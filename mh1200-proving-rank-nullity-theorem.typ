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
      Proving the Rank-Nullity Theorem from Linear Independence
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

= Introduction

This document proves the Rank-Nullity Theorem, starting from everything covered up until Linear Independence.

= Basis

#definition_box[Definition][Basis][
  A basis $S$ of a subspace $T subset bb(R)^n$ is a *list* of linearly-independent vectors that spans the subspace $T$.
]

#theorem_box[Theorem][Minimality of a Basis][
  Suppose a subspace $T$ has a basis $S$ with $n$ vectors.

  Further suppose that we have a list of $m$ vectors $S'$ that spans $T$. Then, $m >= n$.
]

#proof_box[Proof][Minimality of a Basis][
  Suppose, for the sake of contradiction, that there exists a list of $m$ vectors $S'$ that spans $T$ and a basis $S$ of $T$ consisting of $n$ vectors such that $m < n$.

  Let $arrow(v_i) in S$. Then, for each such $arrow(v_i)$, there exist $arrow(w_j) in S'$ and $c_j in bb(R)$ such that:

  $ arrow(v_i) = sum_(j = 1)^m c_j arrow(w_j) $

  TODO proof route:
  - Show that the elementary row operations preserve the row space
  - Show that a basis is linearly independent iff no zero rows when vectors are encoded as row vectors in a matrix
  - Show that any non-minimal basis is necessarily linearly dependent
  - Derive a contradiction from the above fact, conclude the result

  TODO to show rank-nullity:
  - Define the concept of dimension
  - Show that the row spaces and column spaces always have matching dimensions
  - Define rank as the dimension of the row space or column space
  - prove stuff about rank and nullity w.r.t. the structure of a matrix
  - prove the rank-nullity theorem
]