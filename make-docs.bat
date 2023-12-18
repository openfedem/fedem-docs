@echo off
REM SPDX-FileCopyrightText: 2023 SAP SE
REM
REM SPDX-License-Identifier: Apache-2.0
REM
REM This file is part of FEDEM - https://openfedem.org

if not exist "%PDFLATEX%.exe" set PDFLATEX=C:\Program Files\MiKTex\miktex\bin\x64\pdflatex
if not exist "%PDFLATEX%.exe" (
  @echo %PDFLATEX%.exe does not exist
  @echo Please set environment variable PDFLATEX to point to the pdflatex executable
  exit /B
)

setlocal ENABLEDELAYEDEXPANSION

REM Edit this line to match the location of your
REM local clone of https://github.com/SAP/fedem-gui
set gui_dir=%USERPROFILE%\Fedem-src\fedem-gui

set /a doTheory=0
set /a doUser=0
set /a doRef=0
if "%1" == "-theory" set /a doTheory=1
if "%1" == "-user" set /a doUser=1
if "%1" == "-ref" set /a doRef=1
if "%1" == "-install" (
  if not "%2" == "" ( set install_dir=%2 ) else (
    if exist %gui_dir% (
      set /p VERSION=<%gui_dir%\cfg\VERSION
      set install_dir=%USERPROFILE%\Fedem-install\%VERSION%\bin\Doc\
    ) else set install_dir=%~dp0docs\
  )
  if not exist !install_dir! (
    echo !install_dir! does not exist - ignored
    set install_dir=
  )
)

if not %doTheory%==1 if not %doUser%==1 if not %doRef%==1 (
  set /a doTheory=2
  set /a doUser=2
  set /a doRef=2
)

if %doTheory% gtr 0 (
  cd %~dp0\src\TheoryGuide\
  @echo Generate the Fedem Theory Guide (pdf^)
  "%PDFLATEX%" theory_main.tex > pdflatex.log
)
if %doTheory% gtr 1 (
  @echo 2nd pass
  "%PDFLATEX%" theory_main.tex >> pdflatex.log
  if not "%install_dir%" == "" (
    @echo Installing FedemTheoryGuide.pdf in %install_dir%
    rename theory_main.pdf FedemTheoryGuide.pdf
    move FedemTheoryGuide.pdf %install_dir%
  )
)

if %doUser% gtr 0 (
  cd %~dp0\src\UsersGuide\
  @echo Generate the Fedem User Guide (pdf^)
  "%PDFLATEX%" user_main.tex > pdflatex.log
)
if %doUser% gtr 1 (
  @echo 2nd pass
  "%PDFLATEX%" user_main.tex >> pdflatex.log
  if not "%install_dir%" == "" (
    @echo Installing FedemUsersGuide.pdf in %install_dir%
    rename user_main.pdf FedemUsersGuide.pdf
    move FedemUsersGuide.pdf %install_dir%
  )
)

if %doRef% gtr 0 (
  cd %~dp0\src\ReferenceGuide
  @echo Generate the Fedem Reference Guide (chm^)
  call fm-make.bat
  if not "%install_dir%" == "" (
    @echo Installing Fedem.chm in %install_dir%
    move Fedem.chm %install_dir%
  )
)

cd %~dp0
