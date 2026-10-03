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
      2025-09-22 Lecture
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

= Expressing Two Row-Equivalent Matrices as Products of One Another

Given two row-equivalent matrices $A$ and $B$, there exists an invertible matrix $Q$ such that:

$  A = Q B $

To find this matrix $Q$, one can reduce both $A$ and $B$ to RREF. Note down the elementary row operations used, and convert the sequence to a matrix product.

Then, you will have some equation of the form:

$ P_n P_(n - 1) dots.c P_1 A = Q_m Q_(m - 1) dots.c Q_1 B $

Where all $P_i$ and $Q_j$ are elementary matrices (and are thus invertible).

Then, we have:

$  Q = P_1^(-1) P_2^(-1) dots.c P_n^(-1) Q_m Q_(m - 1) dots.c Q_1 B $

= Characterizations of Invertibility

What is a *"characterization"*?

/ characterization: simple properties of a matrix different from invertibiliity but are equivalent to it.

#theorem_box[Theorem][Characterizations of Invertibility][
  Given a square matrix $A$, the following statements are equivalent:

  + $A$ is invertible.
  + The only solution of $A arrow(x) = arrow(0)$ is the trivial solution $arrow(x) = arrow(0)$.
  + The reduced-row echelon form (RREF) of $A$ is the identity matrix.
  + $A$ can be expressed as the product of elementary matrices.
]

How do you prove it?

We'll *hit a home run* (darn such a good analogy).

We will prove them in a circular manner.

#proof_box[Proof][Characterizations of Invertibility][
  We want to prove that $1 arrow 2$, $2 arrow 3$, $3 arrow 4$, and $4 arrow 1$.

  Suppose $A$ is invertible. We want to show that $A arrow(x) = arrow(0)$ only has $arrow(x) = arrow(0)$ as its solution.

  Suppose ftsoc that there exists $arrow(x) eq.not arrow(0)$ such that $ A arrow(x) = arrow(0) $

  Since $A$ is invertible, there exists a matrix $A^(-1)$ such that:

  $ A^(-1) A = I $

  Then:

  #aligned_block(
    [$A arrow(x)$],
    [$=$],
    [$arrow(0)$],

    [$A^(-1) A arrow(x)$],
    [$=$],
    [$A^(-1) arrow(0)$],

    [$arrow(x)$],
    [$=$],
    [$A^(-1) arrow(0)$],

    [$arrow(x)$],
    [$=$],
    [$arrow(0)$],
  )

  Contradiction. Thus, $1 arrow 2$.

  Next, suppose $A arrow(x) = arrow(0)$ only has $arrow(x) = arrow(0)$ as its solution. We want to show that the reduced row echelon form (RREF) of $A$ is the identity matrix.

  Suppose ftsoc that the RREF of $A$ is not the identity matrix. Then, the RREF of $A$ has at least one column with a nonleading entry. Further, $A arrow(x) = arrow(0)$ has at least one solution, so the equation $A arrow(x) = arrow(0)$ corresponding to the augmented matrix with at least one column with no leading entries $mat(A | mat(0; dots.v; 0))$ has infinite solutions, contradiction. Thus, $2 arrow 3$.

  Next, suppose the RREF of $A$ is the identity matrix. We want to show that $A$ is the product of some elementary matrices. Gauss-Jordan elimination gives us steps to reduce $A$ to the identity matrix. Therefore, there are elementary matrices $E_i$ such that:

  $ E_n E_(n - 1) E_(n - 2) dots.c E_1 A = I $

  Since all elementary matrices are invertible,

  $ A = E_1^(-1) E_2^(-1) E_3^(-1) dots.c E_n^(-1) $

  Since $E_i^(-1)$ is elementary, $A$ is indeed the product of elementary matrices. Thus, $3 arrow 4$.

  Finally, suppose $A$ can be expressed as the product of elementary matrices. We want to show that it is invertible. Let $(E_i)_(i = 1)^n$ be some sequence of elementary matrices such that:

  $ A = E_n E_(n - 1) E_(n - 2) dots.c E_1 $

  Then, $ E_1^(-1) E_2^(-1) E_3^(-1) dots.c E_n^(-1) A = I $

  Thus, $ E_1^(-1) E_2^(-1) E_3^(-1) dots.c E_n^(-1) $ is the inverse of $A$, implying that $A$ is invertible. Thus, $4 arrow 1$.
]