#!/bin/sh

# SPDX-FileCopyrightText: 2023 SAP SE
#
# SPDX-License-Identifier: Apache-2.0
#
# This file is part of FEDEM - https://openfedem.org

print_help () {
    echo "make-docs.sh"
    echo ""
    echo "build the end user documentation for FEDEM."
    echo ""
    echo "Usage:"
    echo "make-docs.sh --option <argument>"
    echo ""
    echo "-t, --theory   Build the theory guideline (requires pdflatex)"
    echo "-u, --user     Build the user guideline (requires pdflatex)"
    echo "-r, --ref      Build the reference guide (not implemented yet)"
    echo "-i <folder>, --install <folder>"
    echo "               Install the produced documents on <folder>"
    echo "-h, --help     Show this help page"
}

BUILD_THEORY=false
BUILD_USER=false
BUILD_REF=false
INSTALL=false
INSTALL_DIR=""
while [[ $# -gt 0 ]]; do
  case $1 in
    -t|--theory)
      BUILD_THEORY=true
      shift # past argument
      ;;
    -u|--user)
      BUILD_USER=true
      shift # past argument
      ;;
    -r|--ref)
      BUILD_REF=true
      shift # past argument
      ;;
    -i|--install)
      INSTALL=true
      INSTALL_DIR="$2"
      shift # past argument
      shift # past value
      ;;
    -h|--help)
      print_help
      shift # past argument
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 2
      ;;
    *)
  esac
done

# Print an error if reference guide is asked (to be fixed)
if [ "$BUILD_REF" = true ] ; then
    echo "Reference guide building is not implemented on Linux yet!"
    echo "Please, execute the command again without the option -r, --ref"
    exit 2
fi

# Check that something has to be done
if [ "$BUILD_THEORY" = false ] && [ "$BUILD_USER" = false ] ; then
    echo "Nothing to be done..."
    echo "Please, type 'make-docs.sh -h' to see the program usage"
    exit 0
fi

# Check that pdflatex is available to build theory or user guides
if [ "$BUILD_THEORY" = true ] || [ "$BUILD_USER" = true ] ; then
    pdflatex -v > /dev/null
    if [ $? -ne 0 ]; then
        echo "pdflatex cannot be found"
        echo "Please, install pdflatex. If you already have pdflatex installed,"
        echo "please set the PATH environment variable to point to it typing"
        echo "export PATH=$PATH:$PDFLATEX_PATH, with $PDFLATEX_PATH the path where"
        echo "pdflatex can be found"
        exit 127
    fi
fi

# Time to stop execution if something fails
set -e

# Save the working folder
cwd=$(pwd)

if [ "$BUILD_THEORY" = true ] ; then
    cd $cwd/src/TheoryGuide
    echo "Generate the Fedem Theory Guide (pdf^)"
    pdflatex  -interaction=nonstopmode theory_main.tex > pdflatex.log
    echo "2nd pass"
    pdflatex  -interaction=nonstopmode theory_main.tex >> pdflatex.log
    mv theory_main.pdf FedemTheoryGuide.pdf
    if [ "$INSTALL" = true ] ; then
        echo "Installing FedemTheoryGuide.pdf in $INSTALL_DIR"
        mv FedemTheoryGuide.pdf $INSTALL_DIR/FedemTheoryGuide.pdf
    fi
    cd $cwd
fi

if [ "$BUILD_USER" = true ] ; then
    cd $cwd/src/UsersGuide
    echo "Generate the Fedem User Guide (pdf^)"
    pdflatex  -interaction=nonstopmode user_main.tex > pdflatex.log
    echo "2nd pass"
    pdflatex  -interaction=nonstopmode user_main.tex >> pdflatex.log
    mv user_main.pdf FedemUsersGuide.pdf
    if [ "$INSTALL" = true ] ; then
        echo "Installing FedemUsersGuide.pdf in $INSTALL_DIR"
        mv FedemUsersGuide.pdf $INSTALL_DIR/FedemUsersGuide.pdf
    fi
    cd $cwd
fi
