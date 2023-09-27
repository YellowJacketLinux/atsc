Concerns about ATSC 3.0 Transition
==================================

The primary purpose of the git repository is to provide an off-site backup for
my work on this document for the FCC.

A secondary *but important* purpose is to give a means by which other people who
see stuff in the document that needs to be altered or could be worded better to
make pull requests with their suggested changes.

Unfortunately I am not very skilled with Microsoft Office nor do I even have
access to it, and I am not very skilled with LibreOffice either, so the normal
collaboration software just isn't possible.

LaTeX though is text-based, so it makes collaboration via `git` possible.


LaTeX Compiling Instructions
----------------------------

This document is being built with [TeXLive 2023](https://tug.org/texlive/)
using the LuaLaTeX engine, with a few additions:

1. SpaceMono - A free monospace font from
   [Google Fonts](https://fonts.google.com/specimen/Space+Mono)
   with associated LaTeX support files.
2. `anymouse.sty` - Some LaTeX code I wrote for another project but frequently
   use regardless of the project.

I *believe* all of the needed files are in the `texmf-local` tree within. Copy
them into your local TeXLive `texmf-local` tree and run the `texhash` command
so the LaTeX knows where to find them.

For the SpaceMono font, while not required with LuaLaTeX, you can also enable
the map file to make the font available to other LaTeX engines:

    updmap-sys --enable Map=spacemono.map

Once your TeXLive (or compatible) system has been setup so it knows where to
find the needed files from the `texmf-local` directory, you should be able to
build the PDF files using my primitive bash shell script:

    sh build.sh

The shell script will build two versions of the document---one that is set up to
be printed two-sided using US letter paper, and one that is set up to be printed
single-sided using US letter paper.
