#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 07 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
Let $M subset.eq RR^n$ be a k-dimensional smooth manifold and let $rho : M arrow RR$ be a continuous function.\
We call $rho$ a density function and we define the mass of $M$ with respect to the density $rho$ by
$ m = integral_M rho dif sigma $
We define the center of mass of $M$ to be the point $a = (a_1,dots.h , a_n) in RR^n$ such that for all $1 <= i <= n$
$ a_i = 1/m integral_M x_i rho dif sigma $
When the density function is not specified, we assume that it is the constant function $rho ≡ 1$.

#subquestion()
We will find the center of mass for the manifold $M={(x,y,z) in RR^3 bar x^2+y^2+z^2=1, z>0}$

#solution[
  We first need to convert to cylindrical coordinates system
  $ cases(x=r cos theta, y = r sin theta, z=z) $
  We know that $x^2+y^2=r^2$ so our manifold is $r^2+z^2=1$ and since we are on the upper hemisphere we have $z>0$ so we can solve for $z=sqrt(1-r^2)$ hence we need the bound $0<r<1$ and we need to cover the entire upper hemisphere hence also $0<theta<2pi$.\
  So if $Phi(r, theta)$ mapping an open set $U subset.eq RR^2$ to $M subset.eq RR^3$ is
  $ Phi(r, theta) = (r cos(theta), r sin(theta), sqrt(1-r^2)) $
  We need to calculate the Jacobian matrix $D Phi_((r,theta))$
  $
    D Phi_((r, theta)) = mat(cos(theta), -r sin(theta); sin(theta), r cos(theta); (-r)/sqrt(1-r^2), 0) wide (D Phi_((r, theta)))^T = mat(cos(theta), sin(theta), (-r)/sqrt(1-r^2); r sin(theta), -r cos(theta), 0)
  $
  Next we calculate $sqrt(det((D Phi)^T (D Phi)))$ by the Gram matrix we obtain that
  $
    (D Phi)^T (D Phi) = mat(cos^2(theta)+sin^2(theta)+ ((-r)/sqrt(1-r^2))^2, -r sin(theta)cos(theta)+r cos(theta)sin(theta)+0; r sin(theta) cos(theta)-r cos(theta) sin(theta)+0, r^2 sin^2(theta)+r^2 cos^2(theta)+0) = mat(1+r^2/(1-r^2), 0; 0, r^2) = mat(1/(1-r^2), 0; 0, r^2)
  $
  Hence
  $ sqrt(det((D Phi)^T (D Phi))) = sqrt(r^2/(1-r^2))=r/sqrt(1-r^2) $
  Which means that $dif sigma = r/z$ so we obtain that (using that $rho eq.triple 1$ from the assumption)
  $
    m = integral_M rho dif sigma = integral_0^(2pi) integral_0^1 1 dot.op r/sqrt(1-r^2) dif r dif theta \
    a_1 = 1/m integral_M x rho dif sigma = 1/m integral_0^(2pi) integral_0^1 (r cos(theta))r/sqrt(1-r^2) dif r dif theta \
    a_2 = 1/m integral_M y rho dif sigma = 1/m integral_0^(2pi) integral_0^1 (r sin(theta))r/sqrt(1-r^2) dif r dif theta \
    a_3 = 1/m integral_M z rho dif sigma = 1/m integral_0^(2pi) integral_0^1 sqrt(1-r^2) r/sqrt(1-r^2) dif r dif theta = 1/m integral_0^(2pi) integral_0^1 r dif r dif theta
  $
]

#subquestion()
We will find the center of mass of the upper hemisphere with density $rho(x, y, z)=sqrt(x^2+y^2)$.

#solution[
  We continue from the previous section and compute with $rho(x, y, z)=sqrt(x^2+y^2)=abs(r)=r$ and obtain that
  $
    m = integral_M rho dif sigma = integral_0^(2pi) integral_0^1 r^2/sqrt(1-r^2) dif r dif theta \
    a_1 = 1/m integral_M x rho dif sigma = 1/m integral_0^(2pi) integral_0^1 (r cos(theta))r^2/sqrt(1-r^2) dif r dif theta \
    a_2 = 1/m integral_M y rho dif sigma = 1/m integral_0^(2pi) integral_0^1 (r sin(theta))r^2/sqrt(1-r^2) dif r dif theta \
    a_3 = 1/m integral_M z rho dif sigma = 1/m integral_0^(2pi) integral_0^1 sqrt(1-r^2) r^2/sqrt(1-r^2) dif r dif theta = 1/m integral_0^(2pi) integral_0^1 r^2 dif r dif theta
  $
]

#subquestion()
We will find the center of mass for the manifold spherical triangle $M= {(x,y,z) in RR^3 bar x^2+y^2+z^2=1, x>0, y>0, z>0}$.

#solution[
  We will use spherical coordinates system (we can cylindrical coordinates system but we try to vary).\
  We first notice that our manifold $M$ is strictly the surface of the unit sphere so $r=1$ so we have the parametrization function
  $ Phi(theta, phi) = (sin(phi)cos(theta), sin(phi)sin(theta), cos(phi)) $
  We need to find the correct boundaries for $theta$ and $phi$:\
  From $z>0$ we need to have $z=cos(phi) > 0 ==> phi in (0, pi/2)$.\
  From $x>0, y>0$ from definition of $theta$ we start at the positive $x$-axis and stop at the positive $y$-axis which is just a quarter-turn at $sin(phi) > 0$ so $x=sin(phi)cos(theta) > 0 ==> cos(theta) > 0$ and $y=sin(phi)sin(theta) > 0 ==> sin(theta)>0$ and they both positive when $theta in (0, pi/2)$.\
  We calculate the Jacobian matrix $D Phi_((theta, phi))$
  $
    D Phi_((theta, phi)) = mat(-sin(phi) sin(theta), cos(phi)cos(theta); sin(phi)cos(theta), cos(phi)sin(theta); 0, -sin(phi)) wide
    (D Phi_((theta, phi)))^T = mat(-sin(phi)sin(theta), sin(phi)cos(theta), 0; cos(phi)cos(theta), cos(phi)sin(theta), -sin(phi))
  $
  Next we calculate  $sqrt(det((D Phi)^T (D Phi)))$ by the Gram matrix we obtain that
  $
    (D Phi)^T (D Phi) = mat(sin^2(phi)sin^2(theta)+sin^2(phi)cos^2(theta), -sin(phi)sin(theta)cos(phi)cos(theta)+sin(phi)cos(theta)cos(phi)sin(theta); -sin(phi)sin(theta)cos(phi)cos(theta)+sin(phi)cos(theta)cos(phi)sin(theta), cos^2(phi)cos^2(theta)+cos^2(phi)sin^2(theta)+sin^2(phi)) \
    = mat(sin^2(phi)(sin^2(theta)+cos^2(theta)), 0; 0, cos^2(phi)(cos^2(theta)+sin^2(theta))+sin^2(phi)) = mat(sin^2(phi), 0; 0, 1)
  $
  Hence
  $ sqrt(det((D Phi)^T (D Phi))) = sqrt(sin^2(phi)) = abs(sin(phi)) =_(phi in (0,pi/2)) sin(phi) $
  Which means that $dif sigma = sin(phi)$ and with $rho eq.triple 1$ we obtain that
  $
    m = integral_M rho dif sigma = integral_0^(pi/2) integral_0^(pi/2) sin(phi) dif theta dif phi \
    a_1 = 1/m integral_M x rho dif sigma = 1/m integral_0^(pi/2) integral_0^(pi/2) sin^2(phi)cos(theta) dif theta dif phi \
    a_2 = 1/m integral_M y rho dif sigma = 1/m integral_0^(pi/2) integral_0^(pi/2) sin^2(phi)sin(theta) dif theta dif phi
  $
  $
    a_3 = 1/m integral_M z rho dif sigma = 1/m integral_0^(pi/2) integral_0^(pi/2) sin(phi)cos(phi) dif theta dif phi
  $
]

#subquestion()
We will find the center of mass for the cone with height $h>0$ and slope $a>0$.\
This is the manifold $M= {(x,y,z) in RR^3 bar z^2=a^2(x^2+y^2), 0<z<h)}$.

#solution[
  For a cone the best way is the use cylindrical coordinates system.\
  From the definition of $M$ we obtain that $z= a r$ (since everything is positive we can take root) and from the second constraint we get the $0< a r < h$ which means $0<r<h/a$ and since $theta$ represents the angle spinning horizontally around the $z$-axis we get that $theta in (0,2pi)$.\
  So our parametrization is
  $ Phi(r, theta) = (r cos(theta), r sin(theta), a r) $
  We will do all the calculations as before
  $
    D Phi_((r, theta)) = mat(cos(theta), -r sin(theta); sin(theta), r cos(theta); a, 0) wide (D Phi_((r,theta)))^T = mat(cos(theta), sin(theta), a; -r sin(theta), r cos(theta), 0) \
    (D Phi)^T (D Phi) = mat(cos^2(theta)+sin^2(theta)+a^2, -r cos(theta)sin(theta)+r sin(theta)cos(theta); -r sin(theta)cos(theta)+r cos(theta)sin(theta), r^2sin^2(theta)+r^2cos^2(theta)) = mat(1+a^2, 0; 0, r^2) \
    sqrt(det((D Phi)^T (D Phi))) = sqrt(r^2(1+a^2)) = r sqrt(1+a^2)
  $
  Which means that $dif sigma = r sqrt(1+a^2)$ and with $rho eq.triple 1$ we obtain that
  $
    m = integral_M rho dif sigma = integral_0^(2pi) integral_0^(h/a) r sqrt(1+a^2) dif r dif theta \
    a_1 = 1/m integral_M x rho dif sigma = 1/m integral_0^(2pi) integral_0^(h/a) (r cos(theta))r sqrt(1+a^2) dif r dif theta =1/m integral_0^(2pi) integral_0^(h/a) cos(theta)r^2 sqrt(1+a^2) dif r dif theta \
    a_2 = 1/m integral_M y rho dif sigma = 1/m integral_0^(2pi) integral_0^(h/a) (r sin(theta))r sqrt(1+a^2) dif r dif theta =1/m integral_0^(2pi) integral_0^(h/a) sin(theta)r^2 sqrt(1+a^2) dif r dif theta \
    a_3 = 1/m integral_M z rho dif sigma = 1/m integral_0^(2pi) integral_0^(h/a) a r r sqrt(1+a^2) dif r dif theta=1/m integral_0^(2pi) integral_0^(h/a) a r^2 sqrt(1+a^2) dif r dif theta
  $
]

#question()
Let $M subset.eq RR^n$ be an $n-1$-k-dimensional smooth manifold and we assu,e that there exists an open set $U subset.eq RR^(n-1)$ and a smooth function $f:U arrow RR$ such that $M=Gamma(f)$.\
We will prove that $ Vol(M) = integral_U sqrt(1+norm(gradient f)^2) dif x $

#proof[

]

#question()
Let $C_1 = {(x,y,z) in RR^3 bar x^2+y^2<=1}$ and $C_2 = {(x,y,z) in RR^3 bar x^2+z^2<=1}$ be two cylinders. We will calculate the area of the boundary of their intersection $M= boundary(C_1 inter C_2)$.

#solution[

]
