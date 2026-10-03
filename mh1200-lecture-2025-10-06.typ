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
      2025-10-06 Lecture
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

= Review of Determinants

/ Minor Matrix: Matrix that results from removing a row/column
/ Minor: Determinant of a Minor Matrix
/ Cofactor: A Minor times the sign $(-1)^(i + j)$

= Six Elementary Properties of Determinants
+ If a matrix $A$ has a row of zeroes or a column of zeroes, then $det(A) = 0$.
+ $det(A^T) = det(A)$.
+ Determinants are linear functions with respect to individual rows, and also individual columns.
+ If a matrix $A$ has a repeated row or a repeated column, then $det(A) = 0$.
+ If we obtain a matrix $A'$ from a matrix $A$ by swapping two rows, or swapping two columns, then $det(A') = -det(A)$.
+ The determinant of an upper-triangular matrix is just the product of the diagonal entries.