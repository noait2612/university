#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#show: article_en.with(
  title: [ Solution to Exercise 12 --- Analysis on Manifolds, 80416 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

#question()
We got the following definition: Let $S, overline(S) subset.eq RR^3$ be two surfaces and let $f : S arrow overline(S)$ be a smooth map. We say that $f$ is locally conformal if for every $p$ there exists a neighborhood $V subset.eq S$ such that
+ $f scripts(harpoon.tr)_V : V arrow f(V)$ is a diffeomorphism
+ $f$ preserve angeles between curves in $V$ i.e. for every two curves $alpha, beta : I arrow V$ such that there exists $t_0 in I$ with $alpha(t_0) = beta(t_0)$ then
$
  frac(chevron.l alpha^prime (t_0) comma beta^prime (t_0) chevron.r, norm(alpha^prime (t_0))norm(beta^prime (t_0))) = frac(chevron.l D f_(alpha(t_0)) (alpha^prime (t_0)) comma D f_(beta(t_0)) (beta^prime (t_0)) chevron.r, norm(D f_(alpha(t_0)) (alpha^prime (t_0)))norm(D f_(beta(t_0)) (beta^prime (t_0))))
$
We will use the stereographic projection from exercise $5$ to prove that for every $p_0 in S^2$, $S^2 without (0)$ is locally conformal to $RR^2$.

#proof[
  Without loss of generality we can assume $p_0 = (0,0,1)$ the North pole of the sphere $S^2 subset.eq RR^3$ and we defined $pi : S^2 without (p_0) arrow RR^2$ to be the stereographic projection (which we saw that is diffeomorphism thus a local diffeomorphism everywhere) and we set its inverse $f=pi^(-1) : RR^2 arrow S^2 without (p_0)$ both are given by
  $
    pi(x, y, z) = (frac(x, 1-z), frac(y, 1-z)) \
    f(u,v) = (frac(2u, u^2+v^2+1), frac(2v, u^2+v^2+1), frac(u^2+v^2-1, u^2+v^2+1))
  $
  We notice that $f$ is a smooth bijection with a smooth inverse (since all its components are rational functions with non-zero denominators).\
  To satisfy condition 2 we must show that $pi$ preserve angels but it is sufficient to show that its inverse $f$ is conformal (since the inverse of any conformal diffeomorphism is also a conformal as we saw in Complex Analysis; We can see it by definition with differention but it is kind of trivial since a map preserves angles going in one direction, reversing the mapping must preserve those exact same angles) so we compute $f_u, f_v$
  $
    f_u = (frac(2(v^2-u^2+1), (u^2+v^2+1)^2), frac(-4u v, (u^2+v^2+1)^2), frac(4u, (u^2+v^2+1)^2)) \
    f_v = (frac(-4u v, (u^2+v^2+1)^2), frac(2(u^2-v^2+1), (u^2+v^2+1)^2), frac(4v, (u^2+v^2+1)^2))
  $
  We compute the coefficients of the First Fundamental Form $E, F,G$
  $
    E = chevron.l f_u, f_u chevron.r = frac(4, (u^2+v^2+1)^2) \
    G = chevron.l f_v, f_v chevron.r = frac(4, (u^2+v^2+1)^2) \
    F = chevron.l f_u, f_v chevron.r = 0
  $
  Let $lambda(u, v) = frac(2, u^2+v^2+1)$ so we have $E = G = lambda^2$ and $F= 0$.\
  FOr any tangent vector $w=a frac(partial, partial u) + b frac(partial, partial v) in RR^2$ we have
  $ norm(D f(w))^2 = E a^2 + 2 F a b + G b^2 = lambda^2 (a^2+b^2) = lambda^2 norm(w)^2 $
  By polarization, for any two vectors $w_1, w_2 in T_q RR^2$, the inner product is $ chevron.l D f(w_1), D f(w_2) chevron.r = lambda^2 chevron.l w_1, w_2 chevron.r $
  If we look at two intersecting curves $alpha, beta in RR^2$ where $w_1 = alpha^prime (t_0)$, $w_2 = beta^prime (t_0)$ The angle between their pushforwards $f compose alpha$ and $f compose beta$ on $S^2$ is
  $
    frac(chevron.l D f(w_1) comma D f(w_2), norm(D f (w_1))norm(D f (w_2))) = frac(lambda^2 chevron.l w_1 comma w_2, lambda norm(w_1) lambda norm(w_2)) = frac(chevron.l w_1 comma w_2, norm(w_1) norm(w_2))
  $
  So $f$ preserves angles therefore $pi$ its inverse must also preserve angle and is conformal map and we are done.
]

#question()
Let $S, overline(S) subset.eq RR^3$ be two surfaces and let $f:S arrow overline(s)$ be a diffeomorphism. For every curve $gamma : [a,b] arrow S$ we define the corresponding curve on $overline(S)$, $overline(gamma) : [a,b] arrow overline(S)$ by $overline(gamma) = f compose gamma$.\
We will prove that $f$ is an isometry if and only if for every regular curve $gamma:[a,b] arrow S$, its arc-length parametrization $phi : [0, l(y)] arrow [a,b]$ is also arc-length parametrization for $overline(gamma)$.

#proof[
  $==>$ Assume  that $f$ is an isometry.\
  By definition, an isometry preserves inner products on tangent spaces, therefore $f$ preserves $norm(D f_p (v))= norm(v)$.\
  Let $gamma:[a,b] arrow S$ be a regular curve and let $phi : [0, l(gamma)] arrow [a,b]$ be its arc-length parametrization so by definition $alpha(s)=gamma(phi(s))$ and $norm(alpha^prime (s))=1$ for all $s in [0, l(gamma)]$.\
  Now for $overline(gamma)$ with $overline(alpha)(s) = overline(gamma)(phi(s)) = f(alpha(s))$ by the chain rule
  $ alpha^prime (s) = D f_(alpha(s)) (alpha^prime (s)) $
  Since $f$ is isometry then on taking norm we will get that
  $ norm(alpha^prime (s))= norm(D f_(alpha(s)) (alpha^prime (s))) = norm(alpha^prime (s))=1 $
  So $overline(gamma) compose phi$ always has a norm of $1$ then the parametrization $phi$ is also the arc-length parametrization of $overline(gamma)$.\
  $<==$ Assume that $phi$ is always an arc-length parametrization for $overline(gamma)$.\
  So we have if $alpha(s)=gamma(phi(s))$ with $norm(alpha^prime (s))=1$ then $overline(alpha)(s) = f(alpha(s))$ also with $norm(overline(alpha)^prime (s)) = 1$ which means that for any unit vector $u in T_p S$, its pushforward under $f$ is also a unit vector.\
  Let $p in S$ and $v in T_p S$ be an arbitrary non-zero tangent vector so we can write $v=c dot.op u$ for $u=norm(v)>0$ and $u = frac(v, norm(v))$ a unit vector.\
  Since $u$ is a unit vector, we can construct a regular curve in $S$ through $p$ with velocity $u$ parameterized by arc length and by our assumption, its image under $f$ will also have a velocity vector of norm $1$ therefore
  $ norm(D f_p (u))=1 =_"linearity" norm(D f_p (c dot.op u)) = c dot.op norm(D f_p (u)) = c dot.op 1 = norm(v) $
  Which means that $D f_p$ preserves the norm of all tangent vectors.\
  TO show that $D f_p$ is isometry we need to show that it preserves inner products
  $ chevron.l v, w chevron.r = frac(1, 4)(norm(v+w)^2=norm(v-w)^2) $
  Following
  $
    chevron.l D f_p (v), D f_p (w) chevron.r & = frac(1, 4) (norm(D f_p (v) + D f_p (w))^2 - norm(D f_p (v) - D f_p (w))^2) \
                                             & = frac(1, 4) (norm(D f_p (v+w))^2 - norm(D f_p (v-w))^2) \
                                             & =_((star)) frac(1, 4) (norm(v+w)^2-norm(v-w)^2) \
                                             & = chevron.l v, w chevron.r
  $
  Where $(star)$ is due to the fact that it preserves norms.\
  Therefore $f$ is isometry since it is a diffeomorphism and preserves inner products on all tangent spaces.
]
