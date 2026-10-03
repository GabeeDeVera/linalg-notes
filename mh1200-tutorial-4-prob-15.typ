#import "notes.typ": notes
#import "lib.typ": problem, aligned_block, numbered_eq

#show: notes.with(
    title: [
        Tutorial 4, Problem 15
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