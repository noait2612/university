#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 03 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
For every domain $Omega subset.eq RR^n$ and vector field $F: Omega arrow RR^n$ we will find an explicit function $u:Omega arrow RR$ which is a potential for $F$.

#subquestion()
$Omega = RR^3, space F(x,y,z)=(y+z,x+z, x+y)$.

#solution[
  We want $u$ such that
  $ gradient u = F = (y+z, x+z, x+y) $
  That is
  $ partial/(partial x) u = y+z, space partial/(partial y) u = x+z, space partial/(partial z) u = x+y $
  We start by integrate with respect to $x$ (so $y,z$ are constants)
  $ u(x,y,z)=integral(y+z) dif x = x(y+z)+C(y,z) = x y + x z + C(y,z) $
  Now we differentiate with respect to $y$
  $ partial/(partial y) u = x+ partial/(partial y) C(y,z) $
  We need
  $ x+ partial/(partial y) C(y,z) = x+z $
  Hence
  $ C(y,z) = z $
  We integrate with respect to $y$ and get that $C(y,z)=y z + D(z)$ and we have $u(x,y,z)=x y + x z + y z + D(z)$.\
  We differentiate with respect to $z$
  $ partial/(partial z) u = x + y + partial/(partial z) D(z) $
  We need
  $ x + y + partial/(partial z) D(z) = x+y $
  Hence $partial/(partial z) D(z) = 0$ which means that $D(z)$ is a constant $c$ and the wanted $u$ is given by
  $ u(x,y,z) = x y + x z + y z + c $
  Sanity check:
  $ gradient u = (y+z, x+z, x+y ) = F $
]

#pagebreak()

#subquestion()
$Omega = RR^2 without {0}, space F(x,y)=(x/(x^2+y^2),y/(x^2+y^2))$.

#solution[
  We want $u$ such that
  $ gradient u = F = (x/(x^2+y^2),y/(x^2+y^2)) $
  That is
  $ partial/(partial x) u = x/(x^2+y^2), space partial/(partial y) u = y/(x^2+y^2), space $
  Let
  We start by integrate with respect to $x$
  $
    u(x,y) = integral x/(x^2+y^2) dif x =_(u = x^2+y^2 \
    dif u = 2 x dif x) integral 1/(2u) dif u = 1/2 ln(abs(u)) = ln(x^2+y^2)/2 + C(y)
  $
  Now we differentiate with respect to $y$
  $ partial/(partial y) u = y/(x^2+y^2) + partial/(partial y) C(y) $
  We need
  $ partial/(partial y) u = y/(x^2+y^2) $
  Hence $partial/(partial y) C(y)=0$ which means that $C(y)=c$ a constant hence the wanted $u$ is given by
  $ u(x,y) = ln(x^2+y^2)/2 + c $
  Sanity check:
  $ gradient u = (x/(x^2+y^2), y/(x^2+y^2)) $
]

#question()
Denote $Omega = RR^3 without {(0,0,z) bar z in RR}$. Let $F : Omega arrow RR^3$ be a vector field defined by $F(x, y, z) =
(x/(x^2+y^2), y/(x^2+y^2), z)$.

#subquestion()
We will show that $F$ is conservative.

#proof[
  First we notice that $Omega = RR^3 without {(0,0,z) bar z in RR}$ is not simply connected so the best way to show that $F$ is conservative is by using a theorem from the leacture: $F$ is conservative if and only if $F = gradient u$ for some $u:Omega arrow RR$ so we will construct a proper $u$, that is
  $ partial/(partial x) u = x/(x^2+y^2), space partial/(partial y) u = y/(x^2+y^2), space partial/(partial z) y = z $
  We start by integrate with respect to $x$
  $ u(x,y,z)=integral(x/(x^2+y^2)) dif x = ln(x^2+y^2)/2 + C(y,z) $
  We differentiate with respect to $y$
  $ partial/(partial y) u = y/(x^2+y^2)+ partial/(partial y) C(y,z) $
  We need
  $ partial/(partial y) u = y/(x^2+y^2) $
  Hence $ partial/(partial y) C(y,z) = 0 ==> C(y,z) = C(z) $ So far we have $ u(x,y,z)=ln(x^2+y^2)/2+C(z) $
  Since $ partial/(partial z) u = z = partial/(partial z) C(z) $
  We integrate with respect to $z$ and get that
  $ C(z) = z^2/2 + c $
  We attain that $u$ is given by $ u(x,y,z) = ln(x^2+y^2)/2 + z^2/2 + c $ hence $F = gradient u$ and $F$ is conservative.
]

#pagebreak()

#subquestion()
We will calculate $integral_gamma arrow(F) dif arrow(ell)$ where $gamma(t)=(cos(t), sin(t), t^2)$ and $t in [0,2pi]$.

#solution[ \
  _Reminder:_ Let $gamma : [a,b] arrow RR$ and $arrow(X)$ a vector field then
  $ integral_gamma arrow(X) dif arrow(ell) = integral_a^b arrow(X)(gamma(t)) dot.op dot(gamma)(t) dif t $
  We compute each needed part:
  $
    dot(gamma)(t)= (-sin(t), cos(t), 2t) \
    F(gamma(t))=(cos(t)/(cos^2(t)+sin^2(t)), sin(t)/(cos^2(t)+sin^2(t)), t^2) =_(cos^2(t)+sin^2(t)=1) (cos(t), sin(t), t^2) \
    F(gamma(t)) dot.op dot(gamma)(t) = (cos(t), sin(t), t^2) dot.op (-sin(t), cos(t), 2t) = -sin(t)cos(t)+sin(t)cos(t)+2t^3=2t^3
  $
  Finally
  $ integral_gamma arrow(F) dif arrow(ell) = integral_0^(2pi) 2t^3 dif t = [t^4/2]_(t=0)^(t=2pi) (2pi)^4/2 = 8pi^4 $
]

#question()
Let $U subset.eq RR^n$ be an open set and let $gamma_0, gamma_1: [a,b] arrow U$ be two curves such that $gamma_0 (a)=gamma_1 (a), space gamma_0 (b) = gamma_1 (b)$.\
We say that $gamma_0, gamma_1$ are homotopic in $U$ if there exists a smooth map $H:[a,b] times [0,1] arrow U$ such that
+ $forall t in [a,b], space H(t,0)=gamma_0 (t), space H(t,1)=gamma_1 (t)$
+ $forall s in [0,1], space H(a,s)=gamma_1 (a), space H(b,s)=gamma_1 (b)$
Let $Omega$ be a domain and let $F:Omega arrow RR^n$ be a locally conservative vector field.

#subquestion()
Let $gamma_0, gamma_1:[a,b] arrow Omega$ such that $gamma_0 (a)=gamma_1 (a), space gamma_0 (b) = gamma_1 (b)$ and we assume that $gamma_0, space gamma_1$ are homotopic. We will prove that $ integral_(gamma_0) arrow(F) dif arrow(ell) = integral_(gamma_1) arrow(F) dif arrow(ell) $

#proof[
  In other words, homotopic means that one curve can be smoothly deformed into the other curve. \
  We denote $H:[a,b] times [0,1] arrow U$ be the homotopy map and $gamma_s (t) = H(t,s)$ so that for every $s in [0,1]$ the curve $gamma_s : [a,b] arrow U$ is a curve from $gamma_0 (a)=gamma_1 (a)$ to $gamma_0 (b) = gamma_1 (b)$ which means that $H(t,s)$ is smoothly deforms the starting curve $gamma_0$ into the final curve $gamma_1$ as the parameter $s$ moves from $0$ to $1$.\
  Let $I(s)=integral_(gamma_s) arrow(F) dif arrow(ell)$ (where $I(0)$ represents the integral along the $gamma_0$ curves and $I(1)$ the integral along the $gamma_1$ curve) and if we show that $I(s)$ is a constant we are done (since if $I(s)$ is a constant for all values of $s$ then it's value does not change during the deformation meaning that $I(0)=I(1)$ hence $integral_(gamma_0) arrow(F) dif arrow(ell) = integral_(gamma_1) arrow(F) dif arrow(ell)$).\
  We denote $arrow(F)=(F_1, dots.h, F_n)$ and $H(t,s)=(x_1 (t,s), dots.h, x_n (t,s))$ and we need to compute
  $
    I(s)=integral_(gamma_s) arrow(F) dif arrow(ell)= integral_a^b arrow(F)(H(t,s)) dot.op (partial H)/(partial t) (t,s) dif t
  $
  The integrand in the right hand side is smooth and continuously differentiable with respect to $s$ hence $I$ is differentiable so it will suffice to show that $I^prime (s) = 0$
  $
    I'(s) & =dif/(dif s) integral_a^b arrow(F)(H(t,s)) dot.op (partial H)/(partial t) (t,s) dif t \
    & =_((1)) integral_a^b dif/(dif s) (arrow(F)(H(t,s)) dot.op (partial H)/(partial t) (t,s)) dif t \
    &=_((2)) integral_a^b dif/(dif s) (sum_(i=1)^n F_i (x_1 (t,s), dots.h, x_n (t,s)) (partial x_i)/(partial t) (t,s)) dif t \
    &=_((3)) integral_a^b sum_(i=1)^n sum_(j=1)^n (partial F_i)/(partial x_j) (x_1 (t,s), dots.h, x_n (t,s)) (partial x_j)/(partial s) (t,s) (partial x_i)/(partial t) (t,s) + sum_(i=1)^n F_i (x_1 (t,s), dots.h, x_n (t,s)) (partial^2 x_i)/(partial t partial s) (t,s) dif t \
    &=_((4)) integral_a^b sum_(i=1)^n sum_(j=1)^n (partial F_j)/(partial x_i) (x_1 (t,s), dots.h, x_n (t,s)) (partial x_j)/(partial s) (t,s) (partial x_i)/(partial t) (t,s) + sum_(i=1)^n F_i (x_1 (t,s), dots.h, x_n (t,s)) (partial^2 x_i)/(partial t partial s) (t,s) dif t \
    &=_((5)) integral_a^b dif/(dif t) (sum_(j=1)^n F_j (x_1 (t,s), dots.h, x_n (t,s)) (partial x_j)/(partial s) (t,s)) dif t \
    &=_((6)) [sum_(j=1)^n F_j (x_1 (t,s), dots.h, x_n (t,s)) (partial x_j)/(partial s) (t,s)]_a^b \
    &=_((7)) sum_(j=1)^n F_j (H(t,s)) underbrace((partial x_j)/(dif s) (b,s), =0) - sum_(j=1)^n F_j (H(t,s)) underbrace((partial x_j)/(dif s) (a,s), = 0) = 0
  $
  Explanations for each step: $(1)$ is due to the fact that both are smooth in both variables so we can differentiate under the integral sign (change differentiation and integral order), (2) is opening definitions, (3) is the Chain and Leibniz Integral Rule from the recitation, (4) is due to $F$ being a locally conservative vector field, (5) is the Chain Rule again with respect to $t$ since in the previous step the roles of $t$ and $s$ were switched, (6) is the Fundamental
  Theorem of Calculus and (7) is since the end points does not moves so it's devriative is zero and we can change $s$ as we want but $x_j (a,s) eq.triple p$ for $p$ the matching end point which means that this is a constant curve with respect to $s$.
]

#subquestion()
We will prove that if every two curves $gamma_0, gamma_1:[a,b] arrow Omega$ such that $gamma_0 (a)=gamma_1 (a), space gamma_0 (b) = gamma_1 (b)$ are homotopic then
$F$ is conservative (we call a domain $Omega$ that satisfies this property *simply connected*).

#proof[
  From the previous part we have
  $ integral_(gamma_0) arrow(F) dif arrow(ell) = integral_(gamma_1) arrow(F) dif arrow(ell) $
  So we have path independence.\
  Let $x_0 in Omega$ and $gamma$ is any curve from $x_0$ to $x$ and we define $ u(x)=integral_gamma arrow(F) dif arrow(ell) $
  $u(x)$ is well defined from the previous part and we want to show that $u(x)$ is a potential so we prove $gradient u=F$.\
  For the $i$-th partial derivative we take a small increment $h$ in the $i$-th direction then where $gamma_0$ is a curve from $x_0$ to $x+h e_i$
  $ (star) space u(x+h e_i) = integral_(gamma_0) arrow(F) dif arrow(ell) $
  We use the path path independence and we can write
  $ u(x + h e_i) = u(x) + integral_(gamma_1) arrow(F) dif arrow(ell) $
  Where $gamma_1$ is the curve from $x$ to $x+ h e_i$ given by $gamma_1 (t)= x + t h e_i$ for $t in [0,1]$ then $gamma^prime_1 (t) = h e_i$ so on the right side we have $ integral_0^1 F(gamma_1 (t)) dot.op (h e_i) dif t $
  Combine the above and $(star)$ becomes
  $ (u(x+ h e_i)-u(x))/h = integral_0^1 F(gamma_1 (t)) dot.op (e_i) dif t $
  We take limit as $h arrow 0$ and we attain that $F(gamma_1 (t)) arrow F(x)$ hence (from the integration is over constant) $ (partial u)/(partial x_i) (x) = F(x) dot.op e_i = F_i (x) $ \
  This holds for every component hence $partial u = F$ and $F$ is conservative.
]

#question()
Let $f,g :[a,b] arrow RR$ be $C^1$ functions such that $f <= g$. We Denote $A = {(x, y) in RR^2 : x in [a, b] , y in [f (x) , g (x)]}$.\
For $h in {f, g}$ we define $gamma_h : [a, b] → RR^2$ by $gamma_h (t) = (t, h (t))$ and for $c in {a, b}$ we define $delta_c : [f (c) , g (c)] arrow RR^2$ by
$delta_c (t) = (c, t)$.\
Let $Omega$ be a neighborhood of $A$ and let $F = (P, Q) : Omega arrow RR^2$ be a smooth vector field.

#subquestion()
We will show that
$
  integral_A (partial P)/(partial y) (x,y) dif x dif y = integral_(gamma_g) (P,0) dif ell - integral_(gamma_f) (P,0) dif ell
$

#proof[
  By the definition of $A$ we have $x$ goes from $a$ to $b$ and for each fixed $x$, $y$ goes from $f(x)$ to $g(x)$ which means we slice vertically so integration over $A$ means $dif y dif x$ if we move to iterated integrals.\
  Hence on the left side we have
  $
    integral_A (partial P)/(partial y) (x,y) dif x dif y = integral_a^b integral_(f(x))^(g(x)) (partial P)/(partial y) (x,y) dif y dif x =_((star)) integral_a^b P(x,g(x))-P(x, f(x)) dif x = integral_a^b P(x, g(x)) dif x - integral_a^b P(x, f(x)) dif x
  $
  Where $(star)$ is since that for a fixed $x$ we treat $P(x,y)$ as a function of $y$ and use the Fundamental Theorem of Calculus in $y$.\
  For any curve $gamma(t)=(x(t), y(t))$ and vector field $F=(F_1, F_2)$ we have from definition
  $
    integral_gamma F dif ell = integral_a^b F(x(t), y(t)) (x^prime (t), y^prime (t)) dif t =_(F = (P, 0)) integral_a^b P(x(t), y(t)) x^prime (t) dif t
  $
  So on the right side we have
  $
    integral_(gamma_g) (P,0) dif ell - integral_(gamma_f) (P,0) dif ell = integral_a^b P(t, g(t)) dot.op 1 dif t - integral_a^b P(t, f(t)) dot.op 1 dif t
  $
  With a change of variable $dif x = dif t$ we got that the left side and right side are equal.
]


#subquestion()
We will show that
$
  integral_A (partial Q)/(partial x) (x,y) dif x dif y = integral_(delta_b) F dif ell - integral_(delta_a) F dif ell + integral_(gamma_f) (0,Q) dif ell - integral_(gamma_g) (0,Q) dif ell
$

#proof[
  From the same reasoing as above about $A$
  $
    integral_A (partial Q)/(partial x) (x,y) dif x dif y = integral_a^b integral_(f(x))^(g(x)) (partial Q)/(partial x) (x,y) dif y dif x
  $
  We can't use the Fundamental Theorem of Calculus so instead we will use Leibniz Integration Rule from the recitation (since all the terms are applied) hence
  $
    dif/(dif x) (integral_(f(x))^(g(x)) Q(x,y) dif y) = integral_(f(x))^(g(x)) (partial Q)/(partial x) (x,y) dif y + Q(x,g(x))g^prime (x)-Q(x, f(x))f^prime (x)
  $
  So the inner integral from above becomes
  $
    integral_(f(x))^(g(x)) (partial Q)/(partial x) (x,y) dif y = dif/(dif x) (integral_(f(x))^(g(x)) Q(x,y) dif y)-Q(x, g(x))g^prime (x)+Q (x, f(x))f^prime (x)
  $
  #colbreak()
  Hence
  $
    integral_a^b integral_(f(x))^(g(x)) (partial Q)/(partial x) (x,y) dif y dif x = integral_a^b dif/(dif x) (integral_(f(x))^(g(x)) Q(x,y) dif y) dif x - integral_a^b Q(x, g(x))g^prime (x) dif x + integral_a^b Q(x, f(x)) f^prime (x) dif x
  $
  By the Fundamental Theorem of Calculus we have (since $integral_a^b dif/(dif x) H(x) dif x = H(b) - H(a)$ so with $H(x)=integral_(f(x))^(g(x)) Q(x,y) dif y$)
  $
    integral_a^b dif/(dif x) (integral_(f(x))^(g(x)) Q(x,y) dif y) dif x = integral_(f(b))^(g(b)) Q(b,y) dif y - integral_(f(a))^(g(a)) Q(a,y) dif y
  $
  So far we have
  $
    integral_a^b integral_(f(x))^(g(x)) (partial Q)/(partial x) (x,y) dif y dif x = integral_(f(b))^(g(b)) Q(b,y) dif y - integral_(f(a))^(g(a)) Q(a,y) dif y - integral_a^b Q(x, g(x))g^prime (x) dif x + integral_a^b Q(x, f(x)) f^prime (x) dif x
  $
  We split each component on the right side and compute
  $
    integral_(delta_b) F dif ell = integral_(f(b))^(g(b)) (P(b,t), Q(b,t)) dot.op (0,1) dif t = integral_(f(b))^(g(b)) Q(b,t) dif t \
    integral_(delta_a) F dif ell = integral_(f(a))^(g(a)) (P(a,t), Q(a,t)) dot.op (0,1) dif t = integral_(f(a))^(g(a)) Q(a,t) dif t \
    integral_(gamma_g) F dif ell = integral_a^b (0, Q(t,g(t))) dot.op (1, g^prime (t)) dif t = integral_a^b Q(t,g(t))g^prime (t) dif t \
    integral_(gamma_f) F dif ell = integral_a^b (0, Q(t,f(t))) dot.op (1, f^prime (t)) dif t = integral_a^b Q(t,f(t))f^prime (t) dif t
  $
  Combine them and on the right side we have
  $
    integral_(f(b))^(g(b)) Q(b,t) dif t - integral_(f(a))^(g(a)) Q(a,t) dif t + integral_a^b Q(t,f(t))f^prime (t) dif t - integral_a^b Q(t,g(t))g^prime (t) dif t
  $
  With another change of variable $dif t = dif y$ we got that the left side and right side are equal.
]

#subquestion()
We will conclude that
$
  integral_A (partial Q)/(partial x) - (partial P)/(partial y) dif x dif y = integral_(delta_b) F dif ell - integral_(gamma_g) F dif ell - integral_(delta_a) F dif ell + integral_(gamma_f) F dif ell
$

#proof[
  On the left side with the linearity of the integral we have
  $
    integral_A (partial Q)/(partial x) - (partial P)/(partial y) dif x dif y &= integral_(delta_b) F dif ell - integral_(delta_a) F dif ell + integral_(gamma_f) (0,Q) dif ell - integral_(gamma_g) (0,Q) dif ell- (integral_(gamma_g) (P,0) dif ell - integral_(gamma_f) (P,0) dif ell) \
    &= integral_(delta_b) F dif ell - integral_(delta_a) F dif ell + integral_(gamma_f) (0,Q) dif ell - integral_(gamma_g) (0,Q) dif ell- integral_(gamma_g) (P,0) dif ell + integral_(gamma_f) (P,0) dif ell \
    &= integral_(delta_b) F dif ell - integral_(delta_a) F dif ell + integral_(gamma_f) ((0,Q)+(P,0)) dif ell - integral_(gamma_g) ((0,Q)+(P,0) dif ell) \
    &=integral_(delta_b) F dif ell - integral_(delta_a) F dif ell + integral_(gamma_f) F dif ell - integral_(gamma_g) F dif ell
  $
  Where the last equal is since $F=(P,Q)$.
]

#question()
Let $Omega=(a,b) times (c,d) subset.eq RR^2$ be an open rectangle.

#subquestion()
We will prove that $Omega$ is not a smooth domain.

#proof[
  We need to show that $boundary(Omega)$ is not a smooth curve.\
  The boundary $boundary(Omega)$ contains the four line paths
  $ mycases(x=a, y in [c,d], x=b, y in [c,d], y=c, x in [a,b], y=d, x in [a,b]) $
  These line paths meet at the corner points $(a,c), (a,d), (b,c), (b,d)$.\
  Along each side the boundary is smooth but at the coreners the direction changes: if we take the point $(a,c)$ the boundary is the union of two curves
  $ mycases(gamma_1 (t) = (t,c), t>a, gamma_2 (t) = (a,s), s>c) $
  Obviously, $gamma^prime_1 (t) = (1,0) != (0,1) = gamma^prime_2 (s)$ hence there is no unique tangent vector the boundary is not smooth.
]

#subquestion()
We will formulate and prove Green’s theorem for rectangles using question 4.

#proof[
  Let $R = [a,b] times [c,d]$ a rectangle and $F=(P,Q)$ a smooth vector field, then
  $
    integral_R (partial Q)/(partial x) - (partial P)/(partial y) dif x dif y =integral.cont_(boundary(R)) arrow(F) dif arrow(ell)
  $
  We denote $f(x)=c, g(x) = d, A = R$ and $boundary(R)$ is a closed curve consisting of four straight line segments described as before:
  $
    mycases(gamma_c (t) = (t,c), t in [a,b], gamma_d (t) = (t,d), t in [a,b], delta_b (t)=(b,t), t in [c,d], delta_a (t) = (a,t), t in [c,d])
  $
  Where $gamma_c (t), delta_b$ are oriented counterclockwise path, $gamma_d (t), delta_a (t)$ are opposite to the counterclockwise path which means that this path is $-gamma_d, -delta_a$ hence the total line integral over the positively oriented boundary $boundary(R)$ is the sum of these four segments:
  $
    integral.cont_(boundary(R)) arrow(F) dif arrow(ell) = integral_(gamma_c) F dif ell + integral_(delta_b) F dif ell - integral_(gamma_d) F dif ell - integral_(delta_a) F dif ell
  $
  From the conclusion in question 4 (with $A$ as $R$ and $f,g$ as $c,d$)
  $
    integral_R (partial Q)/(partial x)- (partial P)/(partial y) dif x dif y = integral_(delta_b) F dif ell - integral_(gamma_d) F dif ell - integral_(delta_a) F dif ell + integral_(gamma_c) F dif ell
  $
  $
    ==>_("Rearrange terms")
    integral_R (partial Q)/(partial x)-(partial P)/(partial y) dif x dif y = integral.cont_(boundary(R)) arrow(F) dif arrow(ell)
  $
]
