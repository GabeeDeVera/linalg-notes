#import "notes.typ": notes
#import "lib.typ": problem, aligned_block, numbered_eq, under_construction, table_of_vals, clip_graph, plot_graph, rangef
#import "@preview/curryst:0.5.1": rule, prooftree
#import "@preview/frame-it:1.2.0": *
#import "@preview/cetz:0.4.2"

#show math.equation.where(block: false): it => math.display(it)

#let (example_box, definition_box, theorem_box, lemma_box, corollary_box, problem_box, solution_box, proof_box) = frames(
  definition_box: ("Definition", aqua),
  // For each frame kind, you have to provide its supplement title to be displayed
  theorem_box: ("Theorem",),
  lemma_box: ("Lemma",),
  corollary_box: ("Corollary",),
  // You can provide a color or leave it out and it will be generated
  example_box: ("Example"),
  problem_box: ("Problem"),
  solution_box: ("Solution"),
  // You can add as many as you want
  proof_box: ("Proof",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)

#show: notes.with(
    title: [
      Midterm Practice
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

= Problem Set 2

== Problem 1

(a)
$ mat(7, 1, 4, -3; 3, 0, -2, 5; 0, -2, 1, 7; augment: #3) $

(b)
$ mat(7, 2, 1, -3, 5; 1, 2, 4, 0, 1; augment: #4) $

(c)
$ mat(2, 0, 0; 3, -4, 0; 0, 1, 1; augment: #2) $

(d)
$ mat(1, 0, 0, 0, 7; 0, 1, 0, 0, -2; 0, 0, 1, 0, 3; 0, 0, 0, 1, 4; augment: #4) $

== Problem 2
(b) and (c) only

== Problem 3
#aligned_block(
  [$c$],
  [$=$],
  [$2x + y + 3z$],

  [$c$],
  [$=$],
  [$(x + z) + (x + y + 2z)$],

  [$c$],
  [$=$],
  [$a + b$],
)

== Problem 4

Augmented matrix:

$ mat(2, 1, -1, 0, 1, 0; 0, 1, 0, 1, 1, -1; 0, 0, 0, 2, -5, 5; augment: #5) $

Parameterization:

$ x_5 = s $
$ x_4 = 5 / 2 + 5 / 2 s $
$ x_3 = t $
$ x_2 = - 7 / 2 - 7 / 2 s $
$ x_1 = 7 / 4 + 5 / 4 s + 1 / 2 t $

== Problem 5

$ mat(1, 1, 2, 8; -1, -2, 3, 1; 3, -7, 4, 10; augment: #3) $

$ mat(1, 1, 2, 8; 0, -1, 5, 9; 0, -10, -2, -14; augment: #3) $

$ mat(1, 1, 2, 8; 0, -1, 5, 9; 0, 0, - 52, -104; augment: #3) $

$ mat(1, 1, 2, 8; 0, -1, 5, 9; 0, 0, 1, 2; augment: #3) $

$ mat(1, 1, 2, 8; 0, -1, 0, -1; 0, 0, 1, 2; augment: #3) $

$ mat(1, 1, 2, 8; 0, 1, 0, 1; 0, 0, 1, 2; augment: #3) $

$ mat(1, 1, 0, 4; 0, 1, 0, 1; 0, 0, 1, 2; augment: #3) $

$ mat(1, 0, 0, 3; 0, 1, 0, 1; 0, 0, 1, 2; augment: #3) $

Thus, $x_1 = 3$, $x_2 = 1$, $x_3 = 2$.

== Problem 6

$ mat(2, -3, -2; 2, 1, 1; 3, 2, 1; augment: #2) $

$ mat(2, -3, -2; 0, 4, 3; 0, 13 / 2, 4; augment: #2) $

$ mat(2, -3, -2; 0, 4, 3; 0, 13, 8; augment: #2) $

$ mat(2, -3, -2; 0, 4, 3; 0, 13 - 13, 8 - 3 dot 13 / 4; augment: #2) $

$ mat(2, -3, -2; 0, 4, 3; 0, 0, - 7 / 4; augment: #2) $

This system is inconsistent.

== Problem 7

(a)

$ cases(2u = 4, 3u - 2v = 3, 6u + 4v + w + z = 0) $

(b) 
The above matrix is not in row-echelon form. #strike([To convert it to REF, perform $R_1 arrow.l.r R_3$.]) To convert it to REF, perform:
+ $R_1 arrow.l 1 / 2 R_1$
+ $R_2 arrow.l R_2 - 3 R_1$
+ $R_3 arrow.l R_3 - 6 R_1$
+ $R_3 arrow.l R_3 + 2 R_2$

(c)

$ u = 2 $
$ v = 3 / 2 $
$ w = s $
$ z = -18 - s $

== Problem 8

(i)

$ mat(1, 0, -5, 1; 0, 10, 2, 7; augment: #3) $

(ii)

The matrix above is in REF.

(iii)

$ x_3 = s $
$ x_2 = 7 / 10 - 1 / 5 s $
$ x_1 = 1 + 5 s $

(iv)

The solution set forms a 1-dimensional affine subspace embedded in $bb(R)^3$.

== Problem 9

*NAGKAMALI KA SA CALCULATION DITO*

(i)

Substituting in the coordinates gives the following system of linear equations:

$ cases(a - b + c = -2, c = 1) $

We can already clearly see that this system has infinitely many solutions, as the corresponding augmented matrix of the system:

$ mat(1, -1, 1, -2; 0, 0, 1, 1; augment: #3) $

Which can be further reduced to RREF as:

$ mat(1, -1, 0, -3; 0, 0, 1, 1; augment: #3) $

This matrix is now in RREF, but does not have any rows of zeroes. Thus, the system is consistent. In fact, since $b$ is a free parameter, there are infinitely many such solutions.

For infinitely many of these solutions, $a eq.not 0$, so indeed there are infinitely many solutions.

(ii)

We introduce a new equation:

$ a + b + c = 2 $

Which we can encode to the RREF matrix we found in (i) by appending it as a row:

$ mat(1, -1, 0, -3; 0, 0, 1, 1; 1, 1, 1, 2; augment: #3) $

Reducing, we get:

$ mat(1, -1, 0, -3; 0, 0, 1, 1; 0, 2, 1, 5; augment: #3) $

$ mat(1, -1, 0, -3; 0, 2, 1, 5; 0, 0, 1, 1; augment: #3) $

$ mat(1, -1, 0, -3; 0, 2, 0, 4; 0, 0, 1, 1; augment: #3) $

$ mat(1, -1, 0, -3; 0, 1, 0, 2; 0, 0, 1, 1; augment: #3) $

$ mat(1, 0, 0, -1; 0, 1, 0, 2; 0, 0, 1, 1; augment: #3) $

Thus, we get:

$ a = -1, b = 2, c = 1 $

As the *unique* solution such that $a x^2 + b x + c$ interpolates through the three points.

Thus, there is only one solution in this case.

(iii)

We now know that $f(x) = -x^2 + 2x + 1$. Also, $f(2) = -4 + 4 + 1 = 1$. Thus, the new point is still on the quadratic. There is still exactly one solution in this case.

Note: In general, $n + 1$ distinct points on an $n$-degree polynomial uniquely determines the polynomial. The proof of this relies on the nonzero determinant of the Vandermonde matrix.

== Problem 10

Note to self: be careful of problems like this! It is not asking for the subspace spanned by the three points, but rather the plane that passes through the three points!

In general, a linear equation in $bb(R)^3$ looks like:

$ a x + b y + c z = k $

Substituting in the three points, we get the following augmented matrix:

$ mat(1, 1, 0, k; 1, 0, 1, k; 0, 1, 1, k; augment: #3) $

$ mat(1, 0, 0, k / 2; 0, 1, 0, k / 2; 0, 0, 1, k / 2; augment: #3) $

Thus, $a = b = c = k / 2$. This gives us the plane:

$ k / 2 x + k / 2 y + k / 2 z = k $

$ x + y + z = 2 $

== Problem 11

Consider:

$ x + y = 4 $
$ x - y = 2 $
$ 2 x + 2 y = 8 $
$ - x - y = -4 $

The augmented matrix is:

$ mat(1, 1, 4; 1, -1, 2; 2, 2, 8; -1, -1, -4; augment: #2) $

Performing Gauss-Jordan Elimination:

$ mat(1, 1, 4; 1, -1, 2; 1, 1, 4; -1, -1, -4; augment: #2) $

$ mat(1, 1, 4; 1, -1, 2; 1, 1, 4; 1, 1, 4; augment: #2) $

$ mat(1, 1, 4; 1, -1, 2; 0, 0, 0; 0, 0, 0; augment: #2) $

$ mat(1, 1, 4; 0, -2, -2; 0, 0, 0; 0, 0, 0; augment: #2) $
$ mat(1, 1, 4; 0, 1, 1; 0, 0, 0; 0, 0, 0; augment: #2) $
$ mat(1, 0, 3; 0, 1, 1; 0, 0, 0; 0, 0, 0; augment: #2) $

Notice that there are no free parameters. Thus, the only solution of this system is $y = 1, x = 3$.

The four equations are different, and every entry in the original augmented matrix is non-zero.

This satisfies all four conditions.

== Problem 12

$ a + 2 b + c = 0 $
$ - a + b + 2 c = -3 $
$ a + 4 b + 3 c = -2 $
$ - a + 3 b + 4 c = -5 $

== Problem 13

Since the solution set is a 1-dimensional Affine Subspace of $bb(R)^3$, we must find two distinct equations that the entries satisfy.

The following equations work:

$ x = y + 4 $
$ z = -2 y $

== Problem 14

Substituting four different values for $n$:

$ C(1) = a_1 + a_2 + a_3 + a_4 = 1 $
$ C(2) = 2 a_1 + 4 a_2 + 8 a_3 + 16 a_4 = 9 $
$ C(3) = 3 a_1 + 9 a_2 + 27 a_3 + 81 a_4 = 36 $
$ C(4) = 4 a_1 + 16 a_2 + 64 a_3 + 256 a_4 = 100 $

This corresponds to the following augmented matrix:

$ mat(1, 1, 1, 1, 1; 2, 4, 8, 16, 9; 3, 9, 27, 81, 36; 4, 16, 64, 256, 100; augment: #4) $

Reducing this matrix to RREF:

$ mat(1, 1, 1, 1, 1; 0, 2, 6, 14, 7; 0, 6, 24, 78, 33; 0, 12, 60, 252, 96; augment: #4) $

$ mat(1, 1, 1, 1, 1; 0, 2, 6, 14, 7; 0, 0, 6, 36, 12; 0, 0, 24, 168, 54; augment: #4) $

$ mat(1, 1, 1, 1, 1; 0, 2, 6, 14, 7; 0, 0, 1, 6, 2; 0, 0, 4, 28, 9; augment: #4) $

$ mat(1, 1, 1, 1, 1; 0, 2, 6, 14, 7; 0, 0, 1, 6, 2; 0, 0, 0, 4, 1; augment: #4) $

$ mat(1, 1, 1, 1, 1; 0, 2, 6, 14, 7; 0, 0, 1, 6, 2; 0, 0, 0, 1, 1 / 4; augment: #4) $

$ mat(1, 1, 1, 1, 1; 0, 2, 6, 14, 7; 0, 0, 1, 0, 1 / 2; 0, 0, 0, 1, 1 / 4; augment: #4) $

$ mat(1, 1, 1, 1, 1; 0, 2, 0, 0, 1 / 2; 0, 0, 1, 0, 1 / 2; 0, 0, 0, 1, 1 / 4; augment: #4) $

$ mat(1, 1, 1, 1, 1; 0, 1, 0, 0, 1 / 4; 0, 0, 1, 0, 1 / 2; 0, 0, 0, 1, 1 / 4; augment: #4) $

$ mat(1, 0, 0, 0, 1 - 1/4 - 1/2 - 1/4; 0, 1, 0, 0, 1 / 4; 0, 0, 1, 0, 1 / 2; 0, 0, 0, 1, 1 / 4; augment: #4) $

$ mat(1, 0, 0, 0, 0; 0, 1, 0, 0, 1 / 4; 0, 0, 1, 0, 1 / 2; 0, 0, 0, 1, 1 / 4; augment: #4) $

Thus, if the sum of the cubes of the first $n$ natural numbers is expressible by a polynomial, that polynomial must be:

$ C(n) = 1 / 4 n^2 + 1 / 2 n^3 + 1 / 4 n^4 $

To prove that this formula indeed works, we proceed by induction.

First, let us show that $C(1)$ gives us the sum of the first cube --- namely, $1$.

$ C(1) = 1 / 4 + 1 / 2 + 1 / 4 = 1 $

This proves the base case.

Now, let us show the inductive step. Suppose that $C(n)$ is the sum of the cubes of the first $n$ positive naturals. Then,we want to show that $C(n + 1)$ is the sum of the cubes of the first $n + 1$ positive naturals.

Since $C(n)$ is the sum of the cubes of the first $n$ positive naturals, we have:

$ C(n) = 1 / 4 n^2 + 1/ 2 n^3 + 1/4 n^4 = sum_(i = 1)^n i^3 $

Adding $(n + 1)^3$ to both sides:

#aligned_block(
  [$1 / 4 n^2 + 1/ 2 n^3 + 1/4 n^4$],
  [$=$],
  [$sum_(i = 1)^n i^3$],

  [$(n + 1)^3 + 1 / 4 n^2 + 1/ 2 n^3 + 1/4 n^4$],
  [$=$],
  [$(n + 1)^3 + sum_(i = 1)^n i^3$],

  [$(n + 1)^3 + 1 / 4 n^2 + 1/ 2 n^3 + 1/4 n^4$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$(n + 1)^3 + 1 / 4 (n^2 + 2n^3 + n^4)$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$(n + 1)^3 + 1 / 4 n^2 (1 + 2n + n^2)$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$(n + 1)^3 + 1 / 4 n^2 (n + 1)^2$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$(n + 1)^2 (n + 1 + 1 / 4 n^2)$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$1 / 4 (n + 1)^2 (n^2 + 4n + 4)$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$1 / 4 (n + 1)^2 (n + 2)^2$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$1 / 4 (n + 1)^2 ((n + 1) + 1)^2$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$1 / 4 (n + 1)^2 ((n + 1)^2 + 2 (n + 1) + 1)$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$1 / 4 ((n + 1)^4 + 2 (n + 1)^3 + (n + 1)^2)$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$1 / 4 (n + 1)^2 + 1 / 2 (n + 1)^3 + 1 / 4 (n + 1)^4$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],

  [$C(n + 1)$],
  [$=$],
  [$sum_(i = 1)^(n + 1) i^3$],
)

Thus, we have shown that, if $C(n) = sum_(i = 1)^(n) i^3$, then $C(n + 1) = sum_(i = 1)^(n + 1) i^3$. By the principle of mathematical induction, we have:

$ sum_(i = 1)^n i^3 = C(n) = 1 / 4 n^2 + 1 / 2 n^3 + 1/ 4 n^4 $

== Problem 15

#theorem_box[Theorem][Infinitude of Solutions][
  A linear system cannot have at least two but finitely many solutions.
]

To prove this, we will prove some definitions and some intermediate lemmas:

#definition_box[Definition][Distinct Solutions][
  $(y_i)_(i = 1)^n$ and $(z_i)_(i = 1)^n$ are two distinct solutions iff there exists $j$ satisfying the following:
  + $i <= j <= n$
  + $y_j eq.not z_j$
]

#lemma_box[Lemma][Solutions Combine in Linear Functions][
  Suppose that $(y_i)_(i = 1)^n$ and $(z_i)_(i = 1)^n$ are two distinct solutions of the following equation:

  $ sum_(i = 1)^n a_i x_i = b $

  Then, for any $lambda in bb(R)$, $(lambda y_i + (1 - lambda) z_i)_(i = 1)^n$ is also a solution of the equation above.
] <solutions-combine>

#proof_box[Proof][Solutions Combine in Linear Functions][
  We are given that $(y_i)_(i = 1)^n$ and $(z_i)_(i = 1)^n$ are two distinct solutions of the following equation:

  $ sum_(i = 1)^n a_i x_i = b $

  Thus:

  $ sum_(i = 1)^n a_i y_i = b $
  $ sum_(i = 1)^n a_i z_i = b $

  Multiplying both sides of the first and second equations by $lambda$ and $1 - lambda$, respectively:

  $ lambda sum_(i = 1)^n a_i y_i = lambda b $
  $ sum_(i = 1)^n a_i (lambda y_i) = lambda b $
  $ (1 - lambda) sum_(i = 1)^n a_i z_i = (1 - lambda) b $

  $ sum_(i = 1)^n a_i ((1 - lambda) z_i) = (1 - lambda) b $

  Thus:

  #aligned_block(
    [$sum_(i = 1)^n a_i (lambda y_i) + sum_(i = 1)^n a_i ((1 - lambda) z_i)$],
    [$=$],
    [$lambda b + (1 - lambda) b$],

    [$sum_(i = 1)^n (a_i (lambda y_i) + a_i ((1 - lambda) z_i))$],
    [$=$],
    [$(lambda + (1 - lambda)) b$],

    [$sum_(i = 1)^n a_i ( lambda y_i + (1 - lambda) z_i)$],
    [$=$],
    [$b$],
  )

  Thus, $(lambda y_i + (1 - lambda) z_i)_(i = 1)^n$ is also a solution of the linear equation, as needed. $qed$
]

#lemma_box[Lemma][Combinations of Distinct Solutions are Distinct][
  Suppose that $(y_i)_(i = 1)^n$ and $(z_i)_(i = 1)^n$ are two distinct solutions.

  Then, two solutions $(lambda_1 y_i + (1 - lambda_1) z_i)_(i = 1)^n$ and $(lambda_2 y_i + (1 - lambda_2) z_i)_(i = 1)^n$ are distinct iff $lambda_1 eq.not lambda_2$.
] <combinations-of-distinct-are-distinct>

#proof_box[Proof][Combinations of Distinct Solutions are Distinct][
  Since $(y_i)_(i = 1)^n$ and $(z_i)_(i = 1)^n$ are two distinct solutions, there exists $j in bb(Z)$ satisfying:
  + $1 <= j <= n$
  + $y_j eq.not z_j$

  Now consider the function $f(lambda) = lambda y_j + (1 - lambda) z_j = lambda (y_j - z_j) + z_j$, which gives the value of the $j$th entry of the solution $(lambda y_i + (1 - lambda) z_i)_(i = 1)^n$ as  a function of $lambda$.

  Since $y_j eq.not z_j$, $y_j - z_j eq.not 0$, and thus $f(lambda)$ is a non-constant linear function of $lambda$. Thus, $f(lambda)$ is a bijective function from $bb(R)$ to itself.

  Therefore, if $lambda_1 eq.not lambda_2$, then $f(lambda_1) eq.not f(lambda_2)$, so the solutions $(lambda_1 y_i + (1 - lambda_1) z_i)_(i = 1)^n$ and $(lambda_2 y_i + (1 - lambda_2) z_i)_(i = 1)^n$ are distinct.

  Furthermore, if $lambda_1 = lambda_2$, the two solutions $(lambda_1 y_i + (1 - lambda_1) z_i)_(i = 1)^n$ and $(lambda_2 y_i + (1 - lambda_2) z_i)_(i = 1)^n$ are not distinct.

  Thus, the two solutions are distinct iff $lambda_1 eq.not lambda_2$, as needed. $qed$
]

We are now ready to prove the main theorem:

#proof_box[Proof][Infinitude of Solutions][
  Suppose not. Then, the linear system has at least two, but finitely many solutions.

  Let two of these solutions be $(y_i)_(i = 1)^n$ and $(z_i)_(i = 1)^n$. Both solutions satisfy all linear equations in the system. Since these solutions are distinct, by @solutions-combine, $(lambda y_i + (1 - lambda) z_i)_(i = 1)^n$ is also a solution of the linear system for any $lambda in bb(R)$. 

  Next, consider the set:

  $ S = {lambda y_i + (1 - lambda) z_i in bb(R) | lambda in bb(R)} $

  By @solutions-combine, all elements of the set are solutions of the system. By @combinations-of-distinct-are-distinct, there exists a bijection $f$ from $S$ to $bb(R)$. Thus, $|S| = |bb(R)|$, so $S$ is an infinite set, contradiction.

  Therefore, there cannot be at least two but finitely many solutions of a linear system, as needed. $qed$
]

== Problem 16

#theorem_box[Theorem][($M_(n times m) (bb(R)), tilde$) is a Setoid][
  The set of $n times m$ real matrices equipped with the row equivalence relation $tilde$ forms a setoid. (That is, $tilde$ is an equivalence relation over the set $M_(n times m) (bb(R))$)
]

#proof_box[Proof][($M_(n times m) (bb(R)), tilde$) is a Setoid][
  For ($M_(n times m) (bb(R)), tilde$), we have to verify that the axioms defining a setoid hold.

  Suppose $X, Y, Z in M_(n times m) (bb(R))$ are three particular but arbitrarily chosen matrices of the same shape.

  Then, for any matrix $X$, we note that, clearly, $X ~ X$ since all matrices are row-equivalent to themselves.

  Now, suppose that $X ~ Y$. Then, there is a sequence of row operations $R_1, R_2, R_3, dots, R_k$ that takes $X$ to $Y$:

  $ X arrow^(R_1) X_1 arrow^(R_2) X_2 arrow^(R_3) X_3 arrow^(R_4) dots.c arrow^(R_k) Y $

  Since row operations are invertible by other row operations, each row operation $R_i$ has a corresponding inverse $R_i^(-1)$ that is also a row operation (this was proven in lectures). Thus, there exists a sequence of row operations that takes $Y$ to $X$:

  $ Y arrow^(R_k^(-1)) dots.c arrow^(R_4^(-1)) X_3 arrow^(R_3^(-1)) X_2 arrow^(R_2^(-1)) X_1 arrow^(R_1^(-1)) X $

  Thus, $Y ~ X$. Therefore, if $X ~ Y$, then $Y ~ X$, implying that $~$ is a symmetric relation.

  Finally, suppose $X ~ Y$ and $Y ~ Z$. Then, there exist row operations $R_1, R_2, R_3, dots, R_k$ and $S_1, S_2, S_3, dots, S_j$ such that:

  $ X arrow^(R_1) X_1 arrow^(R_2) X_2 arrow^(R_3) dots.c arrow^(R_k) Y $

  And:

  $ Y arrow^(S_1) Y_1 arrow^(S_2) Y_2 arrow^(S_3) dots.c arrow^(S_j) Z $

  Notice that we can concatenate both sequences together as follows:

  $ X arrow^(R_1) X_1 arrow^(R_2) X_2 arrow^(R_3) dots.c arrow^(R_k) Y arrow^(S_1) Y_1 arrow^(S_2) Y_2 arrow^(S_3) dots.c arrow^(S_j) Z $

  Since $R_i$ and $S_i$ are both elementary row operations for all $i$, there exists a sequence of elementary row operations that take $X$ to $Z$. Therefore, $X ~ Y and Y ~ Z arrow X ~ Z$, implying that $~$ is a transitive relation.

  Since $~$ is a reflexive, symmetric, and transitive relation over $M_(n times m) (bb(R))$, $~$ is an equivalence relation over $M_(n times m) (bb(R))$. Thus, $(M_(n times m) (bb(R)), ~)$ is a setoid, as needed. $qed$
]

= Problem Set 3

== Problem 1

The corresponding augmented matrix is:

$ mat(0, 10, -4, 1, 1; 1, 4, -1, 1, 2; 3, 2, 1, 2, 5; -2, -8, 2, -2, -4; 1, -6, 3, 0, 1; augment: #4) $

Reducing:

$ mat(1, -6, 3, 0, 1; 1, 4, -1, 1, 2; 3, 2, 1, 2, 5; -2, -8, 2, -2, -4; 0, 10, -4, 1, 1; augment: #4) $

$ mat(1, -6, 3, 0, 1; 0, 10, -4, 1, 1; 0, 20, -8, 2, 2; 0, -20, 8, -2, -2; 0, 10, -4, 1, 1; augment: #4) $

$ mat(1, -6, 3, 0, 1; 0, 10, -4, 1, 1; 0, 10, -4, 1, 1; 0, 10, -4, 1, 1; 0, 10, -4, 1, 1; augment: #4) $

$ mat(1, -6, 3, 0, 1; 0, 10, -4, 1, 1; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; augment: #4) $

$ mat(1, -6, 3, 0, 1; 0, 1, -2 / 5, 1 / 10, 1 / 10; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; augment: #4) $

$ mat(1, 0, 3 / 5, 3 / 5, 8 / 5; 0, 1, -2 / 5, 1 / 10, 1 / 10; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; augment: #4) $

== Problem 2

The corresponding augmented matrix is:

$ mat(5, -2, 6, 0; -2, 1, 3, 1; augment: #3) $

$ mat(2, -4 / 5, 12 / 5, 0; -2, 1, 3, 1; augment: #3) $

$ mat(2, -4 / 5, 12 / 5, 0; 0, 1 / 5, 27 / 5, 1; augment: #3) $

$ mat(5, -2, 6, 0; 0, 1, 27, 5; augment: #3) $

Thus, a parameterization of this system is:

$ x_3 = t $
$ x_2 = 5 - 27t $
$ x_1 = 2 - 12t $

== Problem 3

$ mat(0, 1, -2, 1, 1; 2, -1, 0, -1, 0; 4, 1, -6, 1, 3; augment: #4) $

$ mat(2, -1, 0, -1, 0; 0, 1, -2, 1, 1; 4, 1, -6, 1, 3; augment: #4) $

$ mat(2, -1, 0, -1, 0; 0, 1, -2, 1, 1; 0, 3, -6, 3, 3; augment: #4) $

$ mat(2, -1, 0, -1, 0; 0, 1, -2, 1, 1; 0, 0, 0, 0, 0; augment: #4) $

$ mat(2, 0, -2, 0, 1; 0, 1, -2, 1, 1; 0, 0, 0, 0, 0; augment: #4) $

$ mat(1, 0, -1, 0, 1 / 2; 0, 1, -2, 1, 1; 0, 0, 0, 0, 0; augment: #4) $

== Problem 4

This system corresponds to the following augmented matrix:

$ mat(1, 1, a, 0; 1, a, 1, 0; a, 1, 1, 0; augment: #3) $

When $a = 1$, this matrix reduces to:

$ mat(1, 1, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0; augment: #3) $

And thus there are infinitely many solutions in this case.

When $a eq.not 1$:

$ mat(1, 1, a, 0; 0, a - 1, 1 - a, 0; 0, 1 - a, 1 - a^2, 0; augment: #3) $

Since $a -1 eq.not 0$:

$ mat(1, 1, a, 0; 0, 1, -1, 0; 0, 1, a + 1, 0; augment: #3) $

$ mat(1, 1, a, 0; 0, 1, -1, 0; 0, 0, a + 2, 0; augment: #3) $

When $a = -2$, $a + 2 = 0$ and thus there are infinitely many solutions. Otherwise, back-substitution guarantees a unique solution.

In summary:

When $a = 1$ or $a = -2$, there are infinitely many solutions. Otherwise, there is exactly one solution.

== Problem 5

This system corresponds to the following augmented matrix:

$ mat(a, 9, 2, 2; 1, a, 4, 4; 0, a, 2, 0; augment: #3) $

$ mat(1, a, 4, 4; a, 9, 2, 2; 0, a, 2, 0; augment: #3) $

$ mat(1, a, 4, 4; 0, 9 - a^2, 2 - 4a, 2 - 4a; 0, a, 2, 0; augment: #3) $

$ mat(1, a, 4, 4; 0, a, 2, 0; 0, 9 - a^2, 2 - 4a, 2 - 4a; augment: #3) $

When $a = 0$, the matrix becomes:

$ mat(1, 0, 4, 4; 0, 0, 2, 0; 0, 9, 2, 2; augment: #3) $

This matrix has exactly one solution because it can be reduced to:

$ mat(1, 0, 4, 4; 0, 9, 2, 2; 0, 0, 2, 0; augment: #3) $

Which has no free parameters.

When $a eq.not 0$, the matrix is:

$ mat(1, a, 4, 4; 0, a, 2, 0; 0, 9 - a^2, 2 - 4a, 2 - 4a; augment: #3) $

This can be further reduced with $R_3 arrow.l R_3 - (9 - a^2) / a R_2$

$ mat(1, a, 4, 4; 0, a, 2, 0; 0, 0, 2 - 4a - (18 - 2a^2) / a, 2 - 4a; augment: #3) $

Since $a eq.not 0$, we can multiply the bottom row by $a$:

$ mat(1, a, 4, 4; 0, a, 2, 0; 0, 0, 2a - 4a^2 - (18 - 2a^2), 2a - 4a^2; augment: #3) $

$ mat(1, a, 4, 4; 0, a, 2, 0; 0, 0, - 2a^2 + 2a - 18, 2a - 4a^2; augment: #3) $

$ mat(1, a, 4, 4; 0, a, 2, 0; 0, 0, a^2 - a + 9, 2 a^2 - a; augment: #3) $

$a^2 - a + 9 = (a^2 - a + 1 / 4) + 35 / 4 = (a - 1 / 2)^2 + 35 / 4 >= 35 / 4 > 0$, so the bottom row is never a zero row.

Thus, this system always has exactly one solution.

== Problem 6

The augmented matrix corresponding to this system is:

$ mat(1, 3, 2 a^4 - 32, 37 + 2 a; 0, 4, 0, 28; 2, 6, 5 a^4 - 80, 76 + 5 a; augment: #3) $

$ mat(1, 3, 2 a^4 - 32, 37 + 2 a; 0, 4, 0, 28; 0, 0, a^4 - 16, 76 + 5 a; augment: #3) $

$ mat(1, 3, 2 a^4 - 32, 37 + 2 a; 0, 1, 0, 7; 0, 0, a^4 - 16, 76 + 5 a; augment: #3) $

Notice that when $a = plus.minus 2$, $76 + 5a eq.not 0$ but $a^4 - 16 = 0$. Thus, the system has no solutions if and only if $abs(a) = 2$ and has exactly one solution otherwise (as back-substitution guarantees a unique solution).

== Problem 7

The augmented matrix corresponding to this system is:

$ mat(a, b, f; c, d, g; augment: #2) $

If $a = 0$ and $c = 0$, then the system either has infinitely many solutions or is inconsistent.

If $a = 0$ and $c eq.not 0$, then the system has a unique solution exactly when $b eq.not 0$.

If $c = 0$ and $a eq.not 0$, then the system has a unique solution exactly when $d eq.not 0$.

If $a eq.not 0$ and $c eq.not 0$, then the matrix reduces to:

$ mat(a, b, f; c - a dot c / a, d - b dot c / a, g - f dot c / a; augment: #2) $

$ mat(a, b, f; 0, d - b dot c / a, g - f dot c / a; augment: #2) $

Notice that, when $d - b dot c / a = 0$, then either the system has a free parameter or is inconsistent.

Thus, the solution is unique iff $d - b dot c / a eq.not 0$. Since, in this case, $a eq.not 0$, the solution is unique iff $a d - b c eq.not 0$.

In fact, if you check all cases, the solution is unique iff $a d - b c eq.not 0$. The astute reader may observe that this expression is exactly the determinant of the $2 times 2$ matrix.

== Problem 8

The system corresponds to the following augmented matrix:

$ mat(3, 6, 9, 12, (a^5 + 5), a^4 - 1; 1, a + 3, a + 4, a + 6, 1, 0; 0, 0, 0, 0, a^2 - 1, a + 1; augment: #5) $

$ mat(1, a + 3, a + 4, a + 6, 1, 0; 3, 6, 9, 12, (a^5 + 5), a^4 - 1; 0, 0, 0, 0, a^2 - 1, a + 1; augment: #5) $

$ mat(1, a + 3, a + 4, a + 6, 1, 0; 0, 6 - 3a - 9, 9 - 3a - 12, 12 - 3a - 18, (a^5 + 5) - 3, a^4 - 1; 0, 0, 0, 0, a^2 - 1, a + 1; augment: #5) $

$ mat(1, a + 3, a + 4, a + 6, 1, 0; 0, - 3a - 3, -3a - 3, - 3a - 6, a^5 + 2, a^4 - 1; 0, 0, 0, 0, a^2 - 1, a + 1; augment: #5) $

We note that at least one of the middle three entries of the second row is nonzero because $-3a - 3$ and $-3a - 6$ cannot both be simultaneously be zero. Therefore, this augmented matrix is always in row-echelon form for any choice $a in bb(R)$. Furthermore, the last row is composed of all zeroes (except possibly the number to the right of the bar) exactly when $a = plus.minus 1$.

When $a = 1$, then the last row takes on the form $0, 0, 0, 0, 0 | 2$, which is clearly indicative of an inconsistent system.

When $a = -1$, all entries of the bottom row --- including those to the right of the bar --- become zero. Therefore, the system is consistent in this case.

Furthermore, when $a = -1$, then the system has three free parameters. Otherwise, if it is consistent, then it has two free parameters.

== Problem 9

(i)

$ x_1 + x_2 + x_3 = 0 $
$ x_1 + x_2 + x_3 = 1 $
$ x_1 + x_2 + x_3 = 2 $
$ x_1 + x_2 + x_3 = 3 $

(ii)

$ x_1 = 1 $
$ x_2 = 2 $
$ x_3 = 3 $
$ x_1 + x_2 + x_3 = 6 $

(iii)

$ x_1 + x_2 + x_3 = 6 $
$ x_2 + x_3 = 5 $
$ x_1 + 2x_2 + 2x_3 = 11 $
$ x_1 + 3x_2 + 3x_3 = 16 $

== Problem 10

We can substitute in the given function values to arrive at a certain system of linear equations. The system corresponds to the following augmented matrix:

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 1, 1; 16, 8, 4, 2, 1, 3; 81, 27, 9, 3, 1, 31; 256, 64, 16, 4, 1, 133; augment: #5) $

Applying a modified version of Gauss-Jordan Elimination:

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 16, 8, 4, 2, 0, 2; 81, 27, 9, 3, 0, 30; 256, 64, 16, 4, 0, 132; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 8, 4, 2, 1, 0, 1; 27, 9, 3, 1, 0, 10; 64, 16, 4, 1, 0, 33; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 7, 3, 1, 0, 0, 1; 26, 8, 2, 0, 0, 10; 63, 15, 3, 0, 0, 33; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 7, 3, 1, 0, 0, 1; 12, 2, 0, 0, 0, 8; 42, 6, 0, 0, 0, 30; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 7, 3, 1, 0, 0, 1; 12, 2, 0, 0, 0, 8; 6, 0, 0, 0, 0, 6; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 7, 3, 1, 0, 0, 1; 6, 1, 0, 0, 0, 4; 1, 0, 0, 0, 0, 1; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 7, 3, 1, 0, 0, 1; 0, 1, 0, 0, 0, -2; 1, 0, 0, 0, 0, 1; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 0, 3, 1, 0, 0, -6; 0, 1, 0, 0, 0, -2; 1, 0, 0, 0, 0, 1; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 1, 1, 1, 1, 0, 0; 0, 0, 1, 0, 0, 0; 0, 1, 0, 0, 0, -2; 1, 0, 0, 0, 0, 1; augment: #5) $

$ mat(0, 0, 0, 0, 1, 1; 0, 0, 0, 1, 0, 1; 0, 0, 1, 0, 0, 0; 0, 1, 0, 0, 0, -2; 1, 0, 0, 0, 0, 1; augment: #5) $

Thus, $f(x) = x^4 - 2x^3 + x + 1$

== Problem 11

The following system is linear-in-form with the substitution $X = x^2$, $Y = y^2$ and $Z = z^2$.

The augmented matrix corresponding to this system is:

$ mat(1, -1, 2, 6; 2, 2, -5, 3; 2, 5, 1, 9; augment: #3) $

$ mat(1, -1, 2, 6; 0, 4, -9, -9; 0, 7, -3, -3; augment: #3) $

$ mat(1, -1, 2, 6; 0, 28, -63, -63; 0, 28, -12, -12; augment: #3) $

$ mat(1, -1, 2, 6; 0, 28, -63, -63; 0, 0, 1, 1; augment: #3) $

$ mat(1, -1, 2, 6; 0, 1, 0, 0; 0, 0, 1, 1; augment: #3) $
$ mat(1, 0, 0, 4; 0, 1, 0, 0; 0, 0, 1, 1; augment: #3) $

Thus, $x = plus.minus 2$, $y = 0$, and $z = plus.minus 1$

== Problem 12

There are either no solutions or infinitely many solutions.

If there are two equations that contradict one another, then there are no solutions as this system would result in a row with zeros (except for the number on the right of the bar, which will be nonzero).

Furthermore, if there are any solutions, since the augmented matrix is wider than it is tall (because it has more variables than equations), then there will be at least one column with a free parameter. Thus, the solution set will have infinitely many members in this case.

It is not possible for there to be one unique solution. If there were one unique solution, then there should be no free parameters. That is, every column (corresponding to a variable) should have a leading entry. This implies that there are at least as many equations as there are variables, which is not the case in this problem.

== Problem 13

(i)

The augmented matrix corresponding to this system is:

$ mat(0, 0, 1, 0, 1, 1; 0, 1, 0, 1, 1, 1; 1, 1, 1, 1, 1, 1; augment: #5) $

(ii)

Applying Gaussian Elimination to reduce this matrix into row-echelon form:

$ mat(0, 0, 1, 0, 1, 1; 0, 1, 0, 1, 1, 1; 1, 1, 1, 1, 1, 1; augment: #5) $

$ mat(1, 1, 1, 1, 1, 1; 0, 0, 1, 0, 1, 1; 0, 1, 0, 1, 1, 1; augment: #5) $

$ mat(1, 1, 1, 1, 1, 1; 0, 1, 0, 1, 1, 1; 0, 0, 1, 0, 1, 1; augment: #5) $

(iii) Applying further elementary row operations to reduce this matrix to reduced row-echelon form:

$ mat(1, 0, 1, 0, 0, 0; 0, 1, 0, 1, 1, 1; 0, 0, 1, 0, 1, 1; augment: #5) $
$ mat(1, 0, 0, 0, -1, -1; 0, 1, 0, 1, 1, 1; 0, 0, 1, 0, 1, 1; augment: #5) $

(iv)

$ x_5 = s $
$ x_4 = r $
$ x_3 = 1 - s $
$ x_2 = 1 - r - s $
$ x_1 = -1 + s $

(v) Swapping two columns in an augmented matrix is equivalent to swapping two coordinates of each solution in the solution set.

(vi) It is equivalent to dividing the entry corresponding to the column we multiplied of every possible solution by $c$.

(vii) This is equivalent to introducing a new free parameter to the system. Geometrically, one can think of this operation as extruding the set of solutions along a new dimension.

== Problem 14

(i) $(1, 1, 1), (2, 2, 2), (3, 3, 3), (1, 1, 2), (2, 2, 3)$
(ii) For $(3, 3, 3)$ to be in the set, the following system has to have at least one solution:

$ mat(a, 1, 3; 1, 1, 3; 1, b, 3; augment: #2) $

$ mat(1, 1, 3; a, 1, 3; 1, b, 3; augment: #2) $

$ mat(1, 1, 3; 0, 1 - a, 3 - 3 a; 0, b - 1, 0; augment: #2) $

Notice that, if $b eq.not 1$, then $b - 1 eq.not 0$ and thus $s = 0$. Therefore, $0 = (1 - a) s = 3 - 3a$ and thus $a = 1$.

Further, if $a eq.not 1$, then $1 - a eq.not 0$ and $3 - 3a eq.not 0$. Therefore, $(1 - a)s = 3 - 3a arrow s = 1$. Thus, $b - 1 = (b - 1) s = 0$, implying $b = 1$.

We have thus shown that:

$ a eq.not 1 arrow b = 1 $
$ b eq.not 1 arrow a = 1 $

When $a = b = 1$, the system becomes:

$ mat(1, 1, 3; 0, 0, 0; 0, 0, 0; augment: #2) $

Which is clearly consistent.

When $a = 1 or b = 1$, the system is consistent.

Otherwise, it is inconsistent.

Thus, $(3, 3, 3) in P_(a, b)$ exactly when $a = 1 or b = 1$.

The set of solutions forms a 2d affine subspace of $bb(R)^3$ when $a eq.not 1$ or $b eq.not 1$ and forms a 1d affine subspace of $bb(R)^3$ otherwise.

== Problem 15

We can set-up the following system of four linear equations in four variables:

$ cases(4T_1 = 10 + 20 + T_2 + T_4, 4T_2 = 20 + 40 + T_1 + T_3, 4T_3 = 40 + 30 + T_2 + T_4, 4T_4 = 30 + 10 + T_1 + T_3) $

Which is equivalent to:

$ cases(4T_1 - T_2 - T_4 = 30, 4T_2 - T_1 - T_3 = 60, 4T_3 - T_2 - T_4 = 70, 4T_4 - T_1 - T_3 = 40) $

This corresponds to the following augmented matrix:

$ mat(4, -1, 0, -1, 30; -1, 4, -1, 0, 60; 0, -1, 4, -1, 70; -1, 0, -1, 4, 40; augment: #4) $

Reducing this matrix into REF:

$ mat(4, -1, 0, -1, 30; -4, 16, -4, 0, 240; 0, -1, 4, -1, 70; -4, 0, -4, 16, 160; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, -1, 4, -1, 70; 0, -1, -4, 15, 190; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, -15, 60, -15, 1050; 0, -15, -60, 225, 2850; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, 0, 56, -16, 1320; 0, 0, -64, 224, 3120; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, 0, 7, -2, 165; 0, 0, -4, 14, 195; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, 0, 28, -8, 660; 0, 0, -28, 98, 1365; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, 0, 28, -8, 660; 0, 0, 0, 90, 2025; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, 0, 28, -8, 660; 0, 0, 0, 2, 45; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, 0, 28, 0, 840; 0, 0, 0, 2, 45; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 15, -4, -1, 270; 0, 0, 1, 0, 30; 0, 0, 0, 2, 45; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 30, -8, -2, 540; 0, 0, 1, 0, 30; 0, 0, 0, 2, 45; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 30, 0, 0, 825; 0, 0, 1, 0, 30; 0, 0, 0, 2, 45; augment: #4) $

$ mat(4, -1, 0, -1, 30; 0, 1, 0, 0, 55 / 2; 0, 0, 1, 0, 30; 0, 0, 0, 1, 45 / 2; augment: #4) $

$ mat(4, 0, 0, 0, 80; 0, 1, 0, 0, 55 / 2; 0, 0, 1, 0, 30; 0, 0, 0, 1, 45 / 2; augment: #4) $

$ mat(1, 0, 0, 0, 20; 0, 1, 0, 0, 55 / 2; 0, 0, 1, 0, 30; 0, 0, 0, 1, 45 / 2; augment: #4) $

Thus, $T_1 = 20, T_2 = 55 / 2, T_3 = 30, T_4 = 45 / 2$

= Problem Set 4

== Problem 1

We note that:

$ A = mat(-1, -4, -7, -10; 1, -2, -5, -8; 3, 0, -3, -6) $
$ B = mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) $
$ C = mat(0, 0, 0; 0, 0, 0; 0, 0, 0) $
$ D = mat(-1, 1, -1; 1, -1, 1; -1, 1, -1; 1, -1, 1) $
$ E = mat(1, 1, 1; 0, 2, 2; 0, 0, 3) $
$ F = mat(5, -1; 9, 1; 2, 0) $
$ G = mat(1; -1; 3; 2) $

(a) $mat(-6, 6, -6; -6, 6, -6; -6, 6, -6)$

(b) $mat(-4, 2, 5, 8; 1, -5, -5, -8; -1, 2, 2, 8; 1, -2, -5, -11)$

(c) Not defined

(d) $mat(1, 3, 6; 0, 4, 10; 0, 0, 9)$

(e) $mat(-3, 3, -4; 3, -3, 4; -3, 3, -4; 3, -3, 4)$

(f) $mat(3, -6, -15, -24; 8, -4, -16, -28; 9, 0, -9, -18)$

(g) Not defined

(h) $mat(0, 0; 0, 0; 0, 0) $

(i) $mat(-38; -28; -18)$

(j) Not defined

(k) $mat(16, 0; 22, 2; 6, 0)$

(l) $mat(0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 0, 0) $

(m) $mat(0, 1, 1; -1, 0, 2; -1, -2, 0) $

(n) Undefined

(o) $mat(1, -1, 3, 2; -1, 1, -3, -2; 3, -3, 9, 6; 2, -2, 6, 4)$

(p) $mat(15)$ (careful, make sure to explicitly write the brackets of a $1 times 1$ matrix)

== Problem 2

1.i. $(A B)_(3, 4)$

1.ii. $(A B)_(4, 1)$

1.iii. $(B A)_(3, 2)$

1.iv. $(B A)_(2, 5)$

2.a. $ sum_(i = 1)^n a_(3 i) b_(i 2)$

2.b. $ sum_(i = 1)^m b_(4 i) a_(i 1)$

== Problem 3

*Reminder to Self:* When showing that two matrices are equal, make sure to *state that both matrices are of the same size and show that every entry is equal.*

We will only show $(A + B) C = A C + B C$

First, for all operations to be defined, $A$ and $B$ must be of the same shape (say, $n times m$), and $C$ has to be of the shape $m times k$.

Then, the resulting matrix on both the left and right sides of the equation to prove will be $n times k$.

To show that the left- and right-hand sides of the equation are equal, we will show that each entry of the two matrices are equal.

#aligned_block(
    [$((A + B) C)_(i, j)$],
    [$=$],
    [$sum_(i = 1)^m (A + B)_(i m) C_(m j)$],

    [],
    [$=$],
    [$sum_(i = 1)^m (A_(i m) + B_(i m)) C_(m j)$],

    [],
    [$=$],
    [$sum_(i = 1)^m (A_(i m) C_(m j) + B_(i m) C_(m j))$],

    [],
    [$=$],
    [$sum_(i = 1)^m (A_(i m) C_(m j)) + sum_(i = 1)^m (B_(i m) C_(m j))$],

    [],
    [$=$],
    [$(A C)_(i j) + (B C)_(i j)$],

    [],
    [$=$],
    [$(A C + B C)_(i j)$],
)

Thus, $(A + B) C = (A C + B C)$, as needed. $qed$

== Problem 4

#aligned_block(
    [$sum_(m = 1)^5 sum_(n = 1)^3 f(m, n)$],
    [$=$],
    [$sum_(m = 1)^5 (f(m, 1) + f(m, 2) + f(m, 3))$],

    [],
    [$=$],
    [$(f(1, 1) + f(1, 2) + f(1, 3))$],

    [],
    [$+$],
    [$(f(2, 1) + f(2, 2) + f(2, 3))$],

    [],
    [$+$],
    [$(f(3, 1) + f(3, 2) + f(3, 3))$],

    [],
    [$+$],
    [$(f(4, 1) + f(4, 2) + f(4, 3))$],

    [],
    [$+$],
    [$(f(5, 1) + f(5, 2) + f(5, 3))$],

    [],
    [$=$],
    [$(f(1, 1) + f(2, 1) + f(3, 1) + f(4, 1) + f(5, 1))$],

    [],
    [$+$],
    [$(f(1, 2) + f(2, 2) + f(3, 2) + f(4, 2) + f(5, 2))$],

    [],
    [$+$],
    [$(f(1, 3) + f(2, 3) + f(3, 3) + f(4, 3) + f(5, 3))$],

    [],
    [$=$],
    [$sum_(m = 1)^5 f(m, 1) + sum_(m = 1)^5 f(m, 2) + sum_(m = 1)^5 f(m, 3)$],

    [],
    [$=$],
    [$sum_(n = 1)^3 sum_(m = 1)^5 f(m, n)$],
)

== Problem 5

=== 1(a)

#aligned_block(
    [$tr(A + B)$],
    [$=$],
    [$sum_(i = 1)^n (A + B)_(i i)$],

    [],
    [$=$],
    [$sum_(i = 1)^n (A_(i i) + B_(i i))$],

    [],
    [$=$],
    [$sum_(i = 1)^n A_(i i) + sum_(i = 1)^n B_(i i)$],

    [],
    [$=$],
    [$tr(A) + tr(B)$],
)

=== 1(b)

#aligned_block(
    [$tr(r A)$],
    [$=$],
    [$sum_(i = 1)^n (r A)_(i i)$],

    [],
    [$=$],
    [$sum_(i = 1)^n r (A_(i i))$],

    [],
    [$=$],
    [$r sum_(i = 1)^n A_(i i)$],

    [],
    [$=$],
    [$r tr(A)$],
)

=== 2

#aligned_block(
    [$tr(C D)$],
    [$=$],
    [$sum_(i = 1)^p (C D)_(i i)$],

    [],
    [$=$],
    [$sum_(i = 1)^p sum_(j = 1)^q C_(i j) D_(j i)$],

    [],
    [$=$],
    [$sum_(j = 1)^q sum_(i = 1)^p D_(j i) C_(i j)$],

    [],
    [$=$],
    [$sum_(j = 1)^q (D C)_(j j)$],

    [],
    [$=$],
    [$tr(D C)$],
)

=== 3

Suppose there exist square matrices $A$ and $B$ such that:

$ A B - B A = I $

Note that $tr(I) > 0$.

Furthermore:

#aligned_block(
    [$tr(A B - B A)$],
    [$=$],
    [$tr(I)$],

    [$tr(A B) - tr(B A)$],
    [$=$],
    [$tr(I)$],

    [$tr(A B) - tr(A B)$],
    [$=$],
    [$tr(I)$],

    [$0$],
    [$=$],
    [$tr(I)$],
)

This contradicts $tr(I) > 0$. Thus, there exist no square matrices $A$ and $B$ such that $A B - B A = I$.

== Problem 6

Again, to prove this matrix equation, we simply prove that every entry matches.

#aligned_block(
    [$(A I_n)_(i j)$],
    [$=$],
    [$sum_(k = 1)^n A_(i k) (I_n)_(k j)$],

    [],
    [$=$],
    [$A_(i j) (I_n)_(j j)$],

    [],
    [$=$],
    [$A_(i j) dot 1$],

    [],
    [$=$],
    [$A_(i j)$],
)

#aligned_block(
    [$(I_m A)_(i j)$],
    [$=$],
    [$sum_(k = 1)^m (I_m)_(i k) A_(k j)$],

    [],
    [$=$],
    [$(I_m)_(i i) A_(i j)$],

    [],
    [$=$],
    [$1 dot A_(i j)$],

    [],
    [$=$],
    [$A_(i j)$],
)

Thus, $ I_m A = A I_n = A $

== Problem 7

Simplifying the left- and right-hand sides:

#aligned_block(
    [$a mat(1, -1; -1, 1) + b mat(0, 2; 1, 0)$],
    [$=$],
    [$c mat(3, 1; -1, 3) + d mat(1, 1; 0, 1)$],

    [$mat(a, -a + 2 b; -a + b, a)$],
    [$=$],
    [$mat(3 c + d, c + d; -c, 3 c + d)$],
)

Thus, we have the following system of linear equations:

$ a = 3 c + d $
$ -a + 2b = c + d $
$ -a + b = -c $
$ a = 3 c + d $

Which corresponds to the following augmented matrix:

$ mat(1, 0, -3, -1, 0; 1, -2, 1, 1, 0; 1, -1, -1, 0, 0; 1, 0, -3, -1, 0; augment: #4) $

Reducing into RREF:

$ mat(1, 0, -3, -1, 0; 0, -2, 4, 2, 0; 1, -1, -1, 0, 0; 1, 0, -3, -1, 0; augment: #4) $

$ mat(1, 0, -3, -1, 0; 0, -2, 4, 2, 0; 0, -1, 4, 1, 0; 1, 0, -3, -1, 0; augment: #4) $

$ mat(1, 0, -3, -1, 0; 0, -2, 4, 2, 0; 0, -1, 4, 1, 0; 0, 0, 0, 0, 0; augment: #4) $

$ mat(1, 0, -3, -1, 0; 0, 1, -2, -1, 0; 0, -1, 4, 1, 0; 0, 0, 0, 0, 0; augment: #4) $

$ mat(1, 0, -3, -1, 0; 0, 1, -2, -1, 0; 0, 0, 2, 0, 0; 0, 0, 0, 0, 0; augment: #4) $

$ mat(1, 0, -3, -1, 0; 0, 1, -2, -1, 0; 0, 0, 1, 0, 0; 0, 0, 0, 0, 0; augment: #4) $

$ mat(1, 0, 0, -1, 0; 0, 1, 0, -1, 0; 0, 0, 1, 0, 0; 0, 0, 0, 0, 0; augment: #4) $

Thus, the set of all possible solutions of the equation is:

$ d = r $
$ c = 0 $
$ a = b = r $

For any $r in bb(R)$.

== Problem 8

=== (a)

Since $A = - A^T$, $A + A^T = 0$.

Further, note that $tr(A) = tr(A^T)$ and $tr(0) = 0$

Thus:

#aligned_block(
    [$0$],
    [$=$],
    [$tr(A + A^T)$],

    [],
    [$=$],
    [$tr(A) + tr(A^T)$],

    [],
    [$=$],
    [$tr(A) + tr(A)$],

    [],
    [$=$],
    [$2 tr(A)$],
)

Therefore, $2 tr(A) = 0$.

Thus, $tr(A) = 0$, as needed. $qed$

=== (b)

$X = B^T$ works.

#aligned_block(
    [$tr(B^T A)$],
    [$=$],
    [$sum_(i = 1)^n (B^T A)_(i i)$],

    [],
    [$=$],
    [$sum_(i = 1)^n (B^T A)_(i i)$],

    [],
    [$=$],
    [$sum_(i = 1)^n sum_(j = 1)^n (B^T)_(i j) A_(j i)$],

    [],
    [$=$],
    [$sum_(i = 1)^n sum_(j = 1)^n B_(j i) A_(j i)$],

    [],
    [$=$],
    [$sum_(i = 1)^n sum_(j = 1)^n A_(j i) B_(j i)$],

    [],
    [$=$],
    [$sum_(j = 1)^n sum_(i = 1)^n A_(j i) B_(j i)$],

    [],
    [$=$],
    [$sum_(i = 1)^n sum_(j = 1)^n A_(i j) B_(i j)$],
)

As needed. $qed$

== Problem 9

=== (a)

#aligned_block(
    [$mat(1, 2; -1, -1)^2$],
    [$=$],
    [$mat(1 dot 1 + -1 dot 2, 2 dot 1 + -1 dot 2; 1 dot -1 + -1 dot -1, 2 dot -1 + -1 dot -1)$],

    [],
    [$=$],
    [$mat(-1, 0; 0, -1)$],
)

Let $A = mat(1, 2; -1, -1)$. We note that $A^2 = -I$.

=== (b)

Let us organize the matrix into blocks as follows:

$ B = mat(A, I; I, A) $

Then:

#aligned_block(
    [$mat(A, I; I, A)^2$],
    [$=$],
    [$mat(A^2 + I^2, 2 A; 2 A, A^2 + I^2)$],

    [],
    [$=$],
    [$mat(-I + I, 2 A; 2 A, -I + I)$],

    [],
    [$=$],
    [$mat(0, 2 A; 2 A, 0)$],
)

Thus:

$ B^2 = mat(0, 0, 2, 4; 0, 0, -2, -2; 2, 4, 0, 0; -2, -2, 0, 0) $

== Problem 10

=== (a)

#aligned_block(
    [$tr(A X^T)$],
    [$=$],
    [$sum_(i = 1)^m (A X^T)_(i i)$],

    [],
    [$=$],
    [$sum_(i = 1)^m (A X^T)_(i i)$],

    [],
    [$=$],
    [$sum_(i = 1)^m sum_(j = 1)^n A_(i j) (X^T)_(j i)$],

    [],
    [$=$],
    [$sum_(i = 1)^m sum_(j = 1)^n A_(i j) X_(i j)$],
)

=== (b)

Suppose FTSOC $X eq.not 0$, then there exists $i, j in bb(Z)$ satisfying:
+ $1 <= i <= m$
+ $1 <= j <= n$
+ $X_(i j) eq.not 0$

Next, consider the matrix $A$ defined as:

$ A_(p q) = cases(1 "if" (p, q) = (i, j), 0 "otherwise") $

Notice that:

$ tr(A X^T) = sum_(i = 1)^m sum_(j = 1)^n A_(i j) X_(i j) = A_(i j) X_(i j) > 0 $

Contradiction. Therefore, $X = 0$, as needed. $qed$

== Problem 11

Let us first show the forward direction: If a matrix $B$ with the property $A B = I$ exists, then $a_(i i) eq.not 0$ for all $i$.

This is equivalent to showing that, if $a_(i i) = 0$ for some $i$, then no matrix $B$ satisfies $A B = I$.

Suppose not. Then, $a_(i i) = 0$ for some $i$ *and* there exists a matrix $B$ such that $A B = I$. Then, the $i$th row of $A$ is composed of all zeroes. Consider any entry in the $i$th row of $A B$:

#aligned_block(
    [$(A B)_(i j)$],
    [$=$],
    [$sum_(k = 1)^n A_(i k) B_(k j)$],

    [],
    [$=$],
    [$sum_(k = 1)^n A_(i k) B_(k j)$],

    [],
    [$=$],
    [$0$],
)

Since $A B = I$, we have deduced that the $i$th row of $I$ is composed of all zeroes, contradiction. Thus, if $a_(i i) = 0$ for some $i$, then no matrix $B$ satisfies $A B = I$, as needed.

Let us now show the backward direction: If $a_(i i) eq.not 0$ for all $i$, then there is a matrix $B$ such that $A B = I$.

The proof is by direct construction. Let $B$ be the matrix such that:

$ b_(i j) = cases(1 / a_(i i) "if" i = j, 0 "otherwise") $

Then, we have:

#aligned_block(
    [$(A B)_(i j)$],
    [$=$],
    [$sum_(k = 1)^n A_(i k) B_(k j)$],
)

Notice that when $i eq.not j$, $A_(i k)$ and $B_(k j)$ cannot both be nonzero simultaneously for any choice of $k$. Thus, $sum_(k = 1)^n A_(i k) B_(k j) = 0$ in these cases.

On the other hand, when $i = j$, $A_(i k)$ and $B_(k j)$ are both nonzero exactly when $k = i = j$. Thus, $sum_(k = 1)^n A_(i k) B_(k j) = A_(i i) B_(i i) = A_(i i) / A_(i i) = 1$ in these cases.

In summary, we have found:

$ (A B)_(i j) = cases(1 "if" i = j, 0 "otherwise") $

Thus, $A B = I$. So indeed, if $a_(i i) eq.not 0$ for all $i$, there exists a matrix $B$ such that $A B = I$, as needed. $qed$

== Problem 12

=== (i)

For $A B$ to be defined, $A in M_(n times m) (bb(R))$ and $B in M_(m times n) (bb(R))$ must both hold for some $n, m in bb(Z)^+$.

Notice that $B^T A^T$ is also defined since $B^T in M_(n times m) (bb(R))$ and $A^T in M_(m times n) (bb(R))$.

Now, to prove that $(A B)^T = B^T A^T$, we will show that every entry of the left matrix is equal to every entry of the right matrix.

#aligned_block(
    [$((A B)^T)_(i j)$],
    [$=$],
    [$(A B)_(j i)$],

    [],
    [$=$],
    [$sum_(k = 1)^m A_(j k) B_(k i)$],

    [],
    [$=$],
    [$sum_(k = 1)^m (A^T)_(k j) (B^T)_(i k)$],

    [],
    [$=$],
    [$sum_(k = 1)^m (B^T)_(i k) (A^T)_(k j)$],

    [],
    [$=$],
    [$(B^T A^T)_(i j)$],
)

Thus, $ (A B)^T = B^T A^T $

As needed. $qed$

=== (ii)

First, we will show that if $A$ were invertible, then $A^T$ is also invertible.

Since $A$ is invertible, there exists a matrix $B$ such that $A B = I = B A$.

Taking the transpose on all sides of the equation:

$ B^T A^T = (A B)^T = I^T = I = I^T = (B A)^T = A^T B^T $

Thus:

$ B^T A^T = A^T B^T = I $

Implying that $B^T$ is the inverse of $A^T$ and thus that $A^T$ is invertible.

Now, we will show that if $A^T$ were invertible, then $A$ is also invertible.

By our work already done, if $A^T$ were invertible, then $(A^T)^T$ is also invertible. However, $(A^T)^T = A$ for any $A$. Thus, if $A^T$ were invertible, then so is $A$. Since we have shown both sides of the identity, we have proven that $A$ is invertible exactly when $A^T$ is invertible, as needed. $qed$

== Problem 13

We will consider $(A B)_(i j)$ for $j > i$.

Thus, notice that for any $k$, if $k >= j$, then $k > i$ by transitivity. Thus, when $k >= j$, $A_(i k) = 0$ because $k >= j arrow k > i$.

Further, when $k < j$, $B_(k j) = 0$.

Note that:

#aligned_block(
    [$(A B)_(i j)$],
    [$=$],
    [$sum_(k = 1)^n A_(i k) B_(k j)$],

    [],
    [$=$],
    [$sum_(k = 1)^n A_(i k) B_(k j)$],

    [],
    [$=$],
    [$sum_(k = 1, k < j)^n A_(i k) B_(k j) + sum_(k = 1, k >= j)^n A_(i k) B_(k j)$],

    [],
    [$=$],
    [$sum_(k = 1, k < j)^n A_(i k) dot 0 + sum_(k = 1, k >= j)^n 0 dot B_(k j)$],

    [],
    [$=$],
    [$0$],
)



== Problem 14

Suppose $A$ were an involutory matrix. Thus, $A^2 = I$.

Notice that $ ((A + I) / 2)^2 = 1 / 4 (A^2 + A I + I A + I^2) = 1 / 4 (2 I + 2 A) = (A + I) / 2 $

Thus, $(A + I) / 2$ is idempotent.

Similarly, 

$ ((I - A) / 2)^2 = 1 / 4 (A^2 - A I - I A + I^2) = 1 / 4 (2 I - 2 A) = (I - A) / 2 $

Thus, $(I - A) / 2$ is idempotent.

Finally, $(A + I) / 2 - (I - A) / 2 = A$, so indeed, $A$ can be expressed as the difference of two idempotents, as needed. $qed$

== Problem 15

Note to self: "show the steps in your working" = just show the intermediate steps. It does not necessarily mean show every computation --- just show the intermediate matrices.

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

== Problem 16

=== (a)

$ mat(0, 1; 0, 0)^2 = mat(0, 0; 0, 0) $

As you can see, both matrices on the left and right-hand sides are strictly upper triangular.

=== (b)

Define a $k$-strictly upper triangular matrix to be a matrix such that $a_(i j) = 0$ whenever $i + k > j$. Thus, a $1$-strictly upper triangular matrix is equivalent to a normal upper-triangular matrix.

Further, notice that an $n times n$ matrix that is $n$-strictly upper triangular satisfies:

$ a_(i j) = 0 "whenever" i + n > j $

However, we also have $i + n > n >= j$, so $i + n >= j$ always holds. Therefore, if an $n times n$ matrix is $n$-strictly upper triangular, it must be the zero matrix.

Before we prove the whole statement, I will first prove the following intermediate lemma:

#lemma_box[Lemma][Product of Strictly Upper Triangular Matrices][
    Suppose that $A$ and $B$ are square upper triangular matrices of the same size. Further suppose that $A$ is $1$-strictly upper triangular and that $B$ is $k$-strictly upper triangular. Then, $A B$ is $(k + 1)$-strictly upper triangular. 
] <prod-strict-upper-tri>

#proof_box[Proof][Product of Strictly Upper Triangular Matrices][
    Since $A$ is $1$-strictly upper triangular and $B$ is $k$-strictly upper triangular, the following hold:

    $ i + 1 > j arrow A_(i j) = 0 $
    $ i + k > j arrow B_(i j) = 0 $

    We want to show that $A B$ is $(k + 1)$-strictly upper triangular. That is, whenever $i + k + 1 > j$, $(A B)_(i j) = 0$.

    Suppose that $i$ and $j$ are particular but arbitrarily chosen integers such that $1 <= i, j <= n$ and $i + k + 1 > j$.

    Then:

    #aligned_block(
        [$(A B)_(i j)$],
        [$=$],
        [$sum_(l = 1)^n A_(i l) B_(l j)$]
    )

    Whenever $i + 1 > l$, $A_(i l) = 0$. Further, whenever $l + k > j$, $B_(l j) = 0$.

    I claim that if $i + k + 1 > j$, then either $i + 1 > l$ or $l + k > j$.

    Suppose not. Then, $i + k + 1 > j$ and $i + 1 <= l$ and $l + k <= j$.

    Thus, $i + k + 1 <= l + k$. Also, $l + k <= j$. By transitivity, $l + k + 1 <= j$, contradiction.

    Thus, if $i + k + 1 > j$, then either $i + 1 > l$ or $l + k > j$.

    Applying modus ponens, if $i + k + 1 > j$, then either $A_(i l) = 0$ or $B_(l j) = 0$. By the zero-product property, if $i + k + 1 > j$, then $A_(i l) B_(l j) = 0$. 

    Therefore, if $i + k + 1 > j$, $(A B)_(i j) = 0$, proving that $A B$ is $(k + 1)$-strictly upper triangular, as needed. $qed$
]

Now, we will prove the main theorem. I claim that setting $N = n$ works. To show this, consider the following predicate:

$ P(k): A^k "is" k"-strictly upper triangular" $

First, let us consider the base case $P(1)$. Clearly, $A$ is 1-strictly upper triangular because $A$ is strictly upper triangular. This proves the base case.

Now, let us consider the inductive step.

Suppose $A^k$ is $k$-strictly upper triangular for $k < n$. We want to show that $A^(k + 1)$ is $(k + 1)$-strictly upper triangular.

We note that $A^(k + 1) = A A^(k)$, and that $A$ is $1$-strictly upper triangular (given) and $A^k$ is $k$-strictly upper triangular (inductive hypothesis). By @prod-strict-upper-tri, $A^(k + 1)$ must be $(k + 1)$-strictly upper triangular as it is the product of a $1$-strictly upper triangular and a $k$-strictly upper triangular matrix.

This proves that, for $1 <= k <= n$, $A^k$ is $k$-strictly upper triangular.

Thus, $A^n$ is $n$-strictly upper triangular. Since $A^n in M_(n times n) (bb(R))$ and is $n$-strictly upper triangular, $A^n = 0$.

Therefore, there exists $N$ (particularly $N = n$) such that $A^N = 0$, as needed. $qed$

== Problem 17

First, we will show:

$ mat(0, 1; 1, 1)^k mat(0; 1) = mat(F_k; F_(k + 1)) $

The base case is trivially true:

$ mat(0, 1; 1, 1) mat(0; 1) = mat(1; 1) = mat(F_1; F_2) $

Suppose:

$ mat(0, 1; 1, 1)^k mat(0; 1) = mat(1; 1) = mat(F_k; F_(k + 1)) $

Then:

$ mat(0, 1; 1, 1)^(k + 1) mat(0; 1) = mat(0, 1; 1, 1) mat(0, 1; 1, 1)^k mat(0; 1) = mat(0, 1; 1, 1) mat(F_k; F_(k + 1)) = mat(F_(k + 1); F_k + F_(k + 1)) = mat(F_(k + 1); F_(k + 2)) $

As needed. $qed$

Next, we will compute the inverse of $P$:

$ mat(1, 1, 1, 0; phi.alt_+, phi.alt_-, 0, 1; augment: #2) $

$ mat(1, 1, 1, 0; 0, phi.alt_- - phi.alt_+, -phi.alt_+, 1; augment: #2) $

$ mat(1, 1, 1, 0; 0, - sqrt(5), -phi.alt_+, 1; augment: #2) $

$ mat(1, 1, 1, 0; 0, 1, phi.alt_+ / sqrt(5), - sqrt(5) / 5; augment: #2) $

$ mat(1, 0, 1 - phi.alt_+ / sqrt(5), sqrt(5) / 5; 0, 1, phi.alt_+ / sqrt(5), - sqrt(5) / 5; augment: #2) $

$ mat(1, 0, (5 - sqrt(5)) / 10, sqrt(5) / 5; 0, 1, (5 + sqrt(5)) / 10, - sqrt(5) / 5; augment: #2) $

Thus, $ P^(-1) = mat((5 - sqrt(5)) / 10, sqrt(5) / 5; (5 + sqrt(5)) / 10, - sqrt(5) / 5) $

And finally:

#aligned_block(
    [$P mat(phi.alt_+, 0; 0, phi.alt_-) P^(-1)$],
    [$=$],
    [$mat(1, 1; phi.alt_+, phi.alt_-)  mat(phi.alt_+, 0; 0, phi.alt_-) mat((5 - sqrt(5)) / 10, sqrt(5) / 5; (5 + sqrt(5)) / 10, - sqrt(5) / 5)$],

    [],
    [$=$],
    [$mat(phi.alt_+, phi.alt_-; phi.alt_+^2, phi.alt_-^2) mat((5 - sqrt(5)) / 10, sqrt(5) / 5; (5 + sqrt(5)) / 10, - sqrt(5) / 5)$],

    [],
    [$=$],
    [$mat(phi.alt_+, phi.alt_-; phi.alt_+ + 1, phi.alt_- + 1) mat((5 - sqrt(5)) / 10, sqrt(5) / 5; (5 + sqrt(5)) / 10, - sqrt(5) / 5)$],

    [],
    [$=$],
    [$1 / 5 mat(phi.alt_+, phi.alt_-; phi.alt_+ + 1, phi.alt_- + 1) mat((5 - sqrt(5)) / 2, sqrt(5); (5 + sqrt(5)) / 2, - sqrt(5))$],

    [],
    [$=$],
    [$1 / 5 mat(phi.alt_+, phi.alt_-; phi.alt_+ + 1, phi.alt_- + 1) mat(2 + phi.alt_-, phi.alt_+ - phi.alt_-; 2 + phi.alt_+, phi.alt_- - phi.alt_+)$],

    [],
    [$=$],
    [$1 / 5 mat((2 + phi.alt_-) phi.alt_+ + (2 + phi.alt_+) phi.alt_-, (phi.alt_+ - phi.alt_-) phi.alt_+ + (phi.alt_- - phi.alt_+) phi.alt_-; (2 + phi.alt_-) (phi.alt_+ + 1) + (2 + phi.alt_+) (phi.alt_- + 1), (phi.alt_+ - phi.alt_-) (phi.alt_+ + 1) + (phi.alt_- - phi.alt_+) (phi.alt_- + 1))$],

    [],
    [$=$],
    [$1 / 5 mat((2 phi.alt_+ -1) + (2 phi.alt_- -1), (phi.alt_+ - phi.alt_-)^2; (2 phi.alt_+ + phi.alt_-) + (2 phi.alt_- + phi.alt_+) + 2, (phi.alt_+ - phi.alt_-)^2)$],

    [],
    [$=$],
    [$1 / 5 mat(2 (phi.alt_+ + phi.alt_- ) - 2, (phi.alt_+^2 - 2 phi.alt_+ phi.alt_- + phi.alt_-^2); 3 (phi.alt_+ + phi.alt_- ) + 2, (phi.alt_+^2 - 2 phi.alt_+ phi.alt_- + phi.alt_-^2))$],

    [],
    [$=$],
    [$1 / 5 mat(2 - 2, (phi.alt_+^2 + phi.alt_-^2+ 2); 3 + 2, (phi.alt_+^2 + phi.alt_-^2 + 2))$],

    [],
    [$=$],
    [$1 / 5 mat(0, (phi.alt_+ + phi.alt_- + 4); 5, (phi.alt_+ + phi.alt_- + 4))$],

    [],
    [$=$],
    [$1 / 5 mat(0, (phi.alt_+ + phi.alt_- + 4); 5, (phi.alt_+ + phi.alt_- + 4))$],

    [],
    [$=$],
    [$1 / 5 mat(0, 5; 5, 5)$],

    [],
    [$=$],
    [$mat(0, 1; 1, 1)$],
)

Finally, we have:

#aligned_block(
    [$mat(F_k; F_(k + 1))$],
    [$=$],
    [$mat(0, 1; 1, 1)^k mat(0; 1)$],

    [],
    [$=$],
    [$(P mat(phi.alt_+, 0; 0, phi.alt_-) P^(-1))^k mat(0; 1)$],

    [],
    [$=$],
    [$P mat(phi.alt_+^k, 0; 0, phi.alt_-^k) P^(-1) mat(0; 1)$],

    [],
    [$=$],
    [$1 / 5 mat(1, 1; phi.alt_+, phi.alt_-) mat(phi.alt_+^k, 0; 0, phi.alt_-^k) mat(2 + phi.alt_-, phi.alt_+ - phi.alt_-; 2 + phi.alt_+, phi.alt_- - phi.alt_+) mat(0; 1)$],

    [],
    [$=$],
    [$1 / 5 mat(1, 1; phi.alt_+, phi.alt_-) mat(phi.alt_+^k, 0; 0, phi.alt_-^k) mat(phi.alt_+ - phi.alt_-; phi.alt_- - phi.alt_+)$],

    [],
    [$=$],
    [$1 / 5 mat(1, 1; phi.alt_+, phi.alt_-) mat(phi.alt_+^(k + 1) - phi.alt_- phi.alt_+^k; phi.alt_-^(k + 1) - phi.alt_+ phi.alt_-^k)$],
)

Thus,

$ F_k = 1 / 5 (phi.alt_+^(k + 1) - phi.alt_- phi.alt_+^(k) + phi.alt_-^(k + 1) - phi.alt_+ phi.alt_-^k) $

$ F_k = 1 / 5 (phi.alt_+^(k) (phi.alt_+ - phi.alt_-) + phi.alt_-^k (phi.alt_- - phi.alt_+)) $

$ F_k = 1 / 5 (phi.alt_+^(k) (phi.alt_+ - phi.alt_-) - phi.alt_-^k (phi.alt_+ - phi.alt_-)) $

$ F_k = 1 / 5 (phi.alt_+^(k) - phi.alt_-^k) (phi.alt_+ - phi.alt_-) $

$ F_k = sqrt(5) / 5 (phi.alt_+^k - phi.alt_-^k) $

$ F_k = 1 / sqrt(5) (phi.alt_+^k - phi.alt_-^k) $

Finally, we notice that:

#aligned_block(
    [$lim_(n arrow + infinity) (F_n - 1 / sqrt(5) phi.alt_+^n)$],
    [$=$],
    [$lim_(n arrow + infinity) (1 / sqrt(5) (phi.alt_+^n - phi.alt_-^n) - 1 / sqrt(5) phi.alt_+^n)$],

    [],
    [$=$],
    [$lim_(n arrow + infinity) (- 1 / sqrt(5) phi.alt_-^n)$],

    [],
    [$=$],
    [$0$],
)

As needed. $qed$

= Problem Set 5

== Problem 1
TODO

== Problem 2
TODO

== Problem 3
TODO

== Problem 4
TODO

== Problem 5
TODO

== Problem 6
TODO

== Problem 7
TODO

== Problem 8
TODO

== Problem 9
TODO

== Problem 10
TODO

== Problem 11
TODO

== Problem 12
TODO

== Problem 13
TODO

== Problem 14
In general, the $n times n$ matrix can be reduced to the identity as follows:

+ $R_1 arrow R_1 + R_2$
+ $R_2 arrow R_2 + R_3$
+ $R_3 arrow R_3 + R_4$
+ $dots.v$
+ $R_(n - 1) arrow R_(n - 1) + R_n$

Applying these operations to the identity matrix, we obtain the following general form for $A^(-1)$:

$ A^(-1) = mat(1, 1, 0, 0, 0, dots.c, 0; 0, 1, 1, 0, 0, dots.c, 0; 0, 0, 1, 1, 0, dots.c, 0; 0, 0, 0, 1, 1, dots.c, 0; 0, 0, 0, 0, 1, dots.c, 0; dots.v, dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, 0, 0, dots.c, 1) $

== Problem 15
Suppose $A$ were singular. Then, there must exist a nonzero vector $arrow(x)$ such that $A arrow(x) = arrow(0)$.

Then, clearly $(B A) arrow(x) = B (A arrow(x)) = B arrow(0) = arrow(0)$, implying that $B A$ is singular.

To show that $A B$ is singular, we do some casework on $B$.

Suppose $B$ were singular. Then, there exists a nonzero vector $arrow(y)$ such that $B arrow(y) = arrow(0)$. Clearly, $(A B) arrow(y) = A (B arrow(y)) = A arrow(0) = arrow(0)$. Thus, $A B$ is singular in this case.

Now suppose $B$ were invertible. Then, let $arrow(y) = B^(-1) arrow(x)$. Since $arrow(x)$ is a nonzero vector, and $B^(-1)$ is invertible, $arrow(y) = B^(-1) arrow(x) eq.not arrow(0)$.

Now, notice that:

$ (A B) arrow(y) = A (B arrow(y)) = A (B B^(-1) arrow(x)) = A (B B^(-1)) arrow(x) = A (I_q) arrow(x) = A arrow(x) = arrow(0) $

Thus, $A B$ is also singular in this case. 

Since we have exhausted all cases, if $B$ is singular, then so are $A B$ and $B A$, as needed. $qed$

== Problem 16

=== (a)

Let $A = (A_(i j))_(p times q)$ and $B = (B_(i j))_(q times r)$.

First, notice that $R(A B)$ and $R(A) B$ are both $p times r$ matrices.

Thus, it remains to be shown that each entry of both matrix expressions match.

==== Case 1: R is a Row Swap

Suppose we swap rows $p$ and $q$

Notice that $R(A)_(i j) = cases(A_(q j) "if" i = p, A_(p j) "if" i = q, A_(i j) "otherwise")$

By definition,

#aligned_block(
    [$(R(A) B)_(i j)$],
    [$=$],
    [$sum_(k = 1)^q R(A)_(i k) B_(k j)$],
)

Thus:

$ (R(A) B)_(i j) = cases(sum_(k = 1)^q A_(q k) B_(k j) "if" i = p, sum_(k = 1)^q A_(p k) B_(k j) "if" i = q, sum_(k = 1)^q A_(i k) B_(k j) "otherwise") $

By the definition of matrix multiplication, this is:

$ (R(A) B)_(i j) = cases((A B)_(q j) "if" i = p, (A B)_(p j) "if" i = q, (A B)_(i j) "otherwise") $

Thus, by the definition of $R$, we have:

$ (R(A) B)_(i j) = R(A B)_(i j) $

Thus, we have $R(A) B = R(A B)$ in this case.

=== Case 2: Row Addition

Suppose $R$ corresponds to the row operation of $R_p arrow R_p + c R_q$ for $p eq.not q$.

Notice that $R(A)_(i j) = cases(A_(i j) + c A_(q j) "if" i = p, A_(i j) "otherwise")$.

By definition,

$ (R(A) B)_(i j) = sum_(k = 1)^q R(A)_(i k) B_(k j) $

Thus:

#aligned_block(
    [$(R(A) B)_(i j)$],
    [$=$],
    [$cases(sum_(k = 1)^q (A_(i k) + c A_(q k)) B_(k j) "if" i = p, sum_(k = 1)^q A_(i k) B_(k j) "otherwise")$],

    [],
    [$=$],
    [$cases(sum_(k = 1)^q (A_(i k) B_(k j)) + c sum_(k = 1)^q (A_(q k) B_(k j)) "if" i = p, sum_(k = 1)^q A_(i k) B_(k j) "otherwise")$],

    [],
    [$=$],
    [$cases((A B)_(i j) + c (A B)_(q j) "if" i = p, (A B)_(i j) "otherwise")$],
)

By the definition of $R$, the above is just $R(A B)_(i j)$.
Thus:

#aligned_block(
    [$(R(A) B)_(i j)$],
    [$=$],
    [$cases((A B)_(i j) + c (A B)_(q j) "if" i = p, (A B)_(i j) "otherwise")$],

    [],
    [$=$],
    [$R(A B)_(i j)$],
)

Thus, $R(A) B = R(A B)$ too in this case.

=== Case 3: Row Scaling

Suppose $R$ corresponds to the row operation $R_p arrow.l c R_p$ with $c eq.not 0$.

Thus, $ R(A)_(i j) = cases(c A_(i j) "if" i = p, A_(i j) "otherwise") $

By definition,

$ (R(A) B)_(i j) = sum_(k = 1)^q R(A)_(i k) B_(k j) $

Thus,

#aligned_block(
    [$(R(A)B)_(i j)$],
    [$=$],
    [$cases(sum_(k = 1)^q c A_(i k) B_(k j) "if" i = p, sum_(k = 1)^q A_(i k) B_(k j) "otherwise")$],

    [],
    [$=$],
    [$cases(c sum_(k = 1)^q A_(i k) B_(k j) "if" i = p, sum_(k = 1)^q A_(i k) B_(k j) "otherwise")$],

    [],
    [$=$],
    [$cases(c (A B)_(i j) "if" i = p, (A B)_(i j) "otherwise")$],
)

By the definition of $R$, we have:

#aligned_block(
    [$(R(A)B)_(i j)$],
    [$=$],
    [$cases(c (A B)_(i j) "if" i = p, (A B)_(i j) "otherwise")$],

    [],
    [$=$],
    [$R(A B)_(i j)$],
)

Thus, we also have $R(A) B = R(A B)$ in this case.

Since all cases have been exhausted, $R(A) B = R(A B)$ for any elementary row operation, as needed. $qed$

=== (b)

This deduction is quite trivial.

We notice that:

$ R(A) = R(I_p A) = R(I_p) A = E A $

As needed. $qed$

== Problem 17
No, it is not possible.

Since every column has the numbers $0, 1, 2, -3$ in some order, the sum of each row of $A^T$ is $0$.

Thus, $ A^T mat(1; 1; 1; 1) = mat(0; 0; 0; 0) $

Always holds, and thus $A^T$ is singular by the characterizations of invertibility. Thus, $A$ is also singular, as needed. $qed$ 

== Problem 18
Notice that:

$ M E = (E^T M^T)^T $

Now, $E^T$ is an elementary matrix corresponding to the row operation $R_(j) arrow R_(j) + c R_(i)$.

Thus, $E^T M^T$ is equivalent to performing the row operation $R_(j) arrow R_(j) + c R_(i)$ on $M^T$.

This corresponds to the following column operation on $M$, the transpose of $M^T$:

$ C_(j) arrow C_(j) + c C_(i) $

== Problem 19

=== (a)

We will show that both $A$ and $B$ are invertible. Suppose not. Then either $A$ or $B$ is singular.

First, suppose that $B$ were singular. Then, by the characterizations of invertibility, there exists a nonzero vector $arrow(x)$ such that $B arrow(x) = arrow(0)$. We also note that:

$ arrow(0) = A arrow(0) = A (B arrow(x)) = (A B) arrow(x) $

Thus, there exists a nonzero vector $arrow(x)$ such that $(A B) arrow(x) = arrow(0)$. By the characterizations of invertibility, this implies that $(A B) arrow(x) = arrow(0)$ has a nontrivial solution and thus that $A B$ is singular.

Next, suppose that $B$ were invertible but $A$ were singular.

Since $A$ is singular, there exists a nonzero vector $arrow(x)$ such that $A arrow(x) = arrow(0)$.

I claim that there also exists a vector $arrow(v)$ such that $(A B) arrow(v) = arrow(0)$ in this case.

Let $arrow(v) = B^(-1) arrow(x)$.

Notice that:

$ (A B) arrow(v) = (A B) B^(-1) arrow(x) = A (B B^(-1)) arrow(x) = A I arrow(x) = A arrow(x) = arrow(0) $

This implies, by the characterizations of invertibility, that $A B$ is singular in this case too.

Since we have exhausted all cases consistent with the hypotheses, $A B$ is singular. But $A B = I_n$. Therefore, $I_n$ is also singular, contradiction.

Thus, $A$ and $B$ are invertible, as needed. $qed$

=== (b)

Since $B$ is invertible, there must be a matrix $C$ such that $B C = C B = I_n$.

Multiplying both sides of $A B = I_n$ by $C$:

#aligned_block(
    [$A B$],
    [$=$],
    [$I_n$],

    [$A B C$],
    [$=$],
    [$I_n C$],

    [$A (B C)$],
    [$=$],
    [$C$],

    [$A I_n$],
    [$=$],
    [$C$],

    [$A$],
    [$=$],
    [$C$],
)

Thus, $A = C$ and $I_n = B C = B A$, as needed. $qed$

== Problem 20

=== (a)

$ mat(2, -3; 3, -5) $

=== (b)

Reducing into RREF.

#aligned_block(
    columns: 2,
    [$ mat(2, -3; 3, -5) $],
    [],

    [$ arrow.b $],
    [$R_2 arrow.l R_2 - 3 / 2 R_1$],

    [$ mat(2, -3; 0, - 1 / 2) $],
    [],

    [$ arrow.b $],
    [$R_1 arrow.l R_1 - 6 R_2$],

    [$ mat(2, 0; 0, - 1 / 2) $],
    [],

    [$ arrow.b $],
    [$R_1 arrow.l 1/2 R_1$],

    [$ mat(1, 0; 0, - 1 / 2) $],
    [],

    [$ arrow.b $],
    [$R_2 arrow.l -2 R_2$],

    [$ mat(1, 0; 0, 1) $],
    [],
)

Thus, $C = mat(1, 0; 3/2, 1) mat(1, 6; 0, 1) mat(2, 0; 0, 1) mat(1, 0; 0, -1/2)$

=== (c)

$ R_2 arrow.l - 1 / 2 R_2 $
$ R_1 arrow.l  2 R_1 $
$ R_1 arrow.l  R_1 + 6 R_2 $
$ R_2 arrow.l  R_2 + 3 / 2 R_1 $

= Problem Set 6

== Problem 1
TODO

== Problem 2
TODO

== Problem 3
TODO

== Problem 4
TODO

== Problem 5
TODO

== Problem 6
TODO

== Problem 7
TODO

== Problem 8
TODO

== Problem 9
TODO

== Problem 10
TODO

== Problem 11
TODO

== Problem 12
TODO

== Problem 13
TODO

== Problem 14
TODO

== Problem 15
TODO

== Problem 16
TODO

== Problem 17
TODO

== Problem 18

The determinant of a $3 times 3$ matrix is given by:

#aligned_block(
    [$det( mat(a, b, c; d, e, f; g, h, i))$],
    [$=$],
    [$a det(mat(e, f; h, i)) - b det(mat(d, f; g, i)) + c det(mat(d, e; g, h))$],

    [],
    [$=$],
    [$a (e i - h f) - b (d i - g f) + c (d h - g e)$],
)

We note that $a, b, c, d, e, f, g, h, i in {0, 1}$.

Further, $e i, h f, d i, g f, d h, g e in {0, 1}$.

Also, $e i - h f, d i - g f, d h - g e in {-1, 0, 1}$.

Finally, $a(e i - h f), -b (d i - g f), c (d h - g e) in {-1, 0, 1}$.

Since $ -1 <= a(e i - h f), -b (d i - g f), c (d h - g e) <= 1 $

We have:

$ -3 <= a(e i - h f) -b (d i - g f) + c (d h - g e) <= 3 $

Now, suppose, WLOG, that $ a(e i - h f) -b (d i - g f) + c (d h - g e) = 3 $

The argument for $a(e i - h f) -b (d i - g f) + c (d h - g e) = -3$ is similar.

I claim that $a(e i - h f) -b (d i - g f) + c (d h - g e) < 3$. Suppose not, then

$ a(e i - h f) = -b (d i - g f) = c (d h - g e) = 1 $

This implies that $a = c = 1$ and $b = -1$. Further, $e i - h f = d h - g e = 1$ and $d i - g f = -1$. this further implies that $e i = 1$, $h f = 0$, $d h = 1$, $g e = 0$, $d i = 0$, and $g f = 1$. Thus, $e = i = d = h = g = f = 1$.

However, this implies that $0 = h f = 1 dot 1 = 1$, contradiction. Therefore, $3$ is not an attainable value.

Furthermore, notice that the assignment $a = c = e = i = d = h = 1$ and $b = f = g = 0$ gives the following value of the determinant:

$ a(e i - h f) -b (d i - g f) + c (d h - g e) = 1 (1 dot 1 - 1 dot 0) - 0 dot (1 dot 1 - 0 dot 0) + 1 dot (1 dot 1 - 0 dot 1) = 2 $

Therefore, $det(A) <= 2$. By a similar argument, $det(A) >= -2$.

Therefore, the largest and smallest values of the determinant are $2$ and $-2$, respectively.

== Problem 19

#aligned_block(
    [$det(A)$],
    [$=$],
    [$det(mat(1, 1, 1, 1; a, b, c, d; a^2, b^2, c^2, d^2; a^3, b^3, c^3, d^3))$],

    [],
    [$=$],
    [$det(mat(1, 1, 1, 1; 0, b - a, c - a, d - a; 0, b^2 - a^2, c^2 - a^2, d^2 - a^2; 0, b^3 - a^3, c^3 - a^3, d^3 - a^3))$],

    [],
    [$=$],
    [$(-1)^(1 + 1) dot 1 dot det(mat(b - a, c - a, d - a; b^2 - a^2, c^2 - a^2, d^2 - a^2; b^3 - a^3, c^3 - a^3, d^3 - a^3))$],

    [],
    [$=$],
    [$det(mat(b - a, c - a, d - a; b^2 - a^2, c^2 - a^2, d^2 - a^2; b^3 - a^3, c^3 - a^3, d^3 - a^3))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)det(mat(1, 1, 1; b + a, c + a, d + a; b^2 + a b + a^2, c^2 + a c + a^2, d^2 + a d + a^2))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)$],

    [],
    [$dot$],
    [$det(mat(1, 1, 1; b + a, c + a, d + a; b^2 + a b + a^2 - a(b + a), c^2 + a c + a^2 - a(c + a), d^2 + a d + a^2 - a(d + a)))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a) dot det(mat(1, 1, 1; b + a, c + a, d + a; b^2, c^2, d^2))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a) dot det(mat(1, 1, 1; b, c, d; b^2, c^2, d^2))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a) dot det(mat(1, 1, 1; 0, c - b, d - b; 0, c^2 - b^2, d^2 - b^2))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a) dot (-1)^(1 + 1) dot 1 det(mat(c - b, d - b; c^2 - b^2, d^2 - b^2))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a) det(mat(c - b, d - b; c^2 - b^2, d^2 - b^2))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)(c - b)(d - b) det(mat(1, 1; c + b, d + b))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)(c - b)(d - b) det(mat(1, 1; c, d))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)(c - b)(d - b) det(mat(1, 1; 0, d - c))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)(c - b)(d - b) (-1)^(1 + 1) dot 1 dot det(mat(d - c))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)(c - b)(d - b) det(mat(d - c))$],

    [],
    [$=$],
    [$(b - a)(c - a)(d - a)(c - b)(d - b)(d - c)$],
)

Thus, $A$ is invertible when $det(A) eq.not 0$, that is, when all $a, b, c, d$ are pairwise distinct.

== Problem 20

Let $ A = mat(1, 1, 1, 1, dots.c, 1; a_1, a_2, a_3, a_4, dots.c, a_n; a_1^2, a_2^2, a_3^2, a_4^2, dots.c, a_n^2; a_1^3, a_2^3, a_3^3, a_4^3, dots.c, a_n^3; a_1^4, a_2^4, a_3^4, a_4^4, dots.c, a_n^4; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; a_1^(n - 1), a_2^(n - 1), a_3^(n - 1), a_4^(n - 1), dots.c, a_n^(n - 1)) $

We want to show that $det(A) = product_(i = 1)^(n - 1) product_(j = i + 1)^n (a_j - a_i)$.

First, we will show the base case. When $n = 1$, the matrix $A$ becomes $A = mat(1)$. So, $det(A) = 1$ in this case.

Furthermore, $product_(i = 1)^(1 - 1) product_(j = i + 1)^1 (a_j - a_i) = 1$, since the product contains no product terms.

#aligned_block(
    [$det(A)$],
    [$=$],
    [$det(mat(1, 1, 1, 1, dots.c, 1; a_1, a_2, a_3, a_4, dots.c, a_n; a_1^2, a_2^2, a_3^2, a_4^2, dots.c, a_n^2; a_1^3, a_2^3, a_3^3, a_4^3, dots.c, a_n^3; a_1^4, a_2^4, a_3^4, a_4^4, dots.c, a_n^4; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; a_1^(n - 1), a_2^(n - 1), a_3^(n - 1), a_4^(n - 1), dots.c, a_n^(n - 1)))$],

    [],
    [$=$],
    [$det(mat(1, 1, 1, 1, dots.c, 1; 0, a_2 - a_1, a_3 - a_1, a_4 - a_1, dots.c, a_n - a_1; 0, a_2^2 - a_1^2, a_3^2 - a_1^2, a_4^2 - a_1^2, dots.c, a_n^2 - a_1^2; 0, a_2^3 - a_1^3, a_3^3 - a_1^3, a_4^3 - a_1^3, dots.c, a_n^3 - a_1^3; 0, a_2^4 - a_1^4, a_3^4 - a_1^4, a_4^4 - a_1^4, dots.c, a_n^4 - a_1^4; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; 0, a_2^(n - 1) - a_1^(n - 1), a_3^(n - 1) - a_1^(n - 1), a_4^(n - 1) - a_1^(n - 1), dots.c, a_n^(n - 1) - a_1^(n - 1)))$],

    [],
    [$=$],
    [$(-1)^(1 + 1) dot 1 dot det(mat(a_2 - a_1, a_3 - a_1, a_4 - a_1, dots.c, a_n - a_1; a_2^2 - a_1^2, a_3^2 - a_1^2, a_4^2 - a_1^2, dots.c, a_n^2 - a_1^2; a_2^3 - a_1^3, a_3^3 - a_1^3, a_4^3 - a_1^3, dots.c, a_n^3 - a_1^3; a_2^4 - a_1^4, a_3^4 - a_1^4, a_4^4 - a_1^4, dots.c, a_n^4 - a_1^4; dots.v, dots.v, dots.v, dots.down, dots.v; a_2^(n - 1) - a_1^(n - 1), a_3^(n - 1) - a_1^(n - 1), a_4^(n - 1) - a_1^(n - 1), dots.c, a_n^(n - 1) - a_1^(n - 1)))$],
)

To simplify this, we note the following algebraic identity:

#aligned_block(
    [$b^(n) - a^(n) - a(b^(n - 1) - a^(n - 1))$],
    [$=$],
    [$(b - a)(sum_(i = 0)^(n - 1) a^i b^(n - 1 - i) - a sum_(i = 0)^(n - 2) a^i b^(n - 2 - i))$],

    [],
    [$=$],
    [$(b - a)(sum_(i = 0)^(n - 1) a^i b^(n - 1 - i) - sum_(j = 1)^(n - 1) a^(j) b^(n - 2 - j + 1))$],

    [],
    [$=$],
    [$(b - a)(sum_(i = 0)^(n - 1) a^i b^(n - 1 - i) - sum_(j = 1)^(n - 1) a^(j) b^(n - 1 - j))$],

    [],
    [$=$],
    [$(b - a)(b^(n - 1))$]
)

Thus,

#aligned_block(
    [$det(A)$],
    [$=$],
    [$(-1)^(1 + 1) dot 1 dot det(mat(a_2 - a_1, a_3 - a_1, a_4 - a_1, dots.c, a_n - a_1; a_2^2 - a_1^2, a_3^2 - a_1^2, a_4^2 - a_1^2, dots.c, a_n^2 - a_1^2; a_2^3 - a_1^3, a_3^3 - a_1^3, a_4^3 - a_1^3, dots.c, a_n^3 - a_1^3; a_2^4 - a_1^4, a_3^4 - a_1^4, a_4^4 - a_1^4, dots.c, a_n^4 - a_1^4; dots.v, dots.v, dots.v, dots.down, dots.v; a_2^(n - 1) - a_1^(n - 1), a_3^(n - 1) - a_1^(n - 1), a_4^(n - 1) - a_1^(n - 1), dots.c, a_n^(n - 1) - a_1^(n - 1)))$],

    [],
    [$=$],
    [$det(mat(a_2 - a_1, a_3 - a_1, dots.c, a_n - a_1; a_2^2 - a_1^2, a_3^2 - a_1^2, dots.c, a_n^2 - a_1^2; dots.v, dots.v, dots.down, dots.v; a_2^(n - 1) - a_1^(n - 1), a_3^(n - 1) - a_1^(n - 1), dots.c, a_n^(n - 1) - a_1^(n - 1)))$],

    [],
    [$=$],
    [$det(mat(a_2 - a_1, a_3 - a_1, dots.c, a_n - a_1; a_2^2 - a_1^2, a_3^2 - a_1^2, dots.c, a_n^2 - a_1^2; dots.v, dots.v, dots.down, dots.v; #stack(dir: ttb, spacing: 10pt,  align(center, [$a_2^(n - 1) - a_1^(n - 1)$]), align(center, [$- a_1 (a_2^(n - 2) - a_1^(n - 2))$])), #stack(dir: ttb, spacing: 10pt,  align(center, [$a_3^(n - 1) - a_1^(n - 1)$]), align(center, [$- a_1 (a_3^(n - 2) - a_1^(n - 2))$])), dots.c, #stack(dir: ttb, spacing: 10pt,  align(center, [$a_n^(n - 1) - a_1^(n - 1)$]), align(center, [$- a_1 (a_n^(n - 2) - a_1^(n - 2))$]))))$],

    [],
    [$=$],
    [$det(mat(a_2 - a_1, a_3 - a_1, dots.c, a_n - a_1; a_2^2 - a_1^2, a_3^2 - a_1^2, dots.c, a_n^2 - a_1^2; dots.v, dots.v, dots.down, dots.v; (a_2 - a_1) a_2^(n - 2), (a_3 - a_1) a_3^(n - 2), dots.c, (a_n - a_1) a_n^(n - 2)))$],

    [],
    [$=$],
    [$det(mat(a_2 - a_1, a_3 - a_1, dots.c, a_n - a_1; (a_2 - a_1) a_2, (a_3 - a_1) a_3, dots.c, (a_n - a_1) a_n; dots.v, dots.v, dots.down, dots.v; (a_2 - a_1) a_2^(n - 2), (a_3 - a_1) a_3^(n - 2), dots.c, (a_n - a_1) a_n^(n - 2)))$],

    [],
    [$=$],
    [$(product_(j = 2)^n (a_j - a_1)) dot det(mat(1, 1, dots.c, 1; a_2, a_3, dots.c, a_n; dots.v, dots.v, dots.down, dots.v; a_2^(n - 2), a_3^(n - 2), dots.c, a_n^(n - 2)))$],

    [],
    [$=$],
    [$(product_(j = 2)^n (a_j - a_1)) dot product_(i = 2)^(n - 1) product_(j = i + 1)^n (a_j - a_i)$],

    [],
    [$=$],
    [$(product_(i = 1)^1 product_(j = i + 1)^n (a_j - a_i)) dot product_(i = 2)^(n - 1) product_(j = i + 1)^n (a_j - a_i)$],

    [],
    [$=$],
    [$product_(i = 1)^(n - 1) product_(j = i + 1)^n (a_j - a_i)$],
)

Thus, by the principle of mathematical induction,

$ det(A) = product_(i = 1)^(n - 1) product_(j = i + 1)^n (a_j - a_i) $

As needed. $qed$

== Problem 21

=== (i)

Cofactor expansion on the leftmost column gives:

#aligned_block(
    [$det(A)$],
    [$=$],
    [$a det(mat(d, g, h; 0, i, j; 0, k, l)) - c det(mat(b, e, f; 0, i, j; 0, k, l))$],

    [],
    [$=$],
    [$a (d det(mat(i, j; k, l))) - c (b det(mat(i, j; k, l)))$],

    [],
    [$=$],
    [$a d det(mat(i, j; k, l)) - c b det(mat(i, j; k, l))$],

    [],
    [$=$],
    [$(a d - c b) det(mat(i, j; k, l))$],

    [],
    [$=$],
    [$det(mat(a, b; c, d)) det(mat(i, j; k, l))$],
)

Thus,

$ det(A) = det(mat(a, b; c, d)) det(mat(i, j; k, l)) $

As needed. $qed$

=== (ii)

The proof is by induction on $l$.

First, let us consider the base case $l = 1$.

Then, the matrix is of the following form:

$ B = mat(x, Y; 0_(k times 1), Z) $

Cofactor expansion on the leftmost column gives:

#aligned_block(
    [$det(B)$],
    [$=$],
    [$x det(Z)$],
)

Since the determinant of the $1 times 1$ matrix $X = mat(x)$ is $det(X) = x$, we have:

$ det(B) = det(X) det(Z) $

This proves the formula in the base case.

Now, we will show the inductive step. Suppose that $det(B) = det(X) det(Z)$ holds for block-upper triangular matrices $B'$ whose upper-left block is of size $l times l$.

We want to show that it holds for block-upper triangular matrices $B$ whose upper-left block is of size $(l + 1) times (l + 1)$.

Let us consider a cofactor expansion on the first column of $B$. Since $l + 1 > 0$, the first column should consist of $l + 1$ potentially nonzero entries on top and all zero entries on the bottom.

Thus,

#aligned_block(
    [$det(B)$],
    [$=$],
    [$sum_(k = 1)^(l + 1) (-1)^k B_(k 1) det("minormatrix"(B, k, 1))$],

    [],
    [$=$],
    [$sum_(k = 1)^(l + 1) (-1)^k B_(k 1) det("minormatrix"(X, k, 1)) det(Z)$],

    [],
    [$=$],
    [$(sum_(k = 1)^(l + 1) (-1)^k B_(k 1) det("minormatrix"(X, k, 1))) det(Z)$],

    [],
    [$=$],
    [$det(X) det(Z)$],
)

Thus, we have shown that $det(B) = det(X) det(Z)$. This completes the inductive step.

Therefore, for any $l, k in bb(Z)^+$, we have:

$ det(B) = det(X) det(Z) $

As needed. $qed$

== Problem 22

=== (a)

Since $A$ is invertible, we have:

#aligned_block(
    [$det(I_n + A B)$],
    [$=$],
    [$det(A (A^(-1) + B))$],

    [],
    [$=$],
    [$det((A^(-1) + B) A)$],

    [],
    [$=$],
    [$det(A^(-1) A + B A)$],

    [],
    [$=$],
    [$det(I_n + B A)$],
)

Thus:

$ det(I_n + A B) = det(I_n + B A) $

=== (b)

We note that:

#aligned_block(
    [$(I_n + X) (I_n - X + X^2 - X^3 + dots.c + (-1)^n X^n)$],
    [$=$],
    [$I_n - X + X^2 - X^3 + dots.c + (-1)^n X^n$],
    
    [],
    [$+$],
    [$X - X^2 + X^3 - dots.c + (-1)^n X^(n + 1)$],

    [],
    [$=$],
    [$I_n + (-1)^n X^(n + 1)$],

    [],
    [$=$],
    [$I_n + (-1)^n X X^n$],

    [],
    [$=$],
    [$I_n + (-1)^n X 0_(n times n)$],

    [],
    [$=$],
    [$I_n$],
)

Thus, $I_n + X$ is invertible, with $(I_n + X)^(-1) = I_n - X + X^2 - X^3 + dots.c + (-1)^n X^n$.

Therefore, by the first big determinant theorem,

$ det(I_n + X) eq.not 0 $

As needed. $qed$

== Problem 23
Let $pi: {1, 2, 3, dots, n} arrow {1, 2, 3, dots, n}$ be a permutation of ${1, 2, 3, dots, n}$, such that $i$ is mapped to $pi(i)$.

Let the identity permutation $e$ be the unique permutation satisfying $e(i) = i$.

The sign of a permutation $pi$ is equal to $(-1)^("swaps")$, where $"swaps"$ is the number of swaps required to obtain $pi$ from the identity permutation $e$.

Let $pi_(m)$ be the unique permutation on ${1, 2, 3, ..., n}$ such that:

$ pi_(m) (i) = cases(m "if" i = 1, i - 1 "if" i <= m, i "otherwise") $

I claim that $"sign"(pi_m) = (-1)^(m - 1)$.

The proof is by construction.

The table of values of $pi_m$ is:

#table(
    align: center,
    columns: (1fr, ) * 9,
    rows: 2,
    [$i$], [$1$], [$2$], [$dots.c$], [$m$], [$m + 1$], [$m + 2$], [$dots.c$], [$n$],
    [$pi_m (i)$], [$m$], [$1$], [$dots$], [$m - 1$], [$m + 1$], [$m + 2$], [$dots.c$], [$n$]
)

Meanwhile, the identity is:

#table(
    align: center,
    columns: (1fr, ) * 9,
    rows: 2,
    [$i$], [$1$], [$2$], [$dots.c$], [$m$], [$m + 1$], [$m + 2$], [$dots.c$], [$n$],
    [$e (i)$], [$1$], [$2$], [$dots$], [$m$], [$m + 1$], [$m + 2$], [$dots.c$], [$n$]
)

We can obtain $pi_m$ from the identity $e$ through the following sequence of swaps:

+ $i = m - 1$, $i = m$
+ $i = m - 2$, $i = m - 1$
+ $dots.v$
+ $i = 1$, $i = 2$

In total, there are $m - 1$ of these swaps. Thus, $"sign"(pi_m) = (-1)^(m - 1)$, as needed.

Notice that, once we fix $m$ so that $pi (i) = m$, the rest of the permutation $pi$ is isomorphic (i.e., could be relabeled) to some permutation over ${1, 2, 3, dots, n - 1}$. 

NVM WTH THIS PROBLEM GOT HANDS

== Problem 24

=== (b)

Yes, $J_(2N)$ is invertible. Its inverse is:

$ J_(2N)^(-1) = mat(0_(N times N), - I_N; I_N, 0_(N times N)) $

=== (a)

Since $ J_(2N)$ is invertible, $det(J_(2 N)) eq.not 0$.

Furthermore, we have:

#aligned_block(
    [$det(S^T J_(2 N) S)$],
    [$=$],
    [$det(J_(2 N))$],

    [$det(S^T) det(J_(2 N)) det(S)$],
    [$=$],
    [$det(J_(2 N))$],

    [$det(S^T) det(S)$],
    [$=$],
    [$1$],

    [$det(S)^2$],
    [$=$],
    [$1$],
)

Thus, $det(S) = plus.minus 1$.

=== (c)

Since the determinant of any symplectic matrix is nonzero, all symplectic matrices are invertible.

=== (e)

Multiplying both sides of the equation by $J_(2 N)^(-1)$ to the left:

#aligned_block(
    [$S^T J_(2 N) S$],
    [$=$],
    [$J_(2N)$],

    [$J_(2 N)^(-1) S^T J_(2 N) S$],
    [$=$],
    [$J_(2 N)^(-1) J_(2N)$],

    [$- J_(2 N) S^T J_(2 N) S$],
    [$=$],
    [$I_(2 N)$],

    [$- mat(0_(N times N), I_N; -I_N, 0_(N times N)) mat(A^T, C^T; B^T, D^T) mat(0_(N times N), I_N; -I_N, 0_(N times N)) mat(A, B; C, D)$],
    [$=$],
    [$I_(2 N)$],

    [$- mat(0_(N times N), I_N; -I_N, 0_(N times N)) mat(-C^T, A^T; -D^T, B^T) mat(A, B; C, D)$],
    [$=$],
    [$I_(2 N)$],

    [$- mat(-D^T, B^T; C^T, -A^T) mat(A, B; C, D)$],
    [$=$],
    [$I_(2 N)$],

    [$mat(D^T, -B^T; -C^T, A^T) mat(A, B; C, D)$],
    [$=$],
    [$I_(2 N)$],

    [$mat(D, -C; -B, A)^T mat(A, B; C, D)$],
    [$=$],
    [$I_(2 N)$],
)

Thus, $S^(-1) = mat(D^T, -B^T; -C^T, A^T) = mat(D, -C; -B, A)^T$

=== (d)

*Note to self:* READ the problem statement! You didn't see the $2 times 2$ matrix condition and thus thought this problem was hard.

Suppose $S = mat(a, b; c, d)$. We want to show that $det(S) = 1$.

We know that:

$ S^T J_(2 N) S = J_2N $

Thus:

$ mat(a, c; b, d) mat(0, 1; -1, 0) mat(a, b; c, d) = mat(0, 1; -1, 0) $

$ mat(a, c; b, d) mat(c, d; -a, -b) = mat(0, 1; -1, 0) $

$ mat(0, a d - b c; b c - a d, 0) = mat(0, 1; -1, 0) $

Thus, $1 = a d - b c = det(S)$, as needed.

Now suppose $det(S) = 1$. We want to show that $S$ is symplectic.

Since $det(S) = 1$, $a d - b c = 1$.

Furthermore, by our work already done:

$ S^T J_(2 N) S = mat(a, c; b, d) mat(0, 1; -1, 0) mat(a, b; c, d) = mat(0, a d - b c; b c - a d, 0) = mat(0, 1; -1, 0) = J_(2 N) $

Thus, $S$ is symplectic, as needed.

Therefore, a $2 times 2$ matrix $S$ is symplectic if and only if $det(S) = 1$. $qed$