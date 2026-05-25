#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#import "@preview/cetz:0.5.0": canvas, draw
#show: article_en.with(
  title: [ Solution to Exercise 06 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
#subquestion()
Let $M subset.eq RR^d$ be a $C^r$ manfiold of dimension $m$, let $p in M$ and let $phi_i : U_i arrow M$ for $i in {1, 2}$ be two local
parameterizations around $p$.\
We will show that $im (D phi_1)_(phi_1^(−1)(p)) = im (D phi_2)_(phi_2^(−1)(p))$.

#proof[
  Let
  $ u_1 = phi_1^(-1)(p) quad u_2 = phi_2^(-1)(p) $
  Since $phi_1, phi_2$ are local parameterizations around $p$ the transition map $tau = phi_2^(-1) compose phi_1$ is well defined and of class $C^r$ on a neighborhood of $u_1$ and $phi_1 = phi_2 compose tau$.\
  From the chain rule at $u_1$ is get that
  $ (D phi_1)|_(u_1) = (D phi_2)|_(u_2) compose (D tau)|_(u_1) $
  So for each $v in RR^m$ we have
  $ (D phi_1)|_(u_1)(v) = (D phi_2)|_(u_2)((D tau)|_(u_1)(v)) $
  Hence every vector in $im((D phi_1)|_(u_1))$ is in  $im((D phi_2)|_(u_2))$ which means $im((D phi_1)|_(u_1)) subset.eq im((D phi_2)|_(u_2))$.\
  If we reverse the roles of $phi_1$ and $phi_2$ we get the $supset.eq$ hence $im (D phi_1)_(phi_1^(−1)(p)) = im (D phi_2)_(phi_2^(−1)(p))$.
]

#subquestion()
We will conclude from section a that if $M, N subset.eq RR^d$ are two manifolds of dimensions $m$ and $n$ respectively then $M$ intersect
$N$ transversally at $p in M inter N$ if and only if there exist two local parameterizations around $p in M inter N$ , $phi : U arrow RR^d,
psi : V arrow RR^d$ in $M$ and $N$ respectively such that $im (D phi)_(phi^(−1)(p)) + im (D psi)_(psi^(−1)(p)) = RR^d$.

#proof[
  $==>$ Assume that $M$ intersect $N$ transversally at $p in M inter N$.\
  This direction is purly from the definition we gave in the recitation: we defined as the following
  Let $M, N subset.eq RR^d$ be two manifold of dimensions $m$ and $n$ respectively. We say that $M$ intersects $N$ transversally at
  $p in M inter N$ if every two local parameterizations around $p$, $phi : U arrow RR^d, psi : V arrow RR^d$ where $U subset.eq RR^m, V subset.eq RR^n$ are open sets, satisfy
  $ im(D phi)_(phi^(−1) (p)) + im(D psi)_(psi^(−1) (p)) = RR^d $
  And we saied that $M$ intersects $N$ transversally
  and we denote $M ⋔ N$ if they intersect transversally at every $p in M inter N$.\
  So this direction is purly from definition.\
  $<==$ Assume that there exist local parametrizations $phi : U arrow RR^d, psi: V arrow RR^d$ such that
  $ im((D phi)|_(phi^(-1)(p)))+im((D psi)|_(psi^(-1)(p)))=RR^d $
  From the previous section, we proved that the image of the differential of a local parametrization at $p$ is strictly independent of the parametrization chosen. Therefore, these images uniquely define the tangent spaces
  $ T_p M = im (D phi)_(phi^(-1)(p)) quad "and" quad T_p N = im (D psi)_(psi^(-1)(p)) $
  So from our assumption we get
  $ T_p M + T_p N = RR^d $
  This is exactly the definition of $M$ and $N$ intersecting transversally at $p$.
]

#question()
#subquestion()
Let $f : RR arrow RR$ be a smooth function and let $p in Gamma (f) = {(x, f (x)) : x in R} subset.eq RR^2$.\
For every $v$ in $RR^2$ we consider the set $L_v = {p + t v : t in RR}$.\
We will show that $L_v$ is a manifold and find all $L_v$ such that $L_v$ and $Gamma (f)$ intersect transversally at $p$.

#proof[
  Let $p = (x_0, f(x_0)) in Gamma(f)$ and let $v = (v_1, v_2) in RR^2$.
  If $v=(0,0)$ then $L_v = {p}$ which is a single point and trivially a 0-dimensional manifold.\
  Otherwise, assume $v != (0,0)$ so we can define a global parametrization $phi : RR arrow RR^2$ by $phi(t) = p + t v$.\
  We need to show that this is a local parametrization so we need to show that the domain is open, verify the image, continuity and smoothness and show that it has full rank differential.\
  Indeed, the domain is $RR$ which is open and $im(phi)=L_v$ and $phi$ is an affine transformation which is $C^infinity$.\
  We have that $phi$ is a continuous bijection onto $L_v$ and its inverse is (up to a scalar) the dot product with $v$ which is continuous thus $phi$ is a homeomorphism onto its image.\
  Last, we have $D phi_t = mat(v_1; v_2)$ and since $v!=0$ this has full rank hence the differential is injective.\
  So, $L_v$ is indeed a $1$-dimensional $C^infinity$ manifold for $v!=0$.\
  We need to find all $L_v$ such that $L_v$ intersects $Gamma(f)$ transversally at $p$.\
  The graph $Gamma(f)$ has a global parametrization $alpha(x) = (x, f(x))$. Its differential at $x_0$ is the column vector $D alpha_(x_0) = mat(1; f'(x_0))$. Hence
  $ T_p Gamma(f) = Span { (1, f'(x_0)) } $
  If $v = 0$, then $L_v$ is a 0-manifold and $T_p L_0 = {0}$. The sum of the tangent spaces would just be $T_p Gamma(f)$, which is 1-dimensional and cannot span $RR^2$. Thus, we must have $v != 0$.\
  If $v != 0$, using the parametrization $phi(t) = p + t v$, the differential at $t=0$ is exactly the direction vector $v$. Thus
  $ T_p L_v = Span{ v } = Span{ (v_1, v_2) } $
  For the sum of these two 1-dimensional subspaces to be the entire 2-dimensional space $RR^2$, their spanning vectors must be linearly independent. Two vectors in $RR^2$ are linearly independent if and only if the determinant of the matrix they form is non-zero
  $ det mat(1, v_1; f'(x_0), v_2) != 0 <==> 1 dot.op v_2 - v_1 dot.op f'(x_0) != 0 <==> v_2 != v_1 f'(x_0) $
  Therefore, $L_v$ and $Gamma(f)$ intersect transversally at $p$ if and only if $v != 0$ and $v$ is not a scalar multiple of $(1, f'(x_0))$.
]

#subquestion()
Let $S^n = {x in RR^(n+1) : norm(x) = 1}$ and for $t in R$ let $H_t = {x in RR^(n+1) : x_(n+1) = t}$. We will prove that $H_t$ is a manifold and find all $t in R$ such that $H_t ⋔ S^n$.

#proof[
  $H_t$ is a manifold because if we look at $f:RR^(n+1) arrow RR$ defined by $f(x)=x_(n+1)-t$ we get a $C^infinity$ function and its differential is the constant $1 times (n+1)$ matrix $D f_x = mat(0, dots.h, 0, 1)$ with a full rank at all points $x in RR^(n+1)$.\
  By the definition of manifold as the null set of a system of equations we saw in the recitation, the pre-image $f^(-1)(0) = H_t$ is a smooth manifold of dimension $(n+1) - 1 = n$.\
  By definition, $H_t$ and $S^n$ intersect transversally if for every $p in H_t inter S^n$, their tangent spaces span the ambient space
  $ T_p H_t + T_p S^n = RR^(n+1) $
  First, we identify the tangent spaces at an intersection point $p$.
  #todo
]

#question()
#subquestion()
Let $M, N subset.eq RR^d$ be $C^r$ manifolds of dimensions $m$ and $n$ respectively. We will prove that $M times N subset.eq RR^d times RR^d = RR^(2d)$ is a $C^r$ manifold of dimension $m + n$.

#proof[
  Let $(p, q) in M times N$.\
  Because $M$ is a $C^r$ manifold of dimension $m$ in $RR^d$, there exists an open set $U subset.eq RR^m$, an open neighborhood $W_1 subset.eq RR^d$ of $p$, and a $C^r$ local parametrization $phi : U arrow M inter W_1$ such that the differential $D phi_x$ is injective for all $x in U$.\
  Similarly, because $N$ is a $C^r$ manifold of dimension $n$ in $RR^d$, there exists an open set $V subset.eq RR^n$, an open neighborhood $W_2 subset.eq RR^d$ of $q$, and a $C^r$ local parametrization $psi : V arrow N inter W_2$ such that the differential $D psi_y$ is injective for all $y in V$.\
  We look at the function $Phi : U times V arrow RR^(2d)$ defined by
  $ Phi(x, y) = (phi(x), psi(y)) $
  We need to verify that $Phi$ is a valid local parametrization for $M times N$ around $(p,q)$ so we need to show that the domain is open, verify the image, continuity and smoothness and show that it has full rank differential.\
  We know that $U times V$ is open set in $RR^(m+n)$ since product of open sets is open.\
  The image of $Phi$ is $phi(U) times psi(V) = (M inter W_1) times (N inter W_2) = (M times N) inter (W_1 times W_2)$ and since $W_1 times W_2$ is open set in $RR^(2d)$ that contains $(p,q)$ $Phi$ maps onto an open neighborhood of $(p, q)$ in the subspace topology of $M times N$. Furthermore, because the Cartesian product of two homeomorphisms is a homeomorphism, $Phi$ is a homeomorphism onto its image and each of the coordinates of $Phi$ is of class $C^r$ so this is also smooth.\
  We need to show that it has $D Phi$ is of full rank, we have
  $ D Phi_((x, y)) = mat(D phi_x, 0; 0, D psi_y) $
  But since $D phi_x$ has full rank of $m$ and $D psi_y$ has full rank of $n$ the block matrix $D Phi_((x, y))$ has full column rank $m + n$. Thus, the differential is injective everywhere in $U times V$.\
  We constructed a local parametrization around any $(p,q)$ hence $M times N$ is a $C^r$ manifold of dimension $m + n$.
]

#subquestion()
Denote $Delta = {(x, y) in RR^d times RR^d : x = y}$. We will prove that $Delta subset.eq RR^(2d)$ is a manifold of dimension $d$.

#proof[
  We can prove this immediately by observing that the diagonal $Delta$ is simply the graph of a smooth function.\
  Define the identity function $f : RR^d arrow RR^d$ by $f(x) = x$, the domain of $f$ is $RR^d$ (which is open), and $f$ is a smooth $C^r$ function.\
  By definition, the graph of $f$ is:
  $ Delta = Gamma(f) = {(x, f(x)) : x in RR^d} = {(x, x) : x in RR^d} $
  We saw at exercise 5 that the graph of any $C^r$ function $f: U subset RR^d arrow RR^k$ is a $C^r$ manifold of dimension $d$. Therefore, $Delta$ is a $C^r$ manifold of dimension $d$.
]

#subquestion()
We will prove that $M ⋔ N$ if and only if $M times N ⋔ Delta$.

#proof[
  #todo.
]
