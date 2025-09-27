# html-tools #

This is a set of programs that help you manipulate `.html` files.

## html-update ##

The "html-update" family of programs automatically updates text on a
webpage that you maintain.

* `html-update-toc` updates a webpage's table of contents, in place.
  [Documentation](https://raw.githubusercontent.com/plume-lib/html-tools/master/html-update-toc)
  at top of file.

* `html-toc` computes a webpage's table of contents, based on its
   header tags (`<h1>`, `<h2>`, etc.).  It is used by `html-update-toc`
   and is rarely called directly.
   [Documentation](https://raw.githubusercontent.com/plume-lib/html-tools/master/html-toc)
   at top of file.

* `html-update-link-dates` updates webpage text that refers to the date
   and/or size of a linked-to file.
   [Documentation](https://raw.githubusercontent.com/plume-lib/html-tools/master/html-update-link-dates)
   at top of file.

## html-add-favicon ##

Makes each HTML file in a directory use the given favicon.  A favicon is a
favorites icon, which appears in browser tabs.
[Documentation](https://raw.githubusercontent.com/plume-lib/html-tools/master/html-add-favicon)
at top of file.

## Hevea helpers ##

[Hevea](http://hevea.inria.fr/) is a LaTeX-to-HTML translator.
Sometimes it needs a little help.

* `hevea-retarget-crossrefs`
  replaces HTML cross-references of the form
  `<a href="#htoc123">`
  by cross-references to named labels, such as
  `<a href="#introduction">`.
  The former variety (which is generated, for example, by the Hevea
  program) is brittle, as it may change from run to run of Hevea.
  [Documentation](https://raw.githubusercontent.com/plume-lib/html-tools/master/hevea-retarget-crossrefs)
  at top of file.

* `hevea-add-verbatim-linenos` replaces "??" that should be line numbers,
  by the actual line numbers, read from an aux file.
  [Documentation](https://raw.githubusercontent.com/plume-lib/html-tools/master/hevea-add-verbatim-linenos)
  at top of file.

## Lists of URLs ##

These files are used by the
[bibtex2web](http://homes.cs.washington.edu/~mernst/software/bibtex2web.html)
program.

* [`html-canonical-urls`](https://raw.githubusercontent.com/plume-lib/html-tools/master/html-canonical-urls)
  maps a textual string (such as the name of a person, institution, er
  event) to the canonical URL for that string, such as the person's
  homepage.

* [`html-valid-urls`](https://raw.githubusercontent.com/plume-lib/html-tools/master/html-valid-urls)
  is a list of URLs that are valid, even though an
  automated link-checker may indicate that they are invalid.
