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
  To find the generating curve $gamma$ in the $x z$-plane we set $y=0$ so from the equation of the cone we have $z^2=a^2x^2$.\
  Since $a>0$ and $x(t) > 0$ we can take root and get that $z=a x$.\
  This is a line segment that can be parametrize as $x(t)=t, z(t) = a t$ and we have constraint on $z$ with $h$ so
  $ 0<z<h <==> 0< a t < h ==> 0 < t < h/a $
  So we define $gamma : (0, h/a) arrow RR^2$ to be the smooth map $gamma(t) = (x(t), z(t))$ with $x(t) = t, z(t) = a t$ and $t in (0, h/a)$.\
  So we can define
  $ M = {(t cos(theta), t sin(theta), a t) bar t in (0,h/a), theta in [0, 2pi]} $
  #pagebreak()
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

#question()
Let $Omega subset.eq RR^d$ be a bounded smooth open set. Let $U subset.eq RR^d$ be an open set such that $closure(Omega) subset.eq U$, let $u,v : U arrow RR$ be smooth functions and let $X:U arrow RR^d$ be a smooth vector field. \
We will show that
$
  integral_Omega Delta u dot.op chevron.l gradient u, x chevron.r dif x = integral_boundary(Omega) (partial u)/(partial N) chevron.l gradient u, x chevron.r dif sigma - 1/2 integral_boundary(Omega) norm(gradient u)^2 chevron.l x, N chevron.r dif sigma + (d-2)/2 integral_Omega norm(gradient u)^2
$
Where $N$ is the outward pointing unit normal of $Omega$ and $(partial u)/(partial N) colon.eq chevron.l gradient u, N chevron.r$.

#proof[
  We set $partial_i = partial/(partial x_i)$ so the laplacian is $Delta u = partial_(i i) u$ and the directional derivative along the position vector field is $chevron.l gradient u, x chevron.r = x_j partial_j u$ and our integral on the right side becomes
  $
    integral_Omega Delta u chevron.l gradient u, x chevron.r dif x = integral_Omega (partial_(i i) u)(x_j partial_j u) dif x
  $
  By the Divergence Theorem
  $
    integral_Omega (partial_(i i) u) (x_j partial_j u) dif x = integral_boundary(Omega) N_i (partial_i u)(x_j partial_j u) dif sigma - integral_Omega (partial_i u) partial_i (x_j partial_j u) dif x
  $
  We notice that
  $
    N_i partial_i u = chevron.l gradient u, N chevron.r = (partial u)/(partial N) \
    x_j partial_j u = chevron.l gradient u, x chevron.r
  $
  This simpelfy the first term with the boundary integral
  $
    (star) quad integral_Omega (partial_(i i) u) (x_j partial_j u) dif x = integral_boundary(Omega) (partial u)/(partial N) chevron.l gradient u, x chevron.r dif sigma - integral_Omega (partial_i u) partial_i (x_j partial_j u) dif x
  $
  Now, using the product rule we compute $partial_i (x_j partial_j u)$ we obtain that
  $ partial_i (x_j partial_j u) = (partial_i x_j)(partial_j u) + x_j partial_i (partial_j u) $
  For smooth functions we have $partial_i (partial_j u) = partial_(i j) u$ so we have
  $ (partial_i x_j)(partial_j u) + x_j partial_(i j) u $
  We use Kronecker Delta / The Dirac measure to see that
  $ delta_(i j) = partial_i x_j = (partial x_j)/(partial x_i) = mycases(1, i = j, 0, i!=j) $
  Hence
  $
    (partial_i x_j)(partial_j u) + x_j partial_(i j) u = delta_(i j) partial_j u + x_j partial_(i j) u = partial_i u + x_j partial_(i j) u
  $
  So
  $
    (partial_i u)(partial_i u + x_j partial_(i j) u) = (partial_i u)^2 + x_j (partial_i u)(partial_(i j) u) = norm(gradient u)^2 + x_j (partial_i u)(partial_(i j) u)
  $
  We look at $x_j (partial_i u)(partial_(i j) u)$, if we think of $(partial_i u)$ as a single function $f$ this term looks like $f dot.op (partial f)/(partial x_j)$ and since $partial/(partial x_j)(f^2) = 2f partial/(partial x_j)$ we get that $f partial/(partial x_j) = 1/2 partial/(partial x_j)(f^2)$ so
  $ (partial_i u)(partial_(i j) u) = 1/2 partial_j ((partial_i u)^2) $
  We need to sum both sides over $i$ hence
  $
    sum_(i=1)^d (partial_i u)(partial_(i j) u) = 1/2 partial_j sum_(i=1)^d (partial_i u)^2 = 1/2 partial_j (norm(gradient u)^2)
  $
  #colbreak()
  So we have
  $
    -integral_Omega [(partial_i u)^2 + x_j (partial_i u)(partial_(i j) u)] dif x = -integral_Omega norm(gradient u)^2 dif x -1/2 integral_Omega x_j partial_j (norm(gradient u)^2) dif x
  $
  We can apply the divergence theorem on the term $integral_Omega x_j partial_j (norm(gradient u)^2) dif x$ if we look at the vector field $F=norm(gradient u)^2$ and the divergence of $F$ is
  $
    divergence(F) =gradient (norm(gradient u)^2 x) = partial_j (norm(u)^2 x_j) = x_j partial_j (norm(gradient u)^2) + norm(gradient u)^2 (partial_j x_j)
  $
  Since the divergence of the position vector field $x$ in $d$ dimensions is $partial_j x_j=d$, we have
  $ x_j partial_j (norm(gradient u)^2)= gradient (norm(gradient u)^2 x)-d norm(gradient u)^2 $
  Hence
  $
    -1/2 integral_Omega (gradient (norm(gradient u)^2 x)-d norm(gradient u)^2) dif x = -1/2 integral_Omega gradient (norm(gradient u)^2 x) dif x- d/2 integral_Omega norm(u)^2 dif x
  $
  From the Divergence theorem
  $
    integral_Omega gradient (norm(gradient u)^2 x) dif x = integral_boundary(Omega) norm(u)^2 chevron.l x, N chevron.r dif sigma
  $
  So the above evaluates to
  $
    (star star) quad - integral_Omega norm(gradient u)^2 dif x - 1/2 integral_boundary(Omega) norm(u)^2 chevron.l x,N chevron.r dif sigma + d/2 integral_Omega norm(gradient u)^2 dif x = ((d-2)/2) integral_Omega norm(gradient u)^2 dif x- 1/2 integral_boundary(Omega) norm(u)^2 chevron.l x,N chevron.r dif sigma
  $
  We combine $(star), (star star)$ and we are done.
]

#question()
Let $F(x,y,z) = (x,y,z)$ and let $Omega subset.eq RR^3$ be a smooth bounded open set. Let $N$ be the outward pointing unit normal and we will calculate
$
  integral_boundary(Omega) N dif sigma \
  integral_boundary(Omega) F and N dif sigma
$

#solution[
  By the remark, let $N=(N_1, N_2, N_3)$, since $N$ is outward pointing unit vector we can use the dot product with the standard basis vector $"e"_1 = (1,0,0)$ to obtain that
  $
    integral_boundary(Omega) N dif sigma = integral_boundary(Omega) N_1 dif sigma = integral_boundary(Omega) (1,0,0) dot.op N dif sigma
  $
  Now we can apply the Divergence theorem for the constant vector field $(1,0,0)$, since the divergence is just $gradient dot.op (1,0,0) = 0$ hence
  $ integral_boundary(Omega) (1,0,0) dot.op N dif sigma = integral_Omega 0 dif V = 0 $
  We can repeat this process for the $y$ and $z$ components using $"e"_2 = (0,1,0), "e"_3 = (0,0,1)$ hence
  $ integral_boundary(Omega) N dif sigma = 0 $
  For the second part, we start by calculate the cross product of $F$ and $N$
  $ F times N = (y N_3 - z N_2, z N_1 - x N_3, x N_2 - y N_1) $
  We look at the first component
  $ y N_3 - z N_2 = (0,-z,y) dot.op (N_1, N_2, N_3) $
  If we apply the Divergence theorem to the vector field $(0,-z,y)$ which it's $divergence$ is 0 we will get that the volume integral is zero and the same for the vector fields $(z,0,-x)$ and $(-y,x,0)$ for the second and third components hence
  $ integral_boundary(Omega) F and N dif sigma = 0 $
]

#question()
Let $Omega subset.eq RR^d$ be a smooth domain and let $p in boundary(Omega)$. Let $p in W subset.eq RR^d$ be an open neighborhood of $p$.\
Denote by $B subset.eq RR^d$ the open unit ball and let $phi:B arrow W$ be a diffeomorphism such that
$
  phi(0) = p \
  phi({x_d > 0}) = W inter Omega \
  forall x in B, space det D phi_x > 0
$

#subquestion()
Let $A in M_d (RR)$ be a square matrix such t hat $det A > 0$ and let $v_1, dots.h, v_(d-1) in RR^d$ be linearly independent.\
We will show that $ chevron.l A(v_1 and dots.h.c and v_(d-1)), A v_1 and dots.h.c and A v_(d-1) chevron.r > 0 $


#proof[
  By definition,
  $ chevron.l v_1 times dots.h.c times v_(d-1), u chevron.r = det(v_1, dots.h, v_(d-1), u) $
  Let $w = v_1 times dots.h.c times v_(d-1), Y = A v_1 times dots.h.c times A v_(d-1)$ we aim to show that $chevron.l A w, Y chevron.r > 0$.\
  We take $u= A w$ and obtain that $ chevron.l Y, A w chevron.r = det(A v_1, dots.h, A v_(d-1), A w) = det(A) dot.op det(v_1, dots.h, v_(d-1), w) = det(A) chevron.l w,w chevron.r = det(A) norm(w)^2 $
  Since $det(A)>0$ is given, and $v_1, dots.h, v_(d-1)$ are linearly independent hence their cross product $w$ is not the zero vector hence $norm(w)^2 > 0$ and finally we obtain that $chevron.l A w, Y chevron.r > 0$ as wanted.
]

#subquestion()
We will prove that
$
  chevron.l D phi_p^(-1) (partial_1 phi scripts(harpoon.tr)_p and dots.h.c and partial_(d-1) phi scripts(harpoon.tr)_p), e_d chevron.r > 0
$

#proof[
  We use the previous subquestion by choosing $A = (D phi)^(-1)_p = (D phi_0)^(-1)$ and $v_i = partial_i phi scripts(harpoon.tr)_p = D phi_0 (e_i)$ for $1<=i<=d-1$.\
  Since $det D phi_x > 0$ for all $x in B$, we have $det D phi_0 > 0$, which implies
  $ det A = det(D phi_0^(-1)) = 1 / (det D phi_0) > 0 $
  The vectors $v_1, dots.h, v_(d-1)$ are linearly independent because $phi$ is a diffeomorphism so from the previous subquestion
  $
    chevron.l D phi_p^(-1) (partial_1 phi scripts(harpoon.tr)_p and dots.h.c and partial_(d-1) phi scripts(harpoon.tr)_p), D phi_p^(-1)(partial_1 phi scripts(harpoon.tr)_p) and dots.h.c and D phi_p^(-1)(partial_(d-1) phi scripts(harpoon.tr)_p) chevron.r > 0
  $
  We have $D phi_p^(-1)(partial_i phi scripts(harpoon.tr)_p) = D phi_0^(-1)(D phi_0(e_i)) = e_i$ and substituting this into the right hand side of the inner product gives
  $
    chevron.l D phi_p^(-1) (partial_1 phi scripts(harpoon.tr)_p and dots.h.c and partial_(d-1) phi scripts(harpoon.tr)_p), e_1 and dots.h.c and e_(d-1) chevron.r > 0
  $
  By definition, for any vector $u$, we have $chevron.l e_1 and dots.h.c and e_(d-1), u chevron.r = det(e_1, dots.h, e_(d-1), u)$. Let $u=e_d$ and we will get
  $ det(e_1, dots.h, e_(d-1), e_d) = det(I_d) = 1 $
  Since $e_1 and dots.h.c and e_(d-1)$ is orthogonal to $e_1, dots.h, e_(d-1)$, it points purely in the $e_d$ direction, meaning $e_1 and dots.h.c and e_(d-1) = e_d$, substituting this back
  $
    chevron.l D phi_p^(-1) (partial_1 phi scripts(harpoon.tr)_p and dots.h.c and partial_(d-1) phi scripts(harpoon.tr)_p), e_d chevron.r > 0
  $
]

#subquestion()
Denote $N=partial_1 phi scripts(harpoon.tr)_p and dots.h.c and partial_(d-1) phi scripts(harpoon.tr)_p$. We will prove that there exists $delta >0$ such that for all $t in (0,delta)$ we have $p-t N in.not Omega$.

#proof[
  The diffeomorphism $phi$ maps the upper half-ball region ${x in B bar x_d > 0}$ into the interior domain $W inter Omega$, which means that a point $y in W$ belongs to $Omega$ if and only if the $d$-th component of its preimage is strictly positive ($y in Omega <==> chevron.l phi^(-1)(y), e_d chevron.r > 0$).\
  We look at the path $gamma(t) = p - t N$. Since $W$ is an open neighborhood of $p$ and $gamma(0) = p$, by continuity there exists $delta_1 > 0$ such that $gamma(t) in W$ for all $t in [0, delta_1)$.\
  #colbreak()
  Using Taylor Expansion around $t=0$ we obtain that
  $ phi^(-1)(p - t N) = phi^(-1)(p) + D phi_p^(-1)(-t N) + o(t) = -t D phi_p^(-1)(N) + o(t) $
  Taking the inner product with $e_d$ to isolate the $d$-th component
  $
    chevron.l phi^(-1)(p - t N), e_d chevron.r = -t chevron.l D phi_p^(-1)(N), e_d chevron.r + chevron.l o(t), e_d chevron.r
  $
  From the second subquestion, we know that $chevron.l D phi_p^(-1)(N), e_d chevron.r = C$ for some strictly positive constant $C > 0$. Therefore
  $ chevron.l phi^(-1)(p - t N), e_d chevron.r = -t C + o(t) = t (-C + o(t)/t) $
  Since $lim_(t arrow 0) o(t)/t = 0$, there exists a sufficiently small $delta in (0, delta_1)$ such that for all $t in (0, delta)$, we have $|o(t)/t| < C$, so that $-C + o(t)/t < 0$.
  Thus, for all $t in (0, delta)$ we have  $chevron.l phi^(-1)(p - t N), e_d chevron.r < 0$ and this implies $p - t N in.not Omega$.
]
