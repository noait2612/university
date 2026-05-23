#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#import "@preview/cetz:0.5.0": canvas, draw
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
  We saw that $RR^n$ is a connected topological space and the only subsets that are both open and closed in a connected topological space are the $emptyset$ and $RR^n$ itself and since $S^n$ is not empty, $U$ cannot be empty, so we must have $U = RR^n$.\
  But $RR^n$ is unbounded which means that it is not compoact and that  is a contradiction.
]

#question()
Let $M subset.eq RR^n$ and we assume that for every $p in M$ there exists an open set $p in W subset.eq RR^n$ and a $C^r$ function $F:W arrow RR^(n-k)$ such that $D F_p$ is of full rank and $M inter W = {x in W bar F(x)=0}$.\
We will show that for every point $p in M$ there exists an open set $p in V subset.eq RR^n$ such that $V inter M$ is a $k$-dimensional graph of a function $f in C^r (U, RR^(n-k))$ where $U subset.eq RR^k$ is open.

#proof[
  Since $D F_p$ is an $(n-k) times n$ matrix with full rank $n-k$ it must contain an invertible $(n-k) times (n-k)$ submatrix.\
  By permuting the standard coordinates of $RR^n$ if necessary, we can split the coordinate system into $RR^k times RR^(n-k)$ and write any point as $(x, y)$, such that the point $p = (x_0, y_0)$ and the square submatrix of partial derivatives with respect to $y$, denoted $frac(partial F, partial y)(x_0, y_0)$ is invertible.\
  According to the Implicit Function Theorem, there exists an open neighborhood $U subset.eq RR^k$ of $x_0$, an open neighborhood $y_0 in V^prime subset.eq RR^(n-k)$ and a unique $C^r$ function $f: U arrow V^prime$ such that for any $(x, y) in U times V^prime$ we have $F(x, y) = 0 <==> y = f(x)$.\
  We take $V = (U times V^prime) inter W$ and it is an open set in $RR^n$ as intersection of open sets, $p in V$ and the intersection of $M$ with this new open set $V$ is exactly the set of points where $F(x,y) = 0$ restricted to $U times V^prime$.\
  Therefore $V inter M = {(x, f(x)) bar x in U}$ and this is the definition of a $k$-dimensional graph of the $C^r$ function $f$ over $U$.
]

#question()
Denote $U = (0, 1) times (−1, 1) subset.eq R^2$ and define the map $r : U arrow RR^2$ by $r (u, v) = (u + v, v^3)$.

#subquestion()
We will draw the sets ${r(u_0, v) bar u_0 = 1/4, 1/2, 3/4}$ and ${r(u,v_0) bar v_0 = -1/2, 0, 1/2}$.

#solution[
  In blue is the set ${r(u_0, v) bar u_0 = 1/4, 1/2, 3/4}$ and in red is the set $r(u,v_0) bar v_0 = -1/2, 0, 1/2}$.
  #align(center)[
    #canvas({
      import draw: *

      scale(2.5)
      line((-1.5, 0), (2.2, 0), mark: (end: ">"), stroke: gray + 0.5pt)
      line((0, -1.2), (0, 1.2), mark: (end: ">"), stroke: gray + 0.5pt)
      content((2.3, 0), text(fill: gray)[$x$])
      content((0, 1.3), text(fill: gray)[$y$])

      // Draw Axis Ticks
      line((1, -0.05), (1, 0.05), stroke: gray)
      content((1, -0.15), text(size: 0.7em, fill: gray)[$1$])
      line((-1, -0.05), (-1, 0.05), stroke: gray)
      content((-1, -0.15), text(size: 0.7em, fill: gray)[$-1$])
      line((-0.05, 1), (0.05, 1), stroke: gray)
      content((-0.15, 1), text(size: 0.7em, fill: gray)[$1$])
      line((-0.05, -1), (0.05, -1), stroke: gray)
      content((-0.15, -1), text(size: 0.7em, fill: gray)[$-1$])

      // ==========================================
      // Set 1: { r(u0, v) } -> y = (x - u0)^3
      // Blue cubic curves shifted horizontally
      // ==========================================
      let u_vals = (0.25, 0.5, 0.75)
      for u0 in u_vals {
        let pts = ()
        let samples = 60
        for i in range(0, samples + 1) {
          // v ranges from -1 to 1
          let v = -1 + (i / samples) * 2
          let x_val = u0 + v
          let y_val = v * v * v
          pts.push((x_val, y_val))
        }
        line(..pts, stroke: blue + 1.2pt)
      }

      // Labels for Set 1
      content((1, 1.1), text(fill: blue, size: 0.7em)[$u_0=1/4$])
      content((1.5, 1.1), text(fill: blue, size: 0.7em)[$u_0=1/2$])
      content((2, 1.1), text(fill: blue, size: 0.7em)[$u_0=3/4$])

      let v_vals = (-0.5, 0.0, 0.5)
      for v0 in v_vals {
        let y_val = v0 * v0 * v0
        line((v0, y_val), (1 + v0, y_val), stroke: red + 1.5pt)
        circle((v0, y_val), radius: 0.03, fill: red)
        circle((1 + v0, y_val), radius: 0.03, fill: red)
      }

      // Labels for Set 2
      content((1.55, 0.125 + 0.08), text(fill: red, size: 0.7em)[$v_0=1/2$], anchor: "west")
      content((1.05, 0.06), text(fill: red, size: 0.7em)[$v_0=0$], anchor: "west")
      content((0.55, -0.125 - 0.08), text(fill: red, size: 0.7em)[$v_0=-1/2$], anchor: "west")
    })
  ]
]

#subquestion()
Let $I, J subset.eq R$ be open intervals and let $f : I arrow RR^n$ and $g : J arrow RR^n$ be $C^1$.\
Let $t_0 ∈ I$ and $s_0 ∈ J$ such that $f (t_0) = g (s_0)$ and denote $f (t_0) = p$.\
We say that the image of $f$ is parallel to the image of $g$ at $p$ if $f ′ (t_0) , g′ (s_0) ∈ RR^n$ are linearly dependent.\
For every $(u_0, v_0) ∈ U$ define $f_(v_0) : (0, 1) arrow RR^2$ and $g_(u_0) : (−1, 1) arrow RR^2$ by $f_(v_0) (u) = r (u, v_0)$
and $g_(u_0) (v) = r (u_0, v)$.\
We will find all the points $p = (x_0, y_0) ∈ U$ such that the image of $f_(y_0)$ is parallel to the image of $g_(x_0)$ at $p$.

#solution[
  We need to find points $p = (u_0, v_0) in U$ where the tangent vectors of $f_(v_0) (u)$ and $g_(u_0)(v)$ are linearly dependent.\
  So we compute the tangent vectors:
  $
    f_(v_0)(u) = (u+v_0, v_0^3) arrow.long.double f_(v_0)'(u) = (1, 0) \
    g_(u_0)(v) = (u_0+v, v^3) arrow.long.double g_(u_0)'(v) = (1, 3v^2)
  $
  For these to be parallel, one must be a scalar multiple of the other and since both have a first coordinate of $1$, the scalar multiple must be exactly $1$ and this implies their second coordinates must be equal: $3v_0^2 = 0 v_0 = 0$.\
  Since $u_0$ can be anything in the domain $(0,1)$, the wanted points in $U$ are all the points of the form $(u, 0)$ for $u in (0, 1)$.
]

#subquestion()
We will find all the points $p in U$ such that $D r_p$ is not injective.

#solution[
  We start by computing $D r_p$
  $
    D r_((u,v)) = mat(
      display((partial x)/(partial u)), display((partial x)/(partial v));
      display((partial y)/(partial u)), display((partial y)/(partial v))
    ) = mat(display(1), display(1); display(0), display(3v^2))
  $
  Hence the determinant is
  $ det(D r) = 3v^2 $
  We want all the values so $det(D r) = 0$ hence in $v=0$ thus the points where $D r_p$ is not injective are $(u,0)$ for $u in (0,1)$.
]

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

#subquestion()
We will prove that $H = {(x,y,0) in RR^3 bar x in RR, space y>=0}$ is not a manifold of dimension $2$ in $RR^3$.

#proof[
  If $H$ were a $2$-dimensional manifold, it must locally be the graph of a smooth function defined over an open set in $RR^2$ near every point $p in H$ and also in the boundary point $p=(0,0,0)$.\
  For $H$ to locally be a graph near $(0,0,0)$, it must be projectable onto one of the three coordinate planes such that the projection is an open set in $RR^2$ so we work as before
  + Projection onto the $x y$ plane \
    So the image is ${(x, y) : y >= 0}$ and this is a closed half plane, meaning any neighborhood containing $(0,0)$ includes boundary points and it is not an open set in $RR^2$.
  + Projection onto the $x z$ plane or the $y z$ plane \
    We do for the $x z$ plane and for the $y z$ is the same reasoning only that also $y>=0$
    The image is restricted entirely to the line $z = 0$ and a $1$-dimensional line cannot contain an open ball in $RR^2$

  Because there is no coordinate projection where $H$ can locally be described as a graph over an open set in $RR^2$ near $(0,0,0)$, $H$ fails the graphical definition of a manifold.
]

#question()
Denote $Gamma$ the graph of the function $f: (0, 1/pi) arrow RR$ defined by $f(x)=sin(1/x)$ and we consider the curve $alpha:(-3, 0) arrow RR^2$ defined by
$
  alpha(t) = mycases((0 comma -t-2), t in (-3 comma -1), g(t), t in [-1 comma -1/pi], (-t comma sin(-1/t)), t in (-1/pi comma 0)))
$
Where $g:[-1, -1/pi] arrow RR^2$ is a smooth curve such that $g(-1) = (0, -1), g(-1/pi) = (1/pi, 0)$.\
We also assume that $im g inter Gamma = emptyset$ and that $alpha$ is smooth.\
We will disprove that $im alpha$ is not a $1$-dimensional manifold.

#proof[
  We use the given graph in the exercise page.\
  To be a $1$-dimensional manifold, every point in the set must have an open neighborhood (in the subspace topology) that is homeomorphic to an open interval in $RR$ and in particular in the point $p=(0,0)$ and $p in im alpha$ for $alpha(-2) = (0,0)$.\
  Let $W$ be any arbitrarily small open ball of radius $r$ centered at $(0,0)$ in $RR^2$ and we look at the intersection $W inter im alpha$: \
  The first segment of $alpha$ (for $t in (-3, -1)$) traces the vertical line segment from $(0,1)$ to $(0,-1)$ and this means $W inter im alpha$ contains the open vertical segment ${(0, y) : -r < y < r}$.\
  The third segment of $alpha$ (for $t in (-1/pi, 0)$) traces the curve $(u, sin(1/u))$ as $u arrow 0^+$ and as the $x$-coordinate approaches $0$, the $y$-coordinate oscillates infinitely many times between $-1$ and $1$.\
  Because of this infinite oscillation, the open ball $W$ will not only capture the vertical line segment but also infinitely many disjoint, separate "strands" of the sine wave entering and exiting the ball.\
  Therefore, no matter how small you make the neighborhood $W$ around $(0,0)$, the space $W inter im alpha$ consists of a central line segment alongside an infinite number of disjoint curve segments.\
  A space with infinitely many disjoint connected components is not homeomorphic to a single connected open interval $RR$.\
  Since it fails to be locally Euclidean at the origin, it is not a $1$-dimensional manifold
]
