#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *
#import "@preview/cetz:0.5.0": canvas, draw

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
== Smooth Curves
#definition[Parametrized Curve][
  A parametrized curve in $RR^n$ is a function $gamma: [a,b] arrow RR^n$ given by $gamma(t) = (x_1 (t), dots.h, x_n (t))$ where each $x_i : [a,b] arrow RR$.\
  This defines a path in $RR^n$ that can describe movement over time.
]
#example[Helix][
  $gamma : [0, 10] arrow RR^3$ given by $gamma(t) = (cos(t), sin(t), t)$ and the orientation is shown by the blue arrows in the figure.
  #align(center)[
    #canvas({
      import draw: *

      // 1. Perspective Projection Function
      // Converts (x, y, z) 3D coordinates into (x_2d, y_2d) 2D points
      let project(x, y, z) = {
        let x_2d = -x * 0.866 + y * 0.866
        let y_2d = -x * 0.5 - y * 0.5 + z * 0.6 // 0.6 scales the 'vertical' stretch
        return (x_2d, y_2d)
      }

      // 2. Generate the Path
      let samples = 200
      let t_max = 10.0
      let points = ()

      for i in range(0, samples + 1) {
        let t = (i / samples) * t_max
        let x = calc.cos(t)
        let y = calc.sin(t)
        let z = t * 0.5 // We scale t so the helix isn't too tall
        points.push(project(x, y, z))
      }

      // 3. Draw Coordinate Axes for depth reference
      line(project(-1.5, 0, 0), project(1.5, 0, 0), stroke: gray + .5pt, mark: (end: ">"))
      line(project(0, -1.5, 0), project(0, 1.5, 0), stroke: gray + .5pt, mark: (end: ">"))
      line(project(0, 0, 0), project(0, 0, 4), stroke: gray + .5pt, mark: (end: ">"))

      content(project(1.7, 0, 0), [$x$])
      content(project(0, 1.7, 0), [$y$])
      content(project(0, 0, 4.2), [$z$])

      // 4. Draw the Helix
      // We use a thick blue stroke for the main path
      line(..points, stroke: blue + 1.5pt)

      // 5. Add Direction Arrows (The "Flow" of gamma)
      // We place arrows at specific intervals along the array of points
      let arrow_indices = (40, 90, 140, 190)
      for idx in arrow_indices {
        let p1 = points.at(idx)
        let p2 = points.at(idx + 1)
        line(p1, p2, stroke: blue + 1.5pt, mark: (end: ">", fill: blue, size: 0.15))
      }

      // Label the start point
      content(points.at(0), [$gamma(0)$], anchor: "east", padding: .1)
    })
  ]
]
#example[Tschirnhausen cubic][
  $gamma(t)=(t^2-1,t(t-1)(t+1))=(t^2-1, t^3-t)$ as $t$ moves from $-infinity$ to $infinity$ in $RR^2$.\
  We notice that on the $y$ axis we move through zero 3 times so this is a polynomiyal from degree 3 and the zeros of $gamma$ is at \
  $t in {-1, 0, 1}$ and on on the $x$ axis we go from $infinity$ to the point and back (this is a prabola).\
  Observe that $gamma$ is a smooth parametrization curve but it's image is not a smooth curve.
  #align(center)[
    #figure(
      canvas({
        import draw: *

        // 1. Setup Scaling and Samples
        scale(2)
        let samples = 80 // Sufficient for a smooth curve
        let points = ()

        // 2. Generate points for gamma(t) = (t^2 - 1, t^3 - t)
        for i in range(0, samples + 1) {
          let t = -1.5 + (i / samples) * 3.0
          let x = calc.pow(t, 2) - 1
          let y = calc.pow(t, 3) - t
          points.push((x, y))
        }

        // 3. Draw Axes for Reference
        line((-1.5, 0), (1.5, 0), stroke: gray + .4pt, mark: (end: ">"))
        line((0, -1.2), (0, 1.2), stroke: gray + .4pt, mark: (end: ">"))
        content((1.6, 0), [$x$])
        content((0, 1.3), [$y$])

        // 4. Draw the Curve using segments (Avoids Argument Limits)
        for i in range(0, points.len() - 1) {
          line(points.at(i), points.at(i + 1), stroke: blue + 1.2pt)
        }

        // 5. Add Orientation Arrows at t = -0.6 and t = 0.6
        // These indices (approx 24 and 56) show the "flow" of the path
        for idx in (24, 56) {
          line(points.at(idx), points.at(idx + 1), stroke: blue + 1.2pt, mark: (end: ">", fill: blue, size: 0.12))
        }

        // Label the loop intersection
        content((0, 0), [$(0,0)$], anchor: "north-west", padding: .1)
      }),
    )
  ]
]

#example[Lissajous Curve][
  $gamma(t) = (cos(t), sin(2t))$
  #align(center)[
    #canvas({
      import draw: *

      // Scale up for better visibility
      scale(2)

      // Draw the Axes
      line((-1.5, 0), (1.5, 0), mark: (end: ">"), stroke: (paint: gray, thickness: 0.5pt))
      line((0, -1.5), (0, 1.5), mark: (end: ">"), stroke: (paint: gray, thickness: 0.5pt))
      content((1.6, 0), text(fill: gray)[$x$])
      content((0, 1.6), text(fill: gray)[$y$])

      // Generate the points for gamma(t) = (cos(t), sin(2t))
      let samples = 150
      let pts = ()
      for i in range(0, samples + 1) {
        let t = (i / samples) * 2 * calc.pi
        pts.push((calc.cos(t), calc.sin(2 * t)))
      }

      // Draw the curve
      line(..pts, stroke: (paint: blue, thickness: 1.2pt))

      // Mark t = 0 and t = 2pi
      circle((1, 0), radius: 0.05, fill: red)
      content((1, 0.2), text(fill: red)[$t=0, 2pi$], anchor: "south")

      // Mark t = pi/2 and t = 3pi/2
      circle((0, 0), radius: 0.05, fill: red)
      content((-0.1, -0.2), text(fill: red)[$t=pi/2, (3pi)/2$], anchor: "north-east")
    })
  ]
]

#example[The Cycloid][
  #align(center)[
    #canvas({
      import draw: *

      let R = 1

      // Draw the baseline (the ground the circle rolls on)
      line((-1, 0), (4 * calc.pi + 1, 0), stroke: (paint: black, thickness: 1pt))

      // Generate the points for the cycloid: gamma(theta) = R(theta - sin(theta), 1 - cos(theta))
      let samples = 150
      let pts = ()
      for i in range(0, samples + 1) {
        let theta = (i / samples) * 4 * calc.pi
        pts.push((R * (theta - calc.sin(theta)), R * (1 - calc.cos(theta))))
      }

      // Draw the cycloid curve
      line(..pts, stroke: (paint: blue, thickness: 1.5pt))

      // Helper function to draw the rolling circle at a specific angle theta
      let draw_rolling_circle(theta, label_angle: false) = {
        let center_x = R * theta
        let center_y = R
        let point_x = R * (theta - calc.sin(theta))
        let point_y = R * (1 - calc.cos(theta))

        // Draw the circle
        circle((center_x, center_y), radius: R, stroke: (dash: "dashed", paint: gray))

        // Draw the center point
        circle((center_x, center_y), radius: 0.05, fill: black)

        // Draw the radius connecting the center to the tracing point
        line((center_x, center_y), (point_x, point_y), stroke: (paint: red, thickness: 1pt))

        // Draw the tracing point on the cycloid
        circle((point_x, point_y), radius: 0.08, fill: red)
      }

      // Illustrate the rolling circle at various stages
      draw_rolling_circle(calc.pi / 1.5) // Circle mid-roll
      draw_rolling_circle(calc.pi) // Circle at the peak
      draw_rolling_circle(2 * calc.pi) // Circle at the cusp

      // Add labels for the cusps on the x-axis
      content((2 * calc.pi, -0.3), [$2pi R$])
      content((4 * calc.pi, -0.3), [$4pi R$])
      content((0, -0.3), [$0$])
    })
  ]

  #align(center)[
    #canvas({
      import draw: *

      let R = 1

      // 3D Isometric Projection Function
      // Maps (x, y, z) to a 2D canvas mimicking depth
      let project(x, y, z) = {
        let x_2d = x * 0.866 + y * 0.866
        let y_2d = -x * 0.5 + y * 0.5 + z
        return (x_2d, y_2d)
      }

      // 1. Draw a "road" grid to establish the 3D plane (z=0)
      for i in range(-2, 4) {
        line(project(-1, i, 0), project(4 * calc.pi + 1, i, 0), stroke: (paint: luma(200), thickness: 0.5pt))
      }
      for i in range(-1, 14) {
        line(project(i, -2, 0), project(i, 3, 0), stroke: (paint: luma(200), thickness: 0.5pt))
      }

      // 2. Draw the 3D coordinate axes
      line(project(0, 0, 0), project(4 * calc.pi + 1.5, 0, 0), mark: (end: ">"), stroke: 1pt)
      line(project(0, 0, 0), project(0, 3.5, 0), mark: (end: ">"), stroke: 1pt)
      line(project(0, 0, 0), project(0, 0, 2.5), mark: (end: ">"), stroke: 1pt)

      content(project(4 * calc.pi + 1.8, 0, 0), text(fill: black)[$x$])
      content(project(0, 3.8, 0), text(fill: black)[$y$])
      content(project(0, 0, 2.8), text(fill: black)[$z$])

      // 3. Generate the 3D cycloid curve points (rolling along x, height in z, y=0)
      let samples = 150
      let pts = ()
      for i in range(0, samples + 1) {
        let t = (i / samples) * 4 * calc.pi
        pts.push(project(R * (t - calc.sin(t)), 0, R * (1 - calc.cos(t))))
      }

      // Draw the cycloid curve
      line(..pts, stroke: (paint: blue, thickness: 1.5pt))

      // 4. Function to draw the wheel projected in 3D
      let draw_wheel_3d(t_val) = {
        let cx = R * t_val
        let cz = R

        // Compute the circle boundary points
        let circ_pts = ()
        for i in range(0, 61) {
          let a = (i / 60) * 2 * calc.pi
          circ_pts.push(project(cx + R * calc.cos(a), 0, cz + R * calc.sin(a)))
        }
        // Draw the dashed wheel
        line(..circ_pts, stroke: (dash: "dashed", paint: gray, thickness: 1pt))

        // Calculate the specific tracing point
        let px = R * (t_val - calc.sin(t_val))
        let pz = R * (1 - calc.cos(t_val))
        let proj_p = project(px, 0, pz)
        let proj_c = project(cx, 0, cz)

        // Draw the spoke connecting the center to the tracing point
        line(proj_c, proj_p, stroke: (paint: red, thickness: 1.2pt))

        // Draw the center axle and the tracing dot
        circle(proj_c, radius: 0.05, fill: black)
        circle(proj_p, radius: 0.08, fill: red)
      }

      // 5. Draw the wheel at a couple of dynamic positions
      draw_wheel_3d(calc.pi)
      draw_wheel_3d(2.5 * calc.pi)
    })
  ]
]

#example[
  $gamma: (-10, 10) arrow RR^2$ given by $gamma(t) = (t^2, t^3)$.\
  This is a smooth parametrization curve but not a smooth curve since $dot(gamma)(0)=(0,0)$.
  #align(center)[
    #canvas({
      import draw: *

      // Draw the Axes
      line((-1, 0), (6, 0), mark: (end: ">"), stroke: (paint: gray, thickness: 0.5pt))
      line((0, -6), (0, 6), mark: (end: ">"), stroke: (paint: gray, thickness: 0.5pt))
      content((6.2, 0), text(fill: gray)[$x$], anchor: "west")
      content((0, 6.2), text(fill: gray)[$y$], anchor: "south")

      // Generate the points for gamma(t) = (t^2, t^3)
      // We scale x by 1/20 and y by 1/200 visually to fit the canvas
      let samples = 200
      let pts = ()
      for i in range(0, samples + 1) {
        let t = -10 + (i / samples) * 20
        let x_val = (t * t) / 20
        let y_val = (t * t * t) / 200
        pts.push((x_val, y_val))
      }

      // Draw the curve
      line(..pts, stroke: (paint: blue, thickness: 1.5pt))

      // Highlight the non-smooth cusp at t=0
      circle((0, 0), radius: 0.1, fill: red)
      content(
        (0.3, -0.4),
        text(fill: red)[\
          $t=0$],
        anchor: "west",
      )

      // Add some reference markers to show the scale
      line((5, -0.15), (5, 0.15), stroke: gray)
      content((5, -0.4), text(fill: gray)[$x=100$])

      line((-0.15, 5), (0.15, 5), stroke: gray)
      content((-0.3, 5), text(fill: gray)[$y=1000$], anchor: "east")

      line((-0.15, -5), (0.15, -5), stroke: gray)
      content((-0.3, -5), text(fill: gray)[$y=-1000$], anchor: "east")
    })
  ]
]

#definition[Velocity and Speed][
  Let $gamma(t)$ be the position of a particle at time $t$. The *velocity* is the rate of change of position:
  $ gamma'(t) = lim_(h arrow 0) (gamma(t+h) - gamma(t))/h $
  The vector $gamma'(t)$ is the tangent to the curve at time $t$ and the *speed* is the magnitude of the velocity: $norm(gamma'(t))$.
]

#definition[Regular Curve][
  A smooth parametrized curve is called *regular* if for all $t$, its speed is never zero: $gamma'(t) eq.not 0$.
]

#example[
  + The curve $gamma(t) = (t^2, t^3)$ is not regular because $gamma'(0) = (0,0)$
  + The cycloid $gamma(theta) = R(theta - sin theta, 1 - cos theta)$ has $gamma'(theta) = R(1 - cos theta, sin theta) = (0,0)$ when $theta = 0, 2pi, 4pi, dots.h$.
]

#pagebreak()

== Path Integrals
#definition[Length of Parametrized Curve][
  Let $gamma:[a,b] arrow RR^n$ a curve we denote the length of $gamma$ as $L(gamma)$ by
  $ L(gamma) colon.eq integral_a^b norm(dot(gamma)(t)) dif t $
]

#definition[Path Integral (Scalar Field)][
  Let $gamma:[a,b] arrow RR^n$ be a smooth curve, and $f:RR^n arrow RR$ a continuous function. The path integral of $f$ along $gamma$ with respect to the length element $s$ is:
  $ integral_gamma f dif s = integral_a^b f(gamma(t)) norm(gamma'(t)) dif t $
]

#example[
  If $f eq.triple 1$, the path integral gives the length of the curve.\
  If $gamma$ represents a wire of non-uniform density, and $f(gamma(t))$ is the density at a given point, then the path integral computes the total mass of the wire: $m = integral_gamma f dif s$.
]

#definition[Reparameterization][
  If $phi:[c,d] arrow [a,b]$ is smooth, $phi(c)=a$, $phi(d)=b$, and $phi'(t) eq.not 0$ (strictly increasing), then $mu = gamma compose phi : [c,d] arrow RR^n$ is a reparameterization of $gamma$.
]

#lemma[Invariance of Path Integrals][
  The path integral $integral_gamma f dif s$ is well-defined, meaning it is invariant under reparameterization.
]

#proof[
  Let $mu = gamma compose phi$. Using the chain rule, $mu'(t) = gamma'(phi(t)) phi'(t)$.\
  Since $phi'(t) > 0$, $norm(mu'(t)) = norm(gamma'(phi(t))) phi'(t)$.\
  By substitution $tau = phi(t)$:
  $
    integral_c^d f(mu(t)) norm(mu'(t)) dif t = integral_c^d f(gamma(phi(t))) norm(gamma'(phi(t))) phi'(t) dif t = integral_a^b f(gamma(tau)) norm(gamma'(tau)) dif tau = integral_gamma f dif s
  $
]

#end_of_lecture("1 – 24/03")

== Vector Fields and Line Integrals
#definition[Vector Field][
  Let $Omega subset.eq RR^n$ be a domain (connected, open set). A vector field on $Omega$ is a smooth map $F: Omega arrow RR^n$.
]

#definition[Gradient Field and Potential][
  Let $u: Omega arrow RR$ be a smooth scalar function. Its *gradient field* is defined as $arrow(F) = arrow(gradient) u = (partial_1 u, dots.h, partial_n u)$. \
  The function $u$ is called the *potential* of the field $F$.
]
#remark[
  Let $hat(a) = (a_1, dots.h, a_n)$ be a unit vector.\
  The directional derivative of $u$ in the direction of $hat(a)$ can be defined using a limit
  $ (partial u)/(partial a)(x) = lim_(t arrow 0) (u(x + t hat(a)) - u(x))/t $
  Notice that this is exactly the standard 1D derivative evaluated at $t=0$
  $ (partial u)/(partial a)(x) = dif/(dif t) |_(t=0) u(x + t hat(a)) $
  Applying the Chain Rule to expand this derivative, we get
  $
    dif/(dif t) |_(t=0) u(x_1 + t a_1, dots.h, x_n + t a_n) = (partial u)/(partial x_1)(x) dot.op a_1 + dots.h + (partial u)/(partial x_n)(x) dot.op a_n
  $
  This sum is precisely the inner product of the gradient and the direction vector
  $ (partial u)/(partial a) = chevron.l gradient u(x), hat(a) chevron.r $
  Now, taking the absolute value and applying the Cauchy-Schwarz inequality:
  $ abs((partial u)/(partial a)) = abs(chevron.l gradient u comma hat(a) chevron.r) <= norm(gradient u) norm(hat(a)) $
  Since $hat(a)$ is a unit vector ($norm(hat(a)) = 1$), this simplifies to $abs((partial u)/(partial a)) <= norm(gradient u)$.\
  Hence, the maximum directional derivative is obtained when $hat(a)$ points in the exact same direction as the gradient, which is when $ hat(a) = gradient u / norm(gradient u) $
]

#end_of_lecture("2 – 26/03")

#definition[Line Integral][
  Let $Omega subset.eq RR^d$ be a domain (open, connected) and let $F: Omega arrow RR^d$ be a vector field.\
  Let $gamma: [a,b] arrow Omega$ be a parametrized curve.\
  The line integral is defined as:
  $ integral_gamma arrow(F) dif arrow(t) = integral_a^b chevron.l F(gamma(t)), gamma'(t) chevron.r dif t $
  If $F$ is a force field, then this integral computes the work done by the field on a particle moving along $gamma$.
]

#example[
  + Let $F_1(x,y) = (x,y)$ and let $gamma_1(t) = (R cos t, R sin t)$ for $0 <= t <= 2pi$
    $
      integral_(gamma_1) arrow(F_1) dif arrow(t) = integral_0^(2pi) chevron.l vec(R cos t, R sin t), vec(-R sin t, R cos t) chevron.r dif t = 0
    $
  + Let $F_2(x,y) = (-y,x)$ and let $gamma_1$ be the same curve as before
    $
      integral_(gamma_1) arrow(F_2) dif arrow(t) = integral_0^(2pi) chevron.l vec(-R sin t, R cos t), vec(-R sin t, R cos t) chevron.r dif t = integral_0^(2pi) R^2 dif t = 2pi R^2
    $
  + Let $F_2(x,y) = (-y,x)$ as before, but this time we integrate over the curve $gamma_2(t) = (R-t, 0)$ for $0 <= t <= 2R$.\
    The derivative is $gamma_2'(t) = (-1,0)$, and $F_2(gamma_2(t)) = F_2(R-t, 0) = (0, R-t)$
    $
      integral_(gamma_2) arrow(F_2) dif arrow(t) = integral_0^(2R) chevron.l vec(0, R-t), vec(-1, 0) chevron.r dif t = 0
    $
]

#remark[
  Observe that both $gamma_1$ and $gamma_2$ start and end at the exact same points, yet, we don't have the same result for the integral ($pi R^2 eq.not 0$).
]

#lemma[Invariance under Reparameterization][
  The line integral $integral_gamma arrow(F) dif arrow(t)$ is well-defined, i.e., it's invariant under reparameterization of $gamma$
]

#proof[
  Let $phi: [c,d] arrow [a,b]$ be a reparameterization and define $mu = gamma compose phi : [c,d] arrow Omega$ so we compute\
  $
    integral_mu arrow(F) dif arrow(t) &= integral_c^d chevron.l F(mu(s)), mu'(s) chevron.r dif s \
    &= integral_c^d chevron.l F(gamma(phi(s))), (gamma compose phi)'(s) chevron.r dif s \
    &= integral_c^d chevron.l F(gamma(phi(s))), gamma'(phi(s)) dot.op underbrace(phi'(s), "scalar") chevron.r dif s \
    &= integral_c^d chevron.l F(gamma(phi(s))), gamma'(phi(s)) chevron.r phi'(s) dif s
  $
  By using the substitution $t = phi(s)$, we obtain:
  $ integral_a^b chevron.l F(gamma(t)), gamma'(t) chevron.r dif t = integral_gamma arrow(F) dif arrow(t) $
]

== The Reversed Parametrized Curve
#definition[Reversed Curve][
  Given a curve $gamma: [a,b] arrow Omega$, the reversed curve $-gamma$ has the exact same image, just traversed in the opposite direction. \
  It is defined by $-gamma(t) = gamma(a+b-t)$ for $t in [a,b]$
]

#lemma[Integration over Reversed Curves][
  Let $f: RR^n arrow RR$ and $F: Omega arrow RR^d$
  + $integral_(-gamma) f dif s = integral_gamma f dif s$ //
  + $integral_(-gamma) arrow(F) dif arrow(t) = - integral_gamma arrow(F) dif arrow(t)$ //
]

#proof[
  + $
      integral_(-gamma) f dif s = integral_a^b f(-gamma(t)) norm(-gamma'(t)) dif t = integral_a^b f(gamma(a+b-t)) norm(-gamma'(a+b-t)) dif t
    $
    Substitute $s = a+b-t$, so $dif s = -dif t$. The bounds change from $a arrow b$ to $b arrow a$:
    $
      integral_b^a f(gamma(s)) norm(gamma'(s)) (-dif s) = integral_a^b f(gamma(s)) norm(gamma'(s)) dif s = integral_gamma f dif s
    $
  +
    $
      integral_(-gamma) arrow(F) dif arrow(t) = integral_a^b chevron.l F(-gamma(t)), -gamma'(t) chevron.r dif t = integral_a^b chevron.l F(gamma(a+b-t)), -gamma'(a+b-t) chevron.r dif t
    $
    Using the same substitution $s = a+b-t$ and $dif s = -dif t$:
    $
      integral_b^a chevron.l F(gamma(s)), -gamma'(s) chevron.r (-dif s) = - integral_a^b chevron.l F(gamma(s)), gamma'(s) chevron.r dif s = - integral_gamma arrow(F) dif arrow(t)
    $
]

== Conservative Fields and Locally Conservative Fields
#theorem[Gradient Fields Evaluate to Endpoints][
  Let $F : Omega arrow RR^d$ be a gradient field with potential $u : Omega arrow RR$ (i.e., $F = gradient u$). Then $integral_gamma arrow(F) dif arrow(t) = u(gamma(b)) - u(gamma(a))$.
]

#proof[
  $
    integral_a^b chevron.l (gradient u)(gamma(t)), gamma'(t) chevron.r dif t &= integral_a^b ((partial_1 u)(gamma(t)) gamma'_1(t) + dots.h + (partial_d u)(gamma(t)) gamma'_d(t)) dif t = integral_a^b dif/(dif t) (u compose gamma)(t) dif t = u(gamma(b)) - u(gamma(a))
  $
]

#definition[Conservative Field][
  A vector field $F: Omega arrow RR^d$ is called a *conservative field* if for all curves $gamma: [a,b] arrow Omega$, the integral $integral_gamma arrow(F) dif arrow(t)$ depends only on the endpoints of $gamma$.
]

#example[
  Every gradient field is conservative (from the theorem above).
]

#lemma[Closed Curves][
  $F$ is conservative if and only if for all closed curves $gamma: [a,b] arrow Omega$ (i.e., $gamma(a)=gamma(b)$), we have $integral_gamma arrow(F) dif arrow(t) = 0$.
]

#proof[\
  $==>$ Let $gamma: [a,b] arrow Omega$ be a closed curve. Let $xi$ be the constant curve $xi(t) = gamma(a)$.\
  Since both curves share the same start and end points, and $F$ is conservative, their integrals must be equal
  $ integral_gamma arrow(F) dif arrow(t) = integral_xi arrow(F) dif arrow(t) = 0 $
  $<==$ Assume the integral over any closed loop is zero. If $gamma$ and $mu$ share endpoints, the curve $gamma - mu$ (concatenation of $gamma$ and $-mu$) is closed
  $
    0 = integral_(gamma - mu) arrow(F) dif arrow(t) = integral_gamma arrow(F) dif arrow(t) + integral_(-mu) arrow(F) dif arrow(t) = integral_gamma arrow(F) dif arrow(t) - integral_mu arrow(F) dif arrow(t)
  $
  Thus, $integral_gamma = integral_mu$, meaning it depends only on the endpoints.
]

#theorem[Conservative iff Gradient Field][
  Let $Omega$ be a domain. $F$ is conservative in $Omega$ if and only if $F$ is a gradient field in $Omega$.
]

#proof[ \
  $<==$ We already proved that every gradient field is conservative.\
  $==>$ Assume $F$ is conservative. We define a potential $u(x)$ by:
  $ u(x) = integral_(x_0 arrow x) arrow(F) dif arrow(t) $
  where we choose any $C^1$ parametrized curve connecting $x_0$ to $x$ in $Omega$.\
  We notice that $u(x)$ is well-defined (does not depend on the specific curve chosen), since $F$ is conservative and the partial derivative is
  $ lim_(h arrow 0) (u(x+h e_k) - u(x))/h = 1/h (integral_(x arrow x+h e_k) arrow(F) dif arrow(t)) $
  We parametrize the path as $gamma(t) = x + t e_k$ for $0 < t <= h$.\
  $ = 1/h integral_0^h chevron.l F(x+t e_k), e_k chevron.r dif t = 1/h integral_0^h F_k (x+t e_k) dif t $
  By the Fundamental Theorem of Calculus, if we write $f(t) = F_k (x+t e_k)$ and $I(h) = integral_0^h f(t) dif t$, then:
  $ lim_(h arrow 0) 1/h integral_0^h F_k (x+t e_k) dif t = I'(0) = f(0) = F_k (x) $
  What we get is that $partial_k u(x) = F_k(x)$ for all $k$, which implies $gradient u = F$
]

#end_of_lecture("3 – 14/04")

#corollary[Locally Conservative Condition][
  Let $F = (F_1 (x), dots.h, F_d (x)) : Omega arrow RR^d$ be a conservative field. Then for all $1 <= k, ell <= d$:
  $ partial_k F_ell = partial_ell F_k $
]

Is the converse true? the answer is No.
#example[
  Consider the vector field given by $F = (im(1/z), re(1/z))$ on the domain $Omega = RR^2 without {(0,0)}$.\
  We notice that
  $ 1/z = 1/(x+i y) = (x-i y)/(x^2+y^2) $
  So we have
  $ F(x,y) = ( (-y)/(x^2+y^2), x/(x^2+y^2) ) $
  Let's check if $partial_y F_1 = partial_x F_2$:
  $
    partial_y F_1 = partial_y (-y (x^2+y^2)^(-1)) = -(x^2+y^2)^(-1) - y (- (x^2+y^2)^(-2) dot.op 2y) = (- (x^2+y^2) + 2y^2) / (x^2+y^2)^2 = (y^2-x^2) / (x^2+y^2)^2 \
    partial_x F_2 = partial_x (x (x^2+y^2)^(-1)) = (x^2+y^2)^(-1) + x (- (x^2+y^2)^(-2) dot.op 2x) = (x^2+y^2 - 2x^2) / (x^2+y^2)^2 = (y^2-x^2) / (x^2+y^2)^2
  $
  Thus, $partial_1 F_2 = partial_2 F_1$, satisfying the locally conservative condition.\
  We claim that $F$ is not conservative in $RR^2 without {(0,0)}$.\
  Let $gamma(t) = (R cos t, R sin t)$ for $0 <= t <= 2pi$ so
  $
    integral_gamma arrow(F) dif arrow(t) &= integral_0^(2pi) chevron.l F(gamma(t)), gamma'(t) chevron.r dif t \
    &= 1/R^2 integral_0^(2pi) chevron.l vec(-R sin t, R cos t), vec(-R sin t, R cos t) chevron.r dif t \
    &= integral_0^(2pi) ( (R^2 sin^2 t + R^2 cos^2 t) / R^2 ) dif t \
    &= integral_0^(2pi) 1 dif t = 2pi eq.not 0
  $
  Notice that the result is $2pi$, which is independent of $R$, but since the integral over a closed loop is not zero, $F$ is not conservative.
]

#remark[
  Let us try to find a potential for $F$ by brute force.
  We want $display(partial_x u = (-y)/(x^2+y^2))$ and $display(partial_y u = x/(x^2+y^2))$ and integrating these yields $ u(x,y) = arctan(y/x) $
  However, this potential function is not defined globally on $RR^2 without {(0,0)}$; it is only defined on an open subset (where $x eq.not 0$).
]

#theorem[Poincaré Lemma for Balls][
  Let $B$ be an open ball in $RR^d$. If $F: B arrow RR^d$ satisfies $partial_k F_ell = partial_ell F_k$ for all $1 <= k, ell <= d$, then $F$ is conservative in $B$.
]

#theorem[Poincaré Lemma for Balls][
  Let $B subset.eq RR^d$ be an open ball. If $F: B arrow RR^d$ is a $C^1$ vector field that satisfies the locally conservative condition $partial_k F_ell = partial_ell F_k$ for all $1 <= k, ell <= d$, then $F$ is conservative in $B$.
]

#proof[
  We will prove this by explicitly constructing a potential function $u$ such that $F = gradient u$.\
  #underline("Step 1 – The Rectangle Property:") First, we consider a rectangle whose sides are parallel to the coordinate axes $e_k$ and $e_ell$.\
  Let the vertices be defined as:
  $ A = x, quad B = x + a e_k, quad C = x + a e_k + b e_ell, quad D = x + b e_ell $

  #align(center)[
    #canvas({
      import draw: *

      let A = (0, 0)
      let B = (5, 0)
      let C = (5, 3)
      let D = (0, 3)

      line((-1, 0), (6, 0), mark: (end: ">"), stroke: (dash: "dashed", paint: gray))
      line((0, -1), (0, 4), mark: (end: ">"), stroke: (dash: "dashed", paint: gray))
      content((6.2, 0), text(fill: gray)[$e_k$ direction], anchor: "west")
      content((0, 4.2), text(fill: gray)[$e_ell$ direction], anchor: "south")

      line(A, B, mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt))
      line(B, C, mark: (end: ">"), stroke: (paint: blue, thickness: 1.5pt))

      line(A, D, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))
      line(D, C, mark: (end: ">"), stroke: (paint: red, thickness: 1.5pt))

      circle(A, radius: 0.06, fill: black)
      circle(B, radius: 0.06, fill: black)
      circle(C, radius: 0.06, fill: black)
      circle(D, radius: 0.06, fill: black)

      content((A.at(0) - 0.2, A.at(1) - 0.2), [$A = x$], anchor: "north-east")
      content((B.at(0) + 0.2, B.at(1) - 0.2), [$B = x + a e_k$], anchor: "north-west")
      content((C.at(0) + 0.2, C.at(1) + 0.2), [$C = x + a e_k + b e_ell$], anchor: "south-west")
      content((D.at(0) - 0.2, D.at(1) + 0.2), [$D = x + b e_ell$], anchor: "south-east")

      content((2.5, -0.3), text(fill: blue)[$a$], anchor: "north")
      content((5.3, 1.5), text(fill: blue)[$b$], anchor: "west")

      content((-0.3, 1.5), text(fill: red)[$b$], anchor: "east")
      content((2.5, 3.3), text(fill: red)[$a$], anchor: "south")
    })
  ]
  We want to show that integrating (with direction) along the blue path ($A arrow B arrow C$) yields the same result as integrating along the red path ($A arrow D arrow C$).\
  This is equivalent to showing:
  $
    integral_(B arrow C) arrow(F) dif arrow(t) - integral_(A arrow D) arrow(F) dif arrow(t) = integral_(D arrow C) arrow(F) dif arrow(t) - integral_(A arrow B) arrow(F) dif arrow(t)
  $
  Let's compute the difference on the left-hand side (the segments parallel to $e_ell$):
  $
    integral_(B arrow C) - integral_(A arrow D) = integral_0^b (F_ell (x + a e_k + t e_ell) - F_ell (x + t e_ell)) dif t = integral_0^b integral_0^a (partial_k F_ell) (x + s e_k + t e_ell) dif s dif t
  $
  Similarly, the right-hand side (the segments parallel to $e_k$) is:
  $
    integral_(D arrow C) - integral_(A arrow B) = integral_0^a (F_k (x + s e_k + b e_ell) - F_k (x + s e_k)) dif s = integral_0^a integral_0^b (partial_ell F_k) (x + s e_k + t e_ell) dif t dif s
  $
  By our hypothesis, $partial_k F_ell = partial_ell F_k$.\
  Applying Fubini's Theorem to swap the order of integration, we see that the two sides are exactly equal.\
  Hence, the integral over such axis-parallel rectangles is path-independent.
  #end_of_lecture("4 – 16/04")
  #underline("Step 2 – Path Independence for Staircase Paths:")
  Given any two points in the ball, we can connect them using a "staircase" path built by $gamma = gamma_1 + gamma_2 + dots.h + gamma_m$, where each segment $gamma_i$ is parallel to one of the coordinate axes.\
  We claim that the line integral $integral_gamma arrow(F) dif arrow(t)$ is independent of the specific staircase path chosen: \
  If we have a path with many alternating steps, we can use the rectangle property established in Step 1 to "push" the segments around. For instance, a step in direction $e_ell$ followed by a step in $e_k$ can be swapped to a step in $e_k$ followed by $e_ell$ without changing the integral's value.\
  By repeating this procedure, we can deform any axis-parallel path into a canonical path (e.g., doing all $e_1$ movements first, then all $e_2$ movements, etc.).\
  Since all such paths can be deformed into the same canonical path without altering the integral, the line integral over axis-parallel paths is well-defined.
  #colbreak()
  #underline("Step 3 – Constructing the Potential:") Fix a base point $x_0 in B$. We define our potential function as:
  $ u(x) = integral_(x_0 arrow x) arrow(F) dif arrow(t) $
  where the integral is taken over any path composed of axis-parallel segments.
  To verify this is a valid potential, we compute its partial derivative $partial_k u$:
  $
    (u(x + h e_k) - u(x)) / h = 1/h (integral_(x_0 arrow x + h e_k) arrow(F) dif arrow(t) - integral_(x_0 arrow x) arrow(F) dif arrow(t)) = 1/h integral_(x arrow x + h e_k) arrow(F) dif arrow(t) = 1/h integral_0^h F_k (x + t e_k) dif t
  $
  Taking the limit as $h arrow 0$, the Fundamental Theorem of Calculus implies this converges to $F_k (x)$.\
  Therefore, $partial_k u = F_k$ for all $k$, which means $F = gradient u$. Since $F$ is a gradient field, it is conservative in $B$.
]

#end_of_lecture("5 – 23/04")

#remark[
  From here until the end of chapter we aim to prove Green's Theorem (@greens-theorem) and it was spread over lectures 6,7,8.\
  In each part of the proof we used multiple definitions/exercise that each we saw in the matching lecture for the part of the proof we used it so the order is by preference.
]

#definition[Locally Conservative][
  Let $F: Omega arrow RR^d$ be a vector field. We say that $F$ is *locally conservative* (meshamer mekomit) in $Omega$ if for every $k,ell = 1, dots.h, d$, $ partial_k F_ell = partial_ell F_k <==> (partial F_ell)/(partial k) = (partial F_k)/(partial ell) $
]

#definition[$bold(C^k"-smooth")$][
  Domain $Omega subset RR^d$ is *$C^k$-smooth* if for all $x in boundary(Omega)$ there exists a neighborhood $x in V$ and a $C^k$-diffeomorphism $phi: B_1 (0) arrow V$ such that $phi(B_1 (0) inter {x_d > 0}) = V inter Omega$ and we call $phi$ a rectifying map. \
  Informal: $Omega$ is smooth if for all $p in boundary(Omega)$ there exists a neighborhood $p in V$ such that $V inter Omega$ looks like a half circle.
]

#definition[Simply Connected][
  $X$ a topological space is *simply connected* if it is a path connected and any loop ($gamma: [0,1] arrow X$ with $gamma(0)=gamma(1)$) in $X$ can be continuously contracted a point (i.e., is homotopic to a constant loop, with no "holes").\
]

#theorem[
  If $Omega$ is simply connected and $F$ is locally conservative in $Omega$ then $F$ is a conservative in $Omega$.
]

#proof[In exercise 3.]

#notation[
  $ integral_gamma arrow(F) dif arrow(ell) = integral_gamma F_1 dif x_1 + F_2 dif x_2 + dots.h + F_ell dif x_ell $
]

#exercise[
  Let $p in boundary(Omega)$, $V$ a neighborhood of $p$ and $phi: B_1 (0) arrow V$ a rectifying map with $supp(F) subset.eq V$ ($phi(t, s) = (x(t,s), y(t,s))$).\
  If $J_p > 0$ then $phi(t, 0)$ is a parametrization of $boundary(Omega) inter V$ with positive orientation (since we never use reflection).
] <greens-theorem-3rd-case-lemma-exercise>

#definition[Partition of Unity][
  Let $K subset.eq RR^d$ be a compact set and $K subset V_1 union V_2 union dots.h. union V_m$ a finite open open cover.\
  Then there exists $C^k$ functions $psi_1, dots.h, psi_m$ defined in a neighborhood of $K$ such that
  + $forall j$, $psi_j >=0$
  + $supp(psi_j) subset.eq V_k$
  + $sum_(j=1)^m psi_j = 1$ on $K$ (meaning for all $x in K$ we have $sum_(j=1)^m psi_j (x) = 1$)
  Such collection ${psi_j}_(j=1)^m$ is called *Partition of Unity* on $K$ subordinatory to the cover ${V_j}_(j=1)^m$.
]
#example[
  Let $K=[0,2]$, $V_1 = (-1,1)$, $V_2 = (1/2, 3)$ so $K subset U_1 union V_2$ and we define $psi_1, psi_2$
  #align(center)[
    #canvas({
      import draw: *
      // Setup Axes
      line((-1.5, 0), (3.5, 0), mark: (end: ">"), stroke: 0.5pt) // x-axis
      line((0, -0.2), (0, 1.5), stroke: 0.5pt) // y-axis

      // Draw Set K (The compact set on the axis)
      line((0, 0), (2, 0), stroke: 3pt + blue, name: "K")
      content((1, -0.4), [ $K$ ], fill: blue)

      // Draw V1 and V2 as intervals
      line((-1, -0.1), (1.5, -0.1), stroke: 1pt + red)
      content((-0.8, -0.3), [ $V_1$ ], fill: red)

      line((0.5, -0.2), (3, -0.2), stroke: 1pt + orange)
      content((2.8, -0.4), [ $V_2$ ], fill: orange)

      // Draw psi_1 (Starts at 1, drops to 0 in the overlap)
      // Using a Bezier curve to look like a smooth C^k function
      bezier((0, 1), (1.5, 0), (0.7, 1), (0.8, 0), stroke: 1.5pt + red)
      content((0.2, 1.2), [ $psi_1$ ])

      // Draw psi_2 (Starts at 0, rises to 1 in the overlap)
      bezier((0.5, 0), (2, 1), (1.2, 0), (1.3, 1), stroke: 1.5pt + orange)
      content((2.2, 1.2), [ $psi_2$ ])

      // Helper line for y=1
      line((-0.1, 1), (2.1, 1), stroke: (dash: "dotted", paint: gray))
      content((-0.3, 1), [ $1$ ])
    })

    // Thanks Gemini.
  ]
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
]<greens-theorem>

#remark[
  Green Theorem works for other domains and for example in the exercise we will prove for rectangles.
]

#example[
  Suppose that $F$ is locally conservative in $Omega subset.eq RR^2$ so $F=(P,Q)$ and $partial_y P = partial_x Q$ from Green's theorem
  $ integral_(boundary(Omega)) arrow(F) dif arrow(ell)=0 $
]


#proof[@greens-theorem][\
  #underline("1st case:") Suppose $supp(F) = closure({x in Omega bar F(x)!=0}) subset Omega$.\
  Since $F|_(boundary(Omega))=0$ we attain that $integral_(boundary(Omega)) arrow(F) dif arrow(ell) = 0$ so we need to show that the integral on the right is also zero.\
  // and we want to show that $ integral_Omega (partial_x Q - partial_y P) dif x dif y = 0 $
  Since $Omega$ is a bounded smooth domain there exists $M in RR_plus$ so $Omega subset [-M, M] times [-M, M]$ hence
  $
    integral_Omega (partial_x Q - partial_y P) dif x dif y &= integral_([-M, M] times [-M, M]) (partial_x Q - partial_y P) dif x dif y \
    &= integral_(-M)^M integral_(-M)^M partial_x Q dif x dif y - integral_(-M)^M integral_(-M)^M partial_y P dif y dif x \
    &= integral_(-M)^M Q(M,y)-Q(-M, y) dif y + integral_(-M)^M P(x,M)-P(x,-M) dif x = 0
  $
  Where the second equal is Fubini's Theorem and the third one is Fundamental Theorem of Calculus.\
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
  #end_of_lecture("6 – 28/04")
  #underline("3rd case:") Let $p in boundary(Omega)$, $V$ a neighborhood of $p$ and $phi: B_1 (0) arrow V$ a rectifying map with $supp(F) subset.eq V$ ($phi(t, s) = (x(t,s), y(t,s))$).\
  We can assume that $J_p > 0$ (if not, we can replace $phi$ by reflection – simply flipping one coordinate).\
  Using @greens-theorem-3rd-case-lemma-exercise since $supp(F) subset.eq V$ we can write with the definition of line integral
  $
    integral_(boundary(Omega)) P dif x + Q dif y = integral_(boundary(Omega) inter V) P dif x + Q dif y = integral_(-1)^1 P(phi(t, 0)) (partial x)/(partial t) (t,0) + Q(phi(t, 0)) (partial y)/(partial t)(t,0) dif t
  $
  For the other side, we start by computing
  $
    J_phi = det mat(display((partial x)/(partial t)), display((partial x)/(partial s)); display((partial y)/(partial t)), display((partial y)/(partial s))) = (partial x)/(partial t) (partial y)/(partial s) - (partial x)/(partial s)(partial y)/(partial t)
  $
  Since $F$ is smooth we use change of variable to get
  $
    integral_(Omega) partial_x Q - partial_y P dif x dif y &= integral_(Omega inter V) partial_x Q - partial_y P dif x dif y \
    &= integral_(arcfill) (partial_x Q compose phi - partial_y P compose phi) J_phi dif t dif s \
    &= integral_(arcfill) (partial_x Q compose phi -partial_y P compose phi) ((partial x)/(partial t) (partial y)/(partial s) - (partial x)/(partial s) (partial y)/(partial t)) dif t dif s \
    &= integral_(arcfill) ((partial_x Q compose phi) (partial x)/(partial t) + cancel((partial_y Q compose phi) (partial y)/(partial t))) (partial y)/(partial s) - ((partial_x Q compose phi) (partial x)/(partial s) + cancel((partial_y Q compose phi) (partial y)/(partial s))) (partial y)/(partial t)
    \
    &+ ((partial_x P compose phi) (partial x)/(partial t) + (partial_y P compose phi) (partial y)/(partial t)) (partial x)/(partial s) - ((partial_x P compose phi) (partial x)/(partial s) + (partial_y P compose phi) (partial y)/(partial s)) (partial x)/(partial t) \
    &=_((1))
    integral_(arcfill) [(partial (Q compose phi))/(partial t) (partial y)/(partial s) - (partial (Q compose phi))/(partial s) (partial y)/(partial t) + (partial (P compose phi))/(partial t)(partial x)/(partial s) - (partial(P compose phi))/(partial s) (partial x)/(partial t)] dif t dif s \
    &=_((2)) integral_(arcfill) [partial/(partial t) ((Q compose phi) (partial y)/(partial s)) - partial/(partial s) ((Q compose phi) (partial y)/(partial t)) + partial/(partial t) ((P compose phi) (partial x)/(partial s)) - partial/(partial s) ((P compose phi) (partial x)/(partial t))] dif t dif s \
    &= integral_arcfill [partial/(partial t) (underbrace((P compose phi) (partial x)/(partial s) + (Q compose phi)(partial y)/(partial s), tilde(Q)))-partial/(partial s) (underbrace((P compose phi)(partial x)/(partial t) + (Q compose phi) (partial y)/(partial t), tilde(P)))] dif t dif s
  $
  Where $(1)$ is Chain Rule and $(2)$ Leibniz Integral Rule (Notice the line break with the $plus$).\
  #colbreak()
  If we take $arrow(G)(t,s) = (tilde(P), tilde(Q))$ and since $gamma(t) = (t,0), dot(gamma)(t) = (1,0)$, the 2nd case gives us
  $
    integral_(boundary(Omega)) tilde(P)dif t + tilde(Q) dif = integral_arcfill (partial tilde(Q))/(partial t) - (partial tilde(P))/(partial s) dif t dif ==> integral tilde(P) dif t + tilde(Q) dif s = integral_(-1)^1 tilde(P) dif t = integral_(-1)^1 [(P compose phi) (partial y)/(partial t) (t,0) + (Q compose phi)(partial y)/(partial t) (t,0)] dif t s
  $
  Which is indeed the left side.\
  In other words for the 3rd case: we pull our vector field back to the upper half circle and go back to the 2nd case.\
  #end_of_lecture("7 – 30/04")
  #underline("4rd case:") For all $p in boundary(Omega)$ there exists a neighborhood $V_p$ and a rectifying map $phi_p : B_1 (0) arrow V_p$.\
  Since $boundary(Omega) subset union.big_(p in boundary(Omega)) V_p$ and since $boundary(Omega)$ is compact then there exists a finite open subcover $boundary(Omega) subset V_(P_1) union dots.h.c union V_(p_m)$.
  Let $V_0 = Omega$ and $closure(Omega) subset V_0 union V_(p_1) union dots.h union V_(p_m)$ and for simplicity of notations let us write $v_j = v_(gamma_j)$.\
  There exists a partition of unity on $closure(Omega)$ subordinate to ${V_j}_(j=0)^m$ and we define $arrow(F_j) colon.eq psi_j dot.op arrow(F)$ and $supp(arrow(F_j)) subset V_j$ so we have $ sum_(j=1)^m arrow(F_j) = sum_(j=1)^m (psi_j dot.op arrow(F)) =(sum_(j=1)^m psi_j) dot.op arrow(F) =_("on " closure(Omega)) 1 dot.op arrow(F) = arrow(F) $
  From the 1st case if we set $arrow(F_j)=(P_j, Q_j)$ since $supp(arrow(F_0)) subset.eq Omega)$ we have that
  $ integral_boundary(Omega) arrow(F_0) dif arrow(ell) = integral_gamma partial_X Q_0 - partial_y P_0 dif x dif y $
  By the 3rd case we know that for each $1<=j<=m$ we have
  $ integral_boundary(Omega) arrow(F_j) dif arrow(ell) = integral_gamma partial_x Q_j - partial_y P_j dif x dif y $
  Summention gives us
  $
    sum_(j=0)^m integral_boundary(Omega) arrow(F_j) dif arrow(ell) = sum_(j=0)^m integral_gamma partial_x Q_j - partial_y P_j dif x dif y ==> integral_boundary(Omega) arrow(F) dif arrow(ell) = integral_gamma partial_x Q - partial_y P dif x dif y
  $
]

#proof[the existence of partition of unity from the notes by Or Hershkovits, Theorem 10.3][\
  It will be easier to work with balls rather than a general covering.\
  Since each $U_i$ is open in $K$, there exists an open set $tilde(U)_i subset.eq RR^n$ such that $U_i = tilde(U)_i inter K$ and for every $p in K$, there exists a ball $B(p, r_p)$ such that $B(p, 4r_p) subset.eq tilde(U)_i$ for some $i$.\
  The collection ${B(p, r_p)}$ is an open covering of $K$, and since $K$ is compact, there exist finitely many points ${p_j}_(j=1)^T$ such that ${B(p_j, r_j)}_(j=1)^T$ is a finite subcover of $K$ so for each $j$, consider the function $psi_j: RR^n arrow RR$ given by:
  $ psi_j (x) = mu((x - p_j)/r_j) $
  Note that $psi_j > 0$ on $B(p_j, r_j)$ and the support of $psi_j$ is a compact subset of $tilde(U)_i$ (since $B(p_j, 4r_j) subset.eq tilde(U)_i$). For every $i=1, dots.h, m$, set:
  $ tilde(phi.alt)_i = sum_({j bar B(p_j, 4r_j) subset.eq tilde(U)_i}) psi_j $
  So the support of $tilde(phi.alt)_i$ is compact in $tilde(U)_i$. Define $V = union.big_(j=1)^T B(p_j, r_j)$ and we have that $V$ is an open set satisfying $K subset.eq V subset.eq union tilde(U)_i$ and the balls cover $V$ so we know that
  $ sum_(i=1)^m tilde(phi.alt)_i (x) > 0 quad "for all" x in V $
  Finally, we normalize these functions to construct the partition of unity. For $x in V$, we define:
  $ phi.alt_i (x) = (tilde(phi.alt)_i (x)) / (sum_(k=1)^m tilde(phi.alt)_k (x)) $
  Restricting each $phi.alt_i$ to $K$ yields the desired partition of unity subordinate to ${U_i}$.
]

= Smooth Manifolds in $RR^d$
#definition[Smooth manifolds in $bold(RR^d)$][
  Let $k<=d$, a set $M subset.eq RR^d$ is called a *manifold* of dimension $k$ if for all $p in M$ there exists $W subset.eq RR^d$ a neighborhood of $p$ ($p in W)$, an open set $U subset.eq RR^k$ and a smooth map $phi : U arrow W$ so that
  + $phi$ is a homeomorphism on it's image
  + $phi (U) = M inter W$
  + $rank(D phi_u) = k$ for all $u in U$
  Informly, a manifolds of dimension $k$ is any topological space $U$ so that any point $p in U$ has a neighborhood $W$ which is a homeomorphism to a ball in $RR^k$ (A $k$-dimensional manifold is a space that locally looks like $RR^k$).
]
#end_of_lecture("8 – 05/05")
*TBD – Lecture 9*
#end_of_lecture("9 – 07/05")
#definition[Graph of dim $bold(k)$][
  A set $Gamma subset.eq RR^d$ is *a graph of dim $k$* if there exists a partition ${1,2,dots.h,d} = I union.dot J$ with $abs(I)=k$, an open set $U subset.eq RR^k$ and a function $f:U arrow RR^(d-k)$ such that
  $ Gamma = {x in RR^d bar x_I in U, space x_J = f(x_I)} $
]

#example[
  Let $U subset.eq RR^d$ be an open set with $k=d$. We show that $U$ is a graph.\
  We take $I = {1, 2, dots.h, d}$ and $J = emptyset$ with $f:U arrow RR^0 = {0}$
  defined by $f(u) = 0$.\
  Then
  $ U= {x in RR^d bar x in U} = {x in RR^d bar x_I in U, x_J = f(x_I)} $
  Since $J = emptyset$, the condition $x_J = f(x_I)$ is vacuous.
]

#definition[Smooth manifolds of dim $bold(k)$ by graph][
  A set $M subset.eq RR^d$ is *a smooth manifold of dim $k$* if for every $p in M$ there exists an open neighborhood $W subset.eq RR^d$ of $p$ such that $W inter M$ is a graph of dim $k$ of a smooth function.
  We say that $M$ is locally a smooth graph of dim $k$ for a $p in M$.
]

#definition[Manifold as the null set of a system of equations][
  Let $M subset.eq RR^n$. We say that $M$ is a $k$ dimensional manifold if for all $p in M$ there exists a neighborhood $p in W subset.eq RR^n$ and a smooth function $F:W arrow RR^(n-k)$ such that
  + $M inter W = {x in W bar F(x)=0}$
  + $D F_p : RR^n arrow RR^(n-k)$ is of full rank
]

#definition[Smooth manifolds of dim $bold(k)$][
  Let $k <= d$. A set $M subset.eq RR^d$ is called *a smooth manifold of dim $k$* if for every $p in M$ there exists an open neighborhood $W subset.eq RR^d$
  of $p$, an open set $U subset.eq RR^k$ and a smooth map $phi : U arrow W$ such that
  + $phi : U arrow phi(U)$ is a homeomorphism
  + $phi(U) = M inter W$
  + $rank(D phi_u) = k$ for all $u in U$
]

#example[
  We look at the curve
  $ gamma(t)= (sin(t), sin(2t)) $
  We define $S = {gamma(t) bar 0<t<(5pi)/4}$ and ask is $S$ a smooth manifold according to the definition with graphs? \
  Observe that
  $ gamma(0)=gamma(pi)=(0,0) $
  hence the parametrization is not injective.\
  On the other hand, define $U = (-epsilon, (5pi)/4)$ then
  $ (D phi)|_(t=0) = (cos(t), 2cos(2t))|_(t=0) = (1,2) $
  has full rank.\
  However, since $phi(0)=phi(pi)$, the map $phi$ is not injective, hence it is not a homeomorphism onto its image.\
  Therefore this parametrization does not define a smooth manifold chart.\
  In fact, near $(0,0)$ the set looks like two curves crossing, so $S$ is not a smooth manifold.
]

#proposition[
  Every smooth manifold by the graph definition is a smooth manifold.
]

#proof[
  Let
  $ Gamma = {x in RR^d bar x_I in U, space x_J = f(x_I)} $
  where $f:U arrow RR^(d-k)$, ${1, 2, dots.h, d} = I union.dot J$ and $abs(I)=k$.\
  Define $phi : U arrow Gamma$ by
  $ (pi_I compose phi)(u) = u, quad (pi_J compose phi)(u) = f(u) $
  The map $phi$ is smooth since each coordinate is a smooth function.\
  Moreover, the Jacobian matrix of $phi$ contains the identity matrix $I_k$ as a block, hence $rank(D phi_u)=k$ for all $u in U$.\
  Hence
  $ phi(U) = {phi(u) bar u in U} = {x in RR^d bar (pi_I compose phi)(x) = u, space (pi_J compose phi)(x) = f(u)} $
  We have
  $phi : U arrow Gamma$ invertible since
  $ (pi_I compose phi)(u) = pi_I (phi(u)) = u $
  Moreover,
  $
    pi_I (phi((pi_I compose phi)^(-1)(pi_I (x)))) = pi_I (x), quad pi_J (phi((pi_I compose phi)^(-1)(pi_I (x))) = f(pi_I (x)) = pi_J (x)
  $
  Therefore
  $ phi((pi_I compose phi)^(-1)(pi_I (x))) = x $
  So
  $pi_I : Gamma arrow U$ is continuous and is the inverse of $phi : U arrow Gamma$.
]

#proposition[
  Every smooth manifold is a graph manifold.
]

#proof[
  Let $p in M$, $p in W subset.eq RR^d$ open, $U subset.eq RR^k$ and $phi : U arrow W$ with $phi(U) = W inter M$, such that $(D phi)|_(phi^(-1)(p))$ is of full rank.\
  There exists $I subset.eq {1,2,dots.h,d}$ with $abs(I)=k$ so that $(D phi)|_(I times {1, 2, dots.h, k})$ is invertible.\
  We look at the map $pi_I compose phi : U arrow RR^k$ which is a smooth map from $U$ to $RR^k$ and
  $ D(pi_I compose phi)|_(phi^(-1)(p)) = (D phi)|_(I times {1, 2, dots.h, k}) $
  Is invertible.\
  By the inverse function theorem, $pi_I compose phi$ is a local diffeomorphism at $phi^(-1)(p)$, so there exists $phi^(-1)(p) in U_0 subset U$ open and there exists $V_0 subset.eq RR^k$ open so that $(pi_I compose phi) : U_0 arrow V_0$
  is a diffeomorphism.\
  We define $f:V_0 arrow RR^(d-k)$ by
  $ f(v) = pi_J (phi((pi_I compose phi)^(-1)(v))) $
  Where $J = {1,2, dots.h, d} without I$.
  Let $W_0$ be such that $phi(U_0) = W_0 inter M$.\
  We need to verify that
  $ underbrace(W_0 inter M, = A) = underbrace({x in RR^d bar pi_I (x) in V_0, space pi_J (x) = f(pi_I (x))}, =B) $
  Since $W_0 inter M = phi(U_0)$, let $u in U_0$.\
  Then there exists $v in V_0$ such that $(pi_I compose phi)^(-1)(v) = u$, we aim to show that $phi(u) in B$.\
  From our definition, $pi_I (phi(u))=v in V_0$.\
  Also,
  $ pi_J (phi(u)) = pi_J (phi((pi_I compose phi)^(-1)(v))) = f(v) $
  Hence $phi(u) in B$.\
  Why is $B subset.eq A?$ Let $x in B$ and define
  $ u = (pi_I compose phi)^(-1)(pi_I (x)) in U_0 $
  Then
  $ pi_I (phi(u)) = (pi_I compose phi)(u) = pi_I (x) $
  Also,
  $ pi_J (phi(u)) = f(pi_I (phi(u))) = f(pi_I (x)) = pi_J (x) $
  Because the coordinates agree on both $I$ and $J$, we conclude that $phi(u)=x$, hence $x in A.$
]

#proposition[
  Every smooth manifold by the graph definition is manifold by the null set of a system of equations definition (and by propositions above, also by the smooth manifold definition)
]

#proof[
  In Recitation 5 + Exercise 5.
]

#pagebreak()

== Transition Maps
Let $M$ be a smooth manifold of dim $k$ and suppose we have
$ phi_1 : U_1 arrow W_1, quad phi_2 : U_2 arrow W_2 $
where $W_1, W_2$ are neighborhoods of $p$.\
Denote
$ tilde(U)_1 = phi_1^(-1) (W_1 inter W_2 inter M), quad tilde(U)_2 = phi_2^(-1)(W_1 inter W_2 inter M) $
We define $tau_(1 2) : tilde(U)_1 arrow tilde(U)_2$ by
$ tau_(1 2)(u) = phi_2^(-1)(phi_1(u)) $
where $phi_2 : U_2 arrow W_2 inter M$.\
We ask ourselves: is $tau_(1 2)$ a smooth map?\
After possibly shrinking neighborhoods, we may assume both charts are represented as graphs over the same coordinate subset $I$.\
Then
$ tau_(1 2) = phi_2^(-1) compose phi_1 = (pi_I compose phi_2)^(-1) compose (pi_I compose phi_1) $
Since compositions and inverses of smooth maps are smooth, the transition map is smooth.

#end_of_lecture("10 – 12/05")

== Integrals On Parametrized Manifolds
Our goal is to define $integral_M f dif Vol_k$ where $M subset.eq RR^d$ a $k$-dim manifold.
*TBD.*
