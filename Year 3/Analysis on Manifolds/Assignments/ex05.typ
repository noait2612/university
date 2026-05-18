#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 05 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
Consider the $n$ sphere with radius $1$ in $RR^(n+1)$:
$ S^n colon.eq {x in RR^(n+1) bar norm(x)=1} $
Denote $N = "e"_(n+1)$ where $("e"_1, dots.h, "e"_(n+1))$ is the standard basis for $RR^(n+1)$.
Define $pi: S^n without {N} arrow RR^n$ in the following way: \
for every $p in S^n without {N}$ we draw the straight line from $N$ to $p$ and we define $pi(p)$ to be the intersection of that line with the space $ {x in RR^(n+1) bar x_(n+1) = 0} $

#subquestion()
We will give an explicit formula for $pi$ and we will show that it is continuous (we call $pi$ the Stereographic Coordinates for $S^n$).

#proof[
  By definition, the north pole is $N = (0, 0, dots.h, 0, 1)$.\
  The straight line $L$ passing through $N$ and $p$ can be parametrized by a scalar $t in RR$:
  $ L(t) = N + t(p - N) = (0, dots.h, 0, 1) + t(x_1, dots.h, x_n, x_(n+1) - 1) $
  Hence
  $ L(t) = (t x_1, t x_2, dots.h, t x_n, 1 + t(x_(n+1) - 1)) $
  From the definition, $pi(p)$ is the intersection with the last coorindate of $L(t)$ to zero so we have
  $ 1 + t(x_(n+1) - 1) = 0 ==> t(1 - x_(n+1)) = 1 ==> t = 1/(1 - x_(n+1)) $
  We first notice that the above is well defined since $x_(n+1) != 1$ from the definition of $S^n$.\
  Substituting back into the first $n$ coordinates will give us $pi:S^n without {N} arrow RR^n$ by
  $ pi(p) = ( x_1/(1 - x_(n+1)), x_2/(1 - x_(n+1)), dots.h, x_n/(1 - x_(n+1)) ) $
  We notice that each component is a rational function that never vanish and is continuous as a quotient of continuous functions.\
  In $RR^n$ a map is continuous if and only if each of its coordinate is continuous hence $pi$ continuous.
]

#subquestion()
We will prove that $pi$ is bijective and find an explicit formula for $pi^(-1) : RR^n arrow S^n without N$.

#proof[
  If we construct its inverse map we are done.\
  Let $y = (y_1, dots.h, y_n) in RR^n$, we seek a unique point $p = (x_1, dots.h, x_(n+1)) in S^n without {N}$ such that $pi(p) = y$ which means for $i = 1, dots.h, n$
  $ y_i = x_i / (1 - x_(n+1)) <==> x_i = y_i (1-x_(n+1)) $
  Since $p in S^n$, its coordinates must satisfy the equation of the sphere:
  $ sum_(i=1)^n x_i^2 + x_(n+1)^2 = 1 $
  So in our case
  $
    sum_(i=1)^n (y_i (1 - x_(n+1)))^2 + x_(n+1)^2 = 1 <==> (1 - x_(n+1))^2 sum_(i=1)^n y_i^2 + x_(n+1)^2 = 1 <==>_(sum_(i=1)^n y_i^2 = norm(y)^2) norm(y)^2 (1 - x_(n+1))^2 + x_(n+1)^2 = 1
  $
  So
  $
    norm(y)^2 (1 - 2 x_(n+1) + x_(n+1)^2) + x_(n+1)^2 - 1 = 0 <==> (norm(y)^2 + 1)x_(n+1)^2 - 2 norm(y)^2 x_(n+1) + (norm(y)^2 - 1) = 0
  $
  We know that $x_(n+1)=1$ is a root of this equation but our domain is $S^n without {N}$ hence $x_(n+1)!=1$.\
  We use Vieta's formulas from Algebraic Structures 2 and gets that the other valid root must be
  $ x_(n+1) = (norm(y)^2 - 1) / (norm(y)^2 + 1) $
  Hence
  $
    1 - x_(n+1) = 1 - (norm(y)^2 - 1) / (norm(y)^2 + 1) = (norm(y)^2 + 1 - norm(y)^2 + 1) / (norm(y)^2 + 1) = 2 / (norm(y)^2 + 1)
  $

  Substituting this back into our expression for $x_i$:
  $ x_i = y_i (1 - x_(n+1)) = (2 y_i) / (norm(y)^2 + 1) $

  Thus, we have found a unique, explicitly defined point $p$ for every $y in RR^n$. This gives us our inverse function $pi^(-1): RR^n arrow S^n without {N}$ by
  $ pi^(-1)(y) = ( (2 y_1) / (norm(y)^2 + 1), dots.h, (2 y_n) / (norm(y)^2 + 1), (norm(y)^2 - 1) / (norm(y)^2 + 1) ) $
]

#subquestion()
We will prove using the Stereographic Coordinates that we can cover the sphere using two local parametrizations $pi_i : RR^n arrow S^n$
for $i in {1.2}$.

#proof[
  We have already established the inverse stereographic projection from the North pole $N = (0, dots.h, 0, 1)$, which gives us our first local parametrization:
  $ pi_1 = pi^(-1) : RR^n arrow S^n without {N}. $

  This parametrization covers the entire sphere except for the North pole $N$.\
  To cover $N$, we define a second stereographic projection, this time from the South pole $S = (0, dots.h, 0, -1)$.\
  By symmetry (or by repeating the exact derivation with $S$ instead of $N$), the inverse of the stereographic projection from the South pole provides a second local parametrization:
  $ pi_2 : RR^n arrow S^n without {S}. $
  The image of $pi_1$ is $S^n without {N}$, and the image of $pi_2$ is $S^n without {S}$.\
  Since $N eq.not S$, the union of their images is:
  $ (S^n without {N}) union (S^n without {S}) = S^n $

  Thus, $S^n$ is entirely covered by the two local parametrizations $pi_1$ and $pi_2$.
]

#subquestion()
We will prove that the sphere could not be covered with one local parametrization $r : U arrow S^n$ where $U subset.eq RR^n$ is open.

#proof[
  By contradiction, assume that there exists a single local parametrization $r : U arrow S^n$ that covers the entire sphere, where $U subset.eq RR^n$ is an open set.\
  By the definition of a local parametrization, $r$ must be a homeomorphism from $U$ onto its image, which by our assumption is $S^n$ so this implies that $U$ and $S^n$ are homeomorphic.\
  From its definition, $S^n$ is a closed and bounded subset hence by Heine-Borel theorem its compact.\
  Since $r^(-1) : S^n arrow U$ is a homeomorphism and $S^n$ is compact, its image $U$ must also be a compact subset of $RR^n$.\
  Since any compact subset of $RR^n$ is closed and bounded we get that $U$ is both open and close in $RR^n$.\
  We saw that $RR^n$ is a connected topological space and the only subsets that are both open and closed is connected topological space are the $emptyset$ and $RR^n$ itself and since $S^n$ is not empty, $U$ cannot be empty, so we must have $U = RR^n$.\
  But $RR^n$ is unbounded which means that it is not compoact and that  is a contradiction.
]

#question()

#question()

#question()

#subquestion()
We will prove that $C = {(x,y,a sqrt(x^2+y^2)) in RR^3 bar x,y in RR, space a>0}$ is not a manifold of dimension $2$ in $RR^3$.

#proof[
  If it were a smooth manifold, it would have to be locally representable as a smooth graph over at least one of the three coordinate planes ($x y$, $x z$, or $y z$) so we look at the origin $p=(0,0,0)$.\
  Assume for contradiction that $C$ is a smooth manifold of dimension $2$. \
  By the equivalent graph definition of a manifold, there must exist an open neighborhood of $p$ in $C$ that can be represented as the graph of a smooth function over an open set in one of the coordinate planes ($x y$, $x z$, or $y z$).
  + If it is a graph over the $x y$ plane \
    By the definition of the set, $C$ is globally the graph of the function $f(x,y) = a sqrt(x^2+y^2)$ so $f$ must be smooth (and thus differentiable) at $(0,0)$, but
    $
      (partial f)/(partial x) (0,0) = lim_(t arrow 0) (f(t,0) - f(0,0))/t = lim_(t arrow 0) (a sqrt(t^2))/t = lim_(t arrow 0) (a abs(t))/t
    $
    Since the limit evaluates to $a$ from the right and $-a$ from the left, the partial derivative does not exist. So $f$ is not smooth at the origin.
  + If it is a graph over the $x z$ plane or $y z$ plane: We show for the plane $x z$ and for the plane $y z$ it is from the same reasoning.\
    Suppose $C$ can be represented as $y = g(x,z)$ for some smooth function $g : U arrow RR$, where $U subset.eq RR^2$ is an open neighborhood of $(0,0)$ in the $x z$-plane.\
    By definition, every point in $C$ has a $z$-coordinate $z = a sqrt(x^2+y^2) >= 0$. \
    This means the projection of $C$ onto the $x z$-plane is restricted to the upper half-plane $z >= 0$.\
    Since $U$ must be an open set containing $(0,0)$, it must contain points with $z < 0$. However, there are no points in $C$ that map to negative $z$ values, meaning $C$ cannot be written as a graph over an open set $U$ around $(0,0)$.

  Since $C$ cannot be locally represented as a smooth graph over any the coordinate planes at the origin it is a contradiction to the assumption and $C$ is not a manifold of dimension $2$ in $RR^3$.
]
