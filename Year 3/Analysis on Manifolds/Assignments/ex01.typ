#import "../../../src/article.typ": *
#show: article.with(
  title: [ Solution to Exercise 1 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)
#let Adj = math.op("Adj")
#let adj = math.op("adj")
#let GL = math.op("GL")

#question()
#subquestion()
Let $gamma : [a,b] arrow RR^n$ be a parametrized curve.\
We will show that $gamma''(t) = 0$ for all $t in [a,b]$ if and only if there exist $p_0, v_0 in RR^n$ such that $gamma(t)=p_0 + t v_0$.

#proof[ since $gamma$ is a parametrized curve we can write it as $gamma(t) = (gamma_1 (t), gamma_2 (t), dots.h, gamma_n (t))$ when each $gamma_i (t)$ is a component.\
  $==>$ Assume that $gamma''(t) = 0$ for all $t in [a,b]$.\
  By our assumption, $gamma''_i (t) = 0$ for all $i in [n]$ and hence from The Fundamental theorem of calculus we get by integration for each component that $gamma'_i (t) = c_i$ for $c_i in RR$.\
  We use again The Fundamental theorem of calculus and we get $gamma_i (t) = c_i t + d_i$ for $d_i in RR$.\
  By substitute these components we get $gamma (t)= (c_1 t + d_1, c_2 t + d_2, dots.h, c_n t + d_n) = (d_1, d_2, dots.h, d_n) + t(c_1, c_2, dots.h, c_n)$ and we can choose $p_0 = (d_1, d_2, dots.h, d_n), v_0 = (c_1, c_2, dots.h, c_n)$ and we get that $gamma(t) = p_0 + t v_0$.\
  $<==$ Assume that there exists $p_0, v_0 in RR^n$ such that $gamma(t)=p_0 + t v_0$.\
  We can differentiate $gamma(t)$ with respect to $t$ and we remember that a derivative os a constant vector is the zero vector
  $ gamma'(t) = dif/(dif t) (p_0 + t v_0) = v_0 $
  Since $v_0$ is a constant vector we can differentiate again and we will get that $ gamma'' (t) = dif/(dif t) (v_0) = 0 $
  And that is true for all $t in [a,b]$.
]

#subquestion()
Let $gamma: [a,b] arrow RR^n$ be a parametrized curve such that for all $t in [a,b]$, $gamma(t) !=0$.\
Let $t_0 in [a,b]$ be such that the point $gamma(t_0)$ is the closest to the origin on the image of $gamma$.\
We will show that $gamma(t_0) perp gamma'(t_0)$.

#proof[
  We need to show that $gamma(t_0) dot.op gamma'(t_0) = 0$.\
  We know that the distance from the origin to any point on the curve $gamma(t)$ is given by its magnitude, $norm(gamma(t))$, so we will define
  $ f(t) = norm(gamma(t))^2 = gamma(t) dot.op gamma(t) $
  We know that under power minimum and maximum are preserved and the last equals is from Linear Algebra.\
  Furthermore, since we know that for all $t in [a,b]$, $gamma(t) !=0$ we know that for all $t in [a,b]$, $f(t) !=0$.\
  To find the minimum distance, using the product rule for dot products we will get
  $
    f'(t) = dif/(dif t) (gamma(t) dot.op gamma(t)) = gamma'(t) dot.op gamma(t) + gamma(t) dot.op gamma'(t) = 2(gamma(t) dot.op gamma'(t))
  $
  When the last equals is true since that dot product is commutative.\
  Since by our assumption, $t_0$ is the point such that $gamma(t_0)$ is the closest to the origin, we get that at $t_0$, $f(t)$ reaches its absolute minimum and by Fermat's Theorem we know that if a differentiable function reaches a local minimum/maximum at interior point, its derivative at that point is zero, hence $ f'(t_0) = 0 = 2(gamma (t_0) dot.op gamma'(t_0)) ==> gamma (t_0) dot.op gamma'(t_0) = 0 $
  Let us construct a counterexample for the case that $t_0 in {a, b}$ and for $n=1$: Let $gamma(t) = t + 1$ for $t in [0, 1]$, then $gamma'(t) = 1$ for $t = 0$, which lays at the closest point of the curve to the origin.
]

#pagebreak()

#subquestion()
Let $gamma : [a,b] arrow RR^n$ be a parametrized curve. We will show that there exists $c in RR$ such that forall $t in [a,b]$, $abs(gamma'(t))=c$ if and only if for all $t in [a,b]$, $gamma'(t) perp gamma(t)$.

#proof[
  #todo
]

#question()
In Calculus 3 we prove The Inverse Function Theorem: Let $U subset.eq RR^n$ be an open set and let $f in C^r (U, RR^n)$ for $r in NN$.\
We assume that there exists $p in U$ such that $(D f)_p$ is invertible, then there exists a neighborhood $p in W subset.eq U$ such that $f scripts(harpoon.tr)_W : W arrow f(W)$ is invertible and such that $f^(-1) scripts(harpoon.tr)_(f(W)) in C^1 (f(W), W)$.\
In this question we will prove by induction that if $f in C^r$ for $r in NN$ then so is $f^(-1)$.

#subquestion()
We will use the identity $f^(-1) compose f = id$ to show that if $f, f^(-1)$ are differentiable then for all $x in W$, $(D f^(-1))_(f(x)) = ((D f)_x)^(-1)$.

#proof[
  Let $x in W$, from the identity
  $ (star) space (f^(-1) compose f)(x) = f^(-1)(f(x)) = x = id(x) $
  We will differentiate both side:\
  For the left side from the Chain Rule we get:
  $ D(f^(-1) compose f)_x = (D f^(-1))_(f(x)) (D f)_x $
  And for the right side we know that in $RR^n$, the derivative of the identity function is the $n times n$ the identity matrix, so $D(id)_x = I_n$.\
  With $(star)$ we will get that $(D f^(-1))_(f(x)) (D f)_x = I_n$.\
  Since $f, f^(-1)$ are differentiable, from the Inverse Function Theorem we know that $(D f)_x$ is an invertible square matrix.\
  From Linear Algebra we know that if the product of two square matrices equals the identity matrix then those matrices are inverses of one another.\
  In out case it means we can multiple both side on the right by $((D f)_x)^(-1)$ and we will get
  $ (D f^(-1))_(f(x)) (D f)_x ((D f)_x)^(-1) = I_n ((D f)_x)^(-1) <==> (D f^(-1))_(f(x))=((D f)_x)^(-1) $
]

#subquestion()
We will use the identity $forall A in GL_n (RR), space A^(-1) = 1/(det(A)) Adj(A)$ to prove that the function $i : GL_n (RR) arrow GL_n (RR)$ define by $i(A) = A^(-1)$ is smooth.

#proof[
  _Reminder:_
  $ adj(A)_(i,j) = (-1)^(i+j) abs(M_(j,i))=(-1)^(i+j) abs(M_(i,j)^T) $
  We can identity the space of all $M_n (RR)$ with the Euclidean vector space, $RR^(n^2)$.\
  We know that the determinant is a continuous function and even a smooth since it is sum of products.\
  Since $GL_n (RR)$ is the set of all matrices in $M_n (RR)$ where $det(A) !=0$, we can use the determinant function to get that $GL_n (RR)$ is the preimage of the open set $RR without {0}$, hence $GL_n (RR)$ is an open subset of $RR^(n^2)$.\
  Furthermore, every single entry of $Adj(A)$ is a polynomial in the variables $a_(i, j)$ and polynomials are smooth functions so $A mapsto Adj(A)$ is smooth.\
  Since $A in GL_n (RR)$, we can define $f(x)=1/x$ which is smooth for all $x!=0$, therefore the composition $1/det(A)$ is also smooth.
  Using the given identity, we can get:
  $ i(A)_(i, j) = (A^(-1))_(i, j) = (Adj(A)_(i,j))/det(A) $
  The numerator is a polynomial hence smooth and the denominator is a non-zero polynomial hence smooth so their product is also a smooth function.\
  This is true for every coordinate $i,j$ so this is true for the entire matrix-valued function $i(A) = A^(-1)$ so it is smooth, which is what we wanted to prove.
]

#subquestion()
We will show by induction that if $f in C^r (U, RR^n)$ then $f^(-1) scripts(harpoon.tr)_(f(W)) in C^r (f(W), W)$.

#proof[
  Assume $f in C^1 (U, RR^n)$.\
  By The Inverse Function Theorem we already know that the local inverse $g$ exists and is continuously differentiable. Therefore, $g in C^1(f(W), W)$ and the base case holds.\
  Assume the statement holds for some integer $r=k>=1$ - that is, if any function is in $C^k$, its local inverse is also in $C^k$.\
  We now assume $f in C^(k+1)(U, RR^n)$ and we must prove that $g in C^(k+1)(f(W), W)$.\
  From the previous steps, we know that for $y in f(W)$ we have
  $ D g_y = (D f_(g(y)))^(-1) $
  Let $i:GL_n (RR) arrow GL_n (RR)$ given by $i(A) = A^(-1)$ and we will get
  $ D g = i compose D f compose g $
  One should notice:
  + Since $f in C^(k+1)$ we get the $f in C^k$, and by the inductive hypothesis, $g in C^k$
  + Since $f in C^(k+1)$, $D f in C^k$
  + From the previous step we know that $i$ is a smooth function and hence $i in C^k$
  By the chain rule we get that the composition of $C^k$ functions is also a $C^k$ function and from the above, $g, D f$ and $i$ are all at least $C^k$ functions and hence their composition $D g$ is also in $C^k$.\
  By definition, if the first derivative of a function is $C^k$, the original function must be $C^(k+1)$ therefore $g in C^(k+1)$ and we are done.
]

#question()
Let $U subset.eq RR^n$ be an open set, $gamma : [a,b] arrow RR^n$ be a regular smooth curve and let $f:U arrow RR$ be a continuous function.

#subquestion()
We will show that for every $epsilon > 0$ there exists $delta > 0$ such that for all $a<=s<c<t<=b$
$ abs(t-s)<delta ==> norm(gamma'(c)(t-s)-(gamma(t)-gamma(s)))<epsilon $

#proof[
  We will use the given hint.\
  As we did in the first question, since $gamma$ is a parametrized curve in $RR^n$ we can write it as $gamma(t) = (gamma_1 (t), dots.h, gamma_n (t))$.\
  By the Lagrange Mean Value Theorem to each component $gamma_i$ on $[s,t]$, for each $i$ there exists $c_i in (s,t)$ such that
  $ gamma_i (t) - gamma_i (s) = gamma'_i (c_i)(t-s) $
  so
  $ gamma(t)-gamma(s) = (gamma'_1 (c_1)(t-s), dots.h, gamma'_n (c_n)(t-s)) $
  So if we compare $gamma'(c)(t-s)-(gamma(t)-gamma(s))$ componentwise we get
  $ ((gamma'_1(c)-gamma'_1(c_1)))(t-s), dots.h, (gamma'_n(c)-gamma'_n(c_n)))(t-s)) $
  From the hint, $norm(x)<=sum_(i=1)^n abs(x_i)$ so
  $
    (star) norm(gamma'(c)(t-s)-(gamma(t)-gamma(s)))<=sum_(i=1)^n abs((gamma'_i (c)-gamma'_i (c_i))(t-s)) = abs(t-s) sum_(i=1)^n abs(gamma'_i (c)-gamma'_i (c_i))
  $
  Since $gamma$ is smooth we get that $gamma'$ is continuous on $[a,b]$ and from Cantor Theorem we can that $gamma'$ is uniformly continuous.\
  So for every $epsilon > 0$ there exists $delta > 0$ such that
  $ abs(t-s) <delta ==> abs(gamma'_i (c) - gamma'_i (c_i)) < epsilon/(n(b-a)) $
  From $(star)$ and since $abs(t-s)<=b-a$ we will get
  $
    norm(gamma'(c)(t-s)-(gamma(t)-gamma(s)))< abs(t-s) dot.op n dot.op epsilon/(n(b-a)) = abs(t-s) dot.op epsilon/(b-a) <= epsilon
  $
]

#subquestion()
For every partition of $P = {a = t_0 < t_1 < dots.h.c < t_k = b}$ of $[a,b]$ and a choice of intermediate points $c_i in [t_(i-1), t_i]$ where $1<=i<=k$ we define the mesh of the partition $Mesh(P)=max_(1<=i<=k) norm(gamma(t_i) - gamma(t_(i-1)))$ and the Riemann sum
$ S_gamma (f, P, {c_i}_(i=1)^k)=sum_(i=1)^k f(gamma(c_i)) norm(gamma(t_i)-gamma(t_(i-1))) $
We also denote by $h:[a,b] arrow RR$ the function $h(t)=f(gamma(t))norm(gamma'(t))$ and
$ S(h, P, {c_i}_(i=1)^k)=sum_(i=1)^k h(c_i) (t_i - t_(i-1)) $
We will show that for every $epsilon > 0$ there exists $delta > 0$ such that if $Mesh(P) < delta$ then $ abs(S_gamma (f, P, {c_i}_(i=1)^k)-S(h, P, {c_i}_(i=1)^k))<epsilon $

#proof[
  #todo
]

#subquestion()
We will conclude that for every $epsilon > 0$ there exists $delta > 0$ such that if $Mesh(P) < delta$ then $ abs(S_gamma (f, P,{c_i}_(i=1)^k - integral_gamma f dif s))<epsilon $

#proof[
  #todo
]
