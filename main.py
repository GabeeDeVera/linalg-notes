from math import sqrt

a, b, n = map(float, input().split(" "))

zeta2 = (-1.0 + (1.0j) * sqrt(3.0)) * 0.5
zeta3 = (-1.0 - (1.0j) * sqrt(3.0)) * 0.5

print((a + b) ** n + ((zeta2) ** (2.0 * n)) * (a * zeta2 + b) ** n + ((zeta3) ** (2.0 * n)) * (a * zeta3 + b) ** n)
print((a + b) ** n + (a + zeta2 * b) ** n + (a + zeta3 * b) ** n)