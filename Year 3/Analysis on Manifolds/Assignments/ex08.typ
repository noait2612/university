#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 08 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
#subquestion()
We will use Guldin’s theorem to calculate the area of $S^2 = {(x,y,z) in RR^3 bar x^2+y^2+z^2=1}$.

#solution[
  We follow the recitation's definition, let $gamma :(a,b) arrow RR^2$ be a smooth map denoted by $gamma(t)=(x(t), z(t))$.\
  We need to ensure that $x(t)>0$ for all $t in (a,b)$ so $x(t) = cos(t), z(t) = sin(t)$ for $t in (-pi/2, pi/2)$.\
  Our surface of revolution is the sphere and it's obtained by $gamma$ as
  $ M ={(x(t) cos(theta), x(t) sin(theta), z(t)) bar t in (-pi/2, pi/2), theta in [0, 2pi]} $
  we have
  $ norm(dot(gamma)(t)) = sqrt((-sin(t))^2 + (cos(t))^2) = sqrt(sin^2 (t) + cos^2(t)) = sqrt(1) = 1 $
  Hence
  $ l(gamma) = integral_(-pi/2)^(pi/2) norm(dot(gamma)(t)) dif t = integral_(-pi/2)^(pi/2) 1 dif t = pi $
  Now we need to find the center of mass $a_1$.\
  Let $a$ be the center of mass of $gamma(t)$ in $RR^3$ so
  $ a_1 = 1/l(gamma) integral_gamma x dif sigma $
  We know  that
  $ integral_gamma x dif sigma = integral_a^b x(t) norm(dot(gamma)(t)) dif t $
  Hence
  $ a_1 = 1/pi integral_(-pi/2)^(pi/2) cos(t) dif t = 1/pi dot.op [sin(t)]_(t=-pi/2)^(t=pi/2) = 1/pi (1-(-1)) = 2/pi $
  Now we apply Guldin’s theorem
  $ Area(M) = l(gamma) dot.op 2pi abs(a_1) $
  So in our case
  $ Area(M) = pi dot.op 2pi dot.op 2/pi = 4 pi $
]

#subquestion()
We will use Guldin’s theorem to calculate the area of $C = {(x,y,z) in RR^3 bar z^2=a^2(x^2+y^2), 0<z<h space a,h > 0}$.

#solution[
  To find the generating curve $gamma$ in the $x z$-plane we set $y=0$ so from the equation of the cone we have $z^2=a^2x^2$. Since $a>0$ and $x(t) > 0$ we can take root and get that $z=a x$.\
  This is a line segment that can be parametrize as $x(t)=t, z(t) = a t$ and we have constraint on $z$ with $h$ so
  $ 0<z<h <==> 0< a t < h ==> 0 < t < h/a $
  So we define $gamma : (0, h/a) arrow RR^2$ be the smooth map $gamma(t) = (x(t), z(t))$ with $x(t) = t, z(t) = a t$ and $t in (0, h/a)$.\
  So we can define
  $ M = {(t cos(theta), t sin(theta), a t) bar t in (0,h/a), theta in [0, 2pi]} $
  Same as before
  $
    dot(gamma)(t) = (x^prime (t), z^prime (t)) = (1,a) \
    norm(dot(gamma)(t)) = sqrt(1^2+a^2) = sqrt(1+a^2) \
    l(gamma) = integral_0^(h/a) norm(dot(gamma)(t)) = integral_0^(h/a) sqrt(1+a^2) dif t = sqrt(1+a^2) [t]_(t=0)^(t=h/a) = h/a sqrt(1+a^2) \
    a_1 = 1/l(gamma) integral_gamma x dif sigma = 1/l(gamma) integral_0^(h/a) t norm(dot(gamma)(t)) dif t =1/(h/a sqrt(1+a^2)) integral_0^(h/a) t sqrt(1+a^2) dif t = a/(2h) [t^2]_(t=0)^(t=h/a) = a/h dot.op h^2/(2a^2) = h/(2a)
  $
  Since $a,h>0$ we have that $a_1 > 0$ so $abs(a_1) = a_1$ and from Guldin’s theorem we get that
  $ Area(M) = (h/a sqrt(1+a^2)) dot.op 2pi dot.op h/(2a) = (2pi h^2 sqrt(1+a^2))/(2a^2) = (pi h^2 sqrt(1+a^2))/a^2 $
]

#question()
Consider $ M = {(x,y,z) in RR^3 bar x^2+y^2+z^2 =1, sqrt(x^2+y^2)<=z^2} \
F(x,y,z) = (x^2/2 + x y - 4 x z + cos(z), -y^2/2 - x y + x^2 + z^3, 2z^2+x) $
We will calculate the flux of $F$ through $M$ with respect to the unit normal pointing upward.

#solution[
  Let $F=(P,Q,R)$ and we compute the divergence of $F$
  $
    P_x = partial/(partial x) (x^2/2 + x y - 4 x z + cos(z)) = x+y-z \
    Q_y = partial/(partial y) (-y^2/2 - x y + x^2 + z^3) = -y-x \
    R_z = partial/(partial z)(2z^2+x)=4z
  $
  By definition
  $ divergence F = P_x + Q_y + R_z = (x+y-z)+(-y-x)+4z = 0 $
  We need to find the boundary of $M$.\
  Let $r=sqrt(x^2+y^2)$ and our conditions becomes $r^2+z^2 = 1$ and $r<=z^2$ so $r<=1-r^2$ means that $r^2+r-1 <=0$ and since $r>=0$ possible range is $0<=r<=(sqrt(5)-1)/2$ so let $R=(sqrt(5)-1)/2$.\
  On the boundary we have $z^2=1-R^2 = R$ so $z=sqrt(R)$ and $z=-sqrt(R)$ thus $M$ consists of two disjoint parts $M_1$ where $z>0$ and $M_2$ where $z<0$.\
  Same as the recitation, we denote
  $
    D_1 = {(x,y,z) in RR^3 bar z = sqrt(R), x^2+y^2 < R^2} \
    V_1 = {(x,y,z) in RR^3 bar sqrt(R)<z<sqrt(1-x^2-y^2), x^2+y^2<R^2} \
    D_2 = {(x,y,z) in RR^3 bar z=-sqrt(R), x^2+y^2 < R^2} \
    V_2 = {(x,y,z) in RR^3 bar -sqrt(1-x^2-y^2)<z<-sqrt(R), x^2+y^2<R^2}
  $
  By the divergence theorem
  $
    integral_(M_1 union D_1) chevron.l F,N chevron.r dif sigma = integral_(M_1) chevron.l F, N chevron.r dif sigma = integral_(D_1) chevron.l F, N chevron.r dif sigma = integral_(V_1) divergence F dif x dif y dif z = 0 \
    integral_(M_2 union D_2) chevron.l F,N chevron.r dif sigma = integral_(M_2) chevron.l F, N chevron.r dif sigma = integral_(D_2) chevron.l F, N chevron.r dif sigma = integral_(V_2) divergence F dif x dif y dif z = 0
  $
  Let $N=(0,0,-1)$. Let $p in D_1$ and let $gamma : (-epsilon, epsilon) arrow D_1$ be a differentiable path such that $gamma(0)=p$.\
  Since $im gamma subset.eq D_1$ we can write it as $gamma(t)=(x(t), y(t), sqrt(R))$ thus
  $ chevron.l dot(gamma)(0), N chevron.r = chevron.l vec(dot(x)(0), dot(y)(0), 0), vec(0, 0, -1) chevron.l = 0 $
  Moreover, for every $0<s<1$ we have
  $ p+s N = (p_x, p_y, p_z -s) = (p_x, p_y, sqrt(R)-s) $
  Where $p_z = sqrt(R)$ since $p in D_1$. For every $(x,y,z) in V_1$
  we have $z>sqrt(R)$ hence $p+s N in.not V_1$ for all $0<s<1$.\
  Consider the map $phi:(0,R) times (0,2pi) arrow D_1$ defined by $phi(t, theta)=(t cos(theta), t sin(theta), sqrt(R))$ so we have
  $
    (partial phi)/(partial t) = vec(cos(theta), sin(theta), 0), wide (partial phi)/(partial theta) = vec(-t sin(theta), t cos(theta), 0) \
    ==> chevron.l (partial phi)/(partial t), (partial phi)/(partial theta) chevron.r = -t sin(theta) cos(theta) + t sin(theta) cos(theta) = 0
  $
  Furthermore
  $
    norm((partial phi)/(partial t))^2 = cos^2(theta) + sin^2(theta) = 1 \
    norm((partial phi)/(partial theta))^2 = t^2 cos^2(theta)+t^2 sin^2(theta) = t^2
  $
  Hence
  $
    integral_(D_1) chevron.l F, N chevron.r dif sigma & = integral_(D_1) -(2z^2+x) dif sigma \
    & = integral_0^(2pi) integral_0^R -(2(sqrt(R))^2 + t cos(theta))sqrt(t^2) dif t dif theta \
    &= integral_0^(2pi) integral_0^R -(2R t + t^2 cos(theta)) dif t dif theta \
    &= integral_0^(2pi) [-R t^2 - t^3/3 cos(theta)]_(t=0)^(t=R) dif theta \
    &= integral_0^(2pi) (-R^3 - R^3/3 cos(theta)) dif theta \
    &= [-R^3 theta - R^3/3 sin(theta)]_(theta=0)^(theta=2pi) \
    &= -2pi R^3
  $
  For $M_1$ the required normal $N_"up"$ so
  $
    integral_(M_1) chevron.l F, N_"up" chevron.r dif sigma = - integral_(D_1) chevron.l F, N chevron.r dif sigma = 2pi R^3
  $
  By identical reasoing for $D_2$ from $V_2$ the normal is $N=(0,0,1)$ and we have
  $
    integral_(D_2) chevron.l F, N chevron.r dif sigma = integral_(D_2) (2z^2+x) dif sigma = integral_0^(2pi) integral_0^R (2(-sqrt(R))^2 + t cos(theta)) t dif t dif theta = integral_0^(2pi) [R t^2 + t^3/3 cos(theta)]_(t=0)^(t=R) dif theta = 2pi R^3
  $
  Hence
  $
    -integral_(M_2) chevron.l F,N_"up" chevron.r dif sigma + 2pi R^3 = 0 ==> integral_(M_2) chevron.l F,N_"up" chevron.r dif sigma = 2pi R^3
  $
  So the total upward flux is
  $
    integral_M chevron.l F, N_"up" chevron.r dif sigma = integral_(M_1) chevron.l F, N_"up" chevron.r dif sigma + integral_(M_2) chevron.l F, N_"up" chevron.r dif sigma = 2 pi R^3 + 2 pi R^3 = 4 pi R^3
  $
  We have $R=(sqrt(5)-1)/2$ as the positive root of $R^2+R+1 = 0$ so
  $ R^3 = R(1-R) = R-R^2 = R-(1-R) = 2R - 1 = sqrt(5)-2 $
  So the final flux is $4pi(sqrt(5)-2)$.
]
