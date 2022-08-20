Here is an .asd file with a basic `package.lisp`, and a file and folder with accents (letter `é`) : `éé/éé.lisp`.

# logs

```bash
user@user-pc ~/bug-sbcl-guix$ guix build -f bug-sbcl-guix.scm
/gnu/store/2ihxn6zs0bx4mj5qyxdfp01nlxdqzy8v-bug-sbcl-guix-1.0.0
user@user-pc ~/bug-sbcl-guix$ ls -al /gnu/store/2ihxn6zs0bx4mj5qyxdfp01nlxdqzy8v-bug-sbcl-guix-1.0.0/lib/common-lisp/sbcl/bug-sbcl-guix/
total 12
dr-xr-xr-x 2 root root 4096 Jan  1  1970 ./
dr-xr-xr-x 3 root root 4096 Jan  1  1970 ../
-r--r--r-- 1 root root 1296 Jan  1  1970 package.fasl
user@user-pc ~/bug-sbcl-guix$ guix build -f bug-sbcl-guix.scm --no-grafts
/gnu/store/jdvy6gk2c2rjiclgnkx09qpd60yd79dw-bug-sbcl-guix-1.0.0
user@user-pc ~/bug-sbcl-guix$ ls -al /gnu/store/jdvy6gk2c2rjiclgnkx09qpd60yd79dw-bug-sbcl-guix-1.0.0/lib/common-lisp/sbcl/bug-sbcl-guix/
total 16
dr-xr-xr-x 3 root root 4096 Jan  1  1970 ./
dr-xr-xr-x 3 root root 4096 Jan  1  1970 ../
dr-xr-xr-x 2 root root 4096 Jan  1  1970 éé/
-r--r--r-- 1 root root 1296 Jan  1  1970 package.fasl
```

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
