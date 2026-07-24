#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: thmbox-init()
#show: article_he.with(
  title: [ הכנה למבחן --- אנליזה על יריעות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 3)

= יריעות על קצה המזלג
== עקומות חלקות ואינטגרלים מסילתיים
עקומה חלקה ב־$RR^n$ מוגדרת כהעתקה חלקה (גזירה ברציפות אינסוף פעמים) $gamma: [a, b] arrow RR^n$.

=== מושגי יסוד בעקומות
#definition[רה־פרמטריזציה][
  עקומה $mu$ מתקבלת מ־$gamma$ על ידי רה־פרמטריזציה אם קיימת פונקציה חלקה $phi: [c, d] arrow [a, b]$ שהיא דיפואומורפיזם עולה. תכונות גיאומטריות של עקומות הן תכונות שאינן תלויות בבחירת הפרמטריזציה.
]

#definition[עקומה רגולרית][
  עקומה $gamma : [a,b] arrow RR^n$ תקרא רגולרית בנקודה $t_0$ אם $dot(gamma)(t_0) != 0$.\
  עקומה רגולרית בכל נקודה מבטיחה שהתמונה שלה תיראה "חלקה" ללא שינויי כיוון פתאומיים (כפי שקורה כש־g$dot(gamma)(t) = 0$).
]

#definition[הקו המשיק][
  עבור $gamma : [a,b] arrow RR^n$ עקומה רגולרית, הקו המשיק בנקודה $gamma(t_0)$ הוא ה־$Span$ של $gamma'(t_0)$. המשיק ליחידה מוגדר כ־$frac(dot(gamma)(t_0), norm(dot(gamma)(t_0)))$.
]

#theorem[אורך של מסילה][
  בהינתן $gamma: [a,b] arrow RR^n$ מסילה חלקה נגדיר את האורך שלה להיות
  $ L[gamma] = integral_a^b norm(dot(gamma)(t)) dif t $
]

#theorem[אינטגרל מסילתי (של פונקציה סקלרית)][
  בהינתן $gamma: [a,b] arrow RR^n$ מסילה חלקה ו־$f:RR^n arrow RR$ פונקציה רציפה אזי האינטגרל המסילתי/קווי של $f$ על $gamma$ מוגדר על־ידי
  $ integral_gamma f dif s = integral_a^b f(gamma(t)) norm(dot(gamma)(t)) dif t $
]

#theorem[רה־פרמטריזציה (Arc length parametrization)][
  אם $gamma : [a, b] arrow RR^n$ היא $C^1$ ורגולרית אז $phi : [a,b] arrow [0, l(gamma)]$ המוגדרת על־ידי $phi(t) = integral_a^b norm(dot(gamma)(s)) dif s$ (חד־חד ערכית, על וגזירה).\
  אז $overline(gamma) = gamma compose phi^(-1) : [0, l(gamma)] arrow RR^n$ היא רה־פרמטריזציה של $gamma$ (arc-length-parametrization) והיא $C^1$ ו־$norm(dot(overline(gamma))) eq.triple 1$
]

== שדות וקטוריים ואינטגרלים קוויים

שדה וקטורי $X$ על קבוצה פתוחה $U subset.eq RR^n$ הוא פונקציה חלקה $X: U arrow RR^n$.

=== אינטגרל קווי
#theorem[אינטגרל מסילתי על שדה וקטורי][
  תהיי $gamma$ מסילה ו־$arrow(X)$ שדה וקטורי (שם יפה עבור $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ חלקה) אזי $integral_gamma arrow(X) dif arrow(ell) = integral_a^b arrow(X)(gamma(t)) dot(gamma) (t) dif t$.
]

=== שדות משמרים (Conservative Fields)
#definition[שדה משמר][
  שדה וקטורי $arrow(F): U arrow RR^n$ עבור $U$ פתוחה ייקרא שדה משמר אם עבור כל שתי מסילות $gamma_1, gamma_2 : [a,b] arrow U$ המקיימות $gamma_1 (a) = gamma_2 (a)$ ו־$gamma_1 (b) = gamma_2 (b)$ מתקיים $integral_gamma_1 arrow(F) dif ell = integral_gamma_2 arrow(F) dif ell$.
]

#theorem[תנאי שקול לשדה וקטורי][
  אם $arrow(F) : U arrow RR^n$ כאשר $U$ פתוחה וקשירה אז $arrow(F)$ שדה משמר אם ורק אם קיימת פונקציה חלקה $phi : U arrow RR$ כך שמתקיים
  $ arrow(F) = gradient phi = vec(frac(partial phi, partial x_1), dots.v, frac(partial phi, partial x_n)) $
  ל־$phi$ כזאת אנחנו קוראים הפוטנציאל של $arrow(F)$.
]

#corollary[
  אם $arrow(F) = (F_1, dots.h, F_n)$ שדה משמר אזי לכל $i,j in [n]$ מתקיים
  $ frac(partial F_i, partial x_j) = frac(partial F_j, partial x_i) $
]

#definition[שדה משמר מקומית][
  שדה וקטורי $arrow(F): U arrow RR^n$ עבור $U$ פתוחה אז $arrow(F)$ משמר מקומית אם לכל $x in U$ מתקיים
  $ frac(partial F_i, partial x_j)(x) = frac(partial F_j, partial x_i)(x) $
]

#definition[הומוטופיה][
  תהיינה $gamma_1, gamma_2 : [a,b] arrow U$ מסילות כך ש־$gamma_1 (a) = gamma_2 (a)$ ו־$gamma_1 (b) = gamma_2 (b)$. נאמר שהן הומוטפיות ביחס לנקודות הקצה אם קיימת $H:[a,b] times [0,1] arrow U$ חלקה המקיימת
  $
    forall t in [a,b], space H(t,0) = gamma_1 (t), quad H(t,1) = gamma_2 (t) \
    forall s in [0,1], space H(a,s) = gamma_1 (a), quad H(b,s) = gamma_1 (b)
  $
]

#proposition[
  עבור שדה וקטורי $arrow(F) : U arrow RR^n$ עבור $U$ פתוחה הוא משמר מקומית אז עבור כל שתי מסילות $gamma_0, gamma_1 : [a,b] arrow U$ שהומוטפיות ביחס לנקודות הקצה $p,q in U$ מתקיים $integral_gamma_0 arrow(F) dif ell = integral_gamma_1 arrow(F) dif ell$
]

#corollary[
  אם כל שתי מסילות עם אותן נקודות קצה ב־$U$ הומוטופיות זו לזו ו־$arrow(F)$ משמר מקומית אז הוא משמר.
]

#corollary[
  אם $arrow(F)$ שדה משמר מקומית אז לכל נקודה קיימת סביבה בה $arrow(F)$ הוא שדה משמר.
]

#definition[תחום כוכב][
  נגיד ש־$Omega subset.eq RR^n$ היא תחום כוכב אם קיים $a in Omega$ כך שלכל $x in Omega$ מתקיים $[a,x] = {a + t(x-a) bar t in [0,1]} subset.eq Omega$.
]

#example[
  כל כדור הוא תחום כוכב וגם כל קבוצה קמורה היא תחום כוכב.
]

#theorem[
  בתחום כוכב $arrow(F)$ שדה וקטורי הוא משמר אם ורק אם הוא משמר מקומית.
]

#corollary[
  אם בתחום פשוט קשר $Curl F = 0$ אז הוא משמר.
]

#theorem[
  אם $arrow(F)$ עם $phi$ פוטנציאל הוא משמר מקומית ו־$gamma : [a,b] arrow RR^n$ מסילה
  $ integral_gamma arrow(F) dif ell = phi(gamma(b))-phi(gamma(a)) $
]


== יריעות ב־$RR^n$
=== הגדרות שקולות ליריעה
#definition[יריעה לפי פרמטריזציה מקומית][
  $M subset.eq RR^n$ תקרא יריעה $C^r$ $k$־מימדית אם לכל $p in M$ יש סביבה $p in W subset.eq RR^n$, קבוצה פתוחה $U subset.eq RR^k$ והעתקה $phi : U arrow RR^n$ המקיימת
  + $phi(U) = M inter W$
  + $phi:U arrow M inter W$ הוא הומיאומורפיזם
  + $D phi_(phi^(-1)({p})) : RR^k arrow RR^k$ היא מדרגה מלאה
]

#definition[יריעה כגרף של פונקציה][
  $M subset.eq RR^n$ תקרא יריעה $C^r$ $k$־מימדית אם לכל $p in M$ יש סביבה $p in W subset.eq RR^n$, קבוצה פתוחה $U subset.eq RR^k$ ופונקציה $f in C^r (U, RR^(n-k))$ כך שמתקיים $ W inter M = Gamma(f) $
]

#definition[יריעה כקבוצת האפסים][
  $M subset.eq RR^n$ תקרא יריעה $C^r$ $k$־מימדית אם לכל $p in M$ יש סביבה $p in W subset.eq RR^n$ ופונקציה חלקה $F:W arrow RR^(n-k)$ כך שמתקיים
  + $M inter W = {x in W bar F(x) = 0}$
  + $D F_p : RR^n arrow RR^(n-k)$ היא מדרגה מלאה
]

=== המרחב המשיק ($T_p M$)
עבור נקודה $p$ ביריעה, המרחב המשיק הוא תת־מרחב ליניארי מממד $k$ המוגדר כמרחב התמונה של הדיפרנציאל של הפרמטריזציה המקומית: $T_p M = im(D alpha|_x)$.\
הגדרה זו אינה תלויה בבחירת הפרמטריזציה.

== אינטגרציה על יריעות
=== היפר־נפח ($bold(Vol_d)$)
#definition[קבוע הנפח][
  בהינתן 2 מרחבי מכפלה פנימית $k$־מימדים  $(U, chevron.l, chevron.r_U)$ ו־$(W, chevron.l , chevron.r)_W$, העתקה לינארית $T:U arrow W$ ובסיסים אורתונורמליים $e_1, dots.h, e_k$ ל־$U$ ו־$tau_1, dots.h, tau_k$ ל־$W$ נגדיר את קבוע הנפח להיות
  $ V(T)=abs(det(a_(j i))) $
  כאשר $T(e_i) = sum a_(j i) tau_j$
]

#lemma[הגדרה שקולה לקבוע נפח][
  עבור $T:RR^k arrow RR^n$ מתקיים
  $ V(T) = sqrt(det(T^t T)) $
]

#lemma[הגדרה שקולה לקבוע נפח עבור משטח שנתון בצורה סתומה][
  אם $z=h(x,y)$ כלומר $f(x,y) = (x,y, h(x,y))$ אז $dif S = sqrt(1+(z_x)^2 + (z_y)^2 dif x)$.
]

#theorem[היפר־נפח של יריעה פרמטרית][
  בהינתן $X$ יריעה פרמטרית ו־$phi.alt : U subset.eq RR^k arrow RR^n$ הפרמטריזציה שלה (יריעה $k$־מימדית) שלה אז הנפח שלה מוגדר על־ידי
  $ Vol_k (X) = integral_U V(D phi.alt|_x) dif x $
  כאשר $V(T)$ הוא קבוע הנפח.
]

#theorem[
  אם $(X, phi.alt : U arrow RR^n)$ יריעה פרמטרית ו־ $f:X arrow RR$ נגדיר את האינטגרל של $f$ ביחס לנפח ה־$k$ מימדי להיות
  $ integral_X f dif Vol_k colon.eq integral_U f(phi.alt(x))V(D phi.alt |_x) dif x $
  כמובן בהינתן שהאינטגרל מצד ימין מוגדר.
]

#lemma[
  אם $(X, phi.alt : U arrow RR^n)$ יריעה פרמטרית ו־$psi : W subset.eq RR^k arrow U$ דיפאומורפיזם ו־$f:X arrow RR$ אזי
  $ integral_U f(phi.alt(x))V(D phi.alt |_x) dif x = integral_W f(phi.alt(psi(y)))V(D (phi.alt compose psi) |_y) dif y $
]

== המשפטים החשובים
=== משפט גרין
#theorem[משפט גרין][
  יהי $Omega subset.eq RR^2$ תחום חלק ויהי $F=(P,Q)$ שדה וקטורי חלק בסביבה של $Omega$ ו־$boundary(Omega)$ באוריינטציה חיובית. אזי
  $
    integral_boundary(Omega) P dif x + Q dif y = integral_boundary(Omega) F dif ell = integral_Omega frac(partial Q, partial x) - frac(partial P, partial y) dif x dif y
  $
]

#corollary[
  בתנאי משפט גרין
  $
    Area(Omega)=integral_boundary(Omega) x dif y = - integral_boundary(Omega) y dif x = frac(1, 2) integral_boundary(Omega) x dif y - y dif x
  $
]

=== משפט הדיברגנץ
#definition[Divergence על יריעות][
  תהיי $M^k subset.eq RR^n$ יריעה $k$־מימדית (עם או בלי שפה) ויהי $X:M arrow RR^n$ שדה וקטורי חלק. אז הדיברגנץ' של $X$ ביחס ליריעה $M$ בנקודה $p in M$ מוגדר על־ידי
  $ divergence_M X(p) = sum_(i=1)^k chevron.l D_(e_i) X|_p, e_i chevron.r $
  כאשר ${e_i}_(i=1)^k$ בסיס אורתונורמלי למרחב המשיק $T_p (M)$ בנקודה ו־$D e_i X = D X(e_i)$ הנגזרת של השדה הוקטורי $X$ בכיוון הוקטור $e_i$
]

#definition[Divergence על יריעה במימד המרחב][
  אם $Omega subset.eq RR^n$ יריעה ממימד $n$ אזי
  $ divergence_Omega X = sum_(i=1)^n frac(partial X_i, partial x_i) $
]

#theorem[משפט הדירביגנץ][
  תהיי $Omega subset.eq RR^n$ תחום חלק וחסום ויהי $F$ שדה וקטורי חלק המוגדר בסביבה של $Omega$ ויהי $N: boundary(Omega) arrow RR^n$ נורמל היחידה המצביע החוצה על $Omega$ אזי
  $ integral_Omega divergence F dif x = integral_boundary(Omega) chevron.l F, N chevron.r dif sigma $
  במילים אחרות, השטף של שדה וקטורי דרך שפה סגורה שווה לאינטגרל של הדיברגנץ על הנפח.
]

=== אינטגרציה בחלקים וזהויות גרין
#lemma[כלל המכפלה לדיברגנץ][
  עבור פונקציה סקלרית $f$ ושדה וקטורי $X$:
  $ divergence (f X) = f divergence X + chevron.l gradient f, X chevron.r $
]

#theorem[אינטגרציה בחלקים על יריעות][
  בהינתן $f,g$ פונקציות חלקות ו־$X$ שדה וקטורי על תחום $Omega$ עם שפה $boundary(Omega)$ ונורמל חיצוני $hat(n)$:
  $
    integral_Omega (X f)g dif x = - integral_Omega f(X g) dif x - integral_Omega f g divergence X dif x + integral_boundary(Omega) f g chevron.l X, hat(n) chevron.r dif Vol_(d-1)
  $
]

=== משפט סטוקס
#definition[Curl][
  תהיי $U subset.eq RR^3$ קבוצה פתוחה ונגדיר $Curl : C^1 (U, RR^3) arrow C^1 (U, RR^3)$ על־ידי
  $ Curl F = (partial_y F_3 - partial_z F_2, partial_z F_1 - partial_x F_3, partial_x F_2 - partial_y F_1) $
]

#theorem[משפט סטוקס][
  יהי $Sigma subset.eq RR^3$ יריעה קומפקטית דו־מימדית עם שפה (אולי ריקה) ותהיי $U subset.eq RR^3$ סביבה של $Sigma$ ויהי $F:U arrow RR^3$ שדה וקטורי. אזי
  $ integral_boundary(Sigma) F dif ell = integral_Sigma chevron.l Curl F, N chevron.r $
]

== פונקציות הרמוניות
תשלימי אם יש לך זמן (הכל ראינו במד"ר!)

== משטחי סיבוב ומשפט גולדין
שטח הפנים של משטח סיבוב הנוצר על ידי סיבוב עקומה $gamma$ סביב ציר שווה למכפלת אורך העקומה
($gamma$) בהיקף המעגל שיוצר מרכז המסה שלה: $Area = L(gamma) dot.op 2pi abs(a_1)$.

= צורות חשובות
== מסילות
== יריעות פרמטריות
=== ספירה פרמטרית
#definition[פרמטריזציה של ספירה דו־מימדית][
  משטח $Sigma$ נתון על־ידי $display(r(theta,phi.alt) = (cos(phi.alt)sin(theta), sin(phi.alt) sin(theta), cos(theta)))$ עבור $0<=theta<=2pi$ ,  $0<= phi.alt <= pi$.
  #figure(
    image("../../../src/images/2D sphere.png", width: 100%, height: 15%, fit: "contain"),
  )

]

=== טורוס
#definition[טורוס (Torus)][
  יריעה הדומה בצורתה לסופגניה, הנוצרת מסיבוב מעגל ברדיוס $r$ סביב ציר במרחק $R$ ממנו. הפרמטריזציה הסטנדרטית:
  $ r(theta, phi.alt) = ((R + r cos(phi.alt))cos(theta), (R + r cos(phi.alt))sin(theta), r sin(phi.alt)) $
  עבור $0 <= theta <= 2pi$ (זווית הסיבוב המרכזית) ו־$0 <= phi.alt <= 2pi$ (הזווית על המעגל הקטן).
]

=== הליקס (סליל)
#definition[הליקס][
  מסילה $gamma(t) = (cos(t), sin(t), t)$ עבור $t in [0,2pi]$.
  #figure(
    image("../../../src/images/helix.png", width: 100%, height: 20%, fit: "contain"),
    caption: "הליקס עם טווח יותר גדול כדי שנראה את הסיבוב",
  )
]

== יריעות עם שפה
== יריעות בלי שפה

= דרכים כלליות למציאת נורמל
+ תהיי $F:RR^3 arrow RR$ פונקציה חלקה ונסמן $Sigma = F^(-1)(0)$ ונניח כי לכל $p in Sigma$ מתקיים $D F_p != 0$ אזי $display(n = frac(gradient F, norm(gradient F)))$ הוא נורמל היחידה ל־$Sigma$ (זה נכון בעצם גם למשטחים שנתונים בצורה סתומה).
+ תהיי $Sigma$ יריעה פרמטרית (משטח ב־$RR^3$) הנתונה על־ידי פרמטריזציה $r(u,v)$. נורמל היחידה למשטח בנקודה מוגדר על־ידי המכפלה הוקטורית של הנגזרות החלקיות:
  $ n = frac(r_u times r_v, norm(r_u times r_v)) $
  (כאשר $r_u = partial_u r$ ו־$r_v = partial_v r$). כיוון הנורמל (פנימה/החוצה) נקבע לפי סדר המכפלה (כלל יד ימין).

= דברים חשובים לזכור
== זהויות חשובות
+ $cos^2(t)-sin^2(t) = cos(2t)$
+ $cos^2(t)+sin^2(t) = 1$
+ $cos(t)sin(t) = frac(1, 2)sin(2t)$
+ $sin^2 (2t) = frac(1-cos(4t), 2)$

== נפחים ושטחים חשובים
+ ספירה
  + נפח $V = frac(4, 3) pi r^3$
  + שטח $A = 4pi r^2$
+ אליפסואיד
  + נפח $V=frac(4, 3) pi a b c$
+ צילינדר
  + נפח $V=pi r^2 h$
  + שטח $A=2pi r h + 2pi r^2$
+ קונוס
  + נפח $V=frac(1, 3) pi r^2 h$
+ טורוס
  + נפח $V=2pi^2 r^2 R$
  + שטח $A=4pi^2 r R$
= מכפלה וקטורית
#definition[מכפלה וקטורית][
  בהינתן $v,w in RR^3$ כאשר $v = (a_1, a_2, a_3)$ ו־$w=(b_1, b_2,b_3)$ המכפלה הוקטורית שלהם היא
  $ v times w = (a_2 b_3 - b_3b_2, a_3 b_1 - a_1 b_3, a_1 b_2 - a_2 b_1) $
]

#proposition[תכונות המכפלה הוקטורית][
  + $v times w = -w times v$
  + $v times w perp v$, $v times w perp w$
  + אם $v,w$ אורתונורמליים אזי $v,w, v times w$ זה בסיס אורתנורומלי
  + אם $A$ מטריצה אורתוגונלית עם $det(A)=1$ אזי $A(v times w) = A(v) times A(w)$
]

= דוגמאות לחישובים

== מסילות

=== אינטגרל מסילתי/קווי על פונקציה
#example[
  נחשב את האינטגרל הקווי $integral_gamma sqrt(z) dif s$ עבור הסליל (הליקס) $display(gamma(t)=(cos(t), sin(t), t^2))$ כאשר $t in [0,2pi]$
]

#solution[
  $
    dot(gamma)(t) = (-sin(t), cos(t), 2t) \
    norm(dot(gamma)(t)) = sqrt(1+4t^2) \
    ==> integral_gamma sqrt(z) dif s = integral_0^(2pi) abs(t) sqrt(1+4t^2) dif t = integral_0^(2pi) t sqrt(1+4t^2) dif t = dots.h.c = [frac((4t^2+1)^frac(3, 2), 12)]_(t=0)^(t=2pi) = frac(1, 12) ((1+16 pi^2)^frac(3, 2)-1)
  $
]

=== אינטגרל מסילתי על שדה וקטורי
#example[
  נסתכל על השדה הוקטורי $F(x,y,z) = display((frac(x, x^2+y^2m), frac(y, x^2+y^2), z))$ המוגדר על $U=(RR^2 without {0}) times RR$. נחשב את האינטגרל הקווי $integral_gamma arrow(X) dif arrow(ell)$ לאורך המסילה $gamma: [0,2pi] arrow RR^n$ הנתונה על־ידי $gamma(t)=display((cos(t), sin(t), t^2))$.
]

#solution[
  $
    dot(gamma)(t) = (-sin(t), cos(t), 2t) ==> integral_0^(2pi) F(gamma(t)) dot(gamma)(t) dif t = integral_0^(2pi) -sin(t)cos(t) + sin(t)cos(t) + 2t dot.op t^2) dif t = integral_0^(2pi) 2t^3 dif t = [frac(t^4, 2)]_(t=0)^(t=2pi) = 8pi^4
  $
]

== יריעות פרמטריות
#example[
  בהינתן פרמטריזציה $Sigma$ הנתונה על־ידי $display(r(theta, phi.alt) = (cos(phi.alt)sin(theta), sin(phi.alt)sin(theta),cos(theta)))$ עבור $0<=theta<=pi$ ו־$0<=phi.alt <= frac(theta, 2)$ נחשב את השטח של $Sigma$.
]

#solution[
  $
    T colon.eq D phi.alt|_x = mat(-sin(phi.alt) sin(theta), cos(phi.alt) cos(theta); cos(phi.alt) sin(theta), sin(phi.alt) cos(theta); 0, -sin(theta)) \
    sqrt(det(T^t T)) = sqrt(det mat(delim: "[", sin^2(theta), 0; 0, 1)) = abs(sin(theta)) \
    ==> Vol_k (Sigma) = integral_U abs(sin(theta)) dif x = integral_0^pi integral_0^frac(theta, 2) abs(sin(theta)) dif phi.alt dif theta = integral_0^pi integral_0^frac(theta, 2) sin(theta) dif phi.alt dif theta = frac(1, 2) integral_0^pi sin(theta) theta dif theta = [sin(theta)-cos(theta)theta]_(theta=0)^(theta=pi) = frac(pi, 2)
  $
]

=== אינטגרל של פונקציה

=== משפט גרין
#example[
  נחשב את השטח הכלוא בתוך המסילה $gamma(t)=display((sin(t), sin(t)cos(t)))$ עבור $t in [0,2pi]$.
]

#solution[
  ראשית נתחיל מלשים לב שאם $ x(t)=sin(t), quad y(t)=sin(t)cos(t) \
  ==> y(t)=x(t)cos(t) \
  ==> y^2 = x^2 (t) cos^2 (t) = x^2 (t) (1-sin^2 (t))= x^2 (t) (1- x^2 (t)) $
  עבור $t in [0, pi]$ המסילה תלך עם כיוון השעון ועבור $t in [pi, 2pi]$ היא תלך נגד כיוון השעון ובעצם הם יבטלו אחד את השנייה באינטגרל, אז נחשב רק אחד מהם ונכפיל ב־$2$.\
  נרצה להשתמש בלמה לעיל ולכן נחשב
  $ dif x = cos(t) dif t, quad dif y = (cos^2 (t)-sin^2 (t)) dif t $
  ולכן
  $
    x dif y - y dif x = (sin(t))(cos^2 (t) - sin^2 (t)) dif t- (sin(t)cos(t))(cos(t)) dif t = (sin(t)cos^2 (t) - sin^3 (t) - sin(t) cos^2 (t)) dif t = -sin^3 (t) dif t
  $
  ולכן מהלמה לעיל
  $
    Area(Omega) = frac(1, 2) integral_boundary(Omega) x dif y - y dif x = 2 dot.op abs(frac(1, 2) integral_0^(pi) -sin^3 (t) dif t) = integral_0^pi sin^3(t) dif t = integral_0^pi sin(t)(1-cos^2(t)) dif = dots.h.c = frac(4, 3)
  $
]

=== משפט סטוקס
#example[
  נחשב $integral.cont_gamma F dif ell$ עבור $F=(y,-2z, 4x)$ כאשר $gamma$ זה מעגל ברדיוס $2$ במישור $x+2y+3z=4$ נגד כיוון השעון כשמסתכלים עליו מהציר החיובי של ציר ה־$z$.
]

#solution[
  ראשית $Curl F = (2,-4,-1)$ ובשביל למצוא את $n$ בעצם המשטח נתון בצורה סתומה על־ידי משוואה (כלומר קווי גובה) ולכן אם הוא נתון על־ידי $G$ מתקיים $n=frac(gradient G, norm(gradient G))$ על־כן במקרה שלנו $n=-frac((1,2,3), sqrt(14))$ כאשר המינוס הוא בשביל הכיוון הנגדי.\
  ממשפט סטוקס נקבל אם־כך כאשר $Sigma$ זה  בעצם הדיסק החסום על־ידי $gamma$
  $
    integral.cont_gamma F dif ell = integral.double_Sigma -frac(1, sqrt(14)) (2 dot.op 1 + 2 dot.op -4 + 3 dot.op (-1) ) dif x = frac(9, sqrt(14)) underbrace(pi dot.op 2^2, Area(Sigma)) = frac(36 pi, sqrt(14))
  $
]

=== משפט הדיבירגנץ
#example[
  יהי $F(x,y,z) = (-y, x,z)$ ונחשב את השטף של $F$ דרך המשטח הסגור $Sigma = {(x,y,z) bar x^2+y^2 = cos^2 (z), frac(-pi, 2) <= z<=frac(pi, 2)}$.
]

#solution[
  ראשית נשים לב ש־$divergence F = 1$ ולכן נשאר רק לחשב
  $ integral_(-frac(pi, 2))^frac(pi, 2) cos^2 (z) dif z = dots.h.c = frac(pi^2, 2) $
]

#example[

]
== יריעות עם שפה
?
=== משפט הדיבירגנץ'
=== משפט גרין
=== משפט סטוקס

