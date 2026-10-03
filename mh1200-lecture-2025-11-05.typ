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
      2025-11-05 Lecture
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

= Linear Independence

#definition_box[Definition][Linear Dependence][
  A list of vectors $arrow(w_i) in S$ is linearly dependent iff some $arrow(v) in S$ is a linear combination of the vectors $arrow(w_i) in S$.
]

#definition_box[Definition][Linear Dependence, Alternative Definition][
  Fix some Euclidean space $bb(R)^n$. Consider some finite list of vectors in tis $bb(R)^n$:

  $ arrow(v_1), dots.c, arrow(v_m) in bb(R)^n $

  This list of vectors is said to be linearly dependent if the zero vector can be expressed as a linear combination of the vectors on the list, with at least one of the coefficients being non-zero. 
]

#example_box[Example][Standard Basis Vectors][
  Show that the vectors $(1, 0, 0)$, $(0, 1, 0)$, and $(0, 0, 1)$ are linearly independent.

  Solution:

  Consider the following equation:

  $ c_1 (1, 0, 0) + c_2 (0, 1, 0) + c_3 (0, 0, 1) = arrow(0) $

  We want to show tha the only solution to this equation is the trivial solution.

  Notice that the equation above simplifies to:

  $ (c_1, c_2, c_3) = arrow(0) $

  So we immediately have $c_1 = c_2 = c_3 = 0$.

  Thus, any solution must satisfy the equation above, but this implies that the only solution to the original equation is the trivial solution.

  Therefore, the set of vectors is linearly independent.
]

