#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#import "@preview/cetz:0.5.0"

#show: thmbox-init()

#show: article_en.with(
  title: [ Analysis on Manifolds ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)
#set heading(numbering: "1.1")
#outline(depth: 2)

#let arcfill = math.op(box(
  width: 0.8em,
  height: 0.4em,
  clip: true,
  baseline: 0.1em,
  circle(radius: 0.4em, fill: black),
))

= Introduction
// == Smooth Curves
// #definition[Parametrized Curve][
//   A parametrized curve in $RR^n$ is a function $gamma: [a,b] arrow RR^n$ given by $gamma(t) = (x_1 (t), dots.h, x_n (t))$ where each $x_i : [a,b] arrow RR$.\
//   This defines a path in $RR^n$ that can describe movement over time.
// ]
// #example[
//   + Helix is a $gamma : [0, 10] arrow RR^3$ given by $gamma(t) = (cos(t), sin(t), t)$ and the orientation is shown by the blue arrows in the figure.
//     #align(center)[#cetz.canvas({
//         import cetz.draw: *

//         // 1. Perspective Projection Function
//         // Converts (x, y, z) 3D coordinates into (x_2d, y_2d) 2D points
//         let project(x, y, z) = {
//           let x_2d = -x * 0.866 + y * 0.866
//           let y_2d = -x * 0.5 - y * 0.5 + z * 0.6 // 0.6 scales the 'vertical' stretch
//           return (x_2d, y_2d)
//         }

//         // 2. Generate the Path
//         let samples = 200
//         let t_max = 10.0
//         let points = ()

//         for i in range(0, samples + 1) {
//           let t = (i / samples) * t_max
//           let x = calc.cos(t)
//           let y = calc.sin(t)
//           let z = t * 0.5 // We scale t so the helix isn't too tall
//           points.push(project(x, y, z))
//         }

//         // 3. Draw Coordinate Axes for depth reference
//         line(project(-1.5, 0, 0), project(1.5, 0, 0), stroke: gray + .5pt, mark: (end: ">"))
//         line(project(0, -1.5, 0), project(0, 1.5, 0), stroke: gray + .5pt, mark: (end: ">"))
//         line(project(0, 0, 0), project(0, 0, 4), stroke: gray + .5pt, mark: (end: ">"))

//         content(project(1.7, 0, 0), [$x$])
//         content(project(0, 1.7, 0), [$y$])
//         content(project(0, 0, 4.2), [$z$])

//         // 4. Draw the Helix
//         // We use a thick blue stroke for the main path
//         line(..points, stroke: blue + 1.5pt)

//         // 5. Add Direction Arrows (The "Flow" of gamma)
//         // We place arrows at specific intervals along the array of points
//         let arrow_indices = (40, 90, 140, 190)
//         for idx in arrow_indices {
//           let p1 = points.at(idx)
//           let p2 = points.at(idx + 1)
//           line(p1, p2, stroke: blue + 1.5pt, mark: (end: ">", fill: blue, size: 0.15))
//         }

//         // Label the start point
//         content(points.at(0), [$gamma(0)$], anchor: "east", padding: .1)
//       })
//     ]
//   + Tschirnhausen cubic – a path $gamma(t)=(t^2-1,t(t-1)(t+1))=(t^2-1, t^3-t)$ as $t$ moves from $-infinity$ to $infinity$ in $RR^2$.\
//     We notice that on the $y$ axis we move through zero 3 times so this is a polynomiyal from degree 3 and the zeros of $gamma$ is at $t in {-1, 0, 1}$ and on on the $x$ axis we go from $infinity$ to the point and back (this is a prabola).\
//     Observe that $gamma$ is a smooth parametrization curve but it's image is not a smooth curve.
//     #align(center)[
//       #figure(
//         cetz.canvas({
//           import cetz.draw: *

//           // 1. Setup Scaling and Samples
//           scale(2)
//           let samples = 80 // Sufficient for a smooth curve
//           let points = ()

//           // 2. Generate points for gamma(t) = (t^2 - 1, t^3 - t)
//           for i in range(0, samples + 1) {
//             let t = -1.5 + (i / samples) * 3.0
//             let x = calc.pow(t, 2) - 1
//             let y = calc.pow(t, 3) - t
//             points.push((x, y))
//           }

//           // 3. Draw Axes for Reference
//           line((-1.5, 0), (1.5, 0), stroke: gray + .4pt, mark: (end: ">"))
//           line((0, -1.2), (0, 1.2), stroke: gray + .4pt, mark: (end: ">"))
//           content((1.6, 0), [$x$])
//           content((0, 1.3), [$y$])

//           // 4. Draw the Curve using segments (Avoids Argument Limits)
//           for i in range(0, points.len() - 1) {
//             line(points.at(i), points.at(i + 1), stroke: blue + 1.2pt)
//           }

//           // 5. Add Orientation Arrows at t = -0.6 and t = 0.6
//           // These indices (approx 24 and 56) show the "flow" of the path
//           for idx in (24, 56) {
//             line(points.at(idx), points.at(idx + 1), stroke: blue + 1.2pt, mark: (end: ">", fill: blue, size: 0.12))
//           }

//           // Label the loop intersection
//           content((0, 0), [$(0,0)$], anchor: "north-west", padding: .1)
//         }),
//       )
//     ]
// ]
// #todo... דורש הרחבה

// == Path Integrals
// #definition[Length of Parametrized Curve][
//   Let $gamma:[a,b] arrow RR^n$ a curve we denote the length of $gamma$ as $L(gamma)$ by
//   $ L(gamma) colon.eq integral_a^b norm(dot(gamma)(t)) dif t $
// ]
// #definition[Path Integral][
//   Let $gamma:[a,b] arrow RR^n$ a smooth curve, $f:RR^n arrow RR$ continuous then the path integral of $f$ along $gamma$ with respect to the length element is given by
//   $ integral_gamma f dif s = integral_a^b f(gamma(t)) norm(dot(gamma)(t)) dif t $
// ]
// #todo דורש הרחבה.....
// #end_of_lecture("1 – 24/03")

== Conservative Fields and Locally Conservative Fields
#definition[Locally Conservative][
  Let $F: Omega arrow RR^d$ be a vector field. We say that $F$ is *locally conservative* in $Omega$ if $forall 1<=k, ell = d$,
  $partial_k F_ell = partial_ell F_k$ in $Omega$ (We showed $forall x in Omega, space exists B_r (x) subset Omega space s.t. space F "is conservative"$)
]
#definition[$bold(C^k"-smooth")$][
  A domain $Omega subset RR^d$ is *$C^k$-smooth* if for all $x in boundary(Omega)$ there exists a neighborhood $x in V$ and a   $C^k$-differomorphism $phi$ with $phi: B_1 (0) arrow V$ such that $phi(B_1 (0) inter {x_d > 0}) = V inter Omega$ and we call $phi$ a rectifying map. \
  Informal: $Omega$ is smooth if for all $p in boundary(Omega)$ there exists a neighborhood $p in V$ such that $V inter Omega$ looks like a half circle.
]
#definition[Simply Connected][
  $X$ a topological space is *simply connected* if is path connected and any loop ($gamma: [0,1] arrow X$ with $gamma(0)=gamma(1)$) in $X$ can be continuously contracted a point (i.e., is homotopic to a constant loop, with no "holes").\
]
#theorem[
  If $Omega$ is simply connected and $F$ is locally conservative in $Omega$ then $F$ is a conservative in $Omega$.
]
#proof[In exercise 3.]
#notation[
  $ integral_gamma arrow(F) dif arrow(ell) = integral_gamma F_1 dif x_1 + F_2 dif x_2 + dots.h + F_ell dif x_ell $
]
#theorem[Green's Theorem][
  Let $Omega subset RR^2$ be a bounded smooth domain and Let $F=(P,Q)$ be a smooth vector field in a neighborhood of $boundary(Omega)$ and $boundary(Omega)$ be positively orienated (left leg rule) then
  $
    integral.cont_(boundary(Omega)) P dif x + Q dif y = integral.cont_(boundary(Omega)) arrow(F) dif arrow(ell) = integral_Omega (partial_x Q - partial_y P) dif x dif y
  $
  Since $gamma(t)=(x(t), y(t)), dif x = x'(t) dif t, dif y = y'(t) dif t$ we get
  $
    integral_gamma P dif x + Q dif y = integral (P(x(t), y(t))x'(t) + Q(x(t), y(t))y'(t)) dif t = integral chevron.l vec(P, Q) comma vec(x', y') chevron.r dif t
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
    &= integral_(-M)^M integral_(-M)^M partial_x Q dif x dif y - integral_(-M)^M integral_(-M)^M partial_y P dif y dif x \
    &= integral_(-M)^M Q(M,y)-Q(-M, y) dif y + integral_(-M)^M P(x,M)-P(x,-M) dif x = 0
  $
  Where the second equal is Fubini's Theorem and the third one is Fundamental Theorem of Calculus.
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
  #end_of_lecture("6 – 28/04")
  #underline("3rd case:") Let $p in boundary(Omega)$, $V$ a neighborhood of $p$ and $phi: B_1 (0) arrow V$ a rectifying map with $supp(F) subset.eq V$ ($phi(t, s) = (x(t,s), y(t,s))$).\
  We can assume that $J_p > 0$ (if not, we can replace $phi$ by reflection – simply flipping one coordinate).\
  Using @greens-theorem-3rd-case-lemma-exercise since $supp(F) subset.eq V$ we can write with the definition of line integral
  $
    integral_(boundary(Omega)) P dif x + Q dif y = integral_(boundary(Omega) inter V) P dif x + Q dif y = integral_(-1)^1 P(phi(t, 0)) (partial x)/(partial t) (t,0) + Q(phi(t, 0)) (partial y)/(partial t)(t,0) dif t
  $
  For the other side, we start by computing
  $
    J_phi = det mat((partial x)/(partial t), (partial x)/(partial s); (partial y)/(partial t), (partial y)/(partial s)) = (partial x)/(partial t) dot.op (partial y)/(partial s) - (partial x)/(partial s)(partial y)/(partial t)
  $
  Since $F$ is smooth we use change of variable to get
  $
    integral_(Omega) partial_x Q - partial_y P dif x dif y = integral_(Omega inter V) partial_x Q - partial_y P dif x dif y = integral_(arcfill) (partial_x Q compose phi - partial_y P compose phi) J_phi dif t dif s \
    = integral_(arcfill) (partial_x Q compose phi -partial_y P compose phi) ((partial x)/(partial t) dot.op (partial y)/(partial s) - (partial x)/(partial s) -(partial y)/(partial t)) dif t dif s
  $
  Retwrite with $(1)$ Chain Rule and $(2)$ Leibniz Integral Rule as
  $
    = integral_(arcfill) ((partial_x Q compose phi) (partial x)/(partial t) + cancel((partial_y Q compose phi) (partial y)/(partial t))) (partial y)/(partial s) - ((partial_x Q compose phi) (partial x)/(partial s) + cancel((partial_y Q compose phi) (partial y)/(partial s))) (partial y)/(partial t)
    \
    + ((partial_x P compose phi) (partial x)/(partial t) + (partial_y P compose phi) (partial y)/(partial t)) (partial x)/(partial s) - ((partial_x P compose phi) (partial x)/(partial s) + (partial_y P compose phi) (partial y)/(partial s)) (partial x)/(partial t) \
    =_((1))
    integral_(arcfill) [(partial (Q compose phi))/(partial t) (partial y)/(partial s) - (partial (Q compose phi))/(partial s) (partial y)/(partial t) + (partial (P compose phi))/(partial t)(partial x)/(partial s) - (partial(P compose phi))/(partial s) (partial x)/(partial t)] dif t dif s \
    =_((2)) integral_(arcfill) [partial/(partial t) ((Q compose phi) (partial y)/(partial s)) - partial/(partial s) ((Q compose phi) (partial y)/(partial t)) + partial/(partial t) ((P compose phi) (partial x)/(partial s)) - partial/(partial s) ((P compose phi) (partial x)/(partial t))] dif t dif s \
    integral_arcfill [partial/(partial t) (underbrace((P compose phi) (partial x)/(partial s) + (Q compose phi)(partial y)/(partial s), tilde(Q)))-partial/(partial s) (underbrace((P compose phi)(partial x)/(partial t) + (Q compose phi) (partial y)/(partial t), tilde(P)))] dif t dif s
  $
  If we take $arrow(G)(t,s) = (tilde(P), tilde(Q))$, the 2nd case gives us $ integral_(boundary(Omega)) tilde(P)dif t + tilde(Q) dif = integral_arcfill (partial tilde(Q))/(partial t) - (partial tilde(P))/(partial s) dif t dif s $
  We have $gamma(t) = (t,0), dot(gamma)(t) = (1,0)$ $ integral tilde(P) dif t + tilde(Q) dif s = integral_(-1)^1 tilde(P) dif t = integral_(-1)^1 [(P compose phi) (partial y)/(partial t) (t,0) + (Q compose phi)(partial y)/(partial t) (t,0)] dif t = $
  Which is indeed the left side.\
  In other words for the 3rd case: we pull our vector field back to the upper half circle and go back to the 2nd case.
]
#remark[
  In the exercises we will prove Green's Theorem in another domain.
]

#example[
  Suppose that $F$ is locally conservative in $Omega subset.eq RR^2$ so $F=(P,Q)$ and $partial_y P = partial_x Q$ from Green's theorem
  $ integral_(boundary(Omega)) arrow(F) dif arrow(ell)=0 $
]
#exercise[
  Let $p in boundary(Omega)$, $V$ a neighborhood of $p$ and $phi: B_1 (0) arrow V$ a rectifying map with $supp(F) subset.eq V$ ($phi(t, s) = (x(t,s), y(t,s))$).\
  If $J_p > 0$ then $phi(t, 0)$ is a parametrization of $boundary(Omega) inter V$ with positive orientation (since we never use reflection).
] <greens-theorem-3rd-case-lemma-exercise>
#end_of_lecture("7 – 30/04")
