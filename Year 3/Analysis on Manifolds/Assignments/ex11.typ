#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 11 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
Let $S^2 = {(x,y,z) in RR^3 bar x^2+y^2+z^2=1}$ and we consider the following local parametrization for the upper hemisphere of $S^2$ given by $phi:DD arrow S^2$ with $phi(x, y) = (x,y,sqrt(1-x^2-y^2))$ where $DD={(x,y) in RR^2 bar x^2+y^2 < 1}$.

#subquestion()
We will calculate the tangent plane $T_(phi(x_0, y_0)) S^2$ where $(x_0, y_0) in DD$.

#solution[
  Using the chain rule
  $
    frac(partial, partial x) sqrt(1-x^2-y^2) = frac(1, 2sqrt(1-x^2-y^2)) dot.op (-2x) = frac(-x, sqrt(1-x^2-y^2)) \
    frac(partial, partial y) sqrt(1-x^2-y^2)=frac(-y, sqrt(1-x^2-y^2))
  $
  Therefore
  $
    phi_x (x,y) = (1,0, frac(-x, sqrt(1-x^2-y^2))) \
    phi_y (x,y) = (0,1, frac(-y, sqrt(1-x^2-y^2)))
  $
  Let $(x_0, y_0) in DD$ and $z_0 = sqrt(1-x_0^2-y_0^2)$ so the two tangent vectors that form the basis for $T_p S^2$ are
  $
    v_1 = phi_x (x_0, y_0) = (1,0,-frac(x_0, z_0)) \
    v_2 = phi_y (x_0, y_0) = (0,1,-frac(y_0, z_0))
  $
  So from definition
  $ T_(phi(x_0, y_0)) S^2 = Span{v_1, v_2} = {a(1,0,-frac(x_0, z_0))+b(0,1,-frac(y_0, z_0))} $
  This is from the definition of the tangent space $T_p S^2$ as the $2$-dimensional vector subspace of $RR^3$ spanned by these basis vectors
]

#subquestion()
We will calculate the tangent vectors $partial_x scripts(harpoon.tr)_(phi(x_0, y_0)), partial_y scripts(harpoon.tr)_(phi(x_0, y_0)) in T_(phi(x_0, y_0)) S^2$.

#solution[
  From the previous step
  $
    partial_x |_(phi(x_0, y_0)) = vec(1, 0, -frac(x_0, 1-x_0^2-y_0^2)) \
    partial_y |_(phi(x_0, y_0)) = vec(0, 1, -frac(y_0, 1-x_0^2-y_0^2))
  $
]

#subquestion()
We will calculate $norm(partial_x scripts(harpoon.tr)_(phi(x_0, y_0)))^2, norm(partial_y scripts(harpoon.tr)_(phi(x_0, y_0)))^2$ and $chevron.l partial_x scripts(harpoon.tr)_(phi(x_0, y_0)), partial_y scripts(harpoon.tr)_(phi(x_0, y_0)) chevron.r$, we will find if $partial_x scripts(harpoon.tr)_(phi(x_0, y_0)) perp partial_y scripts(harpoon.tr)_(phi(x_0, y_0))$, can we explain the sign of $chevron.l partial_x scripts(harpoon.tr)_(phi(x_0, y_0)), partial_y scripts(harpoon.tr)_(phi(x_0, y_0)) chevron.r$ using a drawing?

#solution[
  We use the denotions from before
  $ partial_x = (1,0,-frac(x_0, z_0)), quad partial_y = (0,1,-frac(y_0, z_0)) $
  Hence
  $ norm(partial_x)^2 = 1^2+0^2 + (-frac(x_0, z_0))^2 = 1 + frac(x_0^2, z_0^2) $
  We know that $z_0^2=1-x_0^2-y_0^2$ therefore
  $ norm(partial_x)^2 = frac(z_0^2+x_0^2, z_0^2) = frac(1-x_0^2-y_0^2+x_0^2, z_0^2) = frac(1-y_0^2, 1-x_0^2-y_0^2) $
  From symmetry
  $ norm(partial_y)^2 = frac(1-x_0^2, 1-x_0^2-y_0^2) $
  For the inner product
  $
    chevron.l partial_x, partial_y chevron.r = 1 dot.op 0 + 1 dot.op 0 + (-frac(x_0, z_0)) (-frac(y_0, z_0)) = frac(x_0 y_0, 1-x_0^2-y_0^2)
  $
  We can see that the two vectors will be orthogonal if and only if $x_0 y_0 = 0$ which means $x_0 = 0$ or $y_0 = 0$.\
  Since the denominator is always positive the sign of the inner product is determined only by the numerator $x_0 y_0$ and dot product is also equal to $norm(v_1) norm(v_2) cos(theta)$ so if the dot product is positive, $cos(theta)>0$ which means that the angle is less than $90^circle.small$ and if the dot product is negative, $cos(theta)<0$ so that angle is greater than $90^circle.small$ so we can indeed explain the sign of the inner product using a drawing (I don't know how to draw).
]

#question()
We call a function $F:RR^3 arrow RR^3$ a rigid motion of $RR^3$ if there exists an orthogonal linear map $L in M_3 (RR)$ with $det L = 1$ and a constant vector $c in RR^3$ such that $F(x) = L x + c$.\
In this question we will prove that two curves $alpha, overline(alpha) : I arrow RR^3$ have the same curvature and torsion $k, tau : I arrow RR$ if and only if there exists a rigid motion $F:RR^3 arrow RR^3$ such that $overline(alpha)=F compose alpha$.

#subquestion()
Let $alpha : I arrow RR^3$ be a smooth curve parametrized by arc length and let $F:RR^3 arrow RR^3$ be a rigid motion. Denote $overline(alpha) = F compose alpha$ and we will prove that $overline(alpha)$ is parametrized by arc length and that $overline(alpha)$ and $alpha$ have the same curvature and torsion.

#proof[
  Since $F$ is a rigid motion, Let $F(x) = L x + c$ where $L$ is an orthogonal matrix with $det L = 1$ and $c in RR^3$.\
  Since $L$ is a constant linear map and $c$ is a constant vector, we have $overline(alpha)^prime (s) = L alpha^prime (s)$.\
  Since $L$ is an orthogonal matrix, it preserves the standard inner product (and thus the Euclidean norm) of vectors, therefore
  $ abs(overline(alpha)^prime (s)) = abs(L alpha^prime (s)) = abs(alpha^prime (s)) $
  But $alpha$ is parameterized by arc length hence $abs(alpha^prime (s)) = 1$ thus $abs(overline(alpha)^prime (s)) = 1$ which means that $overline(alpha)$ is also parameterized by arc length.\
  From the recitation, the curvature is defined as $k(s) = abs(alpha^prime.double (s))$ and $overline(k)(s) = abs(overline(alpha)^prime.double (s))=abs(L(alpha^prime.double) (s))$.\
  As before, since $L$ is an orthogonal map we get that $abs(L(alpha^prime.double (s))) = abs(alpha^prime.double (s))$ therefore $k(s) = overline(k)(s)$ and the curvature is invariant.\
  For the torsion part we need to compute the normal and binormal vectors.\
  The unit normal is defined as
  $
    n(s) = frac(alpha^prime.double (s), abs(alpha^prime.double (s))), quad overline(n)(s) = frac(overline(alpha)^prime.double (s), abs(overline(alpha)^prime.double (s)))
  $
  The binormal vector is defined with the cross product
  $ b(s)=t(s) times n(s) quad overline(b)(s) = overline(t)(s) times overline(n)(s) = L(t(s)) times L(n(s)) $
  Since $L$ is orthogonal with a determinant of $1$ (it preserves orientation), it distributes over the cross product: $L(u) times L(v) = L(u times v)$ therefore $overline(b)(s) = L(t(s) times n(s)) = L(b(s))$.\
  Finally, from the recitation, torison is defined by
  $
    tau(s)= chevron.l b^prime (s), n(s) chevron.r quad overline(tau)(s) = chevron.l overline(b)^prime(s), overline(n)(s) chevron.r
  $
  Since $overline(b)(s) = L(b(s))$ and $L$ is constant, its derivative is $overline(b)^prime (s) = L(b^prime (s))$ which yield from the torison equation
  $ overline(tau)(s) = chevron.l L(b^prime (s)), L(n(s)) chevron.r $
  By definition, an orthogonal matrix preserves the inner product between any two vectors, meaning $chevron.l L(u), L(v) chevron.r = chevron.l u, v chevron.r$ therefore
  $ overline(tau)(s) = chevron.l b^prime (s), n(s) chevron.r = tau(s) $
  Which means the torsion is also preserved.
]

#subquestion()
Let $alpha, overline(alpha) : I arrow RR^3$ be two curves with the same curvature and torsion $k, tau : I arrow RR$. Let $s_0 in I$ and denote by $t_0, n_0, b_0$ and $overline(t_0), overline(n_0), overline(b_0)$ the tangent vector, te normal vector and the binormal vector to $alpha$ and $overline(alpha)$ at $s_0$.\
We will show that there exists an orthogonal map $L$ with $det L = 1$ that maps $x_0$ to $overline(x_0)$ for $x_0 in {t_0, n_0, b_0}$.

#proof[
  As we seen in the recitation, ${t_0, n_0, b_0}$ and ${overline(t_0), overline(n_0), overline(b_0)}$ both form positively oriented orthonormal bases for $RR^3$.\
  From Linear Algebra we know that there exists a unique linear transformation $L: RR^3 arrow RR^3$ that maps one basis exactly to another. Thus, we define $L$ such that $L(t_0) = overline(t_0)$, $L(n_0) = overline(n_0)$, and $L(b_0) = overline(b_0)$.\
  Since $L$ maps an orthonormal basis to another orthonormal basis, it preserves the standard inner product (and thereby lengths and angles which means the Euclidean Norm). This is the exact definition of an orthogonal matrix, so $L L^T = I$.\
  Furthermore, because both bases are positively oriented (their scalar triple products equal 1), the transformation preserves orientation. This requires the determinant of $L$ to be exactly 1, proving that $L in S O(3)$.
]

#pagebreak()

#subquestion()
We will prove that $ frac(dif, dif s)(norm(L(t)-overline(t))^2 + norm(L(n)-overline(n))^2 + norm(L(b)-overline(b))^2) = 0 $
Furteremore, we will deduce that $L$ mapsto $x$ to $overline(x) in {t,n,b}$.

#proof[
  Denote $D(s) = norm(L(t)-overline(t))^2 + norm(L(n)-overline(n))^2 + norm(L(b)-overline(b))^2$.\
  Since $L$ is a constant linear map we have $(L(x))^prime = L(x^prime)$ therefore with the chain rule
  $
    D^prime (s) = & 2 chevron.l L(t)-overline(t), L(t')-overline(t)' chevron.r + 2 chevron.l L(n)-overline(n), L(n')-overline(n)' chevron.r + 2 chevron.l L(b)-overline(b), L(b')-overline(b)' chevron.r
  $
  In the recitation we saw the following equations
  $
    t' = k n \
    n' = -k t - tau \
    b' = tau n
  $
  Because the curves have identical curvature and torsion by hypothesis, $k = overline(k)$ and $tau = overline(tau)$ so substituting back yields
  $
    1/2 D^prime (s) = chevron.l L(t)-overline(t), k L(n) - k overline(n) chevron.r + chevron.l L(n)-overline(n), -k L(t) - tau L(b) + k overline(t) + tau overline(b) chevron.r + chevron.l L(b)-overline(b), tau L(n) - tau overline(n) chevron.r \
    = k chevron.l L(t)-overline(t), L(n) - overline(n) chevron.r - k chevron.l L(n)-overline(n), L(t) - overline(t) chevron.r - tau chevron.l L(n)-overline(n), L(b) - overline(b) chevron.r + tau chevron.l L(b)-overline(b), L(n) - overline(n) chevron.r
  $
  Since the inner product is symmetric all the terms cancels therefore $D^prime (s) = 0$ as wanted.\
  Since the derivative is zero everywhere, $D(s)$ must be a constant function. From the previous subquestion, we know that at $s=s_0$, $L(t_0) = overline(t_0)$, $L(n_0) = overline(n_0)$, and $L(b_0) = overline(b_0)$, therefore $D(s_0) = 0$ which yields $D(s) = 0$ for all $s in I$ but it is a sum of non-negative squared norms which can be zero if and only if all elements are zero, therefore $L(t) = overline(t)$, $L(n) = overline(n)$, and $L(b) = overline(b)$ for all $s in I$.
]

#subquestion()
We will conclude that there exists a rigid motion $F:RR^3 arrow RR^3$ such that $overline(alpha) = F compose alpha$.

#proof[
  From the previous section, we established that for all $s in I$, $overline(t)(s) = L(t(s))$.\
  By the definition of the tangent vector for arc-length parametrized curves, $t(s) = alpha^prime (s)$ and $overline(t)(s) = overline(alpha)^prime (s)$ and substituting back yields
  $ overline(alpha)^prime (s) = L(alpha^prime (s)) $
  Since $L$ is a constant linear transformation, we can integrate both sides of this equation with respect to the arc length parameter $s$
  $
    integral overline(alpha)^prime (s) dif s = integral L(alpha^prime (s)) dif s ==> overline(alpha)(s) = L(alpha(s)) + c
  $
  Where $c in RR^3$ is a constant vector of integration.\
  So if we define $F:RR^3 arrow RR^3$ by $F(x) = L x + c$ and since $L$ is orthogonal matrix with $det L = 1$ (from the first subquestion), we get that $F$ satisfies the definition of rigit motion of $RR^3$ which means that $overline(alpha)(s)=F(alpha(s))$ as wanted.
]

#question()
Denote by $r,l : (0,4pi) arrow RR^3$ the right handed helix and the left handed helix respectively. For $p,q > 0$ we define
$
  r(s) = (p cos(s), p sin(s), q s) \
  l(s) = (p cos(s), -p sin(s), q(s))
$
We will calculate the curvature and torsion of $r$ and $l$ and conclude using question 2 that there does not exists a rigit motion \
$F:RR^3 arrow RR^3$ such that $l = F compose r$.

#solution[
  The recitation explicitly states that its formulas apply only to curves parametrized by arc-length so we need to transform our problem so
  $ norm(r^prime (s)) = norm((-p sin s, p cos s, q)) = sqrt(p^2 + q^2) = norm(l^prime (s)) $
  Let $v = sqrt(p^2 + q^2)$. Since the speed is constant, the arc length from $0$ to $s$ is $L(s) = v s$. To reparameterize by arc-length, we denote \
  $u = v s$ which means $s = u/v$ therefore we have
  $ tilde(r)(u) = (p cos(u/v), p sin(u/v), q u/v) quad tilde(l)(u) = (p cos(u/v), -p sin(u/v), q u/v) $
  Following the definitions from the recitation ($t$ for tangent, $k$ for curvature, $n$ for normal vector, $b$ for binormal vector and $tau$ for torsion) if $alpha(s)$ is a regular curve parameterized by arc length the Frenet equations are given by
  $
    t(s) = alpha^prime (s) \
    k(s) = norm(alpha^prime.double (s)) = norm(t^prime (s)) \
    n(s) = frac(alpha^prime.double (s), norm(alpha^prime.double (s))) = frac(t^prime (s), norm(t^prime (s))) \
    b(s) = t(s) times n(s) \
    tau(s) = chevron.l b^prime (s), n(s) chevron.r
  $
  Computing for $r$
  $
    t_r (u) = tilde(r)^prime (u) = (-p/v sin(u/v), p/v cos(u/v), q/v) \
    t_r^prime (u) = tilde(r)^prime.double (u) = (-p/(v^2) cos(u/v), -p/(v^2) sin(u/v), 0) \
    k_r (u) = norm(t_r^prime (u)) = sqrt(p^2/(v^4) (cos^2(u/v) + sin^2(u/v))) = p/(v^2) = p/(p^2+q^2) \
    n_r (u) = frac(t_r^prime (u), k_r (u)) = (-cos(u/v), -sin(u/v), 0) \
    b_r (u) = t_r (u) times n_r (u) = (q/v sin(u/v), -q/v cos(u/v), p/v) \
    b_r^prime (u) = (q/(v^2) cos(u/v), q/(v^2) sin(u/v), 0) \
    tau_r (u) = chevron.l b_r^prime (u), n_r (u) chevron.r = (q/(v^2) cos)(-cos) + (q/(v^2) sin)(-sin) + 0 = -q/(v^2) = -q/(p^2+q^2)
  $
  #pagebreak()
  Computing for $l$
  $
    t_l (u) = tilde(l)^prime (u) = (-p/v sin(u/v), -p/v cos(u/v), q/v)\
    t_l^prime (u) = tilde(l)^prime.double (u) = (-p/(v^2) cos(u/v), p/(v^2) sin(u/v), 0) \
    k_l (u) = norm(t_l^prime (u)) = sqrt(p^2/(v^4) (cos^2(u/v) + sin^2(u/v))) = p/(v^2) = p/(p^2+q^2) \
    n_l (u) = frac(t_l^prime (u), k_l (u)) = (-cos(u/v), sin(u/v), 0) \
    b_l (u) = t_l (u) times n_l (u) = (-q/v sin(u/v), -q/v cos(u/v), -p/v) \
    b_l^prime (u) = (-q/(v^2) cos(u/v), q/(v^2) sin(u/v), 0) \
    tau_l (u) = chevron.l b_l^prime (u), n_l (u) chevron.r = (-q/(v^2) cos)(-cos) + (q/(v^2) sin)(sin) + 0 = q/(v^2) = q/(p^2+q^2)
  $
  Therefore the curvature are equals but the torsions differ by sign and since $q>0$ it follows that $tau_r != tau_l$ therefore from the previous question we can conclude that there not exists a rigit motion.
]
