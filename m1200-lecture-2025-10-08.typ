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
      2025-10-08 Lecture
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

= The First Elementary Property

#theorem_box[Theorem][Determinant of a Matrix with a Row or Column of Zeroes][
  The determinant of a matrix $A$ with a row or column of zeroes is zero.
]

#proof_box[Proof][Determinant of a Matrix with a Row or Column of Zeroes][
  Direct computation of the determinant along the row or column of zeroes results in zero.
]

= The Second Elementary Property
TODO

= The Third Elementary Property

#theorem_box[Theorem][Determinant Respects Linearity of Rows][
  Let:

  $ A = mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, b arrow(B) + c arrow(C), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r) $

  Then,

  $ det(A) = b det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(B), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + c det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(C), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) $

  As needed. $qed$
]

#proof_box[Proof][Determinant Respects Linearity of Rows][
  Direct computation of the determinant of $A$ using the $i$th row gives:

  #aligned_block(
    [$det(A)$],
    [$=$],
    [$det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, b arrow(B) + c arrow(C), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$],

    [],
    [$=$],
    [$sum_(j = 1)^n (b arrow(B)_j + c arrow(C)_j) (-1)^(i + j) det(M_(i, j))$],

    [],
    [$=$],
    [$b sum_(j = 1)^n arrow(B)_j (-1)^(i + j) det(M_(i, j)) + c sum_(j = 1)^n arrow(C)_j (-1)^(i + j) det(M_(i, j))$],

    [],
    [$=$],
    [$b det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(B), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + c det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(C), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$],
  )

  As needed. $qed$
]

#corollary_box[Corollary][Determinants Respect Linear Combinations on Columns][
  Determinants also respect linearity on specific columns. This is a direct consequence of the previous theorem and the invariance of the determinant under transposition of a matrix.
]

= The Fourth Elementary Property

#theorem_box[Theorem][Repeated Row or Column Implies Zero Determinant][
  Let $A$ be an $n times n$ matrix. If $A$ has a repeated row or a repeated column, its determinant is zero.
]

#proof_box[Proof][Repeated Row or Column Implies Zero Determinant][
  The proof is by mathematical induction.

  First, let us consider the base case of $2 times 2$ matrices.

  Then, the matrix is of the following form:

  $ mat(a, b; a, b) $

  We note that:

  $ det(mat(a, b; a, b)) = a b - a b = 0 $

  This proves the base case.

  Now, suppose that all $(n - 1) times (n - 1)$ matrices (for $n >= 3$) with a repeated row has determinant zero. We want to show that all $n times n$ matrices with a repeated row has determinant zero.

  Suppose that $A$ is some particular but arbitrarily chosen matrix such that it has one repeated row. Since there are repeated rows, there exist rows $j, k$ such that $j eq.not k$ and $arrow(R_j) = arrow(R_k)$.

  Since there are at least $3$ rows in the $n times n$ matrix, at least one of these rows is neither $j$ nor $k$. Let $i eq.not j and i eq.not k$.

  Direct computation of the determinant $A$ along row $i$ gives:

  $ det(A) = sum_(l = 1)^n A_(i, l) (-1)^(i + l) det(M_(i, l)) $

  We note that, since rows $j$ and $k$ are not eliminated in any of the minor matrices $M_(i, l)$, all minor matrices also include a repeated row. Furthermore, $forall l in [1, n] inter bb(Z), M_(i, l) in bold(M)_((n - 1) times (n - 1)) (bb(R))$. By the induction hypothesis, $det(M_(i, l)) = 0$ due to the existence of repeated rows.

  Therefore,

  #aligned_block(
    [$det(A)$],
    [$=$],
    [$sum_(l = 1)^n A_(i, l) (-1)^(i + l) det(M_(i, l))$],

    [],
    [$=$],
    [$sum_(l = 1)^n A_(i, l) (-1)^(i + l) dot 0$],

    [],
    [$=$],
    [$0$]
  )

  Thus, if all $(n - 1) times (n - 1)$ matrices with repeated rows have zero determinant, then all $n times n$ matrices with repeated rows also have zero determinant.

  Therefore, by the principle of mathematical induction, all members $A in bold(M)_(n times n) (bb(R))$ for all $n in bb(Z)_(>= 2)$ with a repeated row have zero determinant, as needed.

  Finally, any matrix $A$ with a repeated column has a corresponding transpose $A^T$ with a repeated row. Thus, $det(A) = det(A^T) = 0$. In both cases, the determinant is zero, as needed. $qed$
]

= The Fifth Elementary Property

#theorem_box[Theorem][Row Swap Flips Determinant Sign][
  Suppose we can obtain $A'$ from one row swap on $A$. Then,

  $ det(A') = - det(A) $
]

#proof_box[Proof][Row Swap Flips Determinant Sign][
  Notice that:

  #aligned_block(
    [$0$],
    [$=$],
    [$det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i) + arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_i) + arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$],

    [],
    [$=$],
    [$det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_i) + arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_i) + arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$],

    [],
    [$=$],
    [$det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$],

    [],
    [$+$],
    [$det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$]
  )
]

#proof_box[
  #aligned_block(
    [],
    [$=$],
    [$det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + 0$],

    [],
    [$+$],
    [$0 + det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$],

    [],
    [$=$],
    [$det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r))$],
  )

  Thus,

  $ det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) + det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) = 0 $

  Which implies,
]

#proof_box[
  $ det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) = - det(mat(arrow.l, arrow(R_1), arrow.r; arrow.l, arrow(R_2), arrow.r; , dots.v, ; arrow.l, arrow(R_i), arrow.r; , dots.v, ; arrow.l, arrow(R_j), arrow.r; , dots.v, ; arrow.l, arrow(R_n), arrow.r)) $

  For any choice of $arrow(R_i)$, as needed. $qed$
]

= The Sixth Elementary Property
#theorem_box[Theorem][Determinants of Lower and Upper Triangular Matrices][
  The determinant of any lower or upper triangular matrix $A$ is the product of its diagonal entries.
]

#proof_box[Proof][Determinants of Lower and Upper Triangular Matrices][
  We will first prove this property on lower triangular matrices.

  The proof is by induction.

  First, let us show that the determinant of all $1 times 1$ lower triangular matrices is the product of its diagonal entries.

  Clearly,

  $ det(A) = A_(1, 1) $

  Which is the product of all diagonal entries of the matrix, as needed.

  Now, we will show that if the determinant of all $(n - 1) times (n - 1)$ lower triangular matrices is $product_(i = 1)^(n - 1) A_(i, i)$, then the determinant of all $n times n$ lower triangular matrices is $product_(i = 1)^n A_(i, i)$.

  Suppose $A in bold(M)_(n times n) (bb(R))$ is some particular but arbitrarily chosen matrix that is lower triangular.

  We will compute the determinant using the top row of $A$.

  Notice that the only nonzero entry on the top row. TODO
]

= The Geometric Interpretation of a Determinant

Take two vectors $arrow(v), arrow(w) in bb(R)$. Let $P$ be the parallelogram:

$ P = {a arrow(v) + b arrow(w) \| a in [0, 1] and b in [0, 1]} $

Then, $ "Area"(P) = abs(det(mat(arrow.t, arrow.t; arrow(v), arrow(w); arrow.b, arrow.b))) $

In 3d, the determinant is the volume of the corresponding parallelepiped up to multiplication by $1$ or $-1$.

= An Alternative Definition of Determinant Based on Permutations

#theorem_box[Theorem][Equivalence of the Permutation Definition of a Determinant][
  Let $pi$ be a permutation from ${1, 2, 3, ..., n}$ to itself.

  Then, let $"sgn"(pi) = (-1)^("swaps"(pi))$ be the sign of a permutation, where $"swaps"(pi)$ is the number of swaps to get from the indentity permutation to $pi$.

  Finally, the determinant of $A$ is given by:

  $ det(A) := sum_(pi in S_n) ("sgn"(pi) product_(i = 1)^n a_(i, pi(i))) $
]