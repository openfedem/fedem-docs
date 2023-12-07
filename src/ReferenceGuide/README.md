<!---
  SPDX-FileCopyrightText: 2023 SAP SE

  SPDX-License-Identifier: Apache-2.0

  This file is part of FEDEM - https://openfedem.org
--->

# FEDEM Reference Guide system

This folder contains the source of the FEDEM Reference Guide system.

It uses the [Microsoft HTML Help Workshop](https://learn.microsoft.com/en-us/previous-versions/windows/desktop/htmlhelp/microsoft-html-help-downloads)
(version 1.32 or later) to generate a CHM file from the HTML source files.
Please read (or at least skim through) the Workshop documentation for detailed information.

Users might have problems viewing the CHM file (e.g., articles don't show up).
[See here](https://www.helpsmith.com/chm-cannot-be-displayed.php)
if you experience such problems.

The chm-file is built by running `fm-make.bat` script.
This will generate a `fm_.hhc` file, which includes the topic list,
and compiles the CHM file using the hhp, hhc and hhk files.

The HTML files are stored in the `htm` subfolder.
You can edit or add HTML files there to update the documentation.
Make sure to update the toc file as well in each folder.

The hhk file should be updated with index data.

The hhp file is the project file, and usually does not need to be edited.
