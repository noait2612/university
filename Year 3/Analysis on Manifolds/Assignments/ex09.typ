#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 09 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
In each case given a manifold $M$ and vector field $F$ we will calculate the flux of $F$ through $M$ with respect to the unit normal pointing outward in two ways
+ Straight from definition is the surface integral
  $ integral_M chevron.l F, N chevron.r dif sigma $
+ Using the Divergence Theorem
  $ integral_M chevron.l F, N chevron.r dif sigma = integral_boundary(M) divergence(F) dif x $

#subquestion()
$
  M = {(x,y,z) in RR^3 bar x^2+y^2 = z, z <= 9} union {(x,y,z) in RR^3 bar x^2+y^2 <= 9, z = 9} \
  F(x,y,z) = (7x z, x z^2, x^2 y^2)
$

#solution[
  + Straight from definition – we need to split in two parts $M_1, M_2$ so that $M = M_1 union M_2$ given by
    $
      M_1 = {(x,y,z) in RR^3 bar x^2+y^2 = z, z<= 9} \
      M_2 = {(x,y,z) in RR^3 bar x^2+y^2 <= z, z=9}
    $
    For $M_1$, we take the parametrization $Phi_1 (r, theta) = (r cos(theta), r sin(theta), r^2)^T$ for $r in [0,3]$ and $theta in [0,2pi]$.\
    Let $ Phi_1 = vec(r cos(theta), r sin(theta), r^2) $
    We compute
    $
      frac(partial Phi_1, partial r) = vec(cos(theta), sin(theta), 2r), quad frac(partial Phi_1, partial theta) = vec(-r sin(theta), r cos(theta), 0)
    $
    We need to compute their cross product
    $
      frac(partial Phi_1, partial r) times frac(partial Phi_1, partial_theta) = mat(delim: "|", i, j, k; cos(theta), sin(theta), 2r; -r sin(theta), r cos(theta), 0)
    $
    Reminder, if $ a times b = mat(delim: "|", i, j, k; a_1, a_2, a_3; b_1, b_2, b_3) = (a_2 b_3 - a_3 b_2)i - (a_1 b_3 - a_3 b_1)j + (a_1 b_2 - a_2 b_1)k $
    So in our case
    $
      frac(partial Phi_1, partial r) times frac(partial Phi_1, partial_theta) = vec(-2r^2 cos(theta), -2r^2 sin(theta), r)
    $
    If we look at the $z$-component, since $0<=r<=3$ we have a positive component which means this vector points upward but from the bottom which means inward so we need to multiple by $minus 1$ (to turn down and away) hence
    $ N_1 dif sigma = vec(2r^2 cos(theta), 2r^2 sin(theta), -r) dif r dif theta $
    Now
    $ F(Phi_1 (r,theta)) = vec(7r^3 cos(theta), r^5 cos(theta), r^4 cos^2 (theta) sin^2(theta)) $
    Hence
    $
      chevron.l F(Phi_1 (r comma theta)), N_1 dif sigma chevron.r = 14r^5 cos^2 (theta) + 2r^7 cos(theta)sin(theta)-r^5 cos^2(theta)sin^2(theta)
    $
    Finally,
    $
      integral_0^(2pi) integral_0^3 14r^5 cos^2 (theta) + 2r^7 cos(theta)sin(theta)-r^5 cos^2(theta)sin^2(theta) dif theta dif r
    $
    Which looks scary but we know that $ integral_0^(2pi) 2r^7 cos(theta)sin(theta)dif theta = 0 $
    If we use the u-substitution and $ integral_0^(2pi) cos^2 (theta) dif theta = pi ==> integral_0^(2pi) 14r^5 cos^2 (theta) dif theta = 14pi r^5 $
    From the identity $cos(theta)sin(theta)=1/2 sin(2theta)$ and from $integral_0^(2pi) sin^2(2theta) dif theta = pi$ one can obtain that
    $ integral_0^(2pi) -r^5 cos^2 (theta) sin^2 (theta) dif theta = minus frac(pi, 4)r^5 $
    So we have over $M_1$
    $ integral_0^3 frac(55, 4) pi r^5 dif r = frac(13365, 8)pi $
    For $M_2$, we have the surface $z=9$ over the disk $x^2+y^2<=9$ and the outward normal pointing straight up is $N_2 = (0,0,1)^T$ and $dif sigma = dif x dif y$ and $chevron.l F, N_2 chevron.r = (7x z, x z^2, x^2 y^2) dot.op (0,0,1) = x^2 y^2$ and using polar coordinates we can compute
    $
      integral.double_M_2 x^2 y^2 dif x dif y = integral_0^(2pi) integral_0^3 (r cos(theta))^2 (r sin(theta))^2 r dif r dif theta = integral_0^(2pi) integral_0^3 r^5 dif r integral_0^(2pi) cos^2 (theta)sin^2(theta) dif theta
    $
    obviously, $ integral_0^3 r^5 dif r = [frac(r^6, 6)]_(r=0)^(r=3) = 121.5 $
    But the other integral is more complicated so we use the identities
    $
      sin^2(x) = frac(1-cos(2x), 2), quad cos^2(x) = frac(1+cos(2x), 2)
    $
    Will provide us the following
    $
      integral_0^(2pi) cos^2 (theta) sin^2 (theta) dif theta = integral_0^(2pi) frac((1-cos(2theta))(1+cos(2theta)), 4) dif theta = integral_0^(2pi) frac(1-cos^2 (2theta), 4) dif theta = frac(1, 4) (integral_0^(2pi) 1 dif theta - integral_0^(2pi) cos^2 (2theta) dif theta)
    $
    The first integral is obvious $pi$, for the other one we use the change of variable with $u=2 theta, theta = u/2$ and $dif theta = frac(1, 2) dif u$.  Without the integral limits we get that
    $
      integral cos^2 (2theta) dif theta = frac(1, 2) integral cos^2 (u) dif u = frac(1, 2) integral frac(cos(2u)+1, 2) dif u = frac(1, 4) (integral cos(2u) dif u + integral 1 dif u) = frac(1, 4) integral cos(2u) dif u + frac(u, 4)
    $
    With another change of variable with $v=2u, u = frac(v, 2)$ and $dif u = frac(1, 2) dif v$ we get that
    $ integral cos(2u) dif u = 1/2 integral cos(v) dif v = frac(sin(v), 2) = frac(sin(2u), 2) = frac(sin(4 theta), 2) $
    Finally if we subsitue everything back
    $
      integral_0^(2pi) cos^2(theta)sin^2(theta) = frac(1, 4) (integral_0^(2pi) 1 dif theta - integral_0^(2pi) cos^2 (theta) dif theta) = frac(1, 4) (2pi- [frac(sin(4theta), 8) + frac(theta, 2)]_(theta=0)^(theta=2pi)) = frac(pi, 2) - frac(pi, 4) = frac(pi, 4)
    $
    In total
    $ integral.double_M_2 x^2 y^2 dif x dif y = 121.5 dot.op frac(pi, 4) = frac(243, 8)pi $
    We sum everything up and get that
    $ "Total Flux" = frac(13365, 8)pi + frac(243, 8)pi = 1701 pi $
  + Using the Divergence Theorem – we start by computing the divergence
  $
    gradient dot.op F = frac(partial, partial x)(7x z) + frac(partial, partial y)(x z^2) + frac(partial, partial z)(x^2+y^2) = 7z + 0 + 0 = 7z
  $
  Our region is bounded below by $z=x^2+y^2$ and above by that constant plane $z=9$ so it is natural to choose cylindrical coordinates with $ x = r cos(theta), space y = r sin(theta), space z=z, space dif V = r dif z dif r dif theta $
  Where $theta in [0, 2pi]$, $0<=r<=3$ (since $x^2+y^2 = 9 ==> r^2=9$) and $r^2 <= z <= 9$ hence we can compute
  $
    integral_M chevron.l F, N chevron.r dif sigma &= integral_boundary(M) divergence(F) dif x \
    &= integral_0^(2pi) integral_0^3 integral_(r^2)^9 7z r dif z dif r dif theta \
    &= integral_0^(2pi) integral_0^3 [frac(7z^2 r, 2)]_(z=r^2)^(z=9) dif r dif theta \
    &= integral_0^(2pi) integral_0^3 frac(567, 2) r - frac(7, 2) r^5 dif r dif theta \
    &= integral_0^(2pi) [frac(567, 4)r^2 - frac(7, 12)r^6]_(r=0)^(r=3) dif theta \
    &= integral_0^(2pi) frac(1701, 2) dif theta \
    &= 1701 pi
  $
]

#pagebreak()

#subquestion()
$
  M = boundary(C) \
  C = {(x,y,z) in RR^3 bar y^2+z^2<9, 0<x<2} \
  F(x,y,z) = (x^2,-y,z)
$

#solution[
  + Straight from definition – First we understand the $C$ is a bounded slice of a cylinder over the $y z$ plane with radius $3$ with the constraint that $0<x<2$ so its boundary, $M=boundary(C)$, contains the following smooth surfaces
    + $M_1$, This is like the confetti rounds for a Soka with the normal from the $x$-axis is $hat(n)_1 = (0,frac(y, 3), frac(z, 3))$ and given by
      $ M_1 colon.eq {(x,y,z) in RR^3 bar y^2+z^2=9, 0<=x<=2} $
      The normal was calculated as the following: for $G(x,y,z) =y^2+z^2$ and $G=9$ so
      $
        gradient G = (0,2y,2z), space norm(gradient G) =sqrt(0^2 + (2y)^2 + (2z)^2) = 2 sqrt(y^2+z^2) =_(y^2+z^2=9) = 2 sqrt(9) = 6\
        ==> hat(n)_1 = frac(gradient G, norm(G)) = frac((0 comma 2y comma 3z), 6) = (0, frac(2y, 6), frac(2z, 6)) = (0, frac(y, 3), frac(z, 3))
      $
    + $M_2$, The right flat disk with outward normal $hat(n)_2 = (1,0,0)$ and given by
      $ M_2 colon.eq {(x,y,z) in RR^3 bar y^2+z^2<=9, x=0 } $
    + $M_3$, The left flat disk with outward normal $hat(n)_3 = (-1,0,0)$ and given by
      $ M_3 colon.eq {(x,y,z) in RR^3 bar y^2+z^2<=9, x=2 } $
    Now for each one of them we will compute
    $ integral_(M_i) chevron.l F, hat(n)_i chevron.r dif sigma $
    + For $M_1$ – We first understand that on $M_1$ we can slide forward and backward along the $x$-axis and it doesn't change our $y$ or $z$ position so we must integrate by $dif x$.\
      Furthermore, if we look at $y^2+z^2=9$ it is natural to choose the mapping $y=3cos(theta), z = 3sin(theta)$ (since we are in a circle of radious 3) and to trace the entire circle $theta in [0,2pi]$ so in our case we have
      $ psi(x, theta) = (x, 3cos(theta), 3sin(theta)) $
      $psi$ is well defined so by the change of variable theorem we have $dif sigma = 3dif x dif theta$
      We start by computing
      $ chevron.l F, hat(n)_1 chevron.r = (x^2,-y,z) dot.op (0, frac(y, 3), frac(z, 3)) = frac(-y^2+z^2, 3) $
      Hence
      $
        integral_(M_1) chevron.l F, hat(n)_1 chevron.r dif sigma = integral_0^(2pi) integral_0^2 frac(-9 cos^2(theta)+9sin^2(theta), 3) 3 dif x dif theta = 9 integral_0^2 dif x integral_0^(2pi) sin^2(theta)-cos^2(theta) dif theta = 9 integral_0^2 dif x integral_0^(2pi) -cos(2theta) dif theta \
        = 9[x]_(x=0)^(x=2) [- frac(sin(2theta), 2)]_(theta=0)^(theta=2pi) = 18 dot.op 0 = 0
      $
    + For $M_2$ – Substituting $x=2$ into $F$ gives us $F(2,y,z)=(4,-y,z)$ and $chevron.l F, hat(n)_2 chevron.r = 4$ hence
      $
        integral_(M_2) chevron.l F, hat(n)_2 chevron.r dif sigma = integral_(M_2) 4 dif sigma = 4 times Area(M_2) = 4 dot.op (pi dot.op 3^2) = 36pi
      $
    + For $M_3$ – Substituting $x=0$ into $F$ gives us $F(0,y,z)=(0,-y,z)$ and $chevron.l F, hat(n)_3 chevron.r =0$ hence
      $
        integral_(M_3) chevron.l F, hat(n)_3 chevron.r dif sigma = integral_(M_3) 0 dif sigma = 0
      $
    Hence the total flux through all three surfaces is $0 + 36pi + 0 = 36pi$
    #colbreak()
  + Using the Divergence Theorem – we start by computing the divergence
    $
      gradient dot.op F = frac(partial, partial x)(x^2) + frac(partial, partial y)(-y) + frac(partial, partial z)(z) = 2x+-1+1 = 2x
    $
    We notice that we don't need to use any other coordinates system since we need to cmpute
    $ integral_C 2x dif V = integral_0^2 ( integral integral_(y^2+z^2<=9) 2x dif y dif z ) dif x $
    But the inner integral is the just double integral with respect to $y$ and $z$ that represents the area of the disk $D$ with radious $3$ multiplied by the constant $2x$ so it just
    $
      integral_C 2x dif V = integral_0^2 2x dot Area(D) dif x = integral_0^2 2x (9 pi) dif x = 18 pi integral_0^2 x dif x = 18 pi [frac(x^2, 2)]_0^2 = 18 pi (frac(4, 2) - 0) = 36 pi
    $
]

#question()
Let $0<r<R$ and consider the set $T={(x,y,z) in RR^3 bar (sqrt(x^2+y^2)-R)^2+z^2=r^2}$.\
This is a $2$-dimensional manifold which called a torus.

#subquestion()
For every $z_0 in RR$ we will find the set $T inter {z = z_0}$ and draw a sketch of the torus.

#solution[
  We substitute $z=z_0$ into the definition so we will have
  $ (sqrt(x^2+y^2)-R)^2 + z_0^2 = r^2 <==> (sqrt(x^2+y^2)-R)^2 = r^2 - z_0^2 $
  We split into cases
  + $abs(z_0) > r$ hence $r^2-z_0^2 < 0$ and the intersection will be only the $emptyset$
  + $abs(z_0) = r$ so $r^2-z_0^2 = 0$ so the equation will become
    $ sqrt(x^2+y^2)-R = 0 <==> x^2+y^2 = R^2 $
    So we have a circle of radius $R$ centered at the $z$-axis on the plane $plus.minus r$ which means the intersection is the set ${(x,y,z_0) in RR^3 bar x^2+y^2=R^2}$
  + $0<=abs(z_0) < r$ hence $r^2-z_0^2 > 0$ so we can take a square root and achieve that
    $ sqrt(x^2+y^2)-R = plus.minus sqrt(r^2-z_0^2) <==> sqrt(x^2+y^2) = R plus.minus sqrt(r^2-z_0^2) $
    We know that $r<R$ so the term $sqrt(r^2-z_0^2) < R$ hence the right side is positive which gives as two circle equations
    $
      x^2+y^2 = (R+sqrt(r^2-z_0^2))^2 \
      x^2+y^2 = (R-sqrt(r^2-z_0^2))^2
    $
    Which gives circles centered on the $z$-axis with the above radiuses.

  I don't really know how to draw but I guess it is obvious from below.
  #import "@preview/cetz:0.5.1"
  #set text(size: 10pt)

  #grid(
    columns: (1fr, 1fr),
    gutter: 1.5em,
    align(center)[
      #v(0.5em)
      #cetz.canvas({
        import cetz.draw: *
        let lim = 4.5

        // Axes
        line((-lim, 0), (lim, 0), stroke: 0.5pt + gray)
        line((0, -lim), (0, lim), stroke: 0.5pt + gray)
        content((lim - 0.3, -0.3), [$x$])
        content((0.3, lim - 0.3), [$y$])

        // Single tangent circle of radius R (let R = 3)
        circle((0, 0), radius: 3, stroke: 1.5pt + blue)

        // Radius line
        line((0, 0), (3 * calc.cos(30deg), 3 * calc.sin(30deg)), stroke: 0.75pt + black)
        content((1.3 * calc.cos(38deg), 1.3 * calc.sin(38deg)), [$R$])
      })
      #v(0.5em)
    ],
    align(center)[
      #v(0.5em)
      #cetz.canvas({
        import cetz.draw: *
        let lim = 4.5

        // Axes
        line((-lim, 0), (lim, 0), stroke: 0.5pt + gray)
        line((0, -lim), (0, lim), stroke: 0.5pt + gray)
        content((lim - 0.3, -0.3), [$x$])
        content((0.3, lim - 0.3), [$y$])

        // Two concentric circles (let R = 3, r = 1, z_0 = 0 for maximum gap)
        // Inner radius: R - r = 2
        circle((0, 0), radius: 2, stroke: 1.5pt + blue)
        // Outer radius: R + r = 4
        circle((0, 0), radius: 4, stroke: 1.5pt + blue)

        // Inner Radius line
        line((0, 0), (2 * calc.cos(135deg), 2 * calc.sin(135deg)), stroke: 0.75pt + black)
        content((1.2 * calc.cos(150deg), 1.2 * calc.sin(150deg)), [$r_"inner"$])

        // Outer Radius line
        line((0, 0), (4 * calc.cos(-30deg), 4 * calc.sin(-30deg)), stroke: 0.75pt + black)
        content((2.5 * calc.cos(-20deg), 2.5 * calc.sin(-20deg)), [$r_"outer"$])
      })
      #v(0.5em)
    ],
  )
]

#pagebreak()

#subquestion()
We will calculate the flux of $F(x,y,z) = (1, z e^x, -y e^x)$ through $T inter {(x,y,z) in RR^3 bar z >0}$ with respect to the unit normal pointing upward.

#solution[
  From the previous subquestion we define $ V colon.eq {(x,y,z) in RR^3 bar (sqrt(x^2+y^2)-R)^2 + z^2 <=r^2, space z>=0} $
  We need to understand $boundary(V)$ but the bad drawing above helps us! The boundary contains the top "curst", $M$, where $z>=0$ and the outward unit norma $hat(n)_M$ and the flat bottom, $D$, is where $z=0$ and from the previous subquestion we know this region is bounded by the circles of radious $R plus.minus r$ and in this case the outward unit normal here will points downard which means $hat(n)_D = (0,0,-1)$.\
  Now, computing $divergence(F)$
  $
    gradient dot.op F = frac(partial, partial x) 1 + frac(partial, partial y) + z e^x + frac(partial, partial z) -y e^x = 0+0+0 = 0
  $
  By the Divergence Theorem we have
  $
    0 = integral.triple_V gradient dot.op F dif V = integral_M chevron.l F, hat(n)_M chevron.r dif sigma + integral_D chevron.l F, hat(n)_D chevron.r dif sigma ==> integral_M chevron.l F, hat(n)_M chevron.r dif sigma = integral_D chevron.l F, hat(n)_D chevron.r dif sigma
  $
  Since $hat(n)_D = (0,0,-1)$ the right side can be computed easily (we remember that $z=0$ on $D$)
  $ chevron.l F, hat(n)_D chevron.r = (1,0,-y e^x) dot.op (0,0,-1) = y e^x $
  So the integral on the right is just
  $ integral_D chevron.l F, hat(n)_D chevron.r dif sigma = integral.double_D y e^x dif x dif y $
  First, we need to remember that in this domain $(R-r)^2 <=x^2+y^2 <= (R+r)^2$ so the top half of the shape is a mirror image of the bottom half (over the $x$-axis) so if we fix a $x$, we can see that
  $ f(x,y)=y e^x ==> f(x,-y)=-y e^x = -f(x,y) $
  So the integrand is an odd function with respect to $y$ and integrating an odd function over symmetric domain the integral is exactly zero so if we apply Fubini's Theorem to swap the order of the integration we will get that
  $
    integral.double_D chevron.l F, hat(n)_D chevron.r dif sigma = integral.double_D y e^x dif x dif y integral.double_D y e^x dif y dif x = 0
  $
  Hence we also have
  $ integral_M chevron.l F, hat(n)_M chevron.r dif sigma = 0 $
  Therefor the wanted flux is zero.
]

#question()
#subquestion()
Let $f:B_r (p) subset.eq RR^3 arrow RR$ be a continuous function. We will show that
$ integral_(B_r (p)) f dif x = integral_0^r integral_boundary(B_t (p)) f dif sigma dif t $

#proof[
  It is suffice to show for $p=0$ since we can always use a translation to move our point to the origin which is a continuous map.\
  In $RR^3$ it is natural to use spherical coordinates mapping $Psi : V = (0,r) times (0,pi) times (0,2pi) arrow RR^3$ given by
  $ Psi(t, phi, theta) = vec(t sin(phi)cos(theta), t sin(phi) sin(theta), t cos(phi)) $
  We notice that $Psi(V)$ covers the entire $B_r (0)$ except for a set of measure zero (the origin and a boundary half-plane) so by the Change of Variables Theorem
  $
    integral_(B_r (0)) f(x) dif x = integral_V f(Psi(t, phi, theta)) abs(det D Psi(t, phi, theta)) dif t dif phi dif theta
  $
  Where $det D Psi(t, phi, theta) = t^2 sin phi$ and since $phi in (0,pi)$ we have $sin phi > 0$ which means we can drop the absolute values, so we have
  $
    integral_(B_r (0)) f(x) dif x = integral_0^r integral_0^pi integral_0^(2pi) f(Psi(t, phi, theta))t^2 sin phi dif theta dif phi dif t =_"Fubini" integral_0^r (integral_0^pi integral_0^(2pi) f(Psi(t, phi, theta))t^2 sin phi dif theta dif phi) dif t
  $
  On the other hand, we fix $t$ and look at $boundary(B_t (0))$, this is a $2$-dimensional manifold (the boundary of a manifold is a manifold without boundary) we take parametrization using the mapping $gamma : (0,pi) times (0,2pi) arrow RR^3$ defined by
  $ gamma(phi, theta) = Psi(t, phi, theta) = vec(t sin phi cos theta, t sin phi sin theta, t cos phi) $
  We know that
  $ dif sigma = norm(frac(partial gamma, partial phi) times frac(partial gamma, partial theta)) dif theta dif phi $
  When
  $
    frac(partial gamma, partial theta) = vec(t cos phi cos theta, t cos phi sin theta, -t sin phi), quad frac(partial gamma, partial theta) = vec(-t sin phi sin theta, t sin phi cos theta, 0)
  $
  Computing their cross product
  $
    frac(partial gamma, partial phi) times frac(partial gamma, partial theta) = t^2 sin phi vec(sin phi cos theta, sin phi sin theta, cos phi) ==> norm(frac(partial gamma, partial phi) times frac(partial gamma, partial theta)) = t^2 sin phi ==> partial sigma = t^2 sin phi dif theta dif phi
  $
  Hence
  $
    integral_0^pi integral_0^(2pi) f(Psi(t, phi, theta)) t^2 sin phi dif theta dif phi = integral_boundary(B_t (0)) f(x) dif sigma
  $
  But from the above
  $ integral_(B_r (0)) f(x) dif x = integral_0^r (integral_boundary(B_t (0)) f(x) dif sigma ) dif t $
  Which is exactly what we wanted to show.
]

#subquestion()
let Omega subset.eq $RR^n$ be an open domain and let $u:Omega arrow RR$ be harmonic. prove that for every $p in Omega$ and $r>0$ such that $B_r (p) subset.eq Omega$ we have
$ frac(1, abs(B_r (p))) integral_(B_r (p)) u(x) dif x = u(p) $

#proof[
  Using the change of variable to $n$-dimensional spherical coordinates we can write any point $x in B_r (p)$ as $x=p+t w$ where $t in [0,r)$ is the radial distance and $w in S^(n-1)$ is a point on the unit sphere which corresponds to $boundary(B_1 (0))$ with $dif x = t^(n-1) dif t dif sigma_1 (w)$ where $dif sigma_1$ is the surface area element on the unit sphere $S^(n-1)$ hence
  $ integral_(B_r (p)) f(x) dif x = integral_0^r integral_(boundary(B_1 (0))) f(p+t w)t^(n-1) dif sigma_1 (w) dif t $
  For a fix $t$, the surface measure $dif sigma_t$ on $boundary(B_t (p))$ is $t^(n-1) dif sigma_1$ hence
  $ integral_boundary(B_t (p)) f(y) dif sigma_t (y) = integral_boundary(B_1 (0)) f(p+ t w)t^(n-1) dif sigma_1 (w) $
  Which means that
  $ integral_(B_r (p)) f(x) dif x = integral_0^r integral_boundary(B_t (p)) f dif sigma dif t $
]

#subquestion()
Let $Omega subset.eq RR^n$ be an open domain and let $u:Omega arrow RR$ be harmonic. We will prove that for every $p in Omega$ and $r>0$ such that $B_r (p) subset.eq Omega$ we have
$ frac(1, abs(B_r (p))) integral_(B_r (p)) u(x) dif x = u(p) $

#proof[
  From Gauss’s mean value property we saw in the recitation we have for every $p in Omega$ and for every $t>0$ such that $closure(B_t (p)) subset.eq Omega$  we have
  $ u(p) = frac(1, abs(boundary(B_t (0)))) integral_boundary(B_t (p)) u dif sigma $
  So if we rewrite it we will get
  $ integral_boundary(B_t (p)) u dif sigma = u(p) abs(boundary(B_t (0))) $
  From the previous subquestion
  $
    integral_(B_r (p)) u(x) dif x = integral_0^r integral_boundary(B_t (p)) u dif sigma dif t = integral_0^r u(p) abs(boundary(B_t (0))) dif t = u(p) integral_0^r abs(boundary(B_t (0))) dif t
  $
  But the integral on the right is just the integration of the surface areas of sphere from $0$ to $r$ which is just the volume of the solid ball $abs(B_r (0))$ which means
  $ integral_(B_r (p)) u(x) dif x = u(p) abs(B_r (p)) ==> u(p) = frac(1, abs(B_r (p))) integral_(B_r (p)) u(x) dif x $
]

#question()
Let $Omega subset.eq RR^n$ be a bounded domain, let $U subset.eq RR^n$ be an open neighborhood of $closure(Omega)$ and let $v:U arrow RR$ be a function such that $Delta v >=0$ (a subharmonic function). We will prove that
$ max_(x in closure(Omega)) v(x) = max_(x in boundary(Omega)) v(x) $

#proof[
  We start with proving the hint same as in the recitation, we define
  $
    f(r) = frac(1, boundary(B_r (0))) integral_boundary(B_r (p)) v dif sigma =_"Change of Variable" frac(1, boundary(B_1 (0))) integral_boundary(B_1 (0)) v(p+ r y) dif sigma(y)
  $
  Differentiating under the integral sign gives us
  $ frac(dif, dif r) f(r) = frac(1, abs(boundary(B_r (0)))) integral_(B_r (p)) chevron.r gradient u, hat(n) chevron.r $
  From the Divergence Theorem
  $
    frac(dif, dif r) f(r) = frac(1, abs(boundary(B_r (0)))) integral_(B_r (p)) divergence(gradient v) dif x = frac(1, abs(boundary(B_r (0)))) integral_(B_r (p)) Delta v dif x
  $
  Since $u$ is subharmonic then $Delta u >=0$ which means that $frac(dif, dif r) f(r) >= 0$ which means it is a non-decreasing function of $r$ and it is continuous so as $r arrow 0$ we have $lim_(r arrow 0^plus) f(r) = v(p)$ and since $f$ is non-decreasing, $f(r) >= v(p)$ for all $r>0$ which implies
  $
    frac(1, abs(boundary(B_r (0)))) integral_boundary(B_r (p)) v dif sigma >= v(p) ==> integral_boundary(B_r (p)) v dif sigma >= v(p) abs(boundary(B_r (0)))
  $
  If we integrate over $t in [0,r]$ using the result from question 3b
  $
    integral_(B_r (p)) v(x) dif x = integral_0^r integral_boundary(B_t (p)) v dif sigma dif t >= integral_0^r v(p) abs(boundary(B_t (0))) dif t = v(p) abs(B_r (p)) ==> v(p) <= frac(1, abs(B_r (p))) integral_(B_r (p)) v(x) dif x
  $
  Now, $closure(Omega)$ is a compoact (since $Omega$ is bounded) and $v$ is continuous so $v$ achieve maximum value $M$ on $closure(Omega)$.\
  Suppose $M$ is achieved at some interior point $p in Omega$ so that $v(p) = M$, we look at a ball $B_r (p) subset.eq Omega$ and from the inequality above
  $ M = v(p) <= frac(1, abs(B_r (p))) integral_(B_r (p)) v(x) dif x $
  $M$ is the maximum so in $closure(Omega)$ we know $v(x) <= M$ for all $x in B_r (p)$.\
  Since the average of a function that is strictly less than $M$ on some positive measure set would be strictly less than $M$ hence the only way the average over the ball can be at least $M$ is if $v(x)=M$ everywhere in $B_r (p)$, which implies that the set
  $ A colon.eq {x in Omega bar v(x)=M} $
  is open but since $v$ is continuous then $A$ is also close in $Omega$ but in a connected domain the only subsets that are both open and close are the entire set, $Omega$ or $emptyset$ and $p in A$ hence $A = Omega$ and from continuity, $v(x)=M$ on $boundary(M)$ as well.
]
