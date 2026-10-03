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
      Finals Practice
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

= Some Learnings/Things to Remember

#theorem_box[Theorem][Matrix Products produce Linear Combinations of Columns and Rows][
  The row vectors of $A B$ are linear combinations of the row vectors of $B$, and the column vectors of $A B$ are linear combinations of the column vectors of $A$.

  Note the asymmetry!
]

For a sketch of the proof of this theorem: Divide the matrix into blocks or simply think about which part of the matrix product we keep fixed as we iterate through rows and columns.

#theorem_box[Theorem][Subspace Dimension is Bounded Above][
  Suppose $U, V$ are vector spaces satisfying $U subset.eq V$. Then, $"dim"(U) <= "dim"(V)$.
]

Kind of an obvious one, but it does turn up sometimes. To prove it, consider a basis on $V$ and realize that you can use this basis to build any spanning set of $U$. Thus, any basis on $U$ must be no bigger than the basis on $V$.

#theorem_box[Theorem][Square Matrix is Invertible iff Column Vectors are Linearly Independent][
  A square matrix $M$ is invertible if and only if the column vectors of $M$ are linearly independent.
]

Here's a sketch of the proof: Use the characterization $M arrow(x) = arrow(0)$ only has the trivial solution to conclude that the column vectors of $M$ are linearly independent and vice versa. 

#theorem_box[Theorem][Nonzero Rows of Row Echelon Form form a Basis for the Row Space][
  The nonzero rows of the row echelon form of matrix $M$ form a basis for $"rowspace"(M)$.
]

Sketch of proof: Show that the elementary row operations preserve the row space. Then Gaussian Elimination immediately gives you the result. 

#theorem_box[Theorem][The Linear Independence Equation][
  A list of vectors $arrow(v_i)$ is linearly independent iff the only solution to the following equation is the trivial one:

  $ sum_(i = 1)^n c_i arrow(v_i)  = arrow(0) $
]

Really basic, but sometimes you forget the basic stuff! Don't forget!

= Other Things to Remember
1. If a problem asks for a careful proof or to prove from the definitions, make sure to actually prove from, e.g., the subspace axioms. Exercise good judgment on how much detail your proof must have.
2. Double check your computations. Your biggest source of errors is some computation mistake in your Gaussian Elimination.

= Problem Set 7

== Problem 1

#aligned_block(
  [$mat(2, 4, 1; 0, 1, 4; 0, 0, 3)^(-1)$],
  [$=$],
  [$1 / mat(2, 4, 1; 0, 1, 4; 0, 0, 3; delim: "|") mat(mat(1, 4; 0, 3; delim: "|"), -mat(0, 4; 0, 3; delim: "|"), mat(0, 1; 0, 0; delim: "|"); -mat(4, 1; 0, 3; delim: "|"), mat(2, 1; 0, 3; delim: "|"), -mat(2, 4; 0, 0; delim: "|"); mat(4, 1; 1, 4; delim: "|"), -mat(2, 1; 0, 4; delim: "|"), mat(2, 4; 0, 1; delim: "|"))^T$],

  [],
  [$=$],
  [$1 / 6 mat(3, -0, 0; -12, 6, -0; 15, -8, 2)^T$],

  [],
  [$=$],
  [$1 / 6 mat(3, 0, 0; -12, 6, 0; 15, -8, 2)^T$],

  [],
  [$=$],
  [$1 / 6 mat(3, -12, 15; 0, 6, -8; 0, 0, 2)$],

  [],
  [$=$],
  [$mat(1 / 2, -2, 5/2; 0, 1, -4/3; 0, 0, 1/3)$],
)

To save on time, I just compute the cofactors directly for the second and third matrices:

$ mat(1, 2, 3; 2, -1, 0; 3, 0, 3)^(-1) = 1 / mat(1, 2, 3; 2, -1, 0; 3, 0, 3; delim: "|") mat(+(-3), -(6), +(3); -(6), +(-6), -(-6); +(3), -(-6), +(-5))^T = - 1 / 6 mat(-3, -6, 3; -6, -6, 6; 3, 6, -5) $

$ mat(1, 3, 5; 2, 1, 4; -1, 6, 2)^(-1) = 1 / mat(1, 3, 5; 2, 1, 4; -1, 6, 2; delim: "|") mat(-22, -8, 13; 24, 7, -9; 7, 6, -5)^T = 1 / 19 mat(-22, 24, 7; -8, 7, 6; 13, -9, -5) $

== Problem 2

We know that:

$ A^(-1) = 1 / det(A) "adj"(A) $

In particular, this means that:

$ (A^(-1))_(i j) = 1 / det(A) dot (-1)^(i + j) dot det(M_(j i)) $

Where $M_(i j)$ is the matrix obtained by removing the $i$th row and $j$th column of $A$.

Let us first show the backward direction. Suppose that $det(A) = plus.minus 1$. Then, $1 / det(A) in bb(Z)$, $(-1)^(i + j) in bb(Z)$, and $det(M_(i j)) in bb(Z)$ (the last one can be proven either by inducting on matrices with integer entries or using the permutation definition of the determinant).

Since $bb(Z)$ is closed under multiplication, $1 / det(A) dot (-1)^(i + j) dot det(M_(j i)) in bb(Z)$, thus $(A^(-1))_(i j) in bb(Z)$, as needed.

Next, let us show the forward direction. Suppose that all entries of $A^(-1)$ are integers. Then, $det(A^(-1)) in bb(Z)$. We also know that all entries of $A$ are integers. Therefore, $det(A) in bb(Z)$.

However, we know that $det(A^(-1)) det(A) = det(A^(-1) A) = det(I) = 1$ and that $det(A^(-1)), det(A) in bb(Z)$. Therefore, $det(A) | 1$, which implies that $det(A) = plus.minus 1$, as needed. $qed$

== Problem 3

=== (i)

This corresponds to the following matrix equation:

$ mat(1, 1, -1; 3, -1, 1; 3, 2, 4) vec(x, y, z) = vec(2, 5, 0) $

We note that $mat(1, 1, -1; 3, -1, 1; 3, 2, 4; delim: "|") = (-4 - 2) - (12 - 3) - (6 + 3) = -6 - 9 - 9 = -24$

Thus:

$ x = mat(2, 1, -1; 5, -1, 1; 0, 2, 4; delim: "|") / mat(1, 1, -1; 3, -1, 1; 3, 2, 4; delim: "|") = (2 dot (-4 - 2) - 5 dot (4 + 2)) / (-24) = 7 / 4 $
$ y = mat(1, 2, -1; 3, 5, 1; 3, 0, 4; delim: "|") / mat(1, 1, -1; 3, -1, 1; 3, 2, 4; delim: "|") = (-2 dot (12 - 3) + 5 dot (4 + 3)) / (-24) = - 17 / 24 $
$ z = mat(1, 1, 2; 3, -1, 5; 3, 2, 0; delim: "|") / mat(1, 1, -1; 3, -1, 1; 3, 2, 4; delim: "|") = (2 dot (6 + 3) - 5 dot (2 - 3)) / (-24) = -23 / 24 $

=== (ii)
I'm not doing this bruh T_T

$4 times 4$ determinants T_T

== Problem 4

=== (i)

$ det(A) = 8 (64) + a (a^2) = 512 + a^3 $

Thus, $A$ is invertible iff $a eq.not -8$.

=== (ii)

$ x_1 = mat(b, a, 0; c, 8, a; d, 0, 8; delim: "|") / mat(8, a, 0; 0, 8, a; a, 0, 8; delim: "|") = (64 b - 8 a c + a^2 d) / (a^3 + 512) $

$ x_2 = mat(8, b, 0; 0, c, a; a, d, 8; delim: "|") / mat(8, a, 0; 0, 8, a; a, 0, 8; delim: "|") = (a^2 b + 64 c - 8a d) / (a^3 + 512) $

$ x_3 = mat(8, a, b; 0, 8, c; a, 0, d; delim: "|") / mat(8, a, 0; 0, 8, a; a, 0, 8; delim: "|") = (- 8 a b + a^2 c + 64 d) / (a^3 + 512) $

== Problem 5

=== (i)

$ det(A) = a^2 (a^2 - b^2) -b^2 (a^2 - b^2) = (a^2 - b^2)^2 $

$A$ is invertible exactly when the determinant is not zero. This happens exactly when $a eq.not plus.minus b$.

=== (ii)

No.

=== (iii)

When $A$ is invertible (i.e., when $a eq.not plus.minus b$)
, we can solve for $X$ by multiplying along the left and right by the inverse of $A$:

$ A^(-1) (A X A) A^(-1) = A^(-1) I A^(-1) $

$ (A^(-1) A) X (A A^(-1)) = (A^(-1))^2 $

$ X = (A^(-1))^2 $

Otherwise, when $A$ is not invertible (i.e., when $a eq plus.minus b$), there is no $X$ that satisfies the equation, because:

$ det(A X A) = det(A) det(X) det(A) = 0 dot det(X) dot 0 = 0 eq.not 1 = det(I) $

So $ det(A X A) eq.not det(I) $

Therefore, $ A X A eq.not I $

== Problem 6

=== (a)

The determinant of $A$ is:

$ det(A) = 2 $

Thus, $A$ is always invertible.

=== (b)

$ "adj"(A) = mat(+2, -0, +(-2 a); -(1 + a), +1, -(a - a(1 + a)); +0, -0, +2)^T = mat(2, 0, -2 a; -1 - a, 1, a^2; 0, 0, 2)^T = mat(2, -1 - a, 0; 0, 1, 0; -2 a, a^2, 2) $

=== (c)

We have:

$ A^(-1) = 1 / det(A) "adj"(A) = 1/2 "adj"(A) $

Thus:

$ vec(x, y, z) = 1/2 "adj"(A) vec(1, -1, 1) = 1/2 mat(2, -1 - a, 0; 0, 1, 0; -2 a, a^2, 2) vec(1, -1, 1) = 1/2 vec(a + 3, -1, -a^2 - 2 a + 2) $

Finally, we have:

$ x = 1 / 2 a + 3 / 2 $
$ y = -1 / 2 $
$ z = - 1/2 a^2 - a + 1 $

== Problem 7

Exploiting the linearity of the determinant:

#aligned_block(
  [$det(B)$],
  [$=$],
  [$mat(a_11, 1/2 a_12, 1/3 a_13; 2 a_21, a_22, 2/3 a_23; 3 a_31, 3/2 a_32, a_33; delim: "|")$],

  [],
  [$=$],
  [$1/2 mat(a_11,  a_12, 1/3 a_13; 2 a_21, 2 a_22, 2/3 a_23; 3 a_31, 3 a_32, a_33; delim: "|")$],

  [],
  [$=$],
  [$1/2 dot 1/3 mat(a_11,  a_12, a_13; 2 a_21, 2 a_22, 2 a_23; 3 a_31, 3 a_32, 3 a_33; delim: "|")$],

  [],
  [$=$],
  [$1/2 dot 1/3 dot 2 dot 3 mat(a_11,  a_12, a_13; a_21, a_22, a_23; a_31, a_32, a_33; delim: "|")$],

  [],
  [$=$],
  [$1/2 dot 1/3 dot 2 dot 3 dot det(A)$],

  [],
  [$=$],
  [$det(A)$],
)

Thus, $det(A) = det(B)$.

== Problem 8

Since $B$ is an $m times n$ matrix, $B^T$ is an $n times m$ matrix. Thus, $B^T B$ is a $n times n$ matrix.

We want to show that this matrix is symmetric. That is, for any $i, j in bb(Z) inter [1, n]$, $(B^T B)_(i j) = (B^T B)_(j i)$.

We achieve this by directly computing the entry using the definition of matrix multiplication:

#aligned_block(
  [$(B^T B)_(i j)$],
  [$=$],
  [$sum_(k = 1)^m (B^T)_(i k) (B)_(k j)$],

  [],
  [$=$],
  [$sum_(k = 1)^m (B)_(k i) (B^T)_(j k)$],

  [],
  [$=$],
  [$sum_(k = 1)^m (B^T)_(j k) (B)_(k i)$],

  [],
  [$=$],
  [$(B^T B)_(j i)$],
)

Thus, the matrix is symmetric, as needed. $qed$

Comment: There is an easier way to show this. To show that a matrix is symmetric, we can show that a matrix is equal to its transpose.

This leads us to the following one-line proof:

$ (B^T B)^T = (B^T) (B^T)^T = (B^T) B = B^T B $

=== (ii)

No, it is not. First, note that $A$ is a square matrix since it is symmetric.

Consider the matrix $A = mat(1, 0; 0, -1)$, which has a negative determinant ($det(A) = -1$).

However, note that for any $B$, $det(B^T B) = det(B^T) det(B) = det(B)^2 >= 0$. Thus, we cannot express every symmetric matrix $A$ as a product of the form $B^T B$.

== Problem 9

=== (a)

This is quite trivial. Divide the matrix $A$ into blocks, where each block is a single column:

$ A = mat(bold(C_1), bold(C_2), bold(C_3), dots.c, bold(C_n)) $

Now, we have:

$ A X = mat(bold(C_1), bold(C_2), bold(C_3), dots.c, bold(C_n)) vec(x_1, x_2, dots.v, x_n) = sum_(i = 1)^n x_i bold(C_i) $

As needed. $qed$

=== (b)

We can express $bold(A)_j$ using blocks:

$ bold(A)_j = mat(bold(C)_1, bold(C)_2, dots.c, bold(C)_(j - 1), sum_(i = 1)^n x_i bold(C)_i, bold(C)_(j + 1), dots.c, bold(C)_n) $

By the linearity of the determinant, we have:

$ det(bold(A)_j) = sum_(i = 1)^n x_i mat(bold(C)_1, bold(C)_2, dots.c, bold(C)_(j - 1), bold(C)_i, bold(C)_(j + 1), dots.c, bold(C)_n; delim: "|") $

When $i eq.not j$, there is a repeated row so the inner determinant is zero. Otherwise, when $i = j$, the matrix $mat(bold(C)_1, bold(C)_2, dots.c, bold(C)_(j - 1), bold(C)_i, bold(C)_(j + 1), dots.c, bold(C)_n)$ becomes $bold(A)$. Therefore, we get:

$ det(bold(A)_j) = x_j mat(bold(C)_1, bold(C)_2, dots.c, bold(C)_(j - 1), bold(C)_j, bold(C)_(j + 1), dots.c, bold(C)_n; delim: "|") = x_j det(bold(A)) $

=== (c)

Using basic algebra,

$ x_j = det(bold(A)_j) / det(bold(A)) $

== Problem 10

=== (a)

Since determinants respect multiplication:

$ det(bold(A)^m) = det(bold(0)_(n times n)) $
$ det(bold(A))^m = 0 $

This immediately implies $det(bold(A)) = 0$.

=== (b)

Recall that:

$ B "adj"(B) = det(B) I $

Thus:

$ det(B "adj"(B)) = det(det(B) I) $

Since $det(B) I$ is a diagonal matrix, its determinant is the product of the diagonal entries. Since its diagonal consists of $n$ repetitions of $det(B)$, $det(det(B) I) = det(B)^m$.

Thus:

$ det(B "adj"(B)) = det(B)^m $
$ det(B) det("adj"(B)) = det(B)^m $

There are two cases to consider.

The first case is when $ det(B) eq.not 0 $. In this case:

$ det(B) det("adj"(B)) = det(B)^m arrow det("adj"(B)) = det(B)^(m - 1) $

Thus, $det("adj"(B)) = det(B)^(m - 1)$.

In the second case, $det(B) = 0$.

I claim that $"adj"(B)$ is singular. Suppose not, then there exists a matrix $"adj"(B)^(-1)$ such that $"adj"(B) "adj"(B)^(-1) = "adj"(B)^(-1) "adj"(B) = I$.

Multiplying both sides of $B "adj"(B) = det(B) I$ by $"adj"(B)^(-1)$:

$ B "adj"(B) = det(B) I $
$ B "adj"(B) "adj"(B)^(-1) = det(B) I "adj"(B)^(-1) $
$ B = det(B) "adj"(B)^(-1) $
$ B = 0 dot "adj"(B)^(-1) $
$ B = bold(0) $

Thus:

$ "adj"(B) = bold(0) $

But this contradicts the fact that $"adj"(B)$ is invertible. Thus, $"adj"(B)$ is singular.

This implies that $det("adj"(B)) = 0$, as needed.

In both cases, the formula $det("adj"(B)) = det(B)^(m - 1)$ holds. $qed$

== Problem 11

=== (a)

We prove this by checking that every entry is the same. The following calculation verifies this identity:

#aligned_block(
  [$((A B)^T)_(i j)$],
  [$=$],
  [$(A B)_(j i)$],

  [],
  [$=$],
  [$sum_(k = 1)^n A_(j k) B_(k i)$],

  [],
  [$=$],
  [$sum_(k = 1)^n (A^T)_(k j) (B^T)_(i k)$],

  [],
  [$=$],
  [$sum_(k = 1)^n (B^T)_(i k) (A^T)_(k j)$],

  [],
  [$=$],
  [$(B^T A^T)_(i j)$],
)

This proves the identity.

=== (b)

Since $A$ is symmetric,

$ A^T = A $

Thus:

$ A^T A^(-1) = A A^(-1) = I $

Taking the transpose of both sides:

$ (A^T A^(-1))^T = I^T $
$ (A^(-1))^T A = I = A^(-1) A $

Thus, $ ((A^(-1))^T - A^(-1)) A = bold(0) $

Multiplying both sides by $A^(-1)$:

$ ((A^(-1))^T - A^(-1)) A = bold(0) $
$ ((A^(-1))^T - A^(-1)) A A^(-1) = bold(0) A^(-1) $
$ (A^(-1))^T - A^(-1) = bold(0) $
$ (A^(-1))^T = A^(-1) $

Thus, $A^(-1)$ is transpose.

=== (c)

Yes. The $(i, j)$-minor of $A$ is just the transpose of the $(j, i)$-minor of $A^T$. But since $A^T = A$, the $(i, j)$-minor of $A$ is the transpose of the $(j, i)$-minor of $A$. Finally, since $det(B) = det(B^T)$ for any square matrix $B$, we conclude that the $(i, j)$-entry of $"adj"(A)$ (which is $(-1)^(i + j) det("minor"(A, (i, j)))$) is equal to its $(j, i)$-entry (which is $(-1)^(j + i) det("minor"(A, (j, i)))$). Therefore, $"adj"(A)$ is also symmetric.

Note: In the actual exam, try explicitly computing the $i, j$ entry.

== Problem 12

=== (a)

Since $A A^T = I_n$, we have:

$ det(A A^T) = det(I_n) $
$ det(A A^T) = 1 $
$ det(A) det(A^T) = 1 $
$ det(A)^2 = 1 $
$ (det(A) - 1)(det(A) + 1) = 0 $

Thus, $det(A) = 1$ or $det(A) = -1$.


=== (b)

Suppose $A$ and $B$ were both orthogonal. Notice that:

$ (A B) (A B)^T = (A B) (B^T A^T) = A (B B^T) A^T = A I_n A^T = A A^T = I_n $
$ (A B)^T (A B) = (B^T A^T) (A B) = B^T (A^T A) B = B^T I_n B = B^T B = I_n $

=== (c)

Yes, the inverse of orthogonal matrix $A$ is $A^T$.

=== (d)

$ mat(1, 0, 0; 0, sqrt(2)/2, -sqrt(2)/2; 0, -sqrt(2)/2, sqrt(2)/2) $

or even more simply:

$ mat(0, 1, 0; 0, 0, 1; 1, 0, 0) $

=== (e)

Since $A(t)$ is always orthogonal, we have:

$ A^T (t) A(t) = I_n $

Thus, by the definition of matrix multiplication:

#aligned_block(
  [$(A^T (t) A(t))_(i j)$],
  [$=$],
  [$(I_n)_(i j)$],

  [$sum_(k = 1)^n (A^T (t))_(i k) (A(t))_(k j)$],
  [$=$],
  [$(I_n)_(i j)$],

  [$sum_(k = 1)^n a_(k i)(t) a_(k j)(t)$],
  [$=$],
  [$(I_n)_(i j)$],
)

Differentiating both sides with respect to time:

#aligned_block(
  [$d / (d t) sum_(k = 1)^n a_(k i)(t) a_(k j)(t)$],
  [$=$],
  [$d / (d t) (I_n)_(i j)$],

  [$sum_(k = 1)^n (a_(k i) '(t) a_(k j)(t) + a_(k i)(t) a_(k j) '(t))$],
  [$=$],
  [$0$],

  [$sum_(k = 1)^n (a_(k i) '(0) a_(k j)(0) + a_(k i)(0) a_(k j) '(0))$],
  [$=$],
  [$0$],

  [$a_(j i) '(0) a_(j j)(0) + a_(i i)(0) a_(i j) '(0)$],
  [$=$],
  [$0$],

  [$a_(j i) '(0) dot 1 + 1 dot a_(i j) '(0)$],
  [$=$],
  [$0$],

  [$a_(j i) '(0) + a_(i j) '(0)$],
  [$=$],
  [$0$],

  [$a_(j i) '(0)$],
  [$=$],
  [$-a_(i j) '(0)$],
)

Thus, $D$ is indeed anti-symmetric, as needed. $qed$

== Problem 13

It helps to organize the matrices into blocks:

$ X_k = mat((A^(-1) B)_(k + 1, 1), dots.c, (A^(-1) B)_(k + 1, n - k); dots.v, dots.down, dots.v; (A^(-1) B)_(n, 1), dots.c, (A^(-1) B)_(n, n - k)) $

$ Y_k = mat(bold(A)_(:, 1), dots.c, bold(A)_(:, k), bold(B)_(:, 1), dots.c, bold(B)_(:, n - k)) $

Where $":"$ denotes picking all entries (eg., $A_(:,1)$ denotes picking all elements along column 1).

Let us left-multiply $Y_k$ by $A^(-1)$:

$ A^(-1) Y_k = mat((I_n)_([1, n], [1, k]), X_([1, n], [1, n - k])) $

We can further decompose the left and right blocks into smaller blocks:

$ A^(-1) Y_k = mat(I_k, X_([1, k], [1, n - k]); bold(0)_((n - k) times k), X_([k + 1, n], [1, n - k])) $

But notice that $X_([k + 1, n], [1, n - k])$ is just the result of removing the first $k$ rows and the last $k$ columns of $X$. Thus, by definition, $X_k = X_([k + 1, n], [1, n - k])$. We therefore have:

$ A^(-1) Y_k = mat(I_k, X_([1, k], [1, n - k]); bold(0)_((n - k) times k), X_k) $

Finally, we recognize that the matrix to the right is block upper triangular. Therefore, the determinant of the matrix is simply the product of the determinants of the diagonal blocks. We therefore have:

#aligned_block(
  [$det(Y_k)$],
  [$=$],
  [$1 / 1 dot det(Y_k)$],

  [],
  [$=$],
  [$1 / det(A) dot det(Y_k)$],

  [],
  [$=$],
  [$det(A^-1) det(Y_k)$],

  [],
  [$=$],
  [$det(A^-1 Y_k)$],

  [],
  [$=$],
  [$mat(I_k, X_([1, k], [1, n - k]); bold(0)_((n - k) times k), X_k; delim: "|")$],

  [],
  [$=$],
  [$det(I_k) dot det(X_k)$],

  [],
  [$=$],
  [$1 dot det(X_k)$],

  [],
  [$=$],
  [$det(X_k)$],
)

This proves the result. $qed$

= Problem Set 8

== Problem 1

1. Subspace: Nonempty, closed under vector addition, closed under scalar multiplication.
2. Not a subspace: Add $(1, 1, 1)$ to itself, the result is not in the set.
3. Not a subspace: Same reason as 2.
4. Not a subspace: $(0, 0, 1)$ in set but scalar multiple $(0, 0, pi)$ is not.
5. Not a subspace: $(0, 0, 1)$ in set but scalar multiple $(0, 0, -1)$ is not.
6. Subspace: Span of $(0, 0, 1)$.
7. Not a subspace: Zero vector is not in set.
8. Not a subspace: $(3, 2, 1)$ in set but not scalar multiple $(-3, -2, -1)$.
9. Subspace: Homogenous System.
10. Subspace: Span of $(1, 0, 0), (0, 1, 1)$.
11. Not a subspace: $(2, 2, 4)$ in set but not scalar multiple $(4, 4, 8)$.
12. Not a subspace: $(1, 1, 1)$ in set  but not scalar multiple $(-1, -1, -1)$.
13. Subspace: $f(x) = x^3$ is bijective over $bb(R)$, so this is just $bb(R)^3$.
14. Subspace: Homogenous System.
15. Not a subspace: Inhomogenous in variables $x-1, y, z$.
16. Subspace: Homogenous in $x, y - 1, z$.
17. Subspace: Homogenous System.

== Problem 2

Not closed under vector addition: $(0, 1, 1), (0, 1, -1)$ in the set, but the sum $(0, 2, 0)$ is not.

Closed under scalar multiplication: $ x^4 + y^4 - z^4 = 0 arrow (k x)^4 + (k y)^4 - (k z)^4 = k^4 (x^4 + y^4 - z^4) = 0 $

So $forall k in bb(R), (x, y, z) in S arrow (k x, k y, k z) in S$

Nonempty: $(0, 0, 0) in S$

== Problem 3

$S$ is just equal to:

$ S = {(u + v, 2 u - v, u + 2 v) in bb(R)^3 ; u, v in bb(R)} $

It is closed under vector addition:

$ (u_1 + v_1, 2 u_1 - v_1, u_1 + 2 v_1) + (u_2 + v_2, 2 u_2 - v_2, u_2 + 2 v_2) $
$ = ((u_1 + u_2) + (v_1 + v_2), 2 (u_1 + u_2) - (v_1 + v_2), (u_1 + u_2) + 2 (v_1 + v_2)) $

Since $u_1 + u_2, v_1 + v_2 in bb(R)$, by definition, the sum is in the set $S$.

$S$ is nonempty because $(0, 0, 0) in S$ (set $u = v = 0$ to get the zero vector).

== Problem 4

For any element of the set $S$, $a = -b$, so $a (1, 1, 0) + b(0, 1, 1) = (a, a - a, -a) = a (1, 0, -1)$.

Thus:

$ S = {a (1, 0, -1); a in bb(R)} $

Consider two arbitrary elements of $S$, $a_1 (1, 0, -1)$ and $a_2 (1, 0, -1)$.

By definition, since $a_1 + a_2 in bb(R)$, $(a_1 + a_2) (1, 0, -1) in S$.

However, $(a_1 + a_2) (1, 0, -1) = a_1 (1, 0, -1) + a_2 (1, 0, -1)$, so the set $S$ is closed under vector addition.

Further, for any $k in bb(R)$, $k a_1 in bb(R)$. Thus, $(k a_1) (1, 0, -1) in S$. This shows that $S$ is closed under scalar multiplication.

Finally, it is nonempty, since $(0, 0, 0) = 0 (1, 0, -1) in S$.

Thus, $S$ is a subspace.

== Problem 5

=== 1

$U$ and $V$ contain the origin.

=== 2

It the list obtained by concatenating $L_1$ and $L_2$.

=== 3

==== $U inter V$

The list of equations with this set of solutions is:

$ 2 x - y + 3 z = 0 $
$ 3 x + 2 y - z = 0 $

This corresponds to the following augmented matrix:

$ mat(2, -1, 3, 0; 3, 2, -1, 0; augment: #3) $
$ mat(6, -3, 9, 0; 6, 4, -2, 0; augment: #3) $
$ mat(6, -3, 9, 0; 0, 7, -11, 0; augment: #3) $
$ mat(42, -21, 63, 0; 0, 21, -33, 0; augment: #3) $
$ mat(42, 0, 30, 0; 0, 21, -33, 0; augment: #3) $
$ mat(7, 0, 5, 0; 0, 7, -11, 0; augment: #3) $

A parameterization for the set of solutions is thus:

$ (-5 r, 11 r, 7 r) = r (-5, 11, 7) $

==== $V inter W$

The list of equations whose set of solutions is $V inter W$ is:

$ 3 x + 2 y - z = 0 $
$ x - 3 y - 2 z = 1 $

This corresponds to the following augmented matrix:

$ mat(3, 2, -1, 0; 1, -3, -2, 1; augment: #3) $
$ mat(1, -3, -2, 1; 3, 2, -1, 0; augment: #3) $
$ mat(-3, 9, 6, -3; 3, 2, -1, 0; augment: #3) $
$ mat(-3, 9, 6, -3; 0, 11, 5, -3; augment: #3) $
$ mat(-33, 99, 66, -33; 0, 99, 45, -27; augment: #3) $
$ mat(-33, 0, 21, -6; 0, 99, 45, -27; augment: #3) $
$ mat(11, 0, -7, 2; 0, 11, 5, -3; augment: #3) $

A parameterization for the set of solutions is thus:

$ (2/11 + 7 r, -3 / 11 - 5 r, 11 r) = (2 / 11, -3 / 11, 0) + r (7, -5, 11) $

=== 4

$U inter V$ is a subspace because it can be expressed as the span of $(-5, 11, 7)$.

$V inter W$, on the other hand, is not a subspace because $(0, 0, 0)$ is not in the set (you can easily check this).

== Problem 6

=== (a)

$a + d$

=== (b)

Subspace: Homogenous System.

=== (c)

Not a subspace: $(1, 1, 1, 1)$ is in the set but not its scalar multiple $(-1, -1, -1, -1)$.

=== (d)

We have:

$ tr(mat(a, b; c, d)^2) = (a^2 + b c) + (d^2 + b c) = 0 $

So, $(1, 1, -1, 1), (-1, 1, -1, 1) in S_3$. However, notice that the sum $(0, 2, -2, 0) in.not S_3$.

=== (e)

Notice that $ det(mat(a, b; c, d) mat(a, b; c, d)^T) = det(mat(a, b; c, d)) det(mat(a, b; c, d)^T) = det(mat(a, b; c, d))^2 $

This is always $>= 0$, so $S_4 = bb(R)^4$, which is clearly a subspace.

== Problem 7

=== (i)

Not a subspace. Inhomogenous.

=== (ii)

Subspace. Determinant reduces to homogenous system.

=== (iii)

Subspace. The determinant is $c - b$. This reduces to a homogenous system.

=== (iv)

Subspace. Homogenous system.

=== (v)

Subspace. Determinant is always zero, so $S_5 = bb(R)^3$.

=== (vi)

Subspace. Determinant is zero because three of the vectors are linearly dependent. Thus, the rank is at most $3$. Therefore, the RREF contains at least one row of zeros, so the RREF is not the identity matrix. Therefore, the matrix is noninvertible, which implies zero determinant.

Therefore, the condition is always true and $S_6 = bb(R)^3$.

== Problem 8

=== (a)

Not a subspace. $(1, 1, 0), (0, 0, 1) in S$, but their sum $(1, 1, 1)$ is not.

=== (b)

$bb(Z)^2$

$(1, 1)$ is in the set but scalar multiple $(pi, pi)$ is not.

== Problem 9

Applying cofactor expansion on the last row, the determinant condition becomes:

$ det(M_(arrow(v))) = sum_(i = 1)^n det("minor"(M_(arrow(v)), (i, n))) (arrow(v))_i = 0 $

This is clearly a homogenous system in terms of the entries of $arrow(v)$. Thus, we conclude that the set $S$ is a subspace of $bb(R)^n$. $qed$

NOTE: In the actual exam, this is *not enough*. If it asks for a careful proof, we must check the axioms.

== Problem 10

=== (i)

Suppose $(x_1, z_1), (x_2, z_2) in W$ are two particular but arbitrarily-chosen elements of $W$.

By definition, there must exist $y_1, y_2 in bb(R)$ such that $(x_1, y_1, z_1), (x_2, y_2, z_2) in V$.

Since $V$ is a subspace, $((x_1 + x_2), (y_1 + y_2), (z_1 + z_2)) = (x_1, y_1, z_1) + (x_2, y_2, z_2) in V$. Thus, by definition, $(x_1, z_1) + (x_2, z_2) = (x_1 + x_2, z_1 + z_2) in W$.

Thus, $W$ is closed under vector addition.

Further, since $(x_1, y_1, z_1) in V$, $(k x_1, k y_1, k z_1) = k (x_1, y_1, z_1) in V$. Therefore, by definition, $k (x_1, z_1) = (k x_1, k z_1) in W$.

Thus, $W$ is closed under scalar multiplication.

Finally, $W$ is nonempty since $V$ is nonempty. Formally, suppose $(x_1, y_1, z_1) in V$ is some element. Then, $(x_1, z_1) in W$.

=== (ii)

$ W = {(x, 0); x in bb(R)} $

== Problem 11

=== 1

It is definitely closed. Suppose $arrow(v_1), arrow(v_2) in V$. Then, there exist $arrow(u_1), arrow(u_2) in bb(R)^n$ such that:

$ arrow(v_1) = A arrow(u_1) $
$ arrow(v_2) = A arrow(u_2) $

Since $arrow(u_1), arrow(u_2) in bb(R)^n$, $arrow(u_1) + arrow(u_2) in bb(R)^n$.

Thus, $A (arrow(u_1) + arrow(u_2)) in V$ by definition. However, $A (arrow(u_1) + arrow(u_2)) = A arrow(u_1) + A arrow(u_2) = arrow(v_1) + arrow(v_2)$. Thus, $arrow(v_1) + arrow(v_2) = A (arrow(u_1) + arrow(u_2)) in V$. This proves that $V$ is closed under vector addition.

Furthermore, let $k in bb(R)$ and $arrow(v) in V$ be particular but arbitrarily chosen elements of their respective sets.

By definition, there exists a $arrow(u) in bb(R)^n$ such that $arrow(v) = A arrow(u)$.

Since $arrow(u) in bb(R)$, $k arrow(u) in bb(R)$. Thus, by definition, $k arrow(v) = k (A arrow(u) = A (k arrow(u)) in V$. Thus, $V$ is closed under scalar multiplication.

Finally, $V$ is clearly nonempty as $A arrow(0) in V$.

=== 2

(i) $(x_1 + 2 x_2 + 3 x_3, x_2 + x_3)$

(ii) $(x_1, 2 x_1 + x_2, 3 x_1 + x_2)$

== Problem 12

Suppose not. Then, there exist $arrow(v_1), arrow(v_2) in bb(R)^n$ such that $arrow(v_1) in V_1 and arrow(v_1) in.not V_2$ and $arrow(v_2) in.not V_1 and arrow(v_2) in V_2$.

Since $V_1 union V_2$ is a subspace and $arrow(v_1), arrow(v_2) in V_1 union V_2$, $arrow(v_1) + arrow(v_2) in V_1 union V_2$.

Let us consider both cases.

Suppose $arrow(v_1) + arrow(v_2) in V_1$. Since $arrow(v_1) in V_1$, $arrow(v_2) = (arrow(v_1) + arrow(v_2)) - arrow(v_1) in V_1$, contradiction.

Now suppose $arrow(v_1) + arrow(v_2) in V_2$. Since $arrow(v_2) in V_2$, $arrow(v_1) = (arrow(v_1) + arrow(v_2)) - arrow(v_2) in V_2$, contradiction.

In both cases, we have a contradiction. Therefore, we conclude that $V_1 subset V_2 or V_2 subset V_1$.

== Problem 13

=== 1

Suppose $arrow(u_1), arrow(u_2) in V_1 + V_2$ are particular but arbitrarily chosen elements of the set. By definition, there exist $arrow(w_1), arrow(w_2) in V_1$ and $arrow(v_1), arrow(v_2) in V_2$ such that:

$ arrow(u_1) = arrow(w_1) + arrow(v_1) $
$ arrow(u_2) = arrow(w_2) + arrow(v_2) $

Let us first verify that $V_1 + V_2$ is closed under vector addition. That is, that $arrow(u_1) + arrow(u_2) in V_1 + V_2$

Since $V_1$ and $V_2$ are subspaces, $arrow(w_1) + arrow(w_2) in V_1$ and $arrow(v_1) + arrow(v_2) in V_2$.

Thus, by definition,

$ (arrow(w_1) + arrow(w_2)) + (arrow(v_1) + arrow(v_2)) in V_1 + V_2 $

Further,

$ arrow(u_1) + arrow(u_2) = arrow(w_1) + arrow(v_1) + arrow(w_2) + arrow(v_2) = (arrow(w_1) + arrow(w_2)) + (arrow(v_1) + arrow(v_2)) $

Thus, $ arrow(u_1) + arrow(u_2) in V_1 + V_2 $

This proves that $V_1 + V_2$ is closed under vector addition.

Now, we want to show that $V_1 + V_2$ is closed under scalar multiplication. That is, that $k arrow(u_1) in V_1 + V_2$

Since $arrow(w_1) in V_1$ and $arrow(v_1) in V_2$ and both $V_1, V_2$ are subspaces, for any $k in bb(R)$, $k arrow(w_1) in V_1$ and $k arrow(v_1) in V_2$. Thus, by definition,

$ (k arrow(w_1)) + (k arrow(v_1)) in V_1 + V_2 $

Further, $ k arrow(u_1) = k (arrow(w_1) + k arrow(v_1)) = (k arrow(w_1)) + (k arrow(v_1)) $

Thus, $ k arrow(u_1) in V_1 + V_2 $

As needed. This shows that $V_1 + V_2$ is closed under scalar multiplication.

Finally, we must show that $V_1 + V_2$ is nonempty.

Since $V_1, V_2$ are both subspaces, $arrow(0) in V_1 and arrow(0) in V_2$.

Therefore, by definition, $arrow(0) = arrow(0) + arrow(0) in V_1 + V_2$.

Thus, $V_1 + V_2$ is nonempty. Since $V_1 + V_2$ satisfies all subspace axioms, $V_1 + V_2$ is a subspace, as needed. $qed$

=== 2

Let $arrow(u)$ be a particular but arbitrarily-chosen element of $V_1 + V_2$. By definition, there exist $arrow(v_1) in V_1$ and $arrow(v_2) in V_2$ such that $arrow(u) = arrow(v_1) + arrow(v_2)$.

Since $V_1 subset W$ and $V_2 subset W$ and $arrow(v_1) in V_1$ and $arrow(v_2) in V_2$, we conclude that both $arrow(v_1) in W$ and $arrow(v_2) in W$ hold.

Finally, since $W$ is a subspace, $arrow(v_1) + arrow(v_2) in W$. But $arrow(u) = arrow(v_1) + arrow(v_2)$. Therefore, $arrow(u) in W$.

Thus, $V_1 + V_2 subset W$.

== Problem 14

=== (a)

First, let us show that the set $S$ is closed under vector addition. Suppose that $arrow(s), arrow(t) in S$ are two particular but arbitrarily-chosen elements of $S$. We want to show that $arrow(s) + arrow(t) in S$

By definition, we have the following equalities:

$ sum_(i = 1)^n s_i v_i = 0 $
$ sum_(i = 1)^n t_i v_i = 0 $

Notice that:

$ sum_(i = 1)^n (s_i + t_i) v_i = sum_(i = 1)^n (s_i v_i + t_i v_i) = sum_(i = 1)^n s_i v_i + sum_(i = 1)^n t_i v_i = 0 + 0 = 0 $

However, $(arrow(s) + arrow(t)) dot arrow(v) = sum_(i = 1)^n (s_i + t_i) v_i$ by definition, so $(arrow(s) + arrow(t)) dot arrow(v) = 0$.

By definition, this implies that $arrow(s) + arrow(t) in S$, as needed.

Next, let us show that the set $S$ is closed under scalar multiplication. Suppose that $arrow(s) in S$ is a particular but arbitrarily-chosen element of $S$. For any arbitrary constant $k in bb(R)$, we want to show that $k arrow(s) in S$.

Since $arrow(s) in S$, by definition, we have:

$ sum_(i = 1)^n s_i v_i = 0 $

Now, notice that:

$ (k arrow(s)) dot arrow(v) = sum_(i = 1)^n (k s_i) v_i = sum_(i = 1)^n k (s_i v_i) = k sum_(i = 1)^n (s_i v_i) = k dot 0 = 0 $

Thus, by definition, $k arrow(s) in S$.

Finally, $S$ is nonempty since $arrow(v) dot arrow(0) = sum_(i = 1)^n v_i dot 0 = sum_(i = 1)^n 0 = 0$, so $arrow(0) in S$.

Since $S$ satisfies all three subspace axioms, $S$ is a subspace.

=== (b)

I claim that setting $c = (arrow(v) dot arrow(w)) / (arrow(v) dot arrow(v))$ and $arrow(z) = arrow(w) - (arrow(v) dot arrow(w)) / (arrow(v) dot arrow(v)) arrow(v)$ works.

First, clearly $c in bb(R)$ and $arrow(w) = ((arrow(v) dot arrow(w)) / (arrow(v) dot arrow(v))) arrow(v) + (arrow(w) - (arrow(v) dot arrow(w)) / (arrow(v) dot arrow(v)) arrow(v)) = c arrow(v) + arrow(z)$.

We thus only need to show that $arrow(z) in S$, that is, that $arrow(v) dot arrow(z) = 0$.

We notice that:

#aligned_block(
  [$arrow(v) dot arrow(z)$],
  [$=$],
  [$sum_(i = 1)^n v_i z_i$],

  [],
  [$=$],
  [$sum_(i = 1)^n v_i (w_i - (arrow(v) dot arrow(w)) / (arrow(v) dot arrow(v)) v_i)$],

  [],
  [$=$],
  [$sum_(i = 1)^n v_i w_i - sum_(i = 1)^n (arrow(v) dot arrow(w)) / (arrow(v) dot arrow(v)) v_i^2$],

  [],
  [$=$],
  [$sum_(i = 1)^n v_i w_i - (arrow(v) dot arrow(w)) / (arrow(v) dot arrow(v)) sum_(i = 1)^n v_i^2$],

  [],
  [$=$],
  [$sum_(i = 1)^n v_i w_i - (sum_(i = 1)^n v_i w_i) / (sum_(i = 1)^n v_i^2) sum_(i = 1)^n v_i^2$],

  [],
  [$=$],
  [$sum_(i = 1)^n v_i w_i - (sum_(i = 1)^n v_i w_i)$],

  [],
  [$=$],
  [$0$],
)

Thus, $arrow(v) dot arrow(z) = 0$. By definition, we conclude $arrow(z) in S$, so indeed this construction is valid. We thus prove the original statement. $qed$

= Problem Set 9

== Problem 1

=== (1)

(Note: I accidentally swapped the order of w, x, y, z. oops)

We can do this by directly verifying the subspace axioms.

First, suppose that $(x_1, y_1, z_1, w_1), (x_2, y_2, z_2, w_2) in V$ are particular but arbitrarily-chosen (not necessarily distinct) elements of $V$.

By definition,

$ w_1 + x_1 = y_1 + z_1 = -x_1 + 2y_1 $
$ w_2 + x_2 = y_2 + z_2 = -x_2 + 2y_2 $

Adding these equations together, we get:

$ (w_1 + w_2) + (x_1 + x_2) = (y_1 + y_2) + (z_1 + z_2) = -(x_1 + x_2) + 2(y_1 + y_2) $

Therefore, by definition, $(x_1 + x_2, y_1 + y_2, z_1 + z_2, w_1 + w_2) in V$.

Thus, $V$ is closed under vector addition.

Furthermore, let $c in bb(R)$.

Multiplying the above equations by $c$, we obtain the following set of equations:

$ (c w_1) + (c x_1) = (c y_1) + (c z_1) = - (c x_1) + 2 (c y_1) $

Thus, by definition, $c (x_1, y_1, z_1, w_1) = (c x_1, c y_1, c z_1, c w_1) in V$. Therefore, $V$ is closed under scalar multiplication.

Finally, $V$ is nonempty since setting $(x, y, z, w) = (0, 0, 0, 0)$ satisfies the equations and thus $(0, 0, 0, 0) in V$.

Thus, $V$ is a subspace of $bb(R)^4$.

=== (2)

Rewriting the equations:

$ w + x - y - z = 0 $
$ -x + y - z = 0 $

The equations correspond to the following augmented matrix:

$ mat(1, 1, -1, -1, 0; 0, -1, 1, -1, 0; augment: #4) $

Reducing the matrix into RREF:

$ mat(1, 1, -1, -1, 0; 0, -1, 1, -1, 0; augment: #4) $
$ mat(1, 0, 0, -2, 0; 0, -1, 1, -1, 0; augment: #4) $
$ mat(1, 0, 0, -2, 0; 0, 1, -1, 1, 0; augment: #4) $

Thus, a parameterization for this system is:

$ w = 2 s $
$ x = r - s $
$ y = r $
$ z = s $

Therefore:

$ (w, x, y, z) = r (0, 1, 1, 0) + s (2, -1, 0, 1) $

Thus, $ V = "span"{(0, 1, 1, 0), (2, -1, 0, 1)} $

== Problem 2

We can express this system as the following augmented matrix:

$ mat(0, 10, -4, 1, 0; 1, 4, -1, 1, 0; 3, 2, 1, 2, 0; -2, -8, 2, -2, 0; 1, -6, 3, 0, 0; augment: #4) $
$ mat(0, 10, -4, 1, 0; 1, 4, -1, 1, 0; 3, 2, 1, 2, 0; 1, 4, -1, 1, 0; 1, -6, 3, 0, 0; augment: #4) $
$ mat(0, 10, -4, 1, 0; 1, 4, -1, 1, 0; 3, 2, 1, 2, 0; 0, 0, 0, 0, 0; 1, -6, 3, 0, 0; augment: #4) $
$ mat(1, -6, 3, 0, 0; 0, 10, -4, 1, 0; 1, 4, -1, 1, 0; 3, 2, 1, 2, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, -6, 3, 0, 0; 0, 10, -4, 1, 0; 0, 10, -4, 1, 0; 0, 20, -8, 2, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, -6, 3, 0, 0; 0, 10, -4, 1, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, -6, 3, 0, 0; 0, 1, -2/5, 1/10, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, 0, 3/5, 3 / 5, 0; 0, 1, -2/5, 1/10, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0; augment: #4) $

Thus, a parameterization for this system is:

$ (-3/5 r -3/5 s, 2/5 r - 1/10 s, r, s) = r (-3/5, 2/5, 1, 0) + s (-3/5, -1/10, 0, 1) $

Thus, the solution set is $"span"{(-3/5, 2/5, 1, 0), (-3/5, -1/10, 0, 1)}$

== Problem 3

=== (i)

For the four vectors to span all of $bb(R)^4$, the RREF of the following matrix must be the identity matrix:

$ mat(0, -a, 0, 1; 1, 0, a, 0; 0, 1, 0, 0; 0, -1, 0, 1) $
$ mat(1, 0, a, 0; 0, 1, 0, 0; 0, -1, 0, 1; 0, -a, 0, 1) $
$ mat(1, 0, a, 0; 0, 1, 0, 0; 0, 0, 0, 1; 0, 0, 0, 1) $
$ mat(1, 0, a, 0; 0, 1, 0, 0; 0, 0, 0, 1; 0, 0, 0, 0) $

The RREF of this matrix can never be the identity, as there is a row of zeros. Therefore, $"span"(S) eq.not bb(R)^4$

=== (ii)

Row-reducing again:

$ mat(0, -a, 0, 1, x_1; 1, 0, a, 0, x_2; 0, 1, 0, 0, x_3; 0, -1, 0, 1, x_4; augment: #4) $
$ mat(1, 0, a, 0, x_2; 0, 1, 0, 0, x_3; 0, -a, 0, 1, x_1; 0, -1, 0, 1, x_4; augment: #4) $
$ mat(1, 0, a, 0, x_2; 0, 1, 0, 0, x_3; 0, 0, 0, 1, x_1 + a x_3; 0, 0, 0, 1, x_4 + x_3; augment: #4) $
$ mat(1, 0, a, 0, x_2; 0, 1, 0, 0, x_3; 0, 0, 0, 1, x_1 + a x_3; 0, 0, 0, 0, x_4 - x_1 + (1 - a) x_3; augment: #4) $

Thus, for the vector to not be in the span, $x_4 - x_1 + (1 - a) x_3 eq.not 0$


The vector $(1, 0, 0, 0)$ is always not in the span.

== Problem 4

=== (i)

We want to see if the vectors on the left are in the span of the vectors on the right. We can determine this by row-reducing the following augmented matrix:

$ mat(-1, 3, 0, -4, 2, 1, 0, 1; 2, 1, 1, 3, 0, 0, 3, 1; 1, 4, 1, -1, 2, 2, 6, 2; 0, 0, 3, 6, -4, 5, 9, -1; augment: #4) $

$ mat(-1, 3, 0, -4, 2, 1, 0, 1; 0, 7, 1, -5, 4, 2, 3, 3; 0, 7, 1, -5, 4, 3, 6, 3; 0, 0, 3, 6, -4, 5, 9, -1; augment: #4) $

$ mat(-1, 3, 0, -4, 2, 1, 0, 1; 0, 7, 1, -5, 4, 2, 3, 3; 0, 0, 0, 0, 0, 1, 3, 0; 0, 0, 3, 6, -4, 5, 9, -1; augment: #4) $

$ mat(-1, 3, 0, -4, 2, 1, 0, 1; 0, 7, 1, -5, 4, 2, 3, 3; 0, 0, 3, 6, -4, 5, 9, -1; 0, 0, 0, 0, 0, 1, 3, 0; augment: #4) $

We note that some of the vectors are not in the span, and thus the statement is false.

=== (ii)

This time, we just interchange the positions of the vectors.

$ mat(2, 1, 0, 1, -1, 3, 0, -4; 0, 0, 3, 1, 2, 1, 1, 3; 2, 2, 6, 2, 1, 4, 1, -1; -4, 5, 9, -1, 0, 0, 3, 6; augment: #4) $

$ mat(2, 1, 0, 1, -1, 3, 0, -4; 0, 0, 3, 1, 2, 1, 1, 3; 0, 1, 6, 1, 2, 1, 1, 3; 0, 7, 9, 1, -2, 6, 3, -2; augment: #4) $

$ mat(2, 1, 0, 1, -1, 3, 0, -4; 0, 1, 6, 1, 2, 1, 1, 3; 0, 7, 9, 1, -2, 6, 3, -2; 0, 0, 3, 1, 2, 1, 1, 3; augment: #4) $

$ mat(2, 1, 0, 1, -1, 3, 0, -4; 0, 1, 6, 1, 2, 1, 1, 3; 0, 0, -33, -6, -16, -1, -4, -23; 0, 0, 3, 1, 2, 1, 1, 3; augment: #4) $

$ mat(2, 1, 0, 1, -1, 3, 0, -4; 0, 1, 6, 1, 2, 1, 1, 3; 0, 0, 3, 1, 2, 1, 1, 3; 0, 0, -33, -6, -16, -1, -4, -23; augment: #4) $

$ mat(2, 1, 0, 1, -1, 3, 0, -4; 0, 1, 6, 1, 2, 1, 1, 3; 0, 0, 3, 1, 2, 1, 1, 3; 0, 0, 0, 5, 6, 10, 7, 10; augment: #4) $

This statement is thus true.

=== (iii)

From the calculation in (ii), this statement is true.

=== (iv)

From the calculation in (i), this statement is false.

== Problem 5

=== (i)

False. $(0, 0, 1), (0, 1, 0), (0, 1, 1)$ is linearly dependent and thus does not form a spanning set of $bb(R)^3$

=== (ii)

False. Notice that $(1, 0), (0, 1)$ and $(1, 1), (1, -1)$ both span $bb(R)^2$, so the intersection of their spans is $bb(R)^2$. But the span of their intersections is the span of the empty set, which is just the trivial subspace. This is thus false since the two expressions are not equal.

=== (iii)

This is false because the RHS is not always a subspace (consider $S_1 = {(1, 0)}$ and $S_2 = {(0, 1)}$).

== Problem 6

=== (i)

We must verify the three axioms. Suppose $(a_1, b_1, c_1, d_1) in V$ and $(a_2, b_2, c_2, d_2) in V$. By definition, we have:

$ a_1 + b_1 = c_1 + d_1 $
$ a_2 + b_2 = c_2 + d_2 $

To verify the first axiom, add the two equations together to obtain:

$ a_1 + b_1 + a_2 + b_2 = c_1 + d_1 + c_2 + d_2 $
$ (a_1 + a_2) + (b_1 + b_2) = (c_1 + c_2) + (d_1 + d_2) $

We have thus concluded:

$ (a_1, b_1, c_1, d_1) + (a_2, b_2, c_2, d_2) = (a_1 + a_2, b_1 + b_2, c_1 + c_2, d_1 + d_2) in V $

To verify the second axiom, multiply the first equation by $k$.

For any constant $k in bb(R)$, $(k a_1) + (k b_1) = (k c_1) + (k d_1)$. Thus, if $(a_1, b_1, c_1, d_1) in V$, $k (a_1, b_1, c_1, d_1) in V$.

Finally, $V$ is nonempty because $0 + 0 = 0 + 0$, thus $(0, 0, 0, 0) in V$.

This shows that $V$ is a subspace of $bb(R)^4$.

=== (ii)

$"span"(S) subset.eq V$ because all vectors in $S$ are in $V$.

To determine whether $V subset.eq "span"(S)$, we check that the following is always satisfiable given the constraint $a + b = c + d$:

$ mat(1, 0, 3, a; 0, -3, 6, b; 2, 1, 4, c; -1, -4, 5, d) $

Reducing to row-echelon form:

$ mat(1, 0, 3, a; 0, -3, 6, b; 2, 1, 4, c; -1, -4, 5, d) $

$ mat(1, 0, 3, a; 0, -3, 6, b; 0, 1, -2, c - 2a; 0, -4, 8, d + a) $

$ mat(1, 0, 3, a; 0, 1, -2, c - 2a; 0, 0, 0, b + 3c - 6a; 0, 0, 0, d + a + 4 c - 8 a) $

Note, however, that $(0, 1, 0, 1)$ is not in the span because $b + 3c - 6a = 1 + 3 dot 0 - 6 dot 0 = 1 eq.not 0$ in this case, and thus, the matrix above is not satisfiable. Furthermore, $(0, 1, 0, 1) in V$ by definition. Therefore, $V subset.eq.not "span"(S)$.

We also conclude that $"span"(S) eq.not V$.

== Problem 7

For this statement to be true, the vectors $arrow(w_1)$ and $arrow(w_2)$ must be in the span of the $arrow(v_i)$ s.

We can directly test this using standard matrix algorithms. Below, we have encoded the vectors $arrow(v_i)$ as column vectors to the left of the bar, while the vectors $arrow(w_i)$ are encoded as column vectors to the right of the bar.

$ mat(1, 1, 3, 0, 4; 0, 1, 2, 1, 3; -1, 1, a, 0, 0; 1, 1, -2, 5, -1; augment: #3) $

Reducing this matrix using Gaussian Elimination:

$ mat(1, 1, 3, 0, 4; 0, 1, 2, 1, 3; -1, 1, a, 0, 0; 1, 1, -2, 5, -1; augment: #3) $
$ mat(1, 1, 3, 0, 4; 0, 1, 2, 1, 3; 0, 2, a + 3, 0, 4; 0, 0, -5, 5, -5; augment: #3) $
$ mat(1, 1, 3, 0, 4; 0, 1, 2, 1, 3; 0, 0, a - 1, -2, -2; 0, 0, 1, -1, 1; augment: #3) $
$ mat(1, 1, 3, 0, 4; 0, 1, 2, 1, 3; 0, 0, 1, -1, 1; 0, 0, a - 1, -2, -2; augment: #3) $
$ mat(1, 1, 3, 0, 4; 0, 1, 2, 1, 3; 0, 0, 1, -1, 1; 0, 0, 0, a - 3, -1 - a; augment: #3) $

We note that this system is not satisfiable for any choice of $a$. Thus, this statement is never true.

== Problem 8

=== (i)

Notice that we can build $arrow(v_i)$ in a telescoping fashion as follows:

$ arrow(v_i) = (arrow(v_i) - arrow(v_(i + 1))) + (arrow(v_(i + 1)) - arrow(v_(i + 2))) + dots.c + (arrow(v_(m - 1) - arrow(v_m))) + arrow(v_m) $

Thus, $"span"({arrow(v_1), arrow(v_2), dots, arrow(v_m)}) subset.eq "span"({arrow(v_1) - arrow(v_2), arrow(v_2) - arrow(v_3), dots, arrow(v_(m - 1) - arrow(v_m)), arrow(v_m)})$

=== (ii)

We can build $arrow(v_i)$ by subtracting two of these prefix vector sums, as follows:

$ arrow(v_i) = sum_(j = 1)^(j = i) arrow(v_j) - sum_(j = 1)^(j = i - 1) arrow(v_j) $

Thus, $"span"({arrow(v_1), arrow(v_2), dots, arrow(v_m)}) subset.eq "span"({sum_(j = 1)^(j = 1) arrow(v_j), sum_(j = 1)^(j = 2) arrow(v_j), dots, sum_(j = m)^(j = 1) arrow(v_j)})$

== Problem 9

=== (a)

We want to determine when the following equations:

$ c_1 (1, 2, 2, 3) + c_2 (0, 3, 1, -1) = (1, -1, 1, 0) $
$ c_1 (1, 2, 2, 3) + c_2 (0, 3, 1, -1) = (1, -1, 1, a) $

Are satisfiable.

This can be captured through the system described by the following augmented matrix:

$ mat(1, 0, 1, -1; 2, 3, -1, 1; 2, 1, 1, -1; 3, -1, 0, a; augment: #2) $

Applying Gaussian Elimination to solve this system:
$ mat(1, 0, 1, -1; 2, 3, -1, 1; 2, 1, 1, -1; 3, -1, 0, a; augment: #2) $
$ mat(1, 0, 1, -1; 0, 3, -3, 3; 0, 1, -1, 1; 0, -1, -3, a+3; augment: #2) $

$ mat(1, 0, 1, -1; 0, 1, -1, 1; 0, 0, 0, 0; 0, 0, -4, a+4; augment: #2) $

The only value for which one of the vectors is in the span is when $a = -4$.

=== (b)

To find $"span"(S_1)$ and $"span"(S_2)$, we can use matrix algorithms. For instance, the vector $(x_1, x_2, x_3, x_4)$ is in $"span"(S_1)$ when the following system is satisfiable:

$ mat(1, 0, x_1; 2, 3, x_2; 2, 1, x_3; 3, -1, x_4; augment: #2) $

We can also check when $(x_1, x_2, x_3, x_4) in "span"(S_2)$ using the following augmented matrix: (in the actual exam, I would probably explicitly write out the equation corresponding to this matrix)

$ mat(1, -1, x_1; -1, 1, x_2; 1, -1, x_3; 0, 2, x_4; augment: #2) $

Let us consider the first matrix and reduce it to row-echelon form:

$ mat(1, 0, x_1; 0, 3, x_2 - 2 x_1; 0, 1, x_3 - 2 x_1; 0, -1, x_4 - 3 x_1; augment: #2) $
$ mat(1, 0, x_1; 0, 1, x_3 - 2 x_1; 0, 0, x_2 - 2 x_1 - 3 x_3 + 6 x_1; 0, 0, x_4 - 3 x_1 + x_3 - 2 x_1; augment: #2) $
$ mat(1, 0, x_1; 0, 1, x_3 - 2 x_1; 0, 0, 4 x_1 + x_2 - 3 x_3; 0, 0, - 5 x_1 + x_3 + x_4; augment: #2) $

And let us do the same for the second matrix:

$ mat(1, -1, x_1; -1, 1, x_2; 1, -1, x_3; 0, a, x_4; augment: #2) $

$ mat(1, -1, x_1; 0, 0, x_2 + x_1; 0, 0, x_3 - x_1; 0, a, x_4; augment: #2) $
$ mat(1, -1, x_1; 0, 2, x_4; 0, 0, x_2 + x_1; 0, 0, x_3 - x_1; augment: #2) $

For a vector to be in the intersection of the spans, both augmented matrices must be satisfiable. This leads us to write the following system of four linear equations:

$ 4 x_1 + x_2 - 3 x_3 = 0 $
$ - 5 x_1 + x_3 + x_4 = 0 $
$ x_1 + x_2 = 0 $
$ -x_1 + x_3 = 0 $

Let us find a parameterization for this system of equations. We write the following augmented matrix corresponding to this system:

$ mat(4, 1, -3, 0, 0; -5, 0, 1, 1, 0; 1, 1, 0, 0, 0; -1, 0, 1, 0, 0; augment: #4) $
$ mat(1, 1, 0, 0, 0; 4, 1, -3, 0, 0; -5, 0, 1, 1, 0; -1, 0, 1, 0, 0; augment: #4) $
$ mat(1, 1, 0, 0, 0; 0, -3, -3, 0, 0; 0, 5, 1, 1, 0; 0, 1, 1, 0, 0; augment: #4) $
$ mat(1, 1, 0, 0, 0; 0, 1, 1, 0, 0; 0, -3, -3, 0, 0; 0, 5, 1, 1, 0; augment: #4) $
$ mat(1, 1, 0, 0, 0; 0, 1, 1, 0, 0; 0, 0, 0, 0, 0; 0, 0, -4, 1, 0; augment: #4) $
$ mat(1, 1, 0, 0, 0; 0, 1, 1, 0, 0; 0, 0, -4, 1, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, 1, 0, 0, 0; 0, 1, 1, 0, 0; 0, 0, 1, -1/4, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, 1, 0, 0, 0; 0, 1, 0, 1/4, 0; 0, 0, 1, -1/4, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, 0, 0, -1/4, 0; 0, 1, 0, 1/4, 0; 0, 0, 1, -1/4, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, 0, 0, -1/4, 0; 0, 1, 0, 1/4, 0; 0, 0, 1, -1/4, 0; 0, 0, 0, 0, 0; augment: #4) $

Thus, the following is a parameterization of the solution set of this system:

$ s (1, -1, 1, 4) $

Therefore, $S_3 = {(1, -1, 1, 4)}$ works.

== Problem 10

=== (i)

$V$ is not a subspace since it is not a homogenous system. Another easy way to see this is that the zero vector does not satisfy this system.

$W$ is a subspace because the system is homogenous.

$V inter W$ is not a subspace because the zero vector is not in the set.

$V union W$ is not a subspace. First, notice that the vector $(1, 0, 0, 0, -1) in V$ (it satisfies both equations). Thus, $(1, 0, 0, 0, -1) in V union W$.

Furthermore, $(0, 1, 0, 1, 0) in W$. Thus $(0, 1, 0, 1, 0) in V union W$.

Now consider $(1, 0, 0, 0, -1) + (0, 1, 0, 1, 0) = (1, 1, 0, 1, -1)$. If $V union W$ is a subspace, it is necessary that this vector is in the set.

However:

$ 2 x_1 + x_2 - x_4 - 2 x_5 = 2 dot 1 + 1 - 1 - 2 dot (-1) = 4 eq.not 0 $

and

$ x_1 + x_2 - x_3 - x_4 - x_5 = 1 + 1 - 0 - 1 - (-1) = 2 eq.not 0 $.

Thus, $(1, 1, 0, 1, -1) in.not V union W$. Therefore, $V union W$ is not a subspace.

=== (ii)

A parameterization for $W$ is:

$ (r, - 2 r + s + 2 t, s, t) = r(1, -2, 0, 0) + s (0, 1, 1, 0) + t (0, 2, 0, 1) $

Therefore, ${(1, -2, 0, 0), (0, 1, 1, 0), (0, 2, 0, 1)}$ is a spanning set for $W$.

=== (iii)

We want to find a parameterization for the following system of linear equations:

$ x_1 - 2 x_2 + 2 x_3 - x_4 + x_5 = 0 $
$ x_1 + x_2 - x_3 - x_4 - x_5 = 2 $
$ 2 x_1 + x_2 - x_4 - 2 x_5 = 0 $

This corresponds to the following augmented matrix:

$ mat(1, -2, 2, -1, 1, 0; 1, 1, -1, -1, -1, 2; 2, 1, 0, -1, -2, 0; augment: #5) $

Applying Gaussian Elimination to this matrix:

$ mat(1, -2, 2, -1, 1, 0; 1, 1, -1, -1, -1, 2; 2, 1, 0, -1, -2, 0; augment: #5) $

$ mat(1, -2, 2, -1, 1, 0; 0, 3, -3, 0, -2, 2; 0, 5, -4, 1, -4, 0; augment: #5) $

$ mat(1, -2, 2, -1, 1, 0; 0, 15, -15, 0, -10, 10; 0, 15, -12, 3, -12, 0; augment: #5) $
$ mat(1, -2, 2, -1, 1, 0; 0, 15, -12, 3, -12, 0; 0, 15, -15, 0, -10, 10; augment: #5) $
$ mat(1, -2, 2, -1, 1, 0; 0, 15, -12, 3, -12, 0; 0, 0, -3, -3, 2, 10; augment: #5) $
$ mat(15, -30, 30, -15, 15, 0; 0, 15, -12, 3, -12, 0; 0, 0, -3, -3, 2, 10; augment: #5) $
$ mat(15, -30, 0, -45, 35, 100; 0, 15, 0, 15, -20, -40; 0, 0, -3, -3, 2, 10; augment: #5) $
$ mat(3, -6, 0, -9, 7, 20; 0, 3, 0, 3, -4, -8; 0, 0, -3, -3, 2, 10; augment: #5) $
$ mat(3, 0, 0, -3, -1, 4; 0, 3, 0, 3, -4, -8; 0, 0, -3, -3, 2, 10; augment: #5) $

The following is a parameterization for the solution set of this system:

$ (1/3 (4 + 3 r + s), 1/3 (-8 - 3r + 4s), -1/3 (10 + 3r - 2s), r, s) $
$ = r(1, -1, -1, 1, 0) + s(1/3, 4/3, 2/3, 0, 1) + (4/3, -8/3, -10/3, 0, 0) $

Thus, $S = {(1, -1, -1, 1, 0), (1/3, 4/3, 2/3, 0, 1), (4/3, -8/3, -10/3, 0, 0)}$. Also, clearly $"span"(S) eq.not bb(R)^5$ since there are only three vectors in $S$.

= Problem Set 10

== Problem 1:

The vectors are linearly independent iff the only way to build the zero vector from these vectors is the trivial solution.

Setting up the augmented matrix, we get:

$
mat(1, 1, 0, 0; 3, a, 1, 0; 0, 0, -a, 0; -2, -2, 2a, 0; augment: #3)
$

Performing Gaussian Elimination:

$
mat(1, 1, 0, 0; 0, a - 3, 1, 0; 0, 0, -a, 0; 0, 0, 2a, 0; augment: #3)
$

$
mat(1, 1, 0, 0; 0, a - 3, 1, 0; 0, 0, -a, 0; 0, 0, 0, 0; augment: #3)
$

For there to be one unique solution, there must be no free parameters. Thus, the collection of vectors is linearly independent iff $a eq.not 0, 3$.

== Problem 2

=== (i)

Again, we wish to determine the values for which the augmented matrix with zeros to the right of the bar only has the trivial solution.

$
mat(1, 0, 1, 0; 1, 1, 0, 0; -2, -3, 1, 0; 0, a, a^2, 0; augment: #3)
$

Performing Gaussian Elimination:

$
mat(1, 0, 1, 0; 0, 1, -1, 0; 0, -3, 3, 0; 0, a, a^2, 0; augment: #3)
$

$
mat(1, 0, 1, 0; 0, 1, -1, 0; 0, 0, 0, 0; 0, 0, a^2 + a, 0; augment: #3)
$

$
mat(1, 0, 1, 0; 0, 1, -1, 0; 0, 0, a^2 + a, 0; 0, 0, 0, 0; augment: #3)
$

For the vectors to be linearly independent, there must be no free parameters. Therefore, $a^2 + a eq.not 0$, implying that the vectors are linearly independent if and only if $a eq.not 0, -1$.

=== (ii)

For the collection of vectors to span the entire space, there must be no rows of zero in the row-echelon form of the following matrix:

$ mat(1, 0, 1; 0, 1, 1; 1, -3, -2; a^2, a, 0) $

The number of zero rows is $4 - "num_leading_entries" >= 4 - "num columns" = 1$. Thus, there is at least one zero row, implying that the list of vectors does not span $bb(R)^4$.

== Problem 3

It suffices to express the zero vector as a nontrivial linear combination of the four vectors, where each vector has a nonzero coefficient. This will allow us to use algebra to express each vector in terms of the other three.

Specifically, we wish to solve for the following system:

$
mat(1, -1, 0, 1, 0; 0, 2, 3, -1, 0; -1, 3, 0, 1, 0; augment: #4)
$

Applying Gauss-Jordan Elimination:

$
mat(1, -1, 0, 1, 0; 0, 2, 3, -1, 0; 0, 2, 0, 2, 0; augment: #4)
$

$
mat(1, -1, 0, 1, 0; 0, 2, 3, -1, 0; 0, 0, -3, 3, 0; augment: #4)
$

$
mat(1, -1, 0, 1, 0; 0, 2, 0, 2, 0; 0, 0, -3, 3, 0; augment: #4)
$

$
mat(1, -1, 0, 1, 0; 0, 1, 0, 1, 0; 0, 0, 1, -1, 0; augment: #4)
$

$
mat(1, 0, 0, 2, 0; 0, 1, 0, 1, 0; 0, 0, 1, -1, 0; augment: #4)
$

Supposing that the coefficients for the four vectors are $c_1, c_2, c_3, c_4$, respectively, we have found that:

$ c_1 = -2c_4 $
$ c_2 = -c_4 $
$ c_3 = c_4 $

These four relations give us the following equation:

$ -2 c_4 mat(1; 0; -1) - c_4 mat(-1; 2; 3) + c_4 mat(0; 3; 0) + c_4 mat(1; -1; 1) = mat(0; 0; 0) $

$ -2 mat(1; 0; -1) - mat(-1; 2; 3) + mat(0; 3; 0) + mat(1; -1; 1) = mat(0; 0; 0) $

Thus, we have the following four equations:

$ mat(1; 0; -1) = - 1/2 mat(-1; 2; 3) + 1/2 mat(0; 3; 0) + 1/2 mat(1; -1; 1) $

$ mat(-1; 2; 3) = -2 mat(1; 0; -1) + mat(0; 3; 0) + mat(1; -1; 1) $

$ mat(0; 3; 0) = 2 mat(1; 0; -1) + mat(-1; 2; 3) - mat(1; -1; 1) $

$ mat(1; -1; 1) = 2 mat(1; 0; -1) + mat(-1; 2; 3) - mat(0; 3; 0) $

== Problem 4

=== (i)

$T'$ is linearly dependent since adding all three vectors (which is a nontrivial linear combination) results in the zero vector.

=== (ii)

This time, I claim that the list of vectors is linearly independent.

To prove this, we want to show that the only way to express the zero vector as a linear combination of the vectors in $T''$ is the trivial combination.

Suppose $c_1, c_2, c_3$ are real numbers satisfying:

$ c_1 (arrow(v_1) - arrow(v_2)) + c_2 (arrow(v_2) - arrow(v_3)) + c_3 (arrow(v_1) + arrow(v_3)) = arrow(0) $

$ (c_1 + c_3) arrow(v_1) + (c_2 - c_1) arrow(v_2) + (c_3 - c_2) arrow(v_3) = arrow(0) $

Since $arrow(v_1), arrow(v_2), arrow(v_3)$ are linearly independent, we know that the only solution to the above equation is the trivial solution. Thus, we have:

$ c_1 + c_3 = c_2 - c_1 = c_3 - c_2 = 0 $

Which corresponds to the following augmented matrix:

$ mat(1, 0, 1, 0; -1, 1, 0, 0; 0, -1, 1, 0; augment: #3) $

Notice that the system is homogenous.

Applying Gauss-Jordan Elimination, we get:

$ mat(1, 0, 1, 0; 0, 1, 1, 0; 0, -1, 1, 0; augment: #3) $

$ mat(1, 0, 1, 0; 0, 1, 1, 0; 0, 0, 2, 0; augment: #3) $
$ mat(1, 0, 1, 0; 0, 1, 1, 0; 0, 0, 1, 0; augment: #3) $
$ mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; augment: #3) $

Thus, the reduced-row echelon form of the matrix is the identity matrix. By the characterizations of invertibility, we thus know that the only solution is the trivial solution. Thus, $c_1 = c_2 = c_3$ is the only solution, implying that the original collection of vectors is linearly independent.

== Problem 5

Since the list is linearly dependent, there is a set of real coefficients $c_1, c_2, c_3, dots, c_m, c_(m + 1)$ satisfying:
1. $c_(m + 1) arrow(w) + sum_(i = 1)^m c_i arrow(v_i) = arrow(0)$
2. $exists i in bb(Z), 1 <= i <= m + 1 and c_i eq.not 0$

First, suppose, for contradiction, that $c_(m + 1) = 0$. Since $exists i in bb(Z), 1 <= i <= m + 1 and c_i eq.not 0$, we can conclude that $exists i in bb(Z), 1 <= i <= m and c_i eq.not 0$ satisfying:

$ c_(m + 1) arrow(w) + sum_(i = 1)^m c_i arrow(v_i) = arrow(0) $

Since $c_(m + 1) = 0$, we have:

$ sum_(i = 1)^m c_i arrow(v_i) = arrow(0) $

We have thus expressed the zero vector as a linear combination of the $arrow(v_i)$ s in a nontrivial way, implying that the $arrow(v_i)$ s are linearly dependent, contradiction.

Therefore, $c_(m + 1) eq.not 0$.

Rearranging the following equation:

$ c_(m + 1) arrow(w) + sum_(i = 1)^m c_i arrow(v_i) = arrow(0) $

$ arrow(w) = sum_(i = 1)^m -(c_i / c_(m + 1)) arrow(v_i) $

Since $c_(m + 1) eq.not 0$, $- c_i / c_(m + 1) in bb(R)$. Thus, $arrow(w)$ is a linear combination of the $arrow(v_i)$ s, implying that:

$ arrow(w) in "span"(arrow(v_1), dots, arrow(v_m)) $

As needed. $qed$

== (a)

$ mat(1, 0, 0; 0, 1, 0; 1, 1, 0) $

== (b)

Let us first show the forward direction.

Suppose that the matrix $A$ has determinant zero. Then, the matrix $A^T$ also has determinant zero and is thus not invertible. Then, by the characterizations of invertibility, a nonzero vector satisfies the following matrix equation:

$ A^T arrow(x) = arrow(0) $

However, this means that the column vectors of $A^T$ are linearly dependent. We note that the column vectors of $A^T$ are just the row vectors of $A$, and thus the row vectors of $A$ are linearly dependent, as needed.

Next, let us show the backward direction.

Suppose that the row vectors of $A$ are linearly dependent. Therefore, the column vectors of $A^T$ are linearly dependent (since they are the same as the row vectors of $A$). This implies that the following matrix equation:

$ A^T arrow(x) = arrow(0) $

Has a nontrivial solution $arrow(x) eq.not arrow(0)$ (since we can express the zero vector as a nontrivial linear combination of the columns). By the characterizations of invertibility, this means that $A^T$ is not invertible and thus $det(A) = det(A^T) = 0$, as needed. $qed$

== Problem 7

=== (a)

Again we want to check if we can express the zero vector as a nontrivial linear combnination of this list of vectors.

Let us construct the augmented matrix with the vectors as the columns of this matrix.

$ mat(1, 7, -2, 0; 4, 10, 1, 0; 2, -4, 5, 0; -3, -1, -4, 0; augment: #3) $

$ mat(1, 7, -2, 0; 0, -18, 9, 0; 0, -18, 9, 0; 0, 20, -10, 0; augment: #3) $

$ mat(1, 7, -2, 0; 0, 2, -1, 0; 0, 0, 0, 0; 0, 0, 0, 0; augment: #3) $

Since the row-echelon form contains a free parameter, we can express the zero vector as a nontrivial linear combination of the three vectors on the list. Thus, the three vectors are linearly dependent.

=== (b)

To show that the vectors are linearly independent, we want to show that the following vector equation:

$ p arrow(x) + q arrow(y) = arrow(0) $

Only has the trivial solution.

Expanding it out:


$ p (a arrow(u) + b arrow(v)) + q (c arrow(u) + d arrow(v)) = arrow(0) $
$ (p a + q c) arrow(u) + (p b + q d) arrow(v) = arrow(0) $

Since $arrow(u)$ and $arrow(v)$ are linearly independent, we have:

$ p a + q c = 0 $
$ p b + q d = 0 $

Which corresponds to the following matrix equation:

$ mat(a, c; b, d) mat(p; q) = arrow(0) $

Since $ det(mat(a, c; b, d)) = a d - b c eq.not 0 $

$mat(a, c; b, d)$ is invertible. Thus, by the characterizations of invertibility, the only solution to $mat(a, c; b, d) mat(p; q) = arrow(0)$ is $p = q = 0$.

Thus, the only solution to

$ p arrow(x) + q arrow(y) = arrow(0) $

is the trivial solution, thereby proving that $arrow(x)$ and $arrow(y)$ are linearly independent, as needed. $qed$ 

== Problem 8

=== (a)

#aligned_block(
  [$"adj"(A)$],
  [$=$],
  [$mat(mat(0, -2; -4, 1; delim: "|"), -mat(-1, -2; 3, 1; delim: "|"), mat(-1, 0; 3, -4; delim: "|"); -mat(2, -5; -4, 1; delim: "|"), mat(-3, -5; 3, 1; delim: "|"), -mat(-3, 2; 3, -4; delim: "|"); mat(2, -5; 0, -2; delim: "|"), -mat(-3, -5; -1, -2; delim: "|"), mat(-3, 2; -1, 0; delim: "|"))^T$],

  [],
  [$=$],
  [$mat(-8, -5, 4; 18, 12, -6; -4, -1, 2)^T$],

  [],
  [$=$],
  [$mat(-8, 18, -4; -5, 12, -1; 4, -6, 2)$],
)

=== (b): Mild Challenge

Recall that $"adj"(M) M = det(M) I$, where $I$ is the identity matrix.

I claim that $det("adj"(M)) = 0$. Suppose not. Then, $"adj"(M)$ must be invertible since its determinant is nonzero.

Multiplying both sides of the matrix equation above by the inverse of the adjoint $"adj"(M)^(-1)$:

$ "adj"(M)^(-1) "adj"(M) M = "adj"(M)^(-1) det(M) I $

$ M = "adj"(M)^(-1) dot 0 dot I $
$ M = bold(0) $

However, $M$ is nonzero, contradiction. Therefore, $det("adj"(M)) = 0$.

Further, $det("adj"(M)^T) = det("adj"(M)) = 0$. Thus, $"adj"(M)^T$ is not invertible. By the characterizations of invertibility, this implies that the following matrix-vector equation:

$ "adj"(M)^T arrow(x) = arrow(0) $

Has a nontrivial solution. Equivalently, this means that there is a nontrivial way to build the zero vector as a linear combination of the column vectors of $"adj"(M)^T$. Thus, the column vectors of $"adj"(M)^T$ are linearly dependent. Therefore, the row vectors of $"adj"(M)$ are linearly dependent, as needed. $qed$

== Problem 9

An equivalent way of saying that the associated vector $arrow(v)$ makes the resulting list linearly dependent upon insertion into the list is to say that $arrow(v)$ is in the span of the three vectors.

The vector is in the span of the three other vectors if the following augmented matrix:

$ mat(1, 1, 2, a; 1, 0, 1, b; 1, 1, 0, c; 1, 0, -1, d; 1, 1, 1, e; augment: #3) $

Performing Gaussian Elimination:

$ mat(1, 1, 2, a; 0, -1, -1, b - a; 0, 0, -2, c - a; 0, -1, -3, d - a; 0, 0, -1, e - a; augment: #3) $

$ mat(1, 1, 2, a; 0, -1, -1, b - a; 0, 0, -2, c - a; 0, 0, -2, d - b; 0, 0, -1, e - a; augment: #3) $

$ mat(1, 1, 2, a; 0, -1, -1, b - a; 0, 0, -1, e - a; 0, 0, 0, c + a - 2e; 0, 0, 0, d - b + 2a - 2e; augment: #3) $

Thus, $arrow(v)$ is on the span if and only if:

$ c + a - 2e = 0 $
$ d - b + 2a - 2e = 0 $

both hold.

Thus, if at least one of these equations did not hold, then $arrow(v)$ would not be on the span and thus including it in the list would result in a linearly independent basis.

== Problem 10

We want to show that the following matrix equation (with the columns organized into blocks):

$ mat(arrow(v_1) - arrow(v_2), arrow(v_2) - arrow(v_3), dots, arrow(v_(n - 1)) - arrow(v_n), arrow(v_n)) arrow(x) = arrow(0) $

Only has the trivial solution, as this implies that the only way to build the zero vector as a linear combination of these vectors is the trivial solution.

Notice that:

$ mat(arrow(v_1) - arrow(v_2), arrow(v_2) - arrow(v_3), dots, arrow(v_(n - 1)) - arrow(v_n), arrow(v_n)) = mat(arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_n)) mat(1, 0, 0, 0, dots, 0; -1, 1, 0, 0, dots, 0; 0, -1, 1, 0, dots, 0; 0, 0, -1, 1, dots, 0; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, 0, dots.c, 1) $

Since $mat(1, 0, 0, 0, dots, 0; -1, 1, 0, 0, dots, 0; 0, -1, 1, 0, dots, 0; 0, 0, -1, 1, dots, 0; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, 0, dots.c, 1)$ is lower triangular, $mat(1, 0, 0, 0, dots, 0; -1, 1, 0, 0, dots, 0; 0, -1, 1, 0, dots, 0; 0, 0, -1, 1, dots, 0; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, 0, dots.c, 1; delim: "|") = 1$ (the product of the diagonal entries).

Furthermore, since $arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_n)$ are linearly independent, the only way to build the zero vector as a linear combination of these vectors is the trivial solution. Equivalently, this means that the following matrix equation:

$ mat(arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_n)) arrow(x) = arrow(0) $

Only has the zero vector as the solution. By the characterizations of invertibility, this means that $mat(arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_n))$ is invertible. Thus, $mat(arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_n); delim: "|") eq.not 0$.

By the zero-product property,

$ mat(arrow(v_1) - arrow(v_2), arrow(v_2) - arrow(v_3), dots, arrow(v_(n - 1)) - arrow(v_n), arrow(v_n); delim: "|") = mat(arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_n); delim: "|") mat(1, 0, 0, 0, dots, 0; -1, 1, 0, 0, dots, 0; 0, -1, 1, 0, dots, 0; 0, 0, -1, 1, dots, 0; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, 0, dots.c, 1; delim: "|") eq.not 0 $

Therefore, $mat(arrow(v_1) - arrow(v_2), arrow(v_2) - arrow(v_3), dots, arrow(v_(n - 1)) - arrow(v_n), arrow(v_n); delim: "|")$ is invertible. By the characterizations of invertibility, the only solution to the following matrix equation:

$ mat(arrow(v_1) - arrow(v_2), arrow(v_2) - arrow(v_3), dots, arrow(v_(n - 1)) - arrow(v_n), arrow(v_n)) arrow(x) = arrow(0) $

Is the zero vector. This implies that the only way to build the zero vector as a linear combination of the column vectors is the trivial solution, implying that the column vectors --- and thus the original list of vectors --- is linearly independent, as needed. $qed$

== Problem 11

=== (1)

Let us first show the forward direction.

Suppose that the vectors $arrow(v_1), dots, arrow(v_p)$ are linearly independent. Thus, the only way to build the zero vector as a linear combination of these vectors is the trivial solution. This implies that the following matrix equation where the vectors are the columns vectors of the matrix:

$ mat(arrow(v_1), dots, arrow(v_p)) arrow(x) = arrow(0) $

only has the zero vector as its solution. By the characterizations of invertibility, this implies that $mat(arrow(v_1), dots, arrow(v_p))$ is invertible.

Therefore, $mat(P arrow(v_1), dots, P arrow(v_p)) = P mat(arrow(v_1), dots, arrow(v_p))$ is also invertible.

By the characterizations of invertibility, the only solution to the following equation is the zero vector:

$ mat(P arrow(v_1), dots, P arrow(v_p)) arrow(x) = arrow(0) $

Therefore, the only way to build the zero vector as a linear combination of $P arrow(v_1), dots, P arrow(v_p)$ is the trivial solution, implying that $P arrow(v_1), dots, P arrow(v_p)$ is linearly independent.

To show the backward direction, assume $P arrow(v_1), dots, P arrow(v_p)$ is linearly independent. Notice that $P^(-1)$ is also invertible.

By our work already done, $P^(-1) P arrow(v_1), dots, P^(-1) P arrow(v_p)$ is also linearly independent. Simplifying, this means that $arrow(v_1), dots, arrow(v_p)$ is linearly independent, as needed. $qed$

=== (2)

Let us first show the forward direction.

Suppose that $arrow(v_1), dots, arrow(v_p)$ span $V$. Let $arrow(w) in W$ be an arbitrary vector. By definition, there exists $arrow(v) in V$ such that $arrow(w) = P arrow(v)$.

Since $arrow(v_1), dots, arrow(v_p)$ span $V$ and $arrow(v) in V$, there exist real $x_1, dots, x_p$ such that:

$ arrow(v) = sum_(i = 1)^p x_i arrow(v_i) $

Thus:

$ arrow(w) = P arrow(v) = P sum_(i = 1)^p x_i arrow(v_i) = sum_(i = 1)^p x_i (P arrow(v_i)) $

Thus, $arrow(w)$ is a linear combination of $P arrow(v_1), dots, P arrow(v_p)$. 

Therefore, $P arrow(v_1), dots, P arrow(v_p)$ span $W$.

Now let us show the backward direction.

Suppose $P arrow(v_1), dots, P arrow(v_p)$ span $W$.

Let $arrow(v) in V$ be some particular but arbitrarily-chosen element of $V$. By definition, $P arrow(v) in W$. Thus, there exist real $x_1, dots, x_p$ such that:

$ P arrow(v) = sum_(i = 1)^p x_i (P arrow(v_i)) $

Therefore:
$ P arrow(v) = sum_(i = 1)^p x_i (P arrow(v_i)) = P sum_(i = 1)^p x_i arrow(v_i) $

Since $P$ is invertible:

$ P^(-1) P arrow(v) = P^(-1) P sum_(i = 1)^p x_i arrow(v_i) $
$ arrow(v) = sum_(i = 1)^p x_i arrow(v_i) $

Thus, $arrow(v)$ is a linear combination of $arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_p)$.

Therefore, $arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_p)$ spans $V$, as needed. $qed$

= Problem Set 11

== Problem 1

For these vectors to form a basis, all vectors in $bb(R)^4$ must be in the span of the vectors and the vectors must be linearly independent.

Therefore, the matrix consisting of these vectors as its columns must have the identity matrix as its RREF.

Applying Gauss-Jordan Elimination:

$ mat(1, 2, 0, 4; 0, 1, 5, 0; -1, 3, 2, -4; 2, 1, 0, 8) $

$ mat(1, 2, 0, 4; 0, 1, 5, 0; 0, 5, 2, 0; 0, -3, 0, 0) $
$ mat(1, 2, 0, 4; 0, 1, 5, 0; 0, 5, 2, 0; 0, 1, 0, 0) $
$ mat(1, 2, 0, 4; 0, 1, 0, 0; 0, 1, 5, 0; 0, 5, 2, 0) $
$ mat(1, 2, 0, 4; 0, 1, 0, 0; 0, 0, 5, 0; 0, 0, 2, 0) $
$ mat(1, 2, 0, 4; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 1, 0) $
$ mat(1, 2, 0, 4; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0) $
$ mat(1, 0, 0, 4; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0) $

Clearly, the reduced row echelon form is not the identity matrix, therefore the vectors do not form a basis for $bb(R)^4$.

== Problem 2

We have:

$ sum_(i = 1)^n c_i arrow(v_i) = sum_(i = 1)^n d_i arrow(v_i) $
$ sum_(i = 1)^n (c_i - d_i) arrow(v_i) = arrow(0) $

Since the $arrow(v_i)$ s form a basis, the only solution to the equation above is if all of the coefficients were zero. Tehrefore, $c_i = d_i$, as needed $qed$.

== Problem 3

(1) Is not a basis since its dimension is less than 3.

(2) Is a basis. We can check this by performing Gauss-Jordsan Elimination on the matrix containing these three vectors as its columns and checking that the result is the identity matrix.

$ mat(1, -1, 0; 0, 2, 3; -1, 3, 0) $
$ mat(1, -1, 0; 0, 2, 3; 0, 2, 0) $
$ mat(1, -1, 0; 0, 2, 0; 0, 2, 3) $
$ mat(1, -1, 0; 0, 2, 0; 0, 0, 3) $
$ mat(1, -1, 0; 0, 1, 0; 0, 0, 1) $
$ mat(1, 0, 0; 0, 1, 0; 0, 0, 1) $

Thus, the three vectors are linearly independent.

To obtain the coordinate vector of $(1, 2, 3)$ with respect to the basis, we can do:

$ mat(1, -1, 0, 1; 0, 2, 3, 2; -1, 3, 0, 3; augment: #3) $
$ mat(1, -1, 0, 1; 0, 2, 3, 2; 0, 2, 0, 4; augment: #3) $
$ mat(1, -1, 0, 1; 0, 2, 0, 4; 0, 2, 3, 2; augment: #3) $
$ mat(1, -1, 0, 1; 0, 2, 0, 4; 0, 0, 3, -2; augment: #3) $
$ mat(1, -1, 0, 1; 0, 1, 0, 2; 0, 0, 1, -2/3; augment: #3) $
$ mat(1, 0, 0, 3; 0, 1, 0, 2; 0, 0, 1, -2/3; augment: #3) $

Thus, $(3, 2, -2/3)$ is the coordinate vector for $(1, 2, 3)$ with respect to the basis.

(3) Is not a basis because the entries are not linearly dependent. Specifically, adding the first and second vectors, then multiplying the result by $2 / 3$ results in the third vector.

(4) Is not a basis because there are four vectors, which is one more than the dimension of $bb(R)^3$. Thus, at least one of the vectors can be expressed as a linear combination of the other ones, implying that this list of vectors is not linearly dependent and is thus not a basis.

== Problem 4

Writing all these vectors as the columns of a matrix:

$ mat(1, 4, 0, 5, 2; 2, 1, 0, 3, 0; -1, 3, 0, 2, 2; 1, -1, 1, -1, 1) $

$ mat(1, 4, 0, 5, 2; 0, -7, 0, -7, -4; 0, 7, 0, 7, 4; 0, -5, 1, -6, -1) $

$ mat(1, 4, 0, 5, 2; 0, -7, 0, -7, -4; 0, 0, 0, 0, 0; 0, -5, 1, -6, -1) $

$ mat(1, 4, 0, 5, 2; 0, 35, 0, 35, 20; 0, 0, 0, 0, 0; 0, -35, 7, -42, -7) $

$ mat(1, 4, 0, 5, 2; 0, 35, 0, 35, 20; 0, -35, 7, -42, -7; 0, 0, 0, 0, 0) $
$ mat(1, 4, 0, 5, 2; 0, 35, 0, 35, 20; 0, 0, 7, -7, 13; 0, 0, 0, 0, 0) $

Since there are three leading entries, the dimension of $W$ is $3$, formed by the vectors on the columns with leading entries, namely:

$ (1, 2, -1, 1), (4, 1, 3, -1), (0, 0, 0, 1) $

== Problem 5

The rank of a matrix is equal to the number of leading entries in a row-echelon form. (Note: also the number of nonzero rows)

Reducing $A$, we get:

$ mat(1, 43, -37; 0, -12, 12; 0, -12, 12) $
$ mat(1, 43, -37; 0, -12, 12; 0, 0, 0) $

Thus, $"rank"(A) = 2$.

Further, reducing $B$, we get:

$ mat(1, 7, -1; 2, 2, 10; 3, 9, 9; 1, 1, 1) $
$ mat(1, 7, -1; 1, 1, 5; 1, 3, 3; 1, 1, 1) $
$ mat(1, 1, 1; 1, 7, -1; 1, 1, 5; 1, 3, 3) $
$ mat(1, 1, 1; 0, 6, -2; 0, 0, 4; 0, 2, 2) $
$ mat(1, 1, 1; 0, 6, -2; 0, 0, 1; 0, 1, 1) $
$ mat(1, 1, 1; 0, 0, 1; 0, 1, 1; 0, 6, -2) $
$ mat(1, 1, 1; 0, 1, 1; 0, 0, 1; 0, 6, -2) $
$ mat(1, 1, 0; 0, 1, 0; 0, 0, 1; 0, 6, -2) $
$ mat(1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 6, -2) $
$ mat(1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0) $

Thus, $"rank"(B) = 3$.

== Problem 6

=== (i)

$ mat(1, 0; 0, 0; 0, 1) $

=== (ii)

No such matrix exists because the dimensions of the column and row spaces must match.

== Problem 7

The row space can be obtained by picking the nonzero rows of the row echelon form.

The column space can be obtained by picking the column vectors corresponding to the leading entries of the row echelon form.

Finally, the null space can be obtained by solving for when the weighted sum of the column vectors equals zero. Specifically, it can be obtained by considering the augmented matrix $mat(bold(A), arrow(0); augment: #1)$ and then finding a parameterization for the set of solutions.

In all three cases, we want to compute the row-echelon form of the matrix.

=== (i)

Computing the reduced row-echelon forms of the matrices and finding a parameterization for the solution set of $M arrow(x) = arrow(0)$.

Matrix $A$:

$ mat(7, -2, -1; 4, 1, -3; 1, -1, 0; 8, -3, 2) $
$ mat(1, -1, 0; 7, -2, -1; 4, 1, -3; 8, -3, 2) $
$ mat(1, -1, 0; 0, 5, -1; 0, 5, -3; 0, 5, 2) $
$ mat(1, -1, 0; 0, 5, -1; 0, 0, -2; 0, 0, 3) $
$ mat(1, -1, 0; 0, 5, -1; 0, 0, -2; 0, 0, 0) $
$ mat(1, 0, 0; 0, 1, 0; 0, 0, 1; 0, 0, 0) $

The parameterization is (we omit the set-builder notation for brevity, note that it is implicitly there):

$ (0, 0, 0) $

Matrix $B$:

$ mat(8, 8, 8, 38; -8, 8, 8, 38; 8, -8, 8, 38; 8, 8, -8, -38) $
$ mat(8, 8, 8, 38; 0, 16, 16, 76; 0, -16, 0, 0; 0, 0, -16, -76) $
$ mat(8, 8, 8, 38; 0, 0, 0, 0; 0, -16, 0, 0; 0, 0, -16, -76) $
$ mat(8, 8, 8, 38; 0, -16, 0, 0; 0, 0, -16, -76; 0, 0, 0, 0) $
$ mat(8, 0, 0, 0; 0, -16, 0, 0; 0, 0, -16, -76; 0, 0, 0, 0) $
$ mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 19/4; 0, 0, 0, 0) $

The parameterization is:

$ (0, 0, -19/4 r, r) = r(0, 0, -19/4, 1) $

Matrix $C$:

$ mat(1, 2, 0, -3, -1; 2, 4, 1, -8, 3; -1, -2, -1, 5, -4) $
$ mat(1, 2, 0, -3, -1; 0, 0, 1, -2, 5; 0, 0, -1, 2, -5) $
$ mat(1, 2, 0, -3, -1; 0, 0, 1, -2, 5; 0, 0, 0, 0, 0) $

The parameterization is:

$ (-2 r + 3 s + t, r, 2 s - 5 t, s, t) = r (-2, 1, 0, 0, 0) + s (3, 0, 2, 1, 0) + t (1, 0, -5, 0, 1) $

We thus find the following bases for the row, column, and null spaces of these matrices:

+ $A$
  + Row Space: $(1, 0, 0), (0, 1, 0), (0, 0, 1)$
  + Column Space: $(7, 4, 1, 8), (-2, 1, -1, -3), (-1, -3, 0, 2)$
  + Null Space: $emptyset$
+ $B$
  + Row Space: $(1, 0, 0, 0), (0, 1, 0, 0), (0, 0, 1, 19/4)$
  + Column Space: $(8, -8, 8, 8), (8, 8, -8, 8), (8, 8, 8, -8)$
  + Null Space: $(0, 0, -19/4, 1)$
+ $C$
  + Row Space: $(1, 2, 0, -3, -1), (0, 0, 1, -2, 5)$
  + Column Space: $(1, 2, -1), (0, 1, -1)$
  + Null Space: $(-2, 1, 0, 0, 0), (3, 0, 2, 1, 0), (1, 0, -5, 0, 1)$

=== (ii)

#table(
  columns: (auto,)*5,
  inset: 10pt,
  align: horizon,
  table.header([$bold(M)$], [*Rank*], [*Nullity*], [*Rank + Nullity*], [*Num Columns*]),
  [$A$], [$3$], [$0$], [$3$], [$3$],
  [$B$], [$3$], [$1$], [$4$], [$4$],
  [$C$], [$2$], [$3$], [$5$], [$5$],
)

Notice that rank + nullity always equals the number of columns. This is an example of the Rank-Nullity theorem in action.

== Problem 8

=== 1
Basis: $(1, 0, 0, 0), (0, 0, 1, 0)$

Dimension: $2$

Note: In the actual exam do check that the vectors are linearly independent. If not, discard some of them.

=== 2
Basis: $(1, 0, 0, 1), (0, 1, 1, 0)$

Dimension: $2$

=== 3
Basis: $(12, 6, 4, 3)$

Dimension: $1$

=== 4
This can be expressed as the following augmented matrix:

$ mat(2, 3, 1, 1, 0; -3, 1, 4, -7, 0; 1, 2, 1, 0, 0; augment: #4) $
$ mat(1, 2, 1, 0, 0; 2, 3, 1, 1, 0; -3, 1, 4, -7, 0; augment: #4) $
$ mat(1, 2, 1, 0, 0; 0, -1, -1, 1, 0; 0, 7, 7, -7, 0; augment: #4) $
$ mat(1, 2, 1, 0, 0; 0, -1, -1, 1, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, 0, -1, 2, 0; 0, -1, -1, 1, 0; 0, 0, 0, 0, 0; augment: #4) $
$ mat(1, 0, -1, 2, 0; 0, 1, 1, -1, 0; 0, 0, 0, 0, 0; augment: #4) $

A parameterization for the solution set is:

$ (r - 2 s, -r + s, r, s) = r (1, -1, 1, 0) + s (-2, 1, 0, 1) $

Basis: $(1, -1, 1, 0), (-2, 1, 0, 1)$

Dimension: $2$

=== 5
This can be expressed as the following augmented matrix:

$ mat(1, 1, -1, 0, 0; 1, -1, 0, -1, 0; augment: #4) $
$ mat(1, 1, -1, 0, 0; 0, -2, 1, -1, 0; augment: #4) $
$ mat(1, 1, -1, 0, 0; 0, 1, -1/2, 1/2, 0; augment: #4) $
$ mat(1, 0, -1/2, -1/2, 0; 0, 1, -1/2, 1/2, 0; augment: #4) $

A parameterization for the solution set is:

$ (1 / 2 r + 1 / 2 s, 1 / 2 r - 1 / 2 s, r, s) = r (1/2, 1/2, 1, 0) + s(1/2, -1/2, 0, 1) $

Basis: $(1/2, 1/2, 1, 0), (1/2, -1/2, 0, 1)$

Dimension: $2$

== Problem 9

Notice that $X$ must be a $101 times 1$ matrix. In other words, $X$ is isomorphic to a column vector with 101 entries. Similarly, $C$ is also isomorphic to a column vector with 100 entries.

This is, therefore, equivalent to the following augmented matrix:

$ mat(A, arrow(c); augment: #1) $

Since the rank of $A$ is 100, its nullity must be $101 - 100 = 1$. Therefore, the row-echelon form of the matrix $A$ always has one free parameter. Therefore, there is no $C$ for which a unique $X$ satisfies the equation.

Note: You can also argue by noting that, since the nullity is greater than 0, there is a nonzero matrix $B$ so that $A B = bold(0)$. From there it is easy to see that if $A X = C$, then $A (X + B) = C$ too, implying nonuniqueness of solutions. This argument is generalizable, which is its main appeal.

== Problem 10

=== (a)

$ mat(1, 1, 1; 2, 2, 2) $

=== (b)

Since $A$ has rank $1$, we can form a basis for the row space that contains exactly one vector.

Suppose the basis vector for the row space of $A$ is row vector $arrow(y)$.

Therefore, the rows of matrix $A$ are scalar multiples of $arrow(y)$. That is, it is of the following form:

$ A = mat(x_1 arrow(y); x_2 arrow(y); dots.v; x_m arrow(y)) $

Thus:

$ A = mat(x_1; x_2; dots.v; x_m) (arrow(y)) $

Where $(arrow(y))$ is a row vector (isomorphic to a matrix with one row).

We can then set $X = mat(x_1; x_2; dots.v; x_m)$ and $Y = (arrow(y))$ to achieve the desired result.

== Problem 11

First, it is clear that the two vectors are linearly independent since neither of them are constant multiples of the other.

Applying Gauss-Jordan Elimination on the matrix:

$ mat(1, 1, 1, 0, 0; -1, 0, 0, 1, 0; augment: #4) $
$ mat(1, 1, 1, 0, 0; 0, 1, 1, 1, 0; augment: #4) $
$ mat(1, 0, 0, -1, 0; 0, 1, 1, 1, 0; augment: #4) $

A parameterization for the solution set of this system is thus:

$ (s, -r -s, r, s) = r(0, -1, 1, 0) + s(1, -1, 0, 1) $

Therefore, the vectors $(0, -1, 1, 0), (1, -1, 0, 1)$ form a spanning set for the solution set.

Notice that $(0, -1, 1, 0) = -1/2 (1, 0, -1, 1) + 1/2 (1, -2, 1, 1)$ and $(1, -1, 0, 1) = 1/2 (1, 0, -1, 1) + 1/2(1, -2, 1, 1)$.

Further, $(1, -2, 1, 1) = (0, -1, 1, 0) + (1, -1, 0, 1)$ and $(1, 0, -1, 1) = (1, -1, 0, 1) - (0, -1, 1, 0)$.

We have thus shown that $"span"({(1, -2, 1, 1), (1, 0, -1, 1)}) = "span"({(0, -1, 1, 0), (1, -1, 0, 1)})$.

This implies that $(1, 0, -1, 1), (1, -2, 1, 1)$ form a spanning set for the solution set of the system. $qed$

== Problem 12

=== (a)

Substituting, we get the equations:

$ c_0 + c_1 + c_2 + c_3 = a $
$ c_0 - c_1 + c_2 - c_3 = b $

This corresponds to the following augmented matrix:

$ mat(1, 1, 1, 1, a; 1, -1, 1, -1, b; augment: #4) $
$ mat(1, 1, 1, 1, a; 0, -2, 0, -2, b - a; augment: #4) $
$ mat(1, 1, 1, 1, a; 0, 1, 0, 1, 1/2 a -1/2 b; augment: #4) $
$ mat(1, 0, 1, 0, 1/2 a + 1/2 b; 0, 1, 0, 1, 1/2 a -1/2 b; augment: #4) $

Therefore, the following set of polynomials satisfy both equations:

$ {(1/2 a + 1/2 b - r) + (1/2 a -1/2 b - s)x + r x^2 + s x^3 | r, s in bb(R)} $

=== (b)

Substituting, we get:

$ c_0 - c_1 x + c_2 x^2 - c_3 x^3 = -c_0 -c_1 x -c_2 x^2 -c_3 x^3 $
$ c_0 + c_2 x^2 = -c_0 -c_2 x^2 $
$ 2 c_0 + 2 c_2 x^2 = 0 $
$ c_0 + c_2 x^2 = 0 $

Thus, $c_0 = c_2 = 0$.

We therefore have $f(x) = c_1 x + c_3 x^3$.

Notice that, for any $c_1, c_3 in bb(R)$, $f(-x) = -c_1 x - c_3 x^3 = -f(x)$.

Therefore, $r (0, 1, 0, 0) + s (0, 0, 0, 1)$ is a parameterization of the set of 4-tuples. Notice that:

$ (r_1 (0, 1, 0, 0) + s_1 (0, 0, 0, 1)) + (r_2 (0, 1, 0, 0) + s_2 (0, 0, 0, 1)) = (r_1 + r_2) (0, 1, 0, 0) + (s_1 + s_2) (0, 0, 0, 1) $

So this set is closed under addition.

Further notice:

$ c (r (0, 1, 0, 0) + s (0, 0, 0, 1)) = (c r) (0, 1, 0, 0) + (c s) (0, 0, 0, 1) $

Thus, this set is also closed under scalar multiplication.

Finally, it is clearly nonempty since $(0, 0, 0, 0)$ is in the set.

Therefore, the set forms a subspace of $bb(R)^4$ of dimension 2.

Note: Alternatively, you can *appeal to the fact that the system $c_0 = c_2 = 0$ is homogenous*.

== Problem 13

=== (a)

An equivalent way of saying that the rank of the matrix is less than 3 is to say that at most two of the rows in its reduced row-echelon form are nonzero. Therefore, its RREF is not the identity matrix, implying that any row-echelon form has at least one row of zeroes.

Let us apply gaussian elimination.

$ mat(2, 3, a; 1, 3, 1; 1, 2, a) $
$ mat(1, 3, 1; 2, 3, a; 1, 2, a) $
$ mat(1, 3, 1; 0, -3, a - 2; 0, -1, a - 1) $
$ mat(1, 3, 1; 0, -1, a - 1; 0, -3, a - 2) $
$ mat(1, 3, 1; 0, 1, 1 - a; 0, -3, a - 2) $
$ mat(1, 3, 1; 0, 1, 1 - a; 0, 0, a - 2 + 3 - 3a) $
$ mat(1, 3, 1; 0, 1, 1 - a; 0, 0, -2a + 1) $

The only way for one of the rows to be zero is when $a = 1/2$. Thus, the matrix has a rank less than 3 if and only if $a = 1/2$.

=== (b)

This is true. We can show this by proving the contrapositive. Suppose that the list of rows of the matrix are linearly independent. Then, the rows form a basis for the row space of the matrix. This implies that the rank of the matrix is $3$.

Taking the contrapositive, if the rank were less than $3$, then the rows of the matrix would be linearly dependent.

=== (c)

When $a = 1/2$, the row vectors are: $(2, 3, 1/2), (1, 3, 1), (1, 2, 1/2)$.

We can express the last vector as a linear combination of the first two as follows:

$ (1, 2, 1/2) = 1/3 (2, 3, 1/2) + 1/3 (1, 3, 1) $

== Problem 14

=== (a)

Notice that $arrow(x) = (x_1, x_2, x_3, x_4) = r (1, -1, 0, 2) + s (0, 1, 1, -3) + t (1, 0, 1, -1)$.

The sum of two such elements is:

$ (r_1 (1, -1, 0, 2) + s_1 (0, 1, 1, -3) + t_1 (1, 0, 1, -1)) + (r_2 (1, -1, 0, 2) + s_2 (0, 1, 1, -3) + t_2 (1, 0, 1, -1)) = (r_1 + r_2) (1, -1, 0, 2) + (s_1 + s_2) (0, 1, 1, -3) + (t_1 + t_2) (1, 0, 1, -1) $

Which is yet another element of the solution set of $X$. Thus, the solutions of $X$ are closed under vector addition.

It is also closed under scalar multiplication, as the following computation shows:

$ c (r (1, -1, 0, 2) + s (0, 1, 1, -3) + t (1, 0, 1, -1)) = (c r) (1, -1, 0, 2) + (c s) (0, 1, 1, -3) + (c t) (1, 0, 1, -1) $

And finally, it is nonempty, as $(0, 0, 0, 0)$ is a solution (set $r = s = t = 0$).

=== (b)

The system is a homogenous system because setting $r = s = t = 0$ results in the zero vector. Thus, the zero vector is part of the solution set of $X$, implying that it is homogenous.

=== (c)

We know that $(1, -1, 0, 2), (0, 1, 1, -3), (1, 0, 1, -1)$ spans the solution set of $X$. It remains to be seen that this spanning set is actually linearly independent (if it is, then it forms a basis of the solution set of $X$).

We can directly verify this by row-reducing the following matrix consisting of the aforementioned vectors as columns:

$ mat(1, 0, 1; -1, 1, 0; 0, 1, 1; 2, -3, -1) $
$ mat(1, 0, 1; 0, 1, 1; 0, 1, 1; 0, -3, -3) $
$ mat(1, 0, 1; 0, 1, 1; 0, 0, 0; 0, 0, 0) $

Since there are free parameters, the three vectors are not linearly independent. Picking only the column vectors corresponding to the columns with leading entries, we find a basis for the solution set:

$ (1, -1, 0, 2), (0, 1, 1, -3) $

Thus, the dimension of the subspace $S$ is $2$.

== Problem 15

=== (a)

Reducing the matrix into row-echelon form:

$ mat(1, 1, 2, 0; -1, 0, 3, 1; 2, 3, 9, 1; 0, 2, 10, 2; 5, 1, 1, 1) $
$ mat(1, 1, 2, 0; 0, 1, 5, 1; 0, 1, 5, 1; 0, 2, 10, 2; 0, -4, -9, 1) $
$ mat(1, 1, 2, 0; 0, 1, 5, 1; 0, 0, 0, 0; 0, 0, 0, 0; 0, 0, 11, 5) $
$ mat(1, 1, 2, 0; 0, 1, 5, 1; 0, 0, 11, 5; 0, 0, 0, 0; 0, 0, 0, 0) $

Since there are three nonzero rows, the rank of $A$ is $3$.

=== (b)

This is equivalent to finding a basis for the column space of the transpose of the matrix.

Taking the transpose of the matrix:

$ A^T = mat(1, -1, 2, 0, 5; 1, 0, 3, 2, 1; 2, 3, 9, 10, 1; 0, 1, 1, 2, 1) $

And row-reducing:

$ mat(1, -1, 2, 0, 5; 1, 0, 3, 2, 1; 2, 3, 9, 10, 1; 0, 1, 1, 2, 1) $
$ mat(1, -1, 2, 0, 5; 0, 1, 1, 2, -4; 0, 5, 5, 10, -9; 0, 1, 1, 2, 1) $
$ mat(1, -1, 2, 0, 5; 0, 1, 1, 2, -4; 0, 0, 0, 0, 11; 0, 0, 0, 0, 5) $
$ mat(1, -1, 2, 0, 5; 0, 1, 1, 2, -4; 0, 0, 0, 0, 11; 0, 0, 0, 0, 0) $

Therefore, the vectors in the first, second, and fifth columns of $A^T$ form a basis for the column space of $A^T$.

Equivalently, the vectors in the first, second, and fifth rows of $A$ form a basis for the rows space of $A$.

In other words, the vectors $(1, 1, 2, 0), (-1, 0, 3, 1), (5, 1, 1, 1)$ form a basis for the row space of $A$.

*(Challenging Problems Begin Here)*
== Problem 16

=== (a)

This corresponds to the following augmented matrix:

$ mat(1, -1, 1, 0; 1, 2, 3, 0; augment: #3) $

Row-reducing:

$ mat(1, -1, 1, 0; 1, 2, 3, 0; augment: #3) $
$ mat(1, -1, 1, 0; 0, 3, 2, 0; augment: #3) $
$ mat(1, -1, 1, 0; 0, 1, 2/3, 0; augment: #3) $
$ mat(1, 0, 5/3, 0; 0, 1, 2/3, 0; augment: #3) $

Thus, a parameterization for the set of solutions is:

$ (-5/3 s, -2/3 s, s) $

=== (b)

Order the vectors of $Z$ in some way. Let the $j$th entry of the $i$th vector in $Z$ be $z_(i j)$.

Consider the $m times n$ matrix $Z' = (z_(i j))$.

Notice that the set of vectors that have a dot product of zero with all of the vectors of $Z$ are elements of the following augmented matrix:

$ mat(Z', bold(0); augment: #1) $

This is because the equation $Z' arrow(v) = arrow(0)$ exactly characterizes the orthogonality condition imposed within the set $Z^bot$: Matrix multiplication represents taking dot products of columns of the right matrix and rows of the left matrix.

Crucially, the augmented matrix formed is always *homogenous*. Thus, using what we have proved in class, the set of solutions forms a subspace of $bb(R)^n$, as needed.

=== (c)

First, note that $Z$ froms the rows of $Z'$. Thus, $"dim"("span"(Z)) = "rank"(Z')$ by definition (since the rank of a matrix is the dimension of the space spanned by its rows).

Furthermore, $Z^bot$ is composed of the vectors corresponding to the solution set of:

$ mat(Z', bold(0); augment: #1) $

But this is just the null space of $Z'$. Thus, $"dim"(Z^bot) = "nullity"(Z')$.

Finally, by the rank-nullity theorem, we conclude:

$ "dim"("span"(Z)) + "dim"(Z^bot) = "rank"(Z') + "nullity"(Z') = m $

As needed. $qed$

== Problem 17

=== (i)

Let us row-reduce the matrix with these vectors as columns:

$ mat(1, 2, 0, 2; -2, -5, 5, 1; 0, -3, 15, 15; 0, -2, 10, 8; 3, 6, 0, 6) $
$ mat(1, 2, 0, 2; 0, -1, 5, 5; 0, -3, 15, 15; 0, -2, 10, 8; 0, 0, 0, 0) $
$ mat(1, 2, 0, 2; 0, -1, 5, 5; 0, 0, 0, 0; 0, 0, 0, -2; 0, 0, 0, 0) $
$ mat(1, 2, 0, 2; 0, -1, 5, 5; 0, 0, 0, -2; 0, 0, 0, 0; 0, 0, 0, 0) $

Thus, the vectors $(1, -2, 0, 0, 3), (2, -5, -3, -2, 6), (2, 1, 15, 8, 6)$ form a basis for $V$.

=== (ii)

I claim that $(1, -2, 0, 0, 3), (2, -5, -3, -2, 6), (2, 1, 15, 8, 6), (0, 0, 1, 0, 0), (0, 0, 0, 0, 1)$ is an extension of the basis for $V$ that spans the entirety of $bb(R)^5$.

To check that these vectors span the entirety of $bb(R)^5$, it suffices to check that the following matrix:

$ mat(1, 2, 2, 0, 0; -2, -5, 1, 0, 0; 0, -3, 15, 1, 0; 0, -2, 8, 0, 0; 3, 6, 6, 0, 1) $

has the identity matrix as its RREF.

Performing Gauss-Jordan Elimination:


$ mat(1, 2, 2, 0, 0; 0, -1, 5, 0, 0; 0, -3, 15, 0, 0; 0, -2, 8, 1, 0; 0, 0, 0, 0, 1) $
$ mat(1, 2, 2, 0, 0; 0, -1, 5, 0, 0; 0, -3, 15, 1, 0; 0, -2, 8, 0, 0; 0, 0, 0, 0, 1) $
$ mat(1, 2, 2, 0, 0; 0, -1, 5, 0, 0; 0, 0, 0, 1, 0; 0, 0, -2, 0, 0; 0, 0, 0, 0, 1) $
$ mat(1, 2, 2, 0, 0; 0, -1, 5, 0, 0; 0, 0, 0, 1, 0; 0, 0, 1, 0, 0; 0, 0, 0, 0, 1) $
$ mat(1, 2, 2, 0, 0; 0, -1, 5, 0, 0; 0, 0, 1, 0, 0; 0, 0, 0, 1, 0; 0, 0, 0, 0, 1) $
$ mat(1, 2, 0, 0, 0; 0, -1, 0, 0, 0; 0, 0, 1, 0, 0; 0, 0, 0, 1, 0; 0, 0, 0, 0, 1) $
$ mat(1, 2, 0, 0, 0; 0, 1, 0, 0, 0; 0, 0, 1, 0, 0; 0, 0, 0, 1, 0; 0, 0, 0, 0, 1) $
$ mat(1, 0, 0, 0, 0; 0, 1, 0, 0, 0; 0, 0, 1, 0, 0; 0, 0, 0, 1, 0; 0, 0, 0, 0, 1) $

== Problem 18

=== (a)

We can apply Gaussian Elimination on the matrix consisting of these vectors as columns:

$ mat(1, 3, -1; 3, -1, 2; 1, 1, 0; 3, -1, 2; 1, 1, 0) $
$ mat(1, 3, -1; 3, -1, 2; 1, 1, 0; 0, 0, 0; 0, 0, 0) $
$ mat(1, 3, -1; 0, -10, 5; 0, -2, 1; 0, 0, 0; 0, 0, 0) $
$ mat(1, 3, -1; 0, -10, 5; 0, 0, 0; 0, 0, 0; 0, 0, 0) $

Therefore, $(1, 3, 1, 3, 1), (3, -1, 1, -1, 1)$ forms a basis for $"span"{arrow(u), arrow(v), arrow(w)}$.

=== (b)

We know that a parameterization for this set of solutions is:

$ r (1, 3, 1, 3, 1) + s (3, -1, 1, -1, 1) $

We want to know how the variables relate to one another. Notice that each variable is associated with a 2d vector --- for instance, $x_1 tilde (1, 3)$ because $x_1 = r + 3 s$.

To see how the variables relate to one another, we set-up the following augmented matrix and reduce to determine, explicitly, the linear dependence between the variables (we know that any solution must correspond to a satisfiable system, so for any rows with all zeros, the numbers to the right of the bar must equal zero. This will give us the equations needed.):

$ mat(1, 3, a_1; 3, -1, a_2; 1, 1, a_3; 3, -1, a_4; 1, 1, a_5; augment: #2) $
$ mat(1, 3, a_1; 3, -1, a_2; 1, 1, a_3; 0, 0, a_4 - a_2; 0, 0, a_5 - a_3; augment: #2) $
$ mat(1, 3, a_1; 0, -10, a_2 - 3 a_1; 0, -2, a_3 - a_1; 0, 0, a_4 - a_2; 0, 0, a_5 - a_3; augment: #2) $
$ mat(1, 3, a_1; 0, -10, a_2 - 3 a_1; 0, 10, 5 a_1 - 5 a_3; 0, 0, a_4 - a_2; 0, 0, a_5 - a_3; augment: #2) $
$ mat(1, 3, a_1; 0, -10, a_2 - 3 a_1; 0, 0, 2 a_1 - 5 a_3 + a_2; 0, 0, a_4 - a_2; 0, 0, a_5 - a_3; augment: #2) $

Therefore, the solution set of the following system of linear equations is equal to the span of the three vectors:

$ 2 x_1 + x_2 - 5 x_3 = 0 $
$ x_4 - x_2 = 0 $
$ x_5 - x_3 = 0 $

== Problem 19

We proceed by induction on the length of the list. Let $P(k)$ be the statement:

$ P(k): "Any list of vectors with length at most" k "satisfying the property is linearly independent" $

$P(1)$ is clear as any list containing a single nonzero vector is linearly independent.

Suppose $P(k - 1)$. We want to show $P(k)$ is true.

Consider a particular but arbitrarily chosen list of $k$ nonzero vectors $arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_k)$.

By the induction hypothesis, we know that $arrow(v_2), arrow(v_2), arrow(v_3), dots, arrow(v_(k))$ is linearly independent. Equivalently, the only solution to the following equation:

$ sum_(i = 2)^(k) c_i arrow(v_i) = arrow(0) $

Is the trivial one.

We want to show that the only solution to the following equation is also the trivial one:

$ sum_(i = 1)^(k) c_i arrow(v_i) = arrow(0) $

Let the first nonzero index of the $i$th vector be $f(i)$. Therefore $forall j in bb(Z)_(>= 0), j < f(i) arrow (arrow(v_i))_(j) eq 0$, and $(arrow(v_i))_(f(i)) eq.not 0$. Also, $i < j arrow f(i) < f(j)$.

Notice that for all integers $i$, when $1 < i$, $f(1) < f(i)$. Further, $arrow(v_i)_(f(1)) = 0$.

By the definition of vector equality, for the following to be satisfied:

$ sum_(i = 1)^(k) c_i arrow(v_i) = arrow(0) $

It is necessary that:

$ (sum_(i = 1)^(k) c_i arrow(v_i))_(f(1)) = 0 $

Performing some manipulations:

$ (sum_(i = 1)^(k) c_i arrow(v_i))_(f(1)) = 0 $
$ sum_(i = 1)^(k) c_i (arrow(v_i))_(f(1)) = 0 $
$ c_1 (arrow(v_1))_(f(1)) + sum_(i = 2)^(k) c_i (arrow(v_i))_(f(1)) = 0 $
$ c_1 (arrow(v_1))_(f(1)) + sum_(i = 2)^(k) c_i dot 0 = 0 $
$ c_1 (arrow(v_1))_(f(1)) = 0 $

Since $(arrow(v_1))_(f(1)) eq.not 0$, by the zero-product property, $c_1 = 0$.

Therefore, $sum_(i = 1)^(k) c_i arrow(v_i) = sum_(i = 2)^(k) c_i arrow(v_i) = arrow(0)$. From our induction hypothesis, this implies that $c_2 = c_3 = dots.c = c_k = 0$. We have thus shown that the only solution is:

$ c_1 = c_2 = c_3 = dots.c = c_k = 0 $

Which is what we wanted to show.

This completes the induction proof. $qed$

== Problem 20

Without loss of generality, let us assume that $m <= n$ --- if $m >= n$, we can apply the argument below in reverse --- instead of turning $B$ to $B'$, we instead turn $B'$ to $B$.

We proceed by induction on $0 <= i <= m$, where the statement $P(i)$ is:

$ P(i): exists S subset B, |S| = m - i and "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_i)} union S) = V $

First, the base case states that:

$ P(0): exists S subset B, |S| = m - 0 and "span"(emptyset union S) = V $

This is trivially true because we can set $S = B$.

Next, the inductive step. Suppose that $P(i - 1)$ were true for some particular but arbitrarily chosen $i$ such that $1 <= i <= m$. We are given:

$ P(i - 1): exists S subset B, |S| = m - i + 1 and "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S) = V $

We want to show:

$ P(i): exists S subset B, |S| = m - i and "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union S) = V $

Let the set $S'$ be a set satisfying the property:

$ |S'| = m - i + 1 and "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S') = V $

Number the elements of the set $S'$ as: $arrow(v_1), arrow(v_2), dots, arrow(v_(m - i + 1))$.

Since $"span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S') = V$ and $arrow(w_i) in V$, we can express $arrow(w_i)$ as a linear combination of the vectors in the spanning set. That is, there exist real coefficients satisfying the following equation:

$ arrow(w_i) = sum_(j = 1)^(j = i - 1) a_j arrow(w_j) + sum_(j = 1)^(j = m - i + 1) b_j arrow(v_j) $

I claim that there exists an integer $j$ satisfying both $ 1<= j <= m - i + 1$ and $b_j eq.not 0$. Suppose not. Then, the equation above simplifies to:

$ arrow(w_i) = sum_(j = 1)^(j = i - 1) a_j arrow(w_j) $

Implying that ${arrow(w_1), arrow(w_2), dots, arrow(w_i)}$ is linearly dependent.

This is a contradiction, since we have assumed that $B'$ is a basis and is thus linearly independent. Therefore, there exists a $j$ such that $b_j eq.not 0$.

Suppose $j^*$ were this integer. That is, suppose $b_(j^*) eq.not 0$.

Further let $N$ be the set such that $N = S' - {arrow(v_(j^*))}$.

I claim that $ "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union N) = "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S') = V $

To show this, we show that every vector in ${arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union N$ can be expressed as a linear combination of the vectors in ${arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S'$ and vice versa.

For the vectors ${arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))}$ and the vectors $arrow(v_j)$ for $j eq.not j^*$, this is trivial as they are in both spanning sets. It thus suffices to show that $arrow(v_(j^*)) in "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union N)$ and $arrow(w_i) in "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S')$.

Recall the following equation:

$ arrow(w_i) = sum_(j = 1)^(j = i - 1) a_j arrow(w_j) + sum_(j = 1)^(j = m - i + 1) b_j arrow(v_j) $

We can rewrite it as follows:

$ arrow(w_i) = b_(j^*) arrow(v_(j^*)) +  sum_(j = 1)^(j = i - 1) a_j arrow(w_j) + sum_(limits(1 <= j <= m - i + 1)_(j eq.not j^*)) b_j arrow(v_j) $

Thus, $arrow(w_i) in "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S')$.

Since $b_(j^*) eq.not 0$, we can rearrange the above equation as:

$ b_(j^*) arrow(v_(j^*)) = arrow(w_i) - sum_(j = 1)^(j = i - 1) a_j arrow(w_j) - sum_(limits(1 <= j <= m - i + 1)_(j eq.not j^*)) b_j arrow(v_j) $

$ arrow(v_(j^*)) = (1 / b_(j^*)) arrow(w_i) - sum_(j = 1)^(j = i - 1) (a_j/b_(j^*)) arrow(w_j) - sum_(limits(1 <= j <= m - i + 1)_(j eq.not j^*)) (b_j/b_(j^*)) arrow(v_j) $

$ arrow(v_(j^*)) = (1 / b_(j^*)) arrow(w_i) + sum_(j = 1)^(j = i - 1) (-a_j/b_(j^*)) arrow(w_j) + sum_(limits(1 <= j <= m - i + 1)_(j eq.not j^*)) (-b_j/b_(j^*)) arrow(v_j) $

Thus, $arrow(v_(j^*)) in "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union N)$.

We therefore conclude that $ "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union N) = "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i - 1))} union S') = V $

Further, since $N$ is obtained by removing $arrow(v_(j^*))$ from $S'$, $|N| = |S'| - 1 = (m - i + 1) - 1 = m - i$. And finally, $N subset S subset B$

We have thus shown, by construction, that:

$ exists S subset B, |S| = m - i and "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union S) = V $

Explicitly, $S = N$ satisfies this condition.

Therefore, $P(i)$ is true for integers $1 <= i <= m$.

Consider $P(m)$. It states that:

$ P(m): exists S subset B, |S| = m - m = 0 and "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(m))} union S) = V $

Since $|S| = 0$, $S = emptyset$. Therefore:

$ "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(m))}) = "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(i))} union S) = V $

Now, I claim that $n = m$. Suppose not. Then, $m < n$.

Since $ "span"({arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(m))}) in V$ and $arrow(w_n) in V$, we can express $arrow(w_n)$ as a linear combination of the vectors $arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(m))$ (and note that since $m < n$, $arrow(w_n)$ is not in this list). But this implies that $arrow(w_1), arrow(w_2), arrow(w_3), dots, arrow(w_(n))$ is linearly dependent and thus is not a basis, contradiction.

Therefore, $n = m$, as needed. $qed$

== Problem 21

=== (a)

This is true. Suppose we express $arrow(x)$ using two sets of coefficients:

$ arrow(x) = sum_(i = 1)^n c_i arrow(v_i) = sum_(i = 1)^n d_i arrow(v_i) $

Thus,

$ sum_(i = 1)^n (c_i - d_i) arrow(v_i) = arrow(0) $

Since the $arrow(v_i)$ s form a basis, they must be linearly independent. Equivalently, this means that the only way to express $arrow(0)$ as a linear combination of these vectors is the trivial solution.

This implies that $c_i - d_i = 0$ and thus $c_i = d_i$.

Therefore, there is a unique set of coefficients so that:

$ arrow(x) = sum_(i = 1)^n c_i arrow(v_i) $

=== (b)

Let $A = (a_(i, j))$ be an $n times n$ matrix.

We can thus express the equation:

$ arrow(x) = sum_(i = 1)^n c_i arrow(v_i) $

As follows:

$ A^T vec(c_1, c_2, c_3, dots.v, c_n) = arrow(x) $

Since the vectors form a basis of $bb(R)^n$ and also comprise the columns of $A^T$, $A^T$ has rank $n$. Therefore, its RREF has $n$ leading entries, implying that its RREF is the identity matrix. This implies, by the characterizations of invertibility, that $A^T$ is invertible. Thus, $det(A^T) eq.not 0$.

By Cramer's Rule, we can thus solve for the $x_i$ s:

$ x_i = mat(("col" 1), ("col" 2), ("col" 3), dots.c, ("col" i), dots.c, ("col" n); a_(1, 1), a_(2, 1), a_(3, 1), dots.c, x_(1), dots.c, a_(n, 1); a_(1, 2), a_(2, 2), a_(3, 2), dots.c, x_(2), dots.c, a_(n, 2); a_(1, 3), a_(2, 3), a_(3, 3), dots.c, x_(3), dots.c, a_(n, 3); dots.v, dots.v, dots.v, dots.down, dots.v, dots.down, dots.v; a_(1, n), a_(2, n), a_(3, n), dots.c, x_(n), dots.c, a_(n, n); delim: "|") / mat(a_(1, 1), a_(2, 1), a_(3, 1), dots.c, a_(n, 1); a_(1, 2), a_(2, 2), a_(3, 2), dots.c, a_(n, 2); a_(1, 3), a_(2, 3), a_(3, 3), dots.c, a_(n, 3); dots.v, dots.v, dots.v, dots.down, dots.v; a_(1, n), a_(2, n), a_(3, n), dots.c, a_(n, n); delim: "|") $

== Problem 22

=== (a)

$ mat(1, 0, 0; 0, 0, 0; 0, 0, 0) $

This matrix has rank one, so we expect all of the $2-$ and $3-$ minors are zero. Notice that any such minor matrix contains at least one row of zeros, so indeed the determinant of any such minor matrix is zero.

=== (b)

==== Forward Direction

Let us first prove the forward direction.

Suppose that the rank of $X$ is less than $k$. Thus, picking any $k$ vectors as rows results in a list of row vectors that are linearly dependent. Further, these $k$ vectors form a $k times n$ submatrix of $X$. Call this submatrix $X'$. Thus, the row vectors of $X'$ are linearly dependent.

These $k$ vectors all live in $bb(R)^n$. Now, further suppose we pick $k$ entries from each vector, such that the entries picked are along the same dimension. This also constructs a particular but arbitrarily chosen $k$-minor of the matrix, as well as a list of $k$ row vectors that live in $bb(R)^k$. Call the resulting $k$-minor matrix $X''$.

We note that the act of picking $k$ entries of the vector could be represented as a projection matrix $P$. Formally, suppose that for the $i$th entry of the smaller vector, we pick entry $f(i)$ of the original vector.

We construct the projection matrix $P$ as follows. Let $P$ be a $k times n$ matrix. Then, an entry $(P)_(i, j)$ of $P$ is one iff $j = f(i)$ and zero otherwise.

Let the row vectors of $X'$ be numbered as $arrow(v_1), arrow(v_2), arrow(v_3), dots, arrow(v_k)$. The corresponding row vectors in $X''$ are $P arrow(v_1), P arrow(v_2), P arrow(v_3), dots, P arrow(v_k)$.

Since the row vectors of $X'$ are linearly dependent, there is a nontrivial linear combination that results in the zero vector:

$ sum_(i = 1)^k c_i arrow(v_i) = arrow(0)_(bb(R)^n) $

Left-multiplying both sides by the projection matrix $P$, and we find the zero vector of $bb(R)^k$ expressed as a nontrivial linear combination of the row vectors of $X''$:

$ P sum_(i = 1)^k c_i arrow(v_i) = P arrow(0)_(bb(R)^n) $
$ sum_(i = 1)^k c_i (P arrow(v_i)) = arrow(0)_(bb(R)^k) $

Thus, the rank of $X''$ is less than $k$, implying that its RREF contains at least one zero. Therefore, $X''$ is singular and thus $det(X'') = 0$.

However, since $X''$ were arbitrarily-chosen, all $k$-minor matrices must have determinant zero, as needed.

==== Backward Direction
Now, let us show the backward direction.

The proof is by contradiction.

We want to show that if all the $k$-minors of $X$ are zero, then its rank must be less than $k$.

Suppose not. Then, all the $k$-minors of $X$ are zero but its rank is at least $k$.

Consider the RREF of $X$. It must have at least $k$ leading entries because the rank of $X$ is at least $k$.

Suppose the $i$th column of $X$ with a leading entry were column $c(i)$. Now, consider the $m times k$ submatrix formed by only picking columns $c(1), c(2), c(3), dots, c(k)$ of $X$. Let this submatrix be $X'$.

Clearly, the rank of $X'$ is $k$ because we have picked the columns with leading entries.

Now consider the RREF of $X'^T$. It must have exactly $k$ leading entries because the rank of $X'^T$ is $k$. Suppose the $i$th column of $X'^T$ with a leading entry were column $r(i)$ (note that this is row $r(i)$ of $X'$). Consider the $k times k$ submatrix of $X'^T$ formed by only picking columns $r(1), r(2), r(3), dots, r(k)$ of $X'^T$. Let this submatrix be $X''$.

Clearly, the rank of $X''$ is $k$ because we have picked the columns with leading entries. Since its rank is $k$, the RREF of $X''$ must have exactly $k$ leading entries, but since $X''$ is a $k times k$ matrix, this simply implies that the RREF of $X''$ is the identity matrix. Thus, $X''$ is invertible and $det(X'') eq.not 0$. Therefore, $det(X''^T) eq.not 0$.

Further, $X''^T$ is a $k$-minor matrix of $X$ whose determinant is nonzero, contradiction.

We thus conclude the result. $qed$