Here is an .asd file with a basic `package.lisp`, and a file and folder with accents (letter `é`) : `éé/éé.lisp`.

# how to reproduce the bug

1. Clone this repository and `cd` within.
2. `guix shell -L . sbcl bug-sbcl-guix -- sbcl`
3. `(require 'asdf)`
4. `(asdf:load-system "bug-sbcl-guix")`

You can see the error message.

# the problem

Because `sbcl-dbi` is an input (see `bug-sbcl-guix.scm`), a graft is applyied which cause the files with characters like `é` to not be copied.

Building with `--no-grafts` flag solves the problem, therefore the graft is the cause.

The build successes even if the files and folders with accents are not copied in `/gnu/store/.../lib/common-lisp/sbcl/`.
