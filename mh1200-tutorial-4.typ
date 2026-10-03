#import "notes.typ": notes
#import "lib.typ": problem, aligned_block, numbered_eq
#import "@preview/frame-it:1.2.0": *

#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("Example", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

#show: notes.with(
    title: [
        Tutorial 4
    ],
    authors: (
        (
            name: "Hans Gabriel D. De Vera",
            affiliation: "Nanyang Technological University",
            email: "hansgabr001@e.ntu.edu.sg"
        ),
    ),
    course: "mh1200"
)

#problem(code: [6], statement: [
  Show that, for square matrices:
  1. (a) $tr(A + B) = tr(A) + tr(B)$, (b) $tr(r A) = r tr(A)$
  2. $tr(C D) = tr(D C)$
  3. $A B - B A eq.not I$
], solution: [
  Part 1a:

  Let $A = (a_(i, j))_(n times n)$ and $B = (b_(i, j))_(n times n)$

  Thus, $A + B = (a_(i, j) + b_(i, j))_(n times n)$

  We thus have:

  #aligned_block(
    [$tr(A + B)$],
    [$=$],
    [$sum_(i = 1)^n (a_(i, i) + b_(i, i))$],

    [],
    [$=$],
    [$sum_(i = 1)^n (a_(i, i)) + sum_(i = 1)^n (b_(i, i))$],

    [],
    [$=$],
    [$tr(A) + tr(B)$],
  )

  Part 1b:

  Let $A = (a_(i, j))_(n times n)$ and $r A = (r a_(i, j))_(n times n)$. We thus have:

  #aligned_block(
    [$tr(r A)$],
    [$=$],
    [$sum_(i = 1)^n (r a_(i, i))$],

    [],
    [$=$],
    [$r sum_(i = 1)^n (a_(i, i))$],

    [],
    [$=$],
    [$r tr(A)$],
  )

  Part 2:

  Let $C = (c_(i, j))_(n times n)$ and $D = (d_(i, j))_(n times n)$.

  We thus have: $C D = (sum_(j = 1)^(n) c_(i, j) d_(j, i))_(n times n)$ and $D C = (sum_(j = 1)^(n) d_(i, j) c_(j, i))_(n times n)$.

  Next, we note that:

  #aligned_block(
    [$tr(C D)$],
    [$=$],
    [$sum_(i = 1)^n sum_(j = 1)^n (c_(i, j) d_(j, i))$],

    [],
    [$=$],
    [$sum_(j = 1)^n sum_(i = 1)^n (c_(i, j) d_(j, i))$],

    [],
    [$=$],
    [$sum_(j = 1)^n sum_(i = 1)^n (d_(j, i) c_(i, j))$],

    [],
    [$=$],
    [$tr(D C)$],
  )

  Part 3:

  Suppose that $A B - B A = I$

  Thus,

  #aligned_block(
    [$tr(A B - B A)$],
    [$=$],
    [$tr(A B) + tr((-1) B A)$],

    [],
    [$=$],
    [$tr(A B) - tr(B A)$],

    [],
    [$=$],
    [$tr(A B) - tr(A B)$],

    [],
    [$=$],
    [$0 = tr(I)$],
  )

  Thus, $tr(I) = 0$, contradiction. Therefore, $ A B - B A eq.not I $
])

#problem(code: [8], statement: [
  (a) Let $A$ be an $n times n$ matrix with the property that $A = -A^T$. Such a matrix is called *anti-symmetric*. Show that $ tr(A) = 0 $

  You may use any properties you know about trace if you wish.

  (b) Let $A = (a_(i, j))_(n times n)$ and $B = (b_(i, j))_(n times n)$. Give a matrix $X$ with the property that $ tr(X A) = sum_(i = 1)^(n) sum_(j = 1)^(n) a_(i, j) b_(i, j) $
], solution: [
  I claim that $X = B^(T)$ works. 

  Note that $B^(T) = (b_(j, i))_(n times n)$.

  Notice that,

  #aligned_block(
    [$tr(B^(T) A)$],
    [$=$],
    [$sum_(i = 1)^(n) sum_(j = 1)^(n) b_(i, j)^(T) a_(j, i)$],

    [],
    [$=$],
    [$sum_(i = 1)^(n) sum_(j = 1)^(n) b_(j, i) a_(j, i)$],

    [],
    [$=$],
    [$sum_(i = 1)^(n) sum_(j = 1)^(n) b_(i, j) a_(i, j)$],
  )

  The expression produced by computing the trace is identical to the target expression, so indeed, $X = B^(T)$, as needed.
])

#problem(code: [9], statement: [
  Compute:

  $ mat(1, 2; -1, -1)^2 $

  Then, use that to compute:

  $ mat(1, 2, 1, 0; -1, -1, 0, 1; 1, 0, 1, 2; 0, 1, -1, -1)^2 $
], solution: [
  Let $A = mat(1, 2; -1, -1)$ and $I = mat(1, 0; 0, 1)$.

  We note that:

  #aligned_block(
    [$A^2$],
    [$=$],
    [$mat(1 dot 1 + 2 dot (-1), 1 dot 2 + 2 dot (-1); (-1) dot 1 + (-1) dot (-1), (-1) dot 2 + (-1) dot (-1))$],

    [],
    [$=$],
    [$mat(-1, 0; 0, -1)$],
  )

  Now, we have:

  #aligned_block(
    [$mat(1, 2, 1, 0; -1, -1, 0, 1; 1, 0, 1, 2; 0, 1, -1, -1)^2$],
    [$=$],
    [$mat(A, I; I, A)^2$],

    [],
    [$=$],
    [$mat(A^2 + I^2, A I + I A; A I + I A, I^2 + A^2)$],

    [],
    [$=$],
    [$mat(A^2 + I, 2 A; 2 A, I + A^2)$],

    [],
    [$=$],
    [$mat(bold(0), 2 A; 2 A, bold(0))$],

    [],
    [$=$],
    [$mat(0, 0, 2, 4; 0, 0, -2, -2; 2, 4, 0, 0; -2, -2, 0, 0)$],
  )
])

#problem(code: [10], statement: [
  Let $m$ and $n$ be positive integers. Let $A, X in bb(M)_(m times n) (bb(R))$.

  (a) Find an expression for $tr(A X^(T))$ in terms of the entries of the matrices, and
  (b) Show that $forall A in bb(M)_(m times n) (bb(R)) space . space tr(A X^(T)) = 0 arrow.r X = bold(0)_(m times n)$
], solution: [
  Part (a):

  Let $A = (a_(i, j))$, $X = (x_(i, j))$, $X^(T) = (x_(j, i))_(n times m)$

  #aligned_block(
    [$tr(A X^(T))$],
    [$=$],
    [$sum_(i = 1)^(n) sum_(j = i)^(n) a_(i, j) x_(i, j)$]
  )

  Part (b):

  Suppose that, for any matrix $ A in bb(M)_(m times n) (bb(R)) $,

  $ tr(A X^(T)) = sum_(i = 1)^(m) sum_(j = i)^(n) a_(i, j) x_(i, j) = 0 $

  We want to show $X = bold(0)_(m times n)$.

  That is, we want to show:

  $ forall A in bb(M)_(m times n) (bb(R)) space . space tr(A X^(T)) = 0 arrow.r X = bold(0)_(m times n) $

  We will instead prove the contrapositive, which is logically equivalent to the original statement:

  #aligned_block(columns: 1,
    [$ X eq.not bold(0)_(m times n) arrow not forall A in bb(M)_(m times n) (bb(R)) space . space tr(A X^(T)) = 0 $],
    [$ equiv $],
    [$ X eq.not bold(0)_(m times n) arrow exists A in bb(M)_(m times n) (bb(R)) space . space tr(A X^(T)) eq.not 0 $],
  )

  Suppose that $X in bb(M)_(m times n) (bb(R))$ has a nonzero entry at row $i_0$, column $j_0$. That is, $x_(i_0, j_0) eq.not 0$. 

  Then, let $A = (a_(i, j))$, where $ a_(i, j) = cases(1" if "i = i_0 and j = j_0, 0" otherwise") $

  Notice that:

  #aligned_block(
    [$tr(A X^(T))$],
    [$=$],
    [$sum_(i = 1)^(m) sum_(j = 1)^(n)a_(i, j) x_(i, j)$],

    [$$],
    [$=$],
    [$a_(i_0, j_0) x_(i_0, j_0)$],

    [$$],
    [$=$],
    [$x_(i_0, j_0)$],

    [$$],
    [$eq.not$],
    [$0$],
  )

  Thus, there exists a matrix $A$ such that $tr(A X^(T)) eq.not 0$, as needed. $qed$
])

#problem(code: [11], statement: [
  Let $A$ be a diagonal $n times n$ matrix. Show that another matrix $B$ exists such that $A B = I$ iff $a_(i, i) eq.not 0$ for all $1 <= i <= n$
], solution: [
  Let us first show the backward direction. Suppose $ a_(i, i) eq.not 0 $

  Define $ B = (b_(i, j))_(n times n) $, with:

  $ b_(i, j) = cases(1 / a_(i, j) "if" i = j, 0 "otherwise") $

  Then,

  #aligned_block(
    [$A B$],
    [$=$],
    [$(sum_(k = 1)^(n) a_(i, k) b_(k, j))$]
  )

  We note that $sum_(k = 1)^(n) a_(i, k) b_(k, j)$ is nonzero only if there is some term where both $a_(i, k)$ and $b_(k, j)$ are nonzero. Thus, $sum_(k = 1)^(n) a_(i, k) b_(k, j)$ is nonzero only if $i = k and k = j arrow i = j$.

  When $i = j$, we have:

  #aligned_block(
    [$sum_(k = 1)^(n) a_(i, k) b_(k, j)$],
    [$=$],
    [$sum_(k = 1)^(n) a_(i, k) b_(k, i)$],

    [],
    [$=$],
    [$a_(i, i) b_(i, i)$],

    [],
    [$=$],
    [$a_(i, i) dot 1 / (a_(i, i))$],

    [],
    [$=$],
    [$1$],
  )

  Thus, $A B$ consists of all zeros except at the diagonals. All diagonal entries are equal to $1$. This implies that $A B = I$.

  Now, we will show the forward direction. That is, if a matrix $B$ exists so that $A B = I$, then $a_(i, i) eq.not 0$ for all $1 <= i <= n$.

  Note that the $(i, i)$-th entry of $A B$ satisfies:

  $ sum_(k = 1)^(n) a_(i, k) b_(k, i) = 1 $

  Further, since $a_(i, j) = 0 "when" i eq.not j$,

  $ a_(i, i) b_(i, i) = 1 $

  Note that $ b_(i, i) eq.not 0 $ as that would otherwise contradict $a_(i, i) b_(i, i) = 1$

  Thus,

  $ a_(i, i) = 1 / b_(i, i) eq.not 0 $

  As needed. $qed$
])

#problem(code: [14], statement: [
  We define the following terms:

  / Involutory Matrix: $A$ is involutory iff $A^2 = I$
  / Idempotent Matrix: $B$ is idempotent iff $B^2 = B$

  Show that any involutory matrix can be expressed as the difference of two idempotent matrices.
], solution: [
  Suppose $A$ is an involutory matrix.

  Notice that $A$ must be a square matrix for $A^2$ to be defined. Therefore, $A + k I$ for any $k in bb(R)$ is also defined since $A$ is square.

  I claim that $(A + I) / 2$ and $(I - A) / 2$ are idempotent.

  Notice that:

  #aligned_block(
    [$((A + I) / 2)^2$],
    [$=$],
    [$1 / 4 (A^2 + A I + I A + I^2)$],

    [],
    [$=$],
    [$1 / 4 (I + A + A + I)$],

    [],
    [$=$],
    [$(A + I) / 2$],
  )

  Also,

  #aligned_block(
    [$((I - A) / 2)^2$],
    [$=$],
    [$1 / 4 (A^2 - A I - I A + I^2)$],

    [],
    [$=$],
    [$1 / 4 (I - A - A + I)$],

    [],
    [$=$],
    [$(I - A) / 2$],
  )

  Thus, both $(A + I) / 2$ and $(I - A) / 2$ are idempotent.

  Finally, notice that $A = (A + I) / 2 - (I - A) / 2$.

  Since $(A + I) / 2$ and $(I - A) / 2$ exist for any involutory matrix $A$, any involutory matrix can be expressed as the difference of two idempotent matrices, as needed. $qed$
])

*Reflection on problem 14:* The solution to this problem requires a clever construction that's similar to the proof that every function is the sum of an even and an odd function. When I noticed that $A + I$ and $I - A$ were _almost_ involutory, I should've doubled down on that insight. What I could've noticed is that the equation in terms of $A + I$ is not homogenous, so cleverly using a scaling factor could've worked (Indeed it did).

#problem(code: [15], statement: [
  (i) Consider the matrix:

  $ P = mat(0, 0, 1; 1, 0, 0; 0, 1, 0) $

  Compute $P^3 - I_3$. Show your working.

  (ii) Let $a$ and $b$ be real numbers. Calculate the following quantity:

  $ tr(mat(a, 0, b; b, a, 0; 0, b, a)^9) $

  (iii) Let $a$ and $b$ be real numbers. Calculate the following quantity:

  $ tr(mat(a, 0, b; b, a, 0; 0, b, a)^100) $
], solution: [
  In the interest of time, I will only solve (iii). We show a generalization of this property for arbitrary positive integer exponents $n$.

  Define a permutation matrix as a matrix where each row is composed of all $0$s except for exactly one entry, which is $1$. We note that $P^3 = I_3$. An easy way to see this is to consider the isomorphism between the group consisting of permutation matrices of order $n$ under the operation of matrix multiplication and the symmetric group over $n$ elements, $S_n$. A more elementary argument is presented here:
  
  Since $P^3 = I_3$, I claim that the two matrices commute with one another.

  Notice that,

  #aligned_block(
    [$I_3 P$],
    [$=$],
    [$P^3 P$],

    [],
    [$=$],
    [$P^4$],

    [],
    [$=$],
    [$P P^3$],

    [],
    [$=$],
    [$P I_3$],
  )

  Since the matrices commute with each other, they satisfy the binomial theorem.

  Thus, we have:

  #aligned_block(
    [$tr(mat(a, 0, b; b, a, 0; 0, b, a)^n)$],
    [$=$],
    [$tr((a I_3 + b P)^n)$],

    [],
    [$=$],
    [$tr((a P^3 + b P)^n)$],

    [],
    [$=$],
    [$tr(sum_(i = 0)^(n) binom(n, i) a^i b^(n - i) P^(3 i) P^(n - i))$],

    [],
    [$=$],
    [$tr(sum_(i = 0)^(n) binom(n, i) a^i b^(n - i) P^(n + 2 i))$],
  )

  Note that $tr(P^(0 mod 3)) = 3$, and $tr(P^(1 mod 3)) = tr(P^(2 mod 3)) = 0$. Therefore,

  #aligned_block(
    [$tr(mat(a, 0, b; b, a, 0; 0, b, a)^n)$],
    [$=$],
    [$tr(sum_(i = 0)^(n) binom(n, i) a^i b^(n - i) P^(n + 2 i))$],

    [],
    [$=$],
    [$tr(sum_(i = 0, i equiv n mod 3)^(n) binom(n, i) a^i b^(n - i) P^(n + 2 i))$],

    [],
    [$=$],
    [$3 sum_(j = 0, j equiv n mod 3)^(n) binom(n, j) a^j b^(n - j)$],
  )

  To simplify this sum, we will use generating functions and complex numbers. The appearance of the $n mod 3$ restriction motivates the introduction of complex numbers to handle the cycling behavior of modular arithmetic.

  Let $P(x) = sum_(j = 0)^(n) binom(n, j) a^j b^(n - j) x^j = (a x + b)^n$ be the ordinary power series generating function describing our sequence. Further, let $zeta_1, zeta_2, zeta_3$ be the three roots of $x^3 - 1 = 0$ (i.e., the third roots of unity).

  Notice that $zeta_1^n + zeta_2^n + zeta_3^n = cases(0 "if" n equiv.not 0 mod 3, 3 "if" n equiv 0 mod 3)$. Therefore, we have:

  #aligned_block(
    [$tr(mat(a, 0, b; b, a, 0; 0, b, a)^n)$],
    [$=$],
    [$3 sum_(j = 0, j equiv n mod 3)^(n) binom(n, j) a^j b^(n - j)$],

    [],
    [$=$],
    [$zeta_1^(2 n) P(zeta_1) + zeta_2^(2 n) P(zeta_2) + zeta_3^(2 n) P(zeta_3)$],

    [],
    [$=$],
    [$(a zeta_1 + b)^n + zeta_2^(2 n) (a zeta_2 + b)^n + zeta_3^(2 n) (a zeta_3 + b)^n$],

    [],
    [$=$],
    [$(a + b)^n + ((-1 + i sqrt(3)) / 2)^(2 n)(a (-1 + i sqrt(3)) / 2 + b)^n + ((-1 - i sqrt(3)) / 2)^(2 n)(a (-1 - i sqrt(3)) / 2 + b)^n$],

    [],
    [$=$],
    [$(a + b)^n + (a + ((-1 - i sqrt(3)) / 2) b)^n + (a + ((-1 + i sqrt(3)) / 2) b)^n$],
  )

  Thus, we have:

  $ tr(mat(a, 0, b; b, a, 0; 0, b, a)^n) = (a + b)^n + (a + ((-1 - i sqrt(3)) / 2) b)^n + (a + ((-1 + i sqrt(3)) / 2) b)^n $

  Where $i = sqrt(-1)$.

  Note to self: It's kinda crazy that complex numbers show up, but apparently the answer is related to a deeper fact about the trace of a matrix --- that the trace of a matrix $M$ is the sum of its eigenvalues.

  Eigenvalues, in general, need not be real numbers. This is why we get complex numbers as the result.
])