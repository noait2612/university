#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *

#show: thmbox-init()

#show: article_en.with(
  title: [ Analysis on Manifolds ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)
#set heading(numbering: "1.1")
#outline(depth: 2)

= Introduction
== Conservative Fields and Locally Conservative Fields
#definition[
  Let $F: Omega arrow RR^d$ be a vector field. We say that $F$ is *locally conservative* in $Omega$ if $forall 1<=k, ell = d$,
  $partial_k F_ell = partial_ell F_k$ in $Omega$ (We showed $forall x in Omega, space exists B_r (x) subset Omega space s.t. space F "is conservative"$)
]
#definition[
  A domain $Omega subset RR^d$ is *$C^k$-smooth* if for all $x in boundary(Omega)$ there exists a neighborhood $x in V$ and a   $C^k$-differomorphism $phi$ with $phi: B_1 (0) arrow V$ such that $phi(B_1 (0) inter {x_d > 0}) = V inter Omega$ and we call $phi$ a rectifying map.
]
#notation[
  $ integral_gamma arrow(F) dif arrow(ell) = integral_gamma F_1 dif x_1 + F_2 dif x_2 + dots.h + F_ell dif x_ell $
]
#theorem[Green's Theorem][
  Let $Omega subset RR^2$ be a bounded smooth domain and Let $F=(P,Q)$ be a smooth vector field in a neighborhood of $Omega$ and $boundary(Omega)$ be positively orienated then
  $
    integral.cont_(boundary(Omega)) P dif x + Q dif y = integral.cont_(boundary(Omega)) arrow(F) dif arrow(ell) = integral_Omega (partial_x Q - partial_y P) dif x dif y
  $
  Since $gamma(t)=(x(t), y(t)), dif x = x'(t) dif t, dif y = y'(t) dif t$ we get
  $
    integral_gamma P dif x + Q dif y = integral (P(x(t), y(t))x'(t) + Q(x(t), y(t))y'(t)) dif t = integral chevron.l vec(P, Q) comma vec(x', y') dif t
  $
]
#proof[
  #underline("1st case:") Suppose $supp(F) subset Omega$ (_Reminder:_ $supp(F) = closure({x in Omega bar F(x)!=0})$).\
  Since $F|_(boundary(Omega))=0$ we attain that
  $ integral_(boundary(Omega)) arrow(F) dif arrow(ell) = 0 $
  We want to show that $ integral_Omega (partial_x Q - partial_y P) dif x dif y = 0 $
  Since $Omega$ is a bounded smooth domain there exists $M in RR_plus$ so $Omega subset [-M, M] times [-M, M]$ hence
  $
    integral_Omega (partial_x Q - partial_y P) dif x dif y &= integral_([-M, M] times [-M, M]) (partial_x Q - partial_y P) dif x dif y \
    &= integral_(-M)^M integral_(-M)^M (partial_x Q) dif x dif y - integral_(-M)^M integral_(-M)^M (partial_y P) dif y dif x \
    &= integral_(-M)^M Q(M,y)-Q(-M, y) dif y + integral_(-M)^M P(x,M)-P(x,-M) dif x = 0
  $
  Where the second equal is Fubini's Theorem and the third one is Fundamental Theorem of Calculus.
  #colbreak()
  #underline("2nd case:") Assume $Omega = {(x,y) in RR^2 bar x^2+y^2 < 1, space y>0}$ and $supp(F) subset B_1 (0)$.\
  First, we need to find a parametrization for our boundary: With $-1<=t<=1$ we have $gamma(t)=(t,0)$ with $gamma'(t)=(1,0)$ hence
  $
    integral_boundary(Omega) P dif x + Q dif y = integral_(-1)^1 P(t,0) dot.op 1 + Q(t,0) dot.op 0 dif t = integral_(-1)^1 P(t,0) dif t
  $
  We need to compute $integral (partial_x Q - partial_y P) dif x dif y$ over the upper half circle of and show that they are equal.\
  Over the upper half circle we can replace with rectangle (small enough) and use Fubini's Theorem and Fundamental Theorem of Calculus
  $
    integral partial_x Q dif x dif y = integral_((-1, 1) times (0,1)) partial_x Q dif x dif y = integral_0^1 integral_(-1)^1 partial_x Q dif x dif y = integral_0^1 underbrace(Q(1,y), =0)-underbrace(Q(-1, y), = 0) dif y = 0
  $
  Since we are out of our support. In the same way
  $
    - integral partial_y P dif x dif y = - integral_((-1, 1) times (0,1)) partial_y P dif x dif y = - integral_(-1)^1 integral_0^1 partial_y P dif y dif x = - integral_(-1)^1 underbrace(P(x,1), =0)-P(x,0)) dif x = integral_(-1)^1 P(x,0) dif x
  $
  Using a change of variable we finish this case.\
  #underline("3rd case:") Let $p in boundary(Omega)$, $V$ is a neighborhood of p and $phi: B_1 (0) arrow V$ is a rectifying map with $supp(F) subset V$ we pull our vector field back to the upper half circle and go back to the 2nd case: our parametrization is $ gamma(t)=phi(t, 0), space phi(t, s)=(x(t,s), y(t,s)) $
  Hence
  $
    integral_boundary(Omega) P dif x = integral_(boundary(Omega) inter V) P dif x = integral_(-1)^1 P(phi(t, 0)) (dif x)/(dif t) (t,0) dif t
  $
  #end_of_lecture("3 – 28/04")
]

#example[
  Suppose that $F$ is locally conservative in $Omega subset.eq RR^2$ so $F=(P,Q)$ and $partial_y P = partial_x Q$ from Green's theorem
  $ integral_(boundary(Omega)) arrow(F) dif arrow(ell)=0 $
]
