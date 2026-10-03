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
      2025-10-29 Lecture
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

= Subspaces Induced by Homogenous Systems

#theorem_box[Theorem][Solutions of Homogenous Systems][
  The solution set of a homogenous system forms a subspace.
]

#proof_box[Proof][Solutions of Homogenous Systems][
  All homogenous systems can be written in the form:

  $ C arrow(x) = arrow(0) $

  Where $C$ is a matrix containing the coefficients of the equations in the system.

  Clearly, $ arrow(x) = arrow(0)$ is a solution since any matrix times the zero vector results in the zero vector.

  Further, if $arrow(x)$ and $arrow(y)$ are solutions, then we have:

  $ arrow(0) = arrow(0) + arrow(0) = C arrow(x) + C arrow(y) = C (arrow(x) + arrow(y)) $

  So indeed, $arrow(x) + arrow(y)$ is also a solution.

  Finally, suppose $arrow(x)$ is a solution. For any $k in bb(R)$, we have:

  $ arrow(0) = C arrow(x) = k C arrow(x) = C (k arrow(x)) $

  Thus, the solution set of the homogenous system satisfies all axioms of a subspace and is thus a subspace, as needed. $qed$
]

= Linear Combination

#definition_box[Definition][Linear Combination][
  $arrow(w)$ is a linear combination of vectors $arrow(v_i)$ iff there exist scalars $c_i$ such that:

  $ arrow(w) = sum_(i = 1)^n c_i arrow(v_i) $
]

#theorem_box[Theorem][Special Vectors in a Linear Combination][
  The vectors in a linear combination are themselves linear combinations of the whole set.

  Additionally, the zero vector is a linear combination of the vectors in the set.
]

Now, how do we decide if this is satisfiable?

$ arrow(w) = sum_(i = 1)^n c_i arrow(v_i) $

We can construct the following augmented matrix:

$ mat(dots.v, dots.v, dots.v, , dots.v, dots.v; arrow.t, arrow.t, arrow.t, , arrow.t, arrow.t; arrow(v_1), arrow(v_2), arrow(v_3), dots.c, arrow(v_n), arrow(w); arrow.b, arrow.b, arrow.b, , arrow.b, arrow.b; dots.v, dots.v, dots.v, , dots.v, dots.v; augment: #5) $

If this augmented matrix is consistent, then $arrow(w)$ is a linear combination of the vectors $arrow(v_i)$.

Furthermore, if the augmented matrix has no free parameters, then the set of vectors are pairwise linearly independent and thus form a basis.

#definition_box[Definition][Span][
  Suppose $B subset bb(R)^n$ is a subset of vectors with $abs(B) = m$. Then, the span of $B$ is defined as:

  $ "span"(B) := {sum_(i = 1)^m c_i arrow(b_i) in bb(R)^n | c_i in bb(R), b_i in B} $
]

#theorem_box[Theorem][Subspaces Induced by Span][
  Consider a set of vectors in $bb(R)^n$, then the set of all possible linear combinations of this set forms a subspace.

  That is, $"span"(B)$ is a subspace of $bb(R)^n$.
]