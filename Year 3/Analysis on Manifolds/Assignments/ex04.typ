#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 04 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
#subquestion()
For $a,b >0$ Let $cal(E)_(a,b) colon.eq { (x,y) in RR^2 bar (x/a)^2 + (y/b)^2 <= 1}$ be the ellipse with parameters $a,b$.\
We will use Green's theorem to show $Area(cal(E)_(a,b)) = pi a b$.

#solution[
  First we notice that $boundary(cal(E)_(a,b)) = {(x,y) in RR^2 bar (x/a)^2 + (y/b)^2 = 1 }$ and ellipse is a smooth domain.\
  We need a positive orienated parameterization which is given by $gamma(t)=(a cos(t), b sin(t))$ for $t in [0,2pi]$.\
  We denote $x(t) = a cos(t), space y(t) = b sin(t)$ hence
  $
    dif x = x^prime (t) dif t = -a sin(t) dif t \
    dif y = y^prime (t) dif t = b cos(t) dif t
  $
  In the recitation we saw the corollary
  $
    Area(cal(E)_(a,b))=integral_boundary(cal(E)_(a,b)) x dif y = - integral_boundary(cal(E)_(a,b)) y dif x = 1/2 integral_boundary(cal(E)_(a,b)) x dif y - y dif x
  $
  So in our case
  $
    Area(cal(E)_(a,b)) = integral_boundary(cal(E)_(a,b)) x dif y = integral_0^(2pi) a cos(t)dot.op b cos(t) dif t = a b integral_0^(2pi) cos^2 (t) dif t = a b pi
  $
  Where the last equals is from the known identity $integral_0^(2pi) cos^2(t) dif t = pi$.
]

#subquestion()
Let $Omega = {(x,y) in RR^2 bar x^(2/3) + y^(2/3)<=1}$ and we will compute the perimeter of $Omega$.

#solution[
  This is another ellipse so the parameterization is $gamma(t)=(cos^3 (t), sin^3 (t))$ for $t in [0,2pi]$ which is smooth and we can see that
  $ (cos^3 (t))^(2/3) + (sin^3 (t))^(2/3) = cos^2 (t) + sin^2 (t) = 1 $
  We differentiate
  $
    x^prime (t) = -3cos^2 (t) sin (t) \
    y^prime (t) = 3sin^2 (t) cos(t)
  $
  Hence
  $
    norm(dot(gamma)(t)) = sqrt(x^prime (t)^2 + y^prime (t)^2) = sqrt(9cos^4 (t) sin^2 (t)+9sin^4 (t) cos^2 (t)) = 3 sqrt(cos^2 (t) sin^2 (t)(cos^2 (t) + sin^2 (t))) = 3 abs(sin(t) cos(t))
  $
  The perimeter is given by
  $
    L = integral_0^(2pi) norm(dot(gamma)(t)) dif t = 3 integral_0^(2pi) abs(sin(t)cos(t)) dif t = 12 integral_0^(pi/2) sin(t)cos(t) dif t = 12 dot.op [1/2 sin^2 (t)]_(t=0)^(t=pi/2) = 12 dot.op 1/2 = 6
  $
]

#subquestion()
Let $P subset.eq RR^2$ be a polygon whose vertices in a counterclockwise order are ${p_1, dots.h, p_n} subset.eq RR^2$.\
For every $1<=i<=n$ denote $p_i = (x_i, y_i)$ and we will prove that $Area(P)=1/2 sum_(i=1)^n (x_i y_(i+1)-x_(i+1)y)$ where $x_(n+1) = x_1,space y_(n+1) = y_1$.

#solution[
  First we notice that $P$ a polygon is a simply connected domain and from the previous exercise in a simply connected domain, the property that all curves with the same endpoints are homotopic ensures that locally conservative fields become conservative.\
  We need to define a vector field $F:RR^2 arrow RR^2$ and by the identities we saw in the recitation we choose
  $ F(x,y) = 1/2 vec(-y, x) $
  Since we need to treat $x,y$ as equals this is the most fitting function from the properties in the recitation.\
  #pagebreak()

  So by Green's Theorem and the recitation
  $ Area(P)=integral.cont_(boundary(P)) F dif ell = integral_boundary(P) 1/2(x dif y - y dif x) $
  The boundary $boundary(P)$ can be represented as a piecewise $C^1$ path so we define this boundary as the union of $n$ directed (counterclockwise) line segments
  $ boundary(P) = union.big_(i=1)^n gamma_i $
  Where each $gamma_i$ is the parametrized curve starting at $p_i = (x_i, y_i)$ and ends at $p_(i+1) = (x_(i+1), y_(i+1))$ where $p_(n+1) = p_1$.\
  Therefore each $gamma_i : [0,1] arrow RR^2$ is given by
  $
    gamma_i (t) = t p_(i+1) + (1-t)p_i = vec(
      x_i + t(x_(i+1)-x_i),
      y_i + t(y_(i+1)-y_i)
    )
  $
  We have
  $ dot(gamma)_i (t) = vec(x_(i+1)-x_i, y_(i+1)-y_i) = vec(Delta x_i, Delta y_i) $
  By the properties of the line integral we have
  $ Area(P) = sum_(i=1)^n integral_(gamma_i) F dif ell $
  We compute
  $
    integral_(gamma_i) F dif ell &= integral_0^1 chevron.l F(gamma_i (t)), dot(gamma)_i (t) chevron.l dif t \
    &= 1/2 integral_0^1 (-y_i + t Delta y_i)Delta x_i + (x_i + t Delta x_i)Delta y_i dif t \
    &= 1/2 integral_0^1 - y_i Delta x_i - t Delta y_i Delta x_i + x_i Delta y_i+t Delta x_i Delta y_i dif t \
    &= 1/2 integral_0^1 x_i Delta y_i - y_i Delta x_i dif t \
    &= 1/2 (x_i Delta y_i - y_i Delta x_i)
  $
  We subsitue back $Delta x_i = x_(i+1)-x_i$ and $Delta y_i = y_(i+1)-y_i$ and gets that
  $ integral_(gamma_i) F dif ell = 1/2 (x_i (y_(i+1)-y_i)-y_i (x_(i+1)-x_i)) = 1/2 (x_i y_(i+1) - x_(i+1)y_i) $
  Hence
  $ Area(P) = sum_(i=1)^n integral_(gamma_i) F dif ell = 1/2 sum_(i=1) (x_i y_(i+1) - x_(i+1)y_i)^n $
]

#question()
Assume that $A= pi R^2$.

#subquestion()
We will prove that $L=2pi r$.

#proof[
  $L$ is the perimeter of the circle and from the isoperimetric inequality from the recitation we can deduce $A<=L^2/(4pi)$ and equality holds for balls.\
  But a disk is a ball hence $A=L^2/(4pi)$ but $A=pi r^2$ so $pi r^2 = L^2/(4pi)$ which means $4pi^2 r^2 = L^2$ and since $L>0$ we can take square roots and have $L=2pi r$.
]

#subquestion()
Denote $alpha^prime = min_(t in [0, T^1]) y(t)$ and $beta^prime = max_(t in [0, T^1]) y(t)$ and we will show that $r=(beta^prime - alpha^prime)/2$.

#proof[
  In the recitation we set $alpha = min_(t in [0,T_1]) x(t)$ and $beta = max_(t in [0,T_1]) x(t)$.\
  We assume that the curve parametrizes a circle of radius $r$ centered at $(x_0, y_0)$ then
  $ (x-x_0)^2 + (y-y_0)^2 = r^2 $
  And for every point on the circle
  $ x_0 - r <= x <= x_0 + r $
  Moreover the points $(x_0 plus.minus r, y_0)$ are in the circle hence $alpha = x_0 - r$ and $beta = x_0 + r$.\
  Therefore
  $ beta-alpha = (x_0 + r) - (x_0 - r) = 2r <==> r = (beta-alpha)/2 $
  Similarly
  $ y_0 - r <= y <= y_0 + r $
  And the point $(x_0, y_0 plus.minus r)$ are in the circle hence
  $alpha^prime = y_0 - r$ and $beta^prime = y_0 +r$ thus
  $ beta^prime - alpha^prime = (y_0 + r)-(y_0 -r) = 2r <==> r = (beta^prime - alpha^prime)/2 $
]

#subquestion()
We will prove that $x(t)=plus.minus r dot(y)(t)$ and $y(t)=plus.minus r dot(x)(t)$ then we will deduce that $Omega = B_Omega$ (we will assume here that the parametrization
of $gamma$ is by arc-length parameterization).

#proof[
  In the recitation we saw that
  $
    A + pi r^2 = integral_0^(T_1) chevron.l vec(x(t), y(t)), vec(y^prime (t), -x^prime (t)) chevron.r dif t <= integral_0^(T_1) norm(vec(x(t), y(t))) dot.op norm(vec(y^prime (t), -x^prime (t))) dif t
  $
  We can see that equality in the isoperimetric inequality means equality holds in Cauchy–Schwarz, therefore the two vectors are linearly dependent for every $t$ which means that there exists $lambda(t)$ such that
  $
    vec(x(t), y(t)) = lambda(t) vec(y^prime (t), -x^prime (t)) <==> x(t) = lambda(t) y^prime (t) wide y(t) = -lambda(t) x^prime (t)
  $
  From the assumeption the parametrization is by arc length which means
  $ x^prime (t)^2 + y^prime (t)^2 = 1 $
  From the construction of the ball $B$ we also have
  $ x(t)^2 + y(t)^2 = r^2 $
  Therefore
  $
    r^2 = x(t)^2 + y(t)^2 = lambda(t)^2 y^prime (t)^2 + lambda(t)^2 x^prime (t)^2 = lambda(t)^2 (y^prime (t)^2 + x^prime (t)^2) = lambda(t)^2 ==> abs(lambda(t))=r
  $
  But $lambda(t)$ is continuous and $lambda(t)!=0$ for all $t$ so it's sign is a constant thus either $lambda(t)=r$ for all $t$ or $lambda(t) = -r$ for all $t$ which exactly means $x(t)=plus.minus r dot(y)(t)$ and $y(t)=plus.minus r dot(x)(t)$.\
  We saw that
  $ x(t)^2 + y(t)^2 = r^2 (dot(x)(t)^2 + dot(y)(t)^2) $
  But since $dot(x)(t)^2 + dot(y)(t)^2 = 1$ we have $x(t)^2 + y(t)^2 = r^2$.\
  Therefore the image of the curve lies on the circle of radius $r$ so $boundary(Omega) = boundary(B_r (0))$ which are both bounded domains the the same boundary so we can conclude that $Omega = B_r (0)$.
]

#question()
Let $Omega subset.eq RR^2$ be a domain. Let $p in boundary(Omega)$ and let $p in V subset.eq RR^2$ be a neighborhood of $p$.\
Denote by $B = B_1 (0) subset.eq RR^2$ the unit ball centered at $0$ and we will assume that $phi:B arrow V$ is a diffeomorphism.\
We also assume that $phi({y>0})=V inter Omega$ and $phi({y=0}) subset.eq boundary(Omega)$.\
We will prove that $det d phi > 0$ if and only if the curve $t mapsto phi(t, 0)$ is a positively oriented with respect to $Omega$.\
Formally, we say that the boundary of a domain $Omega subset.eq RR^2$ parametrized by $gamma:I arrow boundary(Omega)$, $gamma(t)=(x(t), y(t))$ is positively orienated if
$ forall t in I, space exists delta > 0, space forall h in (0,delta), space gamma(t) + h hat(n) (t) in Omega $
Where $hat(n)(t) = (-dot(y)(t), dot(x)(t))$.

#proof[#todo]

#question()
Let $f,g : [a,b] arrow RR$ be $C^1$ functions such that $f<=g$ and we denote $A={(x,y) in RR^2 bar x in [a,b], space y in [f(x), g(x)]}$.\
Let $Omega$ be a neighborhood of $A$ and let $F=(P,Q) : Omega arrow RR^2$ be a smooth vector field.\
Let $R in M_2 (RR)$ be an orthogonal matrix such that $det R = 1$.\
Denote $A_R = {R_p in RR^2 bar p in A}$ and $Omega_R = {R_p in RR^2 bar p in Omega}$ and we define the vector field $F_R = (P_R, Q_R) : Omega_R arrow RR^2$ by \ $F_R = R compose F compose R^(-1)$.\
We will prove that
$
  integral_(boundary(A_R)) F_R dif ell = integral_(A_R) (partial Q_R)/(partial x) - (partial P_R)/(partial y) dif x dif y
$

#proof[
  #todo
]
