#import "../../../src/article.typ": *
#import "../../../src/article_en.typ": *

#show: article_en.with(
  title: [ Analysis on Manifolds --- Exam Prep ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
  language: "en",
)

== Category 1: Integration on Parameterized Manifolds (Surface Area & Integrals)
*Relevant Questions:*
+ Calculate the $integral.double_Sigma y^2 z dif sigma$ when $Sigma$ is given by $Sigma colon.eq ((x,y,z) bar x = sqrt(3) y + sqrt(5)/2 z^2, -1<=y<=1, 0<=z<=1)$.
+ Calculate the area given by $r(theta, phi) = (cos(phi) sin(theta), sin(phi)sin(theta), cos(theta))$ when $0<=theta<=2pi$, $0<=phi<=theta/2$
*Core Concept:* Calculating integrals over a manifold using a local parametrization and the Gram matrix to find the volume/area distortion.

*Steps for Question 1 (1):*
+ Identify the given parametrization of the surface $Sigma$ based on the constraints: $phi(y, z) = (sqrt(3) y + sqrt(5)/2 z^2, y, z)$.
+ Calculate the tangent vectors by taking the partial derivatives $partial phi \/ partial y$ and $partial phi \/ partial z$.
+ Compute the Gram matrix $D phi^T D phi$ and its determinant to find the area element $d sigma = sqrt(det(D phi^T D phi)) d y d z$.
+ Substitute the parametrization into the integrand so that $f(phi(y, z)) = y^2 z$.
+ Evaluate the double integral over the given bounds $-1 <= y <= 1$ and $0 <= z <= 1$.

*Steps for Question 2 (7):*
+ Recognize that the given parametrization $r(theta, phi)$ describes a portion of the unit sphere.
+ Calculate the partial derivatives $partial r \/ partial theta$ and $partial r \/ partial phi$.
+ Compute the area element $sqrt(det(D r^T D r))$.
+ Set up and evaluate the double integral $integral integral 1 d sigma$ using the given bounds for $theta$ and $phi$.

== Category 2: Green's Theorem & Planar Line Integrals
*Relevant Questions:*
+ Calculate the area inside the infinity sign shape which is described by the path $gamma(t) = (sin(t), sin(t) cos(t))$ when $0<=t<=2pi$
+ Calculate the line integral $integral_gamma arrow(F) arrow(dif ell)$ when $arrow(F)(x,y) = (e^(sin(y)), x e^(sin(y))cos(y)+6x)$ and $gamma$ in the path the connects between $(0,0)$ to $(1,0)$ by the following: from $(0,0)$ we go up to $(0,1)$ then left to $(-1,1)$ then down to $(-1, 0)$ and then by the lower half circle using $x^2+y^2=1$ to go from $(-1, 0)$ to $(1,0)$
+ Let $arrow(F)(x,t) = (y^2-y, (x^3-x)cos(y^2))$ and let $gamma$ the path that describes the boundary of the unit square.
  + Calculate $integral.cont_gamma arrow(F) arrow(dif ell)$
  + Does $arrow(F)$ is Conservative vector field in $RR^2$?
*Core Concept:* Relating line integrals along a closed curve to double integrals over the enclosed region using Green's Theorem.

*Steps for Question 1 (2) (Area via Green's Theorem):*
+ Note that the curve $gamma(t)$ is a closed path (a figure-eight).
+ Use the corollary of Green's Theorem for area: $upright("Area")(Omega) = 1/2 integral_(partial Omega) x d y - y d x$.
+ Compute $d x = gamma_1'(t) d t$ and $d y = gamma_2'(t) d t$.
+ Substitute these into the formula and integrate over $0 <= t <= 2 pi$.

*Steps for Question 2 (8) (Path Completion):*
+ Observe that the path $gamma$ is not closed (it starts at $(0,0)$ and ends at $(1,0)$).
+ Close the path by adding a straight line segment $L$ from $(1,0)$ back to $(0,0)$ to form a closed curve $partial Omega = gamma union L$.
+ Calculate the mixed partials $partial Q \/ partial x - partial P \/ partial y$ for the given vector field.
+ Apply Green's Theorem over the enclosed region $Omega$.
+ Subtract the line integral over the added segment $L$ from your result to isolate the integral over $gamma$.

*Steps for Question 3 (9):*
+ To determine if $F$ is conservative (Part b), check if it is locally conservative by verifying if $partial F_1 \/ partial y = partial F_2 \/ partial x$. If they are unequal, the field is not conservative.
+ For Part a, apply Green's Theorem directly since $gamma$ is a closed curve bounding the unit square.
+ Evaluate the double integral of $(partial Q \/ partial x - partial P \/ partial y)$ over the square $[0,1] times [0,1]$.

== Category 3: Conservative Vector Fields
*Relevant Question:*
+ Calculate the line integral $integral_gamma arrow(F) arrow(dif ell)$ of the vector field $arrow(F)(x,y) = (x^2y + sin(x)+y sin(x y), x^3/3 + x sin(x y))$ along the path \
  $gamma(t) = (t cos(t), t sin(t))$ where $pi <=t<=4pi$
*Core Concept:* Line integrals of conservative fields are path-independent and depend only on the endpoints.

*Steps for Question 3 (3):*
+ Check if the vector field is locally conservative by verifying $partial F_1 \/ partial y = partial F_2 \/ partial x$.
+ Because the domain is $RR^2$ (which is star-shaped), a locally conservative field is conservative, meaning it has a potential function $u$ such that $nabla u = F$.
+ Integrate the components of $F$ to find the potential function $u(x,y)$.
+ Evaluate the path endpoints $p = gamma(pi)$ and $q = gamma(4 pi)$.
+ Calculate the line integral simply by taking the difference $u(q) - u(p)$.

== Category 4: Divergence Theorem (Gauss's Theorem)
*Relevant Questions:*
+ Calculate the flux of the field $arrow(F)(x,y,z) = (-y,x,z)$ over the outside side closed plane $Sigma$ where $ Sigma colon.eq ((x,y,z) bar x^2+y & 2=cos^2(z), -pi/2 <= z <= pi/2) $
+ Let
  $ Sigma colon.eq ((x,y,z) bar x^2+y^2+z^1 = 1, z>-sqrt(x^2+y^2)) \
  arrow(F)(x,y,z) = (x^2/2+x y-4x z+cos(z), -y^2/2-x y+x^2+z^3, 2z^2+x) $ and calculate the flux of vector field $arrow(F)$ by $Sigma$ in up orienteion $("כלפי מעלה" Sigma "השטף של השדה דרך")$

*Core Concept:* Converting flux integrals over closed surfaces into volume integrals of the divergence.

*Steps for Question 1 (4):*
+ Verify that $Sigma$ forms a completely closed surface (the bounds on $z$ pinch the cylinder shut).
+ Calculate the divergence of the vector field: $upright("div") F = partial F_1 \/ partial x + partial F_2 \/ partial y + partial F_3 \/ partial z$.
+ Apply the Divergence Theorem: $integral integral_Sigma chevron.l F, N chevron.r d sigma = integral integral integral_Omega upright("div") F d V$.
+ Evaluate the triple integral over the enclosed volume $Omega$, likely using cylindrical coordinates.

*Steps for Question 2 (10) (Surface Completion):*
+ Recognize that $Sigma$ is an open surface (a "cap" of a surface). Close the volume by adding the conical surface $S_"cone"$ defined by the boundary constraint.
+ Calculate the divergence of $F$.
+ Apply the Divergence Theorem over the newly closed volume to find the total flux.
+ Explicitly calculate the flux over your added surface $S_"cone"$ and subtract it from the total flux to find the flux exclusively over $Sigma$.

== Category 5: Stokes' Theorem
*Relevant Questions:*
+ Calculate the line integral $integral.cont_gamma arrow(F) arrow(dif ell)$ where $arrow(F)(x,y,z) = (sin(e^x^2)+y z, x cos(y), x z^2)$ and $gamma$ is the path the connected using lines the points $(0,0,0) -> (0,2,0) -> (2,2,2) -> (2,0,2) -> (0,0,0)$
+ Calculate the line integral $integral.cont_gamma arrow(F) arrow(dif ell)$ when $arrow(F)(x,y,z) = (y,-2z,4x)$ and $gamma$ is a circle in radius 2 that is contained in the plane \
  $x+2y+3z=4$ and מגמתו clockwise when we look up
*Core Concept:* Relating the line integral around a closed curve to the surface integral of the curl over an enclosed surface.

*Steps for Question 1 (5):*
+ Verify that the given points form a closed, piecewise smooth path $gamma$.
+ Identify a flat planar surface $Sigma$ whose boundary is $gamma$ (e.g., notice the relationship between the $x$ and $z$ coordinates of the vertices).
+ Compute the curl of the vector field $F$.
+ Determine the unit normal vector $N$ of your chosen plane.
+ Apply Stokes' Theorem: $integral_gamma F dot d l = integral integral_Sigma chevron.l upright("curl") F, N chevron.r d sigma$.

*Steps for Question 2 (11):*
+ Identify the surface $Sigma$ as the disk of radius 2 lying on the plane $x+2y+3z=4$.
+ Compute $upright("curl") F$.
+ Extract the normal vector $N$ directly from the plane equation, ensuring it points in the correct direction to match the clockwise orientation of the curve.
+ Apply Stokes' Theorem and evaluate the flux of the curl across the disk.

== Category 6: Chain Rule & Differentials
*Relevant Question:*
+ Let $f(x,y)$ function that all it's devertives from second order are continuous.\
  Let $gamma_1 (t) = (t,0), gamma_2 (t) = (t, t^2/2), gamma_3 (t) = (sin(t), 1-cos(t))$ and let $g_j (t) = f(gamma_j (t))$ \
  + Foreach $1<=i<j<=3$ decide if it must happen $g^prime_i (0) = g^prime_j (0)$
  + Foreach $1<=i<j<=3$ decide if it must happen $g^prime.double_i (0) = g^prime.double_j (0)$

*Core Concept:* Applying the chain rule to composite functions along curves.

*Steps for Question 1 (6):*
+ Evaluate the position $gamma_j (0)$, velocity $gamma_j '(0)$, and acceleration $gamma_j ''(0)$ for all three curves.
+ For Part a, use the chain rule to express the first derivative $g_j '(t) = nabla f(gamma_j (t)) dot gamma_j '(t)$. Evaluate at $t=0$ and check if the velocity vectors are identical.
+ For Part b, differentiate again using the product rule and chain rule to express $g_j ''(t)$. Evaluate at $t=0$ to see if identical accelerations result in identical second derivatives.

== Category 7: Differential Geometry (Curvature)
*Relevant Question:*
+ Let $Sigma$ given by $z=x y$. Calculate Gaussian curvature $K$ in the origin and the average curvature $H$ in the origin.
*Core Concept:* Calculating the second fundamental form to determine curvatures.

*Steps for Question 1 (12):*
+ Write the surface as a parametrized map $phi(x, y) = (x, y, x y)$.
+ Compute the unit normal vector field $N$ across the surface.
+ Compute the shape operator (the differential of the normal map) $A_p (v) = D N|_p (v)$. This yields the matrix for the second fundamental form.
+ *External Knowledge Note:* Calculate the determinant of this matrix to find the Gaussian curvature ($K$).
+ *External Knowledge Note:* Calculate half the trace of this matrix to find the Mean curvature ($H$).

#pagebreak()

== Integration on Parameterized Manifolds
*Objective:* Calculate the integral of a scalar function over a manifold, or find its volume/area. \
*General Method:*
- *Parametrize:* Identify or define a local parametrization $alpha: U -> M$ for the manifold.
- *Differentiate:* Compute the differential (Jacobian matrix) $D alpha|_x$.
- *Find the Distortion Factor:* Calculate the volume distortion factor, $V(D alpha|_x)$, which is given by the square root of the Gram determinant: $sqrt(det(D alpha^T D alpha))$.
- *Integrate:* Set up the integral over the parameter domain $U$: $integral_U f(alpha(x)) V(D alpha|_x) d x$. Evaluate this as a standard multiple integral.

== Green's Theorem & Planar Line Integrals
*Objective:* Relate a line integral around a closed planar curve to a double integral over the enclosed region. \
*General Method:*
- *Check the Path:* Ensure the curve is simple, closed, and positively oriented. If the path is _not_ closed, artificially add a segment to close it, apply the theorem, and subtract the line integral of the added segment at the end.
- *Identify Components:* Extract the vector field components $P$ and $Q$.
- *Differentiate:* Calculate the partial derivatives $partial Q / partial x$ and $partial P / partial y$.
- *Integrate:* Evaluate the double integral over the enclosed region $Omega$: $integral integral_Omega (partial Q / partial x - partial P / partial y) d x d y$.

== Conservative Vector Fields
*Objective:* Evaluate line integrals efficiently by finding a scalar potential function. \
*General Method:*
- *Verify Local Conservatism:* Check if the field $F$ is locally conservative by verifying that $partial F_i / partial x_j = partial F_j / partial x_i$ for all components.
- *Check the Domain:* If the domain is simply connected or star-shaped, a locally conservative field is guaranteed to be globally conservative.
- *Find the Potential:* Find the potential function $phi$ such that $nabla phi = F$ by integrating the components of the field one by one.
- *Apply the FTC:* Use the fundamental theorem for line integrals: $integral_gamma F dot d l = phi(gamma(b)) - phi(gamma(a))$.

== Divergence Theorem (Gauss's Theorem)
*Objective:* Convert the flux of a vector field across a closed surface into a volume integral over the enclosed solid. \
*General Method:*
- *Check the Surface:* Ensure the surface $partial Omega$ is completely closed (bounds a compact region $Omega$) and the normal vector points outward. If the surface is open (e.g., a cylinder missing a lid), close it with an additional flat surface, apply the theorem, and subtract the flux through your added surface.
- *Compute Divergence:* Calculate the divergence of the field: $upright("div") F = sum partial F_i / partial x_i$.
- *Integrate:* Evaluate the triple integral over the enclosed volume $Omega$: $integral integral integral_Omega upright("div") F d V$.

== Stokes' Theorem
*Objective:* Relate the line integral around a closed curve in 3D space to the flux of the curl over a bounding surface. \
*General Method:*
- *Choose a Surface:* Identify a surface $Sigma$ whose boundary $partial Sigma$ matches the given curve. Often, choosing the simplest, flattest surface makes the math easier.
- *Orient Correctly:* Ensure the unit normal $N$ of the surface and the orientation of the boundary curve $T$ follow the right-hand rule.
- *Compute Curl:* Calculate the curl of the vector field: $upright("curl") X = (partial R / partial y - partial Q / partial z, partial P / partial z - partial R / partial x, partial Q / partial x - partial P / partial y)$.
- *Integrate:* Evaluate the surface integral: $integral integral_Sigma chevron.l upright("curl") X, N chevron.r d sigma$.

== Chain Rule & Differentials
*Objective:* Differentiate compositions of multivariable functions. \
*General Method:*
- *Deconstruct:* Identify the constituent functions (e.g., $g$ and $f$) and their respective domains and codomains.
- *Find Individual Differentials:* Compute the Jacobian (differential) matrix for each function individually: $(D g)$ and $(D f)$.
- *Multiply:* Multiply the matrices, ensuring the outer function's derivative is evaluated at the inner function's output: $D(g compose f)_p = (D g)_(f(p)) dot (D f)_p$.

== Differential Geometry (Curvature)
*Objective:* Calculate the Gaussian or Mean curvature using the shape operator. \
*General Method:*
- *Parametrize and Find the Normal:* Define a local parametrization for the surface and compute the unit normal field $N$.
- *Compute the Shape Operator:* Compute the differential of the normal map, known as the shape operator: $A_p (v) = D N|_p (v)$.
- *Construct the Matrix:* Build the matrix of this operator, which represents the second fundamental form.
- *Extract Curvatures:* Find the determinant of this matrix for the Gaussian curvature ($K$), or find half the trace for the Mean curvature ($H$).
