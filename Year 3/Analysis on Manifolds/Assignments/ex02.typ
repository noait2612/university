#import "../../../src/article.typ": *
#show: article.with(
  title: [ Solution to Exercise 2 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)
#let Adj = math.op("Adj")
#let adj = math.op("adj")
#let GL = math.op("GL")

#question()
We will draw the following paths and calculate the line or path integrals for each following path and vector fields \
$F: RR^n arrow RR^n$ or functions $f:RR^n arrow RR$.\
_Reminder:_
$ integral_gamma F dif l = integral_0^1 chevron.l F(gamma(t)) comma dot(gamma)(t) chevron.r dif t $
So in each part we calculate each component in this integral.

#subquestion()
$gamma :[0,1] arrow RR^2, space gamma(t)=(t^2,t^2-t), space F(x,y)=(x^2y,y-3x)$ and we will calculate $integral_gamma F dif l$.

#solution[
  $
    dot(gamma)(t) = (2t, 2t-1) \
    F(gamma(t))=F(t^2,t^2-2)= ((t^2)^2 (t^2-t), t^2-t-3t^2)=(t^6-t^5, -2t^2-t)
  $
  So the full integrand is
  $
    integral_gamma F dif l = integral_0^1 (t^6-t^5, -2t^2-t) dot.op (2t, 2t-1) dif t = integral_0^1 2t^7-2t^6 -4t^3+t dif t = [t^8/4-(2t^7)/7 - t^4+t^2/2]_(t=0)^(t=1) = -15/28
  $
  #todo
]

#subquestion()
$gamma:[0,1] arrow RR^3, space gamma(t)=(t, cos(t), sin(t)), space F(x,y,z)=(0,-z,y)$ and we will calculate $integral_gamma F dif l$.

#solution[
  $
    dot(gamma)(t) = (1,-sin(t), cos(t)) \
    F(gamma(t)) = F(t, cos(t), sin(t))=(0,-sin(t), cos(t))
  $
  So the full integrand is
  $
    integral_gamma F dif l = integral_0^1 (0, -sin(t), cos(t)) dot.op (1, -sin(t), cos(t)) dif t = integral_0^1 0+sin^2(t)+sin^2(t) dif t = integral_0^1 1 dif t = 1
  $
  #todo
]

#pagebreak()

#subquestion()
$gamma:[1/4, 3/4] arrow RR^2, space gamma(t)=(2t-1,sqrt(1-(2t-1)^2)), space f(x,y)=x y^4$ and we will calculate $integral_gamma f dif s$.

#solution[
  First w do variable change for $x=2t-1$ so $gamma(t)=(x, sqrt(1-x^2))$ so this is the upper semicircle of radius 1.\
  We will use the hint and use the arc-length reparameterization:
  $
    dot(gamma)(t) = (2, (-2(2t-1))/sqrt(1-(2t-1)^2)) \
    norm(dot(gamma)(t)) = 4 + (4(2t-1)^2)/(1-(2t-1)^2) = (4(1-(2t-1)^2)+4(2t-1)^2)/(1-(2t-1)^2) = 4/(1-(2t-1)^2) \
    l(gamma)=integral_(1/4)^(3/4) norm(dot(gamma)(t)) dif t = integral_(1/4)^(3/4) 4/(1-(2t-1)^2) dif t
  $
  To calculate the integral we will use subsution
  $
    integral 4/(1-(2t-1)^2) dif t
    =_(u=2t-1 \
    dif t = 1/2 dif u) 2 integral 1/(1-u^2) dif u = -2 integral 1/((u-1)(u+1)) dif u = -2 integral - (1/(u+1)-1/(u-1))/2 dif u \
    = integral 1/(u+1) dif u - integral 1/(u-1) dif u = ln(abs(u+1))-ln(abs(u-1)) = ln(abs(t))-ln(abs(t-1))
  $
  So
  $ l(gamma)=[ln(abs(t))-ln(abs(t-1))]_(t=1/4)^(t=3/4) = -2ln(1/4) $
  We then get
  $ phi(t)=integral $
  #todo

]

#question()
Let $gamma : [a, b] arrow RR^n$ be a regular curve, and let $overline(gamma)$ be its arc length parameterization. \
We will show that $l(overline(gamma) scripts(harpoon.tr)_([s_1, s_2]))=s_2-s_1$ for $0<=s_1<=s_2<=l(gamma)$ (meaning that the amount of length covered by $overline(gamma)$ within any interval is the length of the interval).

#proof[
  We defined the arc length parametrization of $gamma$ as $overline(gamma)=gamma compose phi^(-1)$ where $phi:[a,b] arrow [0, l(gamma)]$ given by \
  $gamma(t)=integral_a^t norm(dot(gamma)(s)) dif s$ and we saw in the recitation a lemma that implies $norm(dot(overline(gamma))) eq.triple 1$ hence
  $
    l(overline(gamma) scripts(harpoon.tr)_([s_1, s_2])) = integral_(s_1)^(s_2) norm(dot(overline(gamma))(s)) dif s = integral_(s_1)^(s_2) 1 dif s = s_2 - s_1
  $
  Where the last equality is from the definition of indicator function/The Fundamental Theorem of Calculus.
]

#question()
In this question we will prove the following theorem: \ Let $gamma:[a, b] arrow RR^n$ be a regular $C^1$ curve such that
$gamma(a) = A,gamma (b) = B$. Then $l(γ) >= norm(B-A)$ and there is an equality if and only if $forall t in [a, b], space gamma(t) in
{(1 − s)A + s B bar s in [0, 1]}$.

#subquestion()
We will show that $l(gamma)>=norm(B-A)$.

#proof[
  Since $gamma$ is differentiable, from The Fundamental Theorem of Calculus and the definition of $l(gamma)$ we gets
  $ B-A = gamma(b)-gamma(a) = integral_a^b dot(gamma)(t) dif t $
  By the triangle inequality for integrals
  $ norm(B-A)=norm(integral_a^b dot(gamma)(t) dif t)<= integral_a^b norm(dot(gamma)(t)) dif t = l(gamma) $
]

#subquestion()
Let $x,y in RR^n$ and we will show that if $norm(x+y)=norm(x)+norm(y)$ then there exists $alpha>=0$ such that $x=alpha y$.

#proof[
  We start by squaring both sides and using the definition of inner product
  $
    norm(x+y)^2 = (norm(x)+norm(y))^2 <==> norm(x)^2+2 chevron.l x,y chevron.r + norm(y)^2 = norm(x)^2+2norm(x)norm(y)+norm(y)^2
  $
  Subtracting $norm(x)^2+norm(y)^2$ from both sides and diving by $2$ yields
  $ chevron.l x,y chevron.r = norm(x)norm(y) $
  From Cauchy-Schwarz inequality we gets $abs(chevron.l x comma y chevron.r)<=norm(x)norm(y)$ and equality holds if and only if $x$ and $y$ are linearly dependent.\
  We found that $chevron.l x, y chevron.r = norm(x)norm(y)$ so it means that $x$ and $y$ are linearly dependent and the angle between them is $0^circle.small$ which means that they are in the same direction.\
  Thus, there exists a scalar $alpha$ such that $x=alpha y$ and since $chevron.l x,y chevron.r = norm(x)norm(y)$ is not negative then $alpha>=0$.
]

#subquestion()
We will show that for every $t_0 in [a, b], space l(γ) >= norm(gamma(t_0) - A) + norm(B-gamma(t_0))$.

#proof[
  let $t_0 in [a,b]$, from the linearity of integrals
  $
    l(gamma)=integral_a^b norm(dot(gamma)(t)) dif t = integral_a^(t_0) norm(dot(gamma)(t)) dif t + integral_(t_0)^b norm(dot(gamma)(t)) dif t
  $
  Part (1) implies that
  $
    l(gamma scripts(harpoon.tr)_([a,t_0])) >= norm(gamma(t_0) - gamma(a))=norm(gamma(t_0) - A) \
    l(gamma scripts(harpoon.tr)_([t_0,b])) >= norm(gamma(b) - gamma(t_0))=norm(B - gamma(t_0))
  $
  We add both inequalities
  $
    l(gamma)=l(gamma scripts(harpoon.tr)_([a,t_0]))+l(gamma scripts(harpoon.tr)_([t_0,b])) >= norm(gamma(t_0) - A) + norm(B - gamma(t_0))
  $
]

#pagebreak()

#subquestion()
We will use parts (2) and (3) to conclude that $l(gamma)=norm(B-A)$ implies $forall t in [a,b], space gamma(t) in {(1-s)A+s B bar s in [0,1]}$.

#proof[
  Assume that $l(gamma)=norm(B-A)$ and from part (3) for any $t in [a,b]$
  $ norm(B-A)>=norm(gamma(t)-A)+norm(B-gamma(t)) $
  From the triangle inequality
  $ norm(B-A)<=norm(gamma(t)-A)+norm(B-gamma(t)) $
  Thus
  $ norm(B-A)=norm(gamma(t)-A)+norm(B-gamma(t)) $
  From part (1) we get $alpha>=0$ so that
  $ B-A=(gamma(t)-A)+(B-gamma(t)) <==> gamma(t)-A=alpha(B-gamma(t)) $
  We rearrange
  $ gamma(t) = A/(1+alpha) + (alpha B)/(1+alpha) $
  Let $s=alpha/(1+alpha) in [0,1]$ so
  $ gamma(t)=(1-s)A+s B $
]

#subquestion()
We will prove that if $forall t in [a,b], space gamma(t) in {(1-s)A + s B bar s in [0,1]}$ then $l(gamma)=norm(B-A)$.

#proof[
  By the assumption, every point of the curves lies on the path from $A$ to $B$ so there exists a function $s(t) in [0,1]$ such that
  $
    gamma(t)=(1-s(t))A + s(t)B \
    dot(gamma)(t) = dot(s)(t)(B-A)
  $
  So the length is given by
  $
    l(gamma)=integral_a^b norm(dot(gamma)(t)) dif t = integral_a^b abs(dot(s)(t))norm(B-A) dif t = norm(B-A)integral_a^b abs(dot(s)(t)) dif t
  $
  We notice that $s(t)$ is non-decreasing (since by definition, $gamma(a)=A, space gamma(b)=B$ so $s(a)=0, space s(b)=1$ and the curves moves along the path without reversing direction) and hence $abs(dot(s)(t))=dot(s)(t)$ thus using The Fundamental Theorem of Calculus
  $
    l(gamma)= norm(B-A)integral_a^b abs(dot(s)(t)) dif t = norm(B-A)integral_a^b dot(s)(t) dif t = norm(B-A)(s(b)-s(a))=norm(B-A) dot.op 1 = norm(B-A)
  $
]

#question()
We call a vector field $F : RR^n without {0} arrow RR^n$ a radial field if there exists a $C^1$ function $g : RR_plus arrow RR$ such that
$ forall x in RR^n, space F(x) = g(norm(x))x $
We will show that if $F: RR^n without {0} arrow RR^n$ is a radial field then there exists a $f in C^1, space f : RR^n without {0} arrow RR$ such that $F = gradient f$.

#proof[
  #todo
]

#question()
Let $Omega subset.eq RR^n$ be an open set in $RR^n$. We call a smooth function $phi:[0,T] times Omega arrow Omega$ a flow if:
+ For all $t in [0,T]$ the map $phi_t : Omega arrow Omega$ defined by $phi_t (x) = phi(t, x)$ is a diffeomorphism
+ For all $x in Omega, space phi(0, x)=x$
Let $F:[0,T] times Omega arrow RR^n$ be a smooth function (this function induces a vector field on $Omega$ for every $t in [0, T]$).\
We say that $F$ is compatible with the flow $phi$ if:
$ forall x in RR^n, space dif/(dif t) phi(t, x) = F(t, phi(t, x)) $
And assume that $forall s,t in [0,T]$ and $forall x in Omega, space phi(s+t, x)=phi(t, phi(s, x))$ and that $F$ is compatible with $phi$.\
We will show that $forall t, s in [0,T]$ and $forall x in Omega, space F(t,x)=F(s,x)$.

#proof[
  In other words, we want to show that $F$ does not depend on time.\
  Fix $s,t,x$, from our assumption
  $ phi(s+t, x) = phi(t, phi(s, x)) $
  We differentiate with respect to $t$ each side:\
  Since $F$ compatible with $phi$
  $ dif/(dif t) phi(s+t, x) = F(s+t, phi(s+t, x)) $
  On the right side since $phi(s, x)$ is a constant
  $ dif/(dif t) phi(t, phi(s, x))=F(t, phi(t, phi(s, x)))=F(t, phi(s+t, x)) $
  Where the last equality is from out assumption.\
  So we have
  $ F(s+t, phi(s+t, x)) = F(t, phi(s+t, x)) $
  Since $phi_(s+t)$ is a diffeomorphism, every $y in Omega$ can be written as
  $ y = phi(s+t, x) $
  So our equation above becomes for all $y in Omega$
  $ (star) space F(s+t, y) = F(t,y) $
  Now we fix $x$ and want aim to show that $F(t,x)=F(s,x)$.\
  From $(star)$ using $y=x, t=0$ we get
  $ F(s+0, x) = F(s, x) = F(0,x) $
  Similarly, we get that $F(t,x)=F(0,x)$ so $F(s,x)=F(t,x)$ for all $s,t,x$ and we are done.
]
