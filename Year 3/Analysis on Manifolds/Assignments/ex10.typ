#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 10 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()

#question()
Let $U subset.eq RR^3$ be an open set and let $F:U arrow RR^3$ be a vector field. For $p in U$ we will show that
$ op("Curl") F = lim_(r arrow 0) frac(1, abs(B_r (p))) integral_boundary(B_r (p)) (N times F) dif sigma $
Where $N$ is the outward pointing unit normal of $B_r (p)$.

#proof[
  Let $c=(c_1, c_2, c_3) in RR^3$ from the integral linearity we have
  $
    c dot.op integral_boundary(B_r (p)) (N times F) dif sigma = integral_boundary(B_r (p)) c dot.op (N times F) dif sigma
  $
  We have the scalar triple product identity to get that $c dot.op (N times F) = (F times c) dot.op N$ so we have the vector field $G = F times c$ and now we can use the Divergence Theorem
  $
    integral_boundary(B_r (p)) c dot.op (N times F) dif sigma = integral_boundary(B_r (p)) (F times c) dot.op N dif sigma = integral_(B_r (p)) divergence (F times c) dif x
  $
  We compute $divergence(F times c)$, we use the identity
  $ divergence(A times B)=B dot.op divergence(A)-A dot.op divergence(B) $
  We can prove it but I think Dan showed that in the lecture anyway this is pure algebraic and from definitions.\
  In our case, $B=c$ so $divergence(B)=0$ and we have
  $ divergence(F times c)=c dot.op divergence(F) = c dot.op op("Curl") F $
  Finally we have
  $
    integral_boundary(B_r (p)) c dot.op (N times F) dif sigma = integral_(B_r (p)) c dot.op op("Curl") F dif x = c dot.op integral_(B_r (p)) op("Curl") F dif x
  $
  So we got
  $ c dot.op integral_boundary(B_r (p)) (N times F) dif sigma = c dot.op integral_(B_r (p)) op("Curl") F dif x $
  But this is true for every vector which means that
  $ integral_boundary(B_r (p)) (N times F) dif sigma = integral_(B_r (p)) op("Curl") F dif x $
  Which actually means since $op("Curl")F$ is continuous
  $
    lim_(r arrow 0) frac(1, abs(B_r (p))) integral_boundary(B_r (p)) (N times F) dif sigma = lim_(r arrow 0) frac(1, abs(B_r (p))) integral_(B_r (p)) op("Curl") F dif x =_"Mean Value Theorem" lim_(x_r arrow p ) op("Curl")F(x_r) = op("Curl")F(p)
  $

]

#question()
Let $0<k<d$ and we assume that $M subset.eq RR^d$ is a $k$-dimensional manifold with boundary. We will prove that $boundary(M)$ is
$(k − 1)$-dimensional manifold without boundary.

#proof[
  Since $M$ is a $k$-dimensional manifold for every $p in M$ there exists an open neighborhood $p in U subset.eq RR^d$ and a diffeomorphism \
  $phi : U inter M arrow V subset.eq H^k colon.eq {(x_1, dots.h, x_k) in RR^k bar x_k >=0}$.\
  Assume that $p in boundary(M)$ by definition of the boundary of a manifold with boundary, we may assume (after possibly shrinking $U$) that
  $ phi((U inter M) inter boundary(M))=V inter boundary(H^k) $
  Where
  $ boundary(H^k) = {(x_1, dots.h, x_k) in RR^k bar x_k = 0} $
  We consider $psi colon.eq phi|_(U inter boundary(M)) : U inter boundary(M) arrow V inter boundary(H^k)$ and since $phi$ is a diffeomorphism, $psi$ is a homeomorphism onto its image. \
  Since $V inter boundary(H^k)$ is open in $boundary(H^k)$, there exists an open set $W subset.eq RR^k$ such that $V=W inter H^k$ therefore
  $ V inter boundary(H^k) = (W inter H^k) inter boundary(H^k)=W inter boundary(H^k) $
  Which is open in $boundary(H^k)$ and we define the map $pi:boundary(H^k) arrow RR^(k-1)$ by $pi(x_1, dots.h, x_(k-1), 0)=(x_1, dots.h, x_(k-1))$ which is diffeomorphism, hence $pi compose psi : U inter boundary(M) arrow pi(V inter boundary(H^k))$ is a homeomorphism onto an open subset of $RR^(k-1)$.\
  Thus every point $p in boundary(M)$ possesses a neighborhood in $boundary(M)$ that is diffeomorphic to an open subset of $RR^(k-1)$ which means that $boundary(M)$ is a $(k-1)$-dimensional manifold.\
  Furthermore, since $V inter {x_k = 0} tilde.equiv RR^(k-1)$ the manifold is without a boundary.
]

#question()

#question()

#question()
Let $S^2 subset.eq RR^3$ and denote by $psi : (0,pi) times (0, 2pi) arrow S^2$ the spherical coordinates $psi(theta, phi.alt) = (sin(theta) cos(phi.alt), sin(theta)sin(phi.alt), cos(theta))$.\
Let $gamma : [0,1] arrow S^2$ be a smooth path $gamma(t)=psi(theta(t), phi.alt(t))$.\
We will show that
$ l(gamma) = integral_0^1 (dot(theta)^2 (t) + dot(phi.alt)^2 (t)sin^2(theta(t)))^frac(1, 2) dif t $

#solution[
  We know that
  $ l(gamma) = integral_0^1 norm(dot(gamma)(t)) dif t $
  So using the chain rule we have
  $ dot(gamma)(t) = frac(partial psi, partial theta) dot(theta) + frac(partial psi, partial phi.alt) dot(phi.alt) $
  We have
  $
    frac(partial psi, partial theta) = (cos(theta)cos(phi.alt), cos(theta)sin(phi.alt), -sin(theta)) \
    frac(partial psi, partial phi.alt) = (-sin(theta)sin(phi.alt), sin(theta)cos(phi.alt), 0)
  $
  We notice that
  $
    chevron.l frac(partial psi, partial theta), frac(partial psi, partial phi.alt) chevron.r = -cos(theta)cos(phi.alt)sin(theta)sin(phi.alt) + cos(theta)sin(phi.alt)sin(theta)cos(phi.alt) + 0 = 0
  $
  Which mean that if we set $"e"_1 =frac(partial psi, partial theta), "e"_2 = frac(partial psi, partial phi.alt)$ they form an orthogonal basis for the tangent space so we compute
  $
    norm("e"_1)^2 = cos^2(theta)cos^2(phi.alt)+cos^2(theta)sin^2(phi.alt) + sin^2(theta) = cos^2(theta)underbrace((cos^2(phi.alt)+sin^2(phi.alt)), = 1) + sin^2(theta) = cos^2(theta)+sin^2(theta) = 1 \
    norm("e"_2)^2 = sin^2(theta)sin^2(phi.alt)+sin^2(theta)cos^2(phi.alt) = sin^2(theta)underbrace((sin^2(phi.alt)+cos^2(phi.alt)), =1) = sin^2(theta)
  $
  We remember that $norm(v)^2 = chevron.l v,v chevron.r$  so in our case $v=dot(theta) "e"_1 + dot(phi.alt)"e"_2$ so from identity in Functional calculate we will have
  $
    norm(dot(theta)"e"_1 + dot(phi.alt)"e"_2)^2 = dot(theta)^2 chevron.l "e"_1, "e"_1 chevron.r + 2 dot(theta)dot(phi.alt) chevron.l "e"_1, "e"_2 chevron.r + dot(phi.alt)^2 chevron.l "e"_2, "e"_2 chevron.r =_(chevron.l "e"_1, "e"_1 chevron.r = norm("e"_1)^2) dot(theta)^2 norm("e"_1)^2 + 2 dot(theta)dot(phi.alt) chevron.l "e"_1, "e"_2 chevron.r + dot(phi.alt)^2 norm("e"_2)^2 =_(chevron.l "e"_1, "e"_2 chevron.r = 0)norm("e"_1)^2) dot(theta)^2 norm("e"_1)^2 + dot(phi.alt)^2 norm("e"_2)^2
  $
  So from the above we get that
  $ norm(dot(gamma)(t))^2 = dot(theta)^2 + dot(phi.alt)^2 sin^2(theta) $
  Since $gamma :[0,1] arrow S^2$ all that is left is taking the square root to achieve the wanted result.
]
