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
      2025-09-24 Lecture
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

= Quotes
"But we can do better"

PROF ANDREW SAID THE SIR KEVIN LINE 🤯

= Finding the Inverse
We note that Gauss-Jordan finds, by proxy of the characterizations of invertibility, elementary matrices that turn a matrix into RREF.

#aligned_block(
  columns: 1,
  [$ mat(1, 0, 0, 8; 0, 1, 2, 0; 0, 3, 7, 0; 1, 0, 1, 1),  mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1) $],

  [$ mat(1, 0, 0, 8; 0, 1, 2, 0; 0, 3, 7, 0; 0, 0, 1, -7),  mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; -1, 0, 0, 1) $],

  [$ mat(1, 0, 0, 8; 0, 1, 2, 0; 0, 0, 1, 0; 0, 0, 1, -7),  mat(1, 0, 0, 0; 0, 1, 0, 0; 0, -3, 1, 0; -1, 0, 0, 1) $],

  [$ mat(1, 0, 0, 8; 0, 1, 2, 0; 0, 0, 1, 0; 0, 0, 0, -7),  mat(1, 0, 0, 0; 0, 1, 0, 0; 0, -3, 1, 0; -1, 3, -1, 1) $],

  [$ mat(1, 0, 0, 8; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, -7),  mat(1, 0, 0, 0; 0, 7, -2, 0; 0, -3, 1, 0; -1, 3, -1, 1) $],

  [$ mat(1, 0, 0, 8; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1),  mat(1, 0, 0, 0; 0, 7, -2, 0; 0, -3, 1, 0; 1/7, -3/7, 1/7, -1/7) $],

  [$ mat(1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1),  mat(-1/7, 24/7, -8/7, 8/7; 0, 7, -2, 0; 0, -3, 1, 0; 1/7, -3/7, 1/7, -1/7) $],
)

Note to self: This is easier than the adjoint matrix method.

= Determinants

== Induction

#theorem_box[Theorem][Induction][
  $ P(0) $
  $ forall n in bb(N), P(n) arrow P(n + 1) $
  $ therefore forall n in bb(N), P(n) $
]

#example_box[Example][Sum of Squares][
  We want to show:

  $ P(n): 1 + 2 + 3 + dots.c + n = n(n + 1) / 2 $

  For all $n in bb(N)$.

  First, we show:

  $ P(0): 0 = 0 dot (0 + 1) / 2 $

  Indeed, $0 dot (0 + 1) / 2 = 0 dot 1 / 2 = 0$, so $P(0)$, as needed.

  Next, we show that $P(n) arrow P(n + 1)$.

  Suppose $P(n)$. We want to show:

  $ P(n + 1): 1 + 2 + 3 + dots.c + n + (n + 1) = (n + 1)(n + 2) / 2 $

  Notice that:

  #aligned_block(
    [$ 1 + 2 + 3 + dots.c + n + (n + 1)$],
    [$=$],
    [$(1 + 2 + 3 + dots.c + n) + (n + 1)$],

    [],
    [$=$],
    [$n(n + 1) / 2 + (n + 1)$],

    [],
    [$=$],
    [$1 / 2 (n(n + 1) + 2(n + 1))$],

    [],
    [$=$],
    [$1 / 2 ((n + 2)(n + 1))$],

    [],
    [$=$],
    [$((n + 1)(n + 2)) / 2$],
  )

  Thus, $P(n) arrow P(n + 1)$. Since $P(0)$ and $forall n in bb(N), P(n) arrow P(n + 1)$. Thus, by the principle of mathematical induction, $ forall n in bb(N), P(n) $

  As needed. $qed$
]

/ Base Case: The first thing you prove in mathematical induction to start the "fall of the chain of dominoes"
/ Inductive Step: Show that if one domino falls, the next one falls.

== Definition of the Determinant of a matrix

#definition_box[Definition][Minor Matrix][
  The $"minor"(M, i, j)$ minor matrix of $M$ is the result of removing the $i$th row and $j$th column from $M$.
]

#definition_box[Definition][Determinant][
  The *determinant* of an $n times n$ *square matrix*, denoted $det(A)$, is defined as:

  $ det(A) = sum_(i = 1)^(n) (-1)^(i + 1) a_(1 i) det("minor"(A, 1, i)) $

  Where the determinant of a $1 times 1$ matrix is defined as:

  $ det(A) = a_(1 1) $
]

#definition_box[Definition][Cofactor][
  The $C_(i j)$ cofactor of $M$ is given by:

  $ C_(i j) := (-1)^(i + j) det("minor"(M, i, j)) $

  So, the determinant can be equivalently computed as:

  $ det(A) = sum_(i = 1)^n a_(1 i) C_(1 i) $
]

#theorem_box[Theorem][Properties of the Determinant][
  + A matrix $A$ is invertible iff $det(A) eq.not 0$.
  + $det(A B) = det(A) det(B)$
]