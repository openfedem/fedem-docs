<!---
  SPDX-FileCopyrightText: 2023 SAP SE

  SPDX-License-Identifier: Apache-2.0

  This file is part of FEDEM - https://openfedem.org
--->

[![REUSE status](https://api.reuse.software/badge/github.com/openfedem/fedem-docs)](https://api.reuse.software/info/github.com/openfedem/fedem-docs)
[![Build documentation](https://github.com/openfedem/fedem-docs/actions/workflows/build-docs.yml/badge.svg)](https://github.com/openfedem/fedem-docs/actions/workflows/build-docs.yml)

# FEDEM end user documention

![Fedem Logo](https://github.com/openfedem/.github/blob/main/profile/FedemLogo.png)

## About this project

This project contains all end-user documentation for FEDEM.
It consists of the following:

- LaTeX source files for the [Theory Guide](src/TheoryGuide/)
- LaTeX source files for the [User's Guide](src/UsersGuide/)
- HTML source and image files as well as build script for the [Reference Guide](src/ReferenceGuide/)

## Requirements and Setup

To compile the PDF-version of the Theory and User's Guides,
you need to have a [LaTeX](https://www.latex-project.org/) installation on your local computer.
On Windows, for instance, the [MiKTeX](https://miktex.org/) package can be used.
Most Linux distributions can install a LaTeX compiler through their respective package management system.

To compile the CHM-file containing the Reference Guide (on Windows only), you need to intall the
[Microsoft HTML Help Workshop](https://learn.microsoft.com/en-us/previous-versions/windows/desktop/htmlhelp/microsoft-html-help-downloads) tool.

On Windows, you can then build the three documents by executing the bat-file
[make-docs.bat](make-docs.bat). To build and install the documentation in
your local installation of the Fedem GUI, execute

    make-docs.bat -install

It will assume you have cloned the [fedem-gui](https://github.com/openfedem/fedem-gui)
repository under `%USERPROFILE%\Fedem-src` and built it. If any other location,
you need to edit line 19 in the bat script defining the `gui_dir` variable,
or specify the desired installation folder as command-line argument:

    make-docs.bat -install <doc_dir>

where `<doc_dir>` needs to be an existing directory.

The tree documents will be built automatically by the github action
[Build documentation](https://github.com/openfedem/fedem-docs/actions/workflows/build-docs.yml)
whenever a new tag is pushed, and the resulting files are publised on the
[Releases](https://github.com/openfedem/fedem-docs/releases) page.

## Contributing

This project is open to feature requests, suggestions, bug reports, etc.,
via [GitHub issues](https://github.com/openfedem/fedem-docs/issues).
Contributions and feedback are encouraged and always welcome.
For more information about how to contribute,
see our [Contribution Guidelines](.github/CONTRIBUTING.md).

## Licensing

Copyright 2023 SAP SE or an SAP affiliate company and fedem-docs contributors.
Please see our [LICENSE](LICENSE) for copyright and license information.
Detailed information including third-party components and their licensing/copyright information
is available via the [REUSE tool](https://api.reuse.software/info/github.com/openfedem/fedem-docs).
