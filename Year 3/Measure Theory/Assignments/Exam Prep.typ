#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן --- משפטים והוכחות נבחרים --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#let Leb = math.op("Leb")
#let Borel = math.op("Borel")

#set heading(numbering: "1.1")
#outline(depth: 2)

#pagebreak()

= מידה
== תנאי שקול לפונקציה מדידה
#theorem(
  "תנאי שקול לפונקציה מדידה",
)[יהי $(X, cal(A))$ מרחב מדיד. אם $f: X arrow.r [-infinity, infinity]$ פונקציה אזי $f$ מדידה אם ורק אם $f^(-1)((alpha, infinity])$ לכל $alpha in RR$.
]
#proof[\
  $<==$ מיידי מהגדרה כי אם $f$ מדידה לכל $E in BB([-infinity, infinity])$ מתקיים $f^(-1)(E) in cal(A)$ ולכן בהינתן $alpha in RR$ כלשהו, מתקיים $(alpha, infinity] in BB([infinity, infinity])$ ובפרט $f^(-1)((alpha, infinity]) in cal(A)$.\
  $==>$ מספיק להראות שהמקור של כל אחת מהקבוצות
  $ (alpha, beta), wide (alpha, infinity], wide [-infinity, beta) $
  הוא מדיד, ואכן:
  + בהינתן $beta in RR$ מתקיים
    $
      f^(-1)([-infinity, alpha)) = union.big_(n=1)^infinity f^(-1)([-infinity, beta-1/n)) = union.big_(n=1)^infinity f^(-1)((beta-1/n, infinity]^c) = union.big_(n=1)^infinity (f^(-1)((beta-1/n, infinity]))^c in cal(A)
    $
    כאשר המעבר האחרון נובע מההנחה שלכל $alpha in RR$ מתקיים $f^(-1)((alpha, infinity])$ ולכן לכל $n in NN$ בפרט עבור $alpha = beta-1/n in RR$ נקבל \
    $f^(-1)((beta-1/n, infinity]) in cal(A)$.\
    אבל $cal(A)$ היא $sigma$־אלגברה ולכן מצד אחד נקבל $(f^(-1)((beta-1/n, infinity]))^c$ לכל $n in NN$ ומצד שני $union.big_(n=1)^infinity (f^(-1)((beta-1/n, infinity]))^c in cal(A)$ לכל \
    $beta in RR$, וזה סוגר את שני המקרים הימניים.
  + בהינתן $alpha, beta in RR$
    $
      f^(-1)((alpha, beta))=f^(-1)([-infinity, beta) inter (alpha, infinity]) = f^(-1)([-infinity, beta)) inter f^(-1)((alpha, infinity]) in cal(A)
    $
    כאשר המעבר האחרון נובע מכך ש־$sigma$־אלגברה סגורה לחיתוכיים סופיים.
  כעת, אם $U subset.eq [-infinity, infinity]$ אזי $U = union.big_(n=1)^infinity I_n$ כאשר לכל $n in NN$, $I_n$ הוא מהצורה של $(star)$ וכי קבוצה פתוחה ב־$[-infinity, infinity]$ היא איחוד בן־מנייה של קבוצות מהצורה $(star)$ ונקבל
  $ f^(-1)(U) = f^(-1)(union.big_(n=1)^infinity I_n) = union.big_(n=1)^infinity f^(-1)(I_n) in cal(A) $
  כלומר המקור של כל קבוצה פתוחה הוא מדיד ולכן $f$ מדידה.
]

#pagebreak()

== מדידות נשמרת תחת הפעלת sup/inf/limsup/liminf
#theorem(
  "מדידות נשמרת תחת הפעלת sup/inf/limsup/liminf",
)[יהי $(X, cal(A))$ מרחב מדידה. אם ${f_n : X arrow.r [-infinity, infinity]}_(n=1)^infinity$ סדרת פונקציות מדידות, אז הפונקציות
  $
    (1) space sup_(n in NN) {f_n} wide (2) space inf_(n in NN) {f_n} wide (3) space limsup_(n arrow.r infinity) f_n wide (4) liminf_(n arrow.r infinity) f_n
  $
  כולן מדידות.]
#proof[
  $(1)$ נסמן $g colon.eq sup_(n in NN) {f_n}$,  ומספיק להראות שהקבוצה $g^(-1)((a,infinity])$ היא מדידה לכל $alpha in RR$, אז נרצה להראות
  $ (star) space g^(-1)((alpha, infinity)) = union.big_(n=1)^infinity f_n^(-1)((a, infinity]) $
  $subset.eq$: אם $x in g^(-1)((alpha, infinity])$ אז
  $ sup_(n in NN) {f_n (x)} = g(x) in (alpha, infinity] > alpha $
  כלומר קיים $n_0 in NN$ כך ש־$f_(n_0) (x) > alpha$ (אחרת לכל $n in NN$ מתקיים $f_n (x) <= alpha$ וזו סתירה) אז $ x in f_(n_0)^(-1) ((alpha, infinity]) ==> x in union.big_(n=1)^infinity f_n^(-1)((alpha, infinity]) ==> g^(-1)((alpha, infinity]) subset.eq union.big_(n=1)^infinity f_n^(-1) ((alpha, infinity]) $
  $supset.eq$: אם $x in union.big_(n=1)^infinity f_n^(-1)((alpha, infinity])$ אז קיים $n_0 in NN$ כך ש־$x in f_n^(-1) ((alpha, infinity])$ ולכן $f_(n_0) (x) in (alpha, infinity]$ כלומר $f_(n_0) (x) > alpha$ ומתקיים
  $
    sup_(n in NN) {f_n (x)} >= f(n_0) (x) > alpha ==> sup_(n in NN) {f_n (x)} > alpha ==> g(x) in (alpha, infinity] ==> x in g^(-1) ((alpha, infinity])
  $
  אז $(star)$ נכון ולכן $f_n$ מדידה לכל $n in NN$ ולכן $f_n^(-1)((alpha, infinity])$ מדידה לכל $n in NN$, כלומר הקבוצה $g^(-1)((alpha, infinity])$ היא איחוד בן־מנייה של קבוצות מדידות ולכן מדידה בעצמה וקיבלנו שהפונקציה $g$ מדידה.\
  $(2)$ זהה עבור קטעים מהצורה $[-infinity, beta]$.\
  $(3)$
  $
    limsup_(n arrow.r infinity) f_n = inf_(k in NN) {sup_(n in NN \
      n>=k) {f_n}}
  $
  ולכן עבור סדרת הפונקציות ${h_k : X arrow.r [-infinity, infinity]}_(k=1)^infinity$ המוגדרת על־ידי
  $
    forall k in NN, space h_k colon.eq sup_(n in NN \
    n>=k) {f_n}
  $
  מתקיים מ־$(1)$ ש־${h_k}_(k=1)^infinity$ סדרת פונקציות מדידות ונקבל מ־$(2)$ ש־$inf_(k in NN) {h_k}$ מדידה ולכן $limsup_(n arrow.r infinity) f_n$ מדידה.\
  $(4)$ באותו אופן למקרה הקודם רק עבור $ liminf_(n arrow.r infinity) f_n = sup_(k in NN){inf_(n in NN \ n>=k) {f_n}} $
]

= אינטגרציה
== לכל פונקציה מדידה יש סדרת פונקציות פשוטות שמתכנסת אליה
#theorem(
  "לכל פונקציה מדידה יש סדרת פונקציות פשוטות שמתכנסת אליה",
)[אם $f: X arrow.r [0,infinity]$ פונקציה מדידה כלשהי, אז קיימת סדרת פונקציות פשוטות ${s_n} bar X arrow.r [0, infinity)_(n=1)^infinity$ כך שמתקיים
  + ${s_n}_(n=1)^infinity$ סדרה מונוטונית עולה וחסומה על־ידי $f$, כלומר
    $ forall n, m in NN, space m<=n ==> 0<=s_m<=s_n <=f $
  + הסדרה ${s_n}_(n=1)^infinity$ מתכנסת נקודתית ל־$f$, כלומר
    $ forall x in X, space s_n (x) stretch(arrow.r)_(n arrow.r infinity) f(x) $
]
#proof[
  נגדיר $phi_n : [0,infinity) arrow.r [0, infinity)$ על־ידי
  $ forall x in [0, infinity), space phi_n (x) colon.eq mycases(2^(-n) dot.op floor(2^n dot.op x), 0<=x<n, n, x>=n) $
  אז לכל $n in NN$, $phi_n$ היא צירוף לינארי של פונקציות מהצורה $bb(1)_(k/2^n, (k+1)/2^n)$ לכל $0<=k <= n dot.op 2^n-1$ ולכן היא מדידה בורל ביחס ל־$[0,infinity)$ ולכן תמונתה סופית ו־$phi_n$ היא פונקציה פשוטה.\
  לכל $x in [0,n]$ ולכל $n in NN$ מתקיים
  $ floor(2^n x) <= 2^n x < floor(2^n x)+1 <==> 2^(-n) floor(2^n x) <= x < 2^(-n)(floor(2^n x)+1) $
  כלומר
  $
    phi_n (x) <= x < phi_n (x) + 2^(-n) <==> phi_n (x) <= x and x < phi_n (x) + 2^(-n) <==> x>=phi_n (x) and phi_n (x) > x-2^(-n) <==> x-2^(-n) < phi_n (x) <= x
  $
  ולכן $x-2^(-n) < phi_n (x) <= x$ לכל $n in NN, x in [0,n]$ ומכאן הרי ש־$phi_n (x) stretch(arrow.r)_(n arrow.r infinity) x$ לכל $x in [0,n]$ וכן לכל $x in [0, infinity)$ מתקיים
  $ forall n,m in NN, space n<=m ==> phi_n <= phi_m <=x $
  ולכן ${phi_n}_(n=1)^infinity$ סדרה מונוטונית עולה ואם לכל $n in NN$ נגדיר $s_n colon.eq phi_n compose f$ נקבל את הטענה שכן הרכבת פונקציות מדידות היא פונקציה מדידה, אז ${s_n}_(n=1)^infinity$ מקיימת את הנדרש.
]

#pagebreak()

== תכונות האינטגרל

#theorem("תכונות האינטגרל")[
  תהיינה $f,g : X arrow.r [0,infinity]$ פונקציות מדידות ותהיינה $A,B, E in cal(E)$ מדידות.\
  האינטגרל של $f, g$ ביחס ל־$mu$ מקיים את התכונות הבאות
  + מונטוניות של $f,g$: אם $0<=f<=g$ אזי $0<=integral_A f dif mu <= integral_A g dif mu$
  + מונטוניות ביחס להכלה: אם $0<=f$ ו־$A subset.eq B$ אזי $integral_A f dif mu <= integral_B f dif mu$
  + הומוגניות: אם $0<=f$ ו־$c in [0,infinity)$ אזי $integral_A c dot.op f dif mu = c dot.op integral_A f dif mu$
  + אם $f|_E eq.triple 0$ אזי $integral_E f dif mu = 0$ (גם אם $mu(E) = infinity$)
  + אינטגרציה על קבוצות ממידה אפס: אם $mu(E)=0$ אזי $integral_E f dif mu = 0$ (גם אם $f|_E eq.triple infinity$)
  + אינטגרציה על קבוצה בניסוח עם הפונקציה המציינת: אם $0<=f$ אזי $integral_E f dif mu = integral_X f dot.op bb(1)_(E) dif mu$
  + אינטגרציה על איחוד זר: אם $A inter B = emptyset$ אזי $integral_(A union.dot B) f dif mu = integral_A f dif mu + integral_B dif mu$
]
#proof[
  + בלי הגבלת הכלליות, $X=E$ אחרת ניקח לכל $E in cal(A)$,  $f dot.op bb(1)_(E), g dot.op bb(1)_(E)$ ועדיין נחשב אינטגרציה על כל $X$ ונקבל מהגדרה
    $ integral f d mu = sup {integral_E s d mu bar 0<=s<=f, " פשוטה" s} $
    מהיות $0<=f<=g$ נובע גם שלכל $s$ כזאת מתקיים $0<=s<=g$ ולכן מתקיים
    $
      {integral_E s d mu bar 0<=s<=f, " פשוטה" s} subset.eq {integral_E s d mu bar 0<=s<=g, " פשוטה" s}
    $
    ובפרט בלקיחת סופרמום
    $
      integral f d mu = sup {integral_E s d mu bar 0<=s<=f, " פשוטה" s} subset.eq sup {integral_E s d mu bar 0<=s<=g, " פשוטה" s} = integral g d mu
    $
  + יהי $x in X$.\
    אם $x in A$ אז $bb(1)_(A)(x)=1$ ומהנתון $A subset.eq B$ מתקיים $bb(1)_(B)(x)=1$.\
    אם $x in.not A$ אזי $bb(1)_(A)(x)=0$ ויש שתי אפשרויות: או ש־$x in B$ או ש־$x in.not B$, כלומר או ש־$bb(1)_(B)(x)=1$ או ש־$bb(1)_(B)(x)=0$.\
    בין כה וכה, מכך ש-$A subset.eq B$ נובע כי בהתאמה מתקיים $bb(1)_(A)(x)<=bb(1)_(B)(x)$ לכל $x in X$.\
    בפרט נובע מכך שלכל $x in X$ מתקיים $f dot.op bb(1)_(A)(x) <= f dot.op bb(1)_(B)(x)$ והם בהתאמה מתאימים מהגדרה ל־$integral_A f d mu, integral_B f d mu$.\
    מהסעיף הקודם נובע אם כך ש־$integral_A f d mu <= integral_B f d mu$ (הסעיף הקודם הוא מונוטוניות האינטגרל) עבור $E = X$.
  + תהיי $E in cal(A)$, ותהיי $s<=f$ פונקציה פשוטה כך שמתקיים $s=sum_(i=1)^n alpha_i bb(1)_(E_i)$ עם $alpha_i >=0$ ו־${E_i}$ קבוצות זרות בזוגות ומדידות ב־$E$.\
    ראינו שמתקיים $integral_E s d mu = sum_(i=1)^n alpha_i mu(E_i)$.\
    נבחין שגם $c s$ היא פונקציה פשוטה שכן
    $
      c s (x) = sum_(i=1)^n (c alpha_i) bb(1)_(E_i)(x) ==> integral_E c s(x) d mu = sum_(i=1)^n (c alpha_i) mu(E_i) = c sum_(i=1)^n alpha i mu(E_i) = c integral_E s d mu
    $
    נסמן מהגדרה
    $
      integral_E f d mu = sup { integral_E s d mu bar 0<=s<=f, " פשוטה" s} = S_f \
      integral_E c f d mu = sup {integral_E p d mu bar 0<=p<=c f, " פשוטה" p} = S_(c f)
    $
    נשים לב שלכל $0<=p<=c f$, אם $c>0$ אז אם נגדיר פונקציה פשוטה $0<=s' = p/c <=f$ ומתקיים ממה שראינו לעיל, $ integral_E p d mu = integral_E c s d mu = c integral_E d mu $
    זה נכון לכל $p$ פשוטה כזאת ולכן
    $
      S_(c f) = sup {c integral_E s d mu bar 0<=s<=f, " פשוטה" s} =_"מכפלה עם סופרמה אי־שלילית" c dot.op sup { integral_E s d mu bar 0<=s<=f, " פשוטה" s} = c dot.op S_f
    $
    אם $c=0$, אנחנו רוצים להראות
    $ integral_E 0 dot.op f mu = 0 dot.op integral_E f d mu $
    בצד שמאל יש לנו פשוט את הפונקציה $g eq.triple 0$ וזאת כמובן פונקציה פשוטה ולכן $ integral_E 0 d mu = sum_(i=1)^n alpha_i mu(E_i) = sum_(i=1)^n 0 mu(E_i) = 0 $
    מצד שני, יש לנו $0 dot.op integral_E f d mu$ שתמיד כמובן שווה לאפס בזכות הקונבנציה $0 dot.op infinity = 0$.\
  + תהיי $s = sum_(i=1)^n alpha_i bb(1)_(A_i)$ פונקציה פשוטה ואם נסתכל על $E$ אזי $0<=s<=f$ וכן $f|_E eq.triple 0$ ולכן על $E$, $s(x) = 0$ לכל $x in E$ ומהגדרה
    $ integral_E s dif mu = sum alpha_i mu(A_i inter E) $
    ולכן אם $A_i inter E$ לא ריקה אז המקדמים $alpha_i$ חייבים להיות אפסים ולכן הסכום הוא בידיוק $0$; מהגדרת אינטגרל לבג
    $ integral_E f dif mu = sup{integral_E s dif mu bar 0<=s <= f, "פשוטה" s} $
    אבל לכל פשוטה הנימוק לעיל תקף כלומר האינטגרל על כל הקבוצה הוא $0$ ולכן $integral_E f dif mu = 0$ (ניזכר כי $0 dot.op infinity = 0$ ולכן גם הסוגריים נכונים).
  + תהיי $0<=s<=f$ פונקציה פשוטה $s = sum_(i=1)^n alpha_i bb(1)_(A_i)$ ומהגדרת האינטגרל
    $ integral_E s dif mu = sum_(i=1)^n alpha_i dot.op mu(A_i inter E) $
    אבל $mu(E) = 0$ ו־$A_i inter E subset.eq E$ ולכן ממונטוניות, $mu(A_i inter E) = 0$ כלומר $integral_E s dif mu = 0$; זה נכון לכל פונקציה פשוטה ולכן מהגדרת האינטגרל מתקיים $integral_E f dif mu = 0$ (אפשר וצריך לסיים עם משפט ההתכנסות המונוטונית ועם ${s_n}_(n=1)^infinity$ פשוטות כך ש־$s_n arrow.tr f$)
  + מתקיים
    $ integral_E bb(1)_(A) dif mu = mu(A inter E) $ אבל $bb(1)_(A) dot.op bb(1)_(E) = bb(1)_(A inter E)$ ולכן
    $ integral_X bb(1)_(A) dot.op bb(1)_(E) dif mu = integral_X bb(1)_(A inter E) dif mu = mu(A inter E) $
    אז הטענה נכונה לאינדיקטורים; תהיי $s = sum_(i=1)^n alpha_i bb(1)_(A_i)$ פונקציה פשוטה, אז
    $
      integral_E s dif mu = sum_(i=1)^n alpha_i integral_E bb(1)_(A_i) dif mu = sum_(i=1)^n alpha_i integral_X bb(1)_(A_i) dot.op bb(1)_(E) dif mu = integral_X (sum_(i=1)^n alpha_i bb(1)_(A_i)) dot.op bb(1)_(E) dif mu = integral_X s dot.op bb(1)_(E) dif mu
    $
    והטענה נכונה לפונקציות פשוטות; לבסוף, נשתמש במשפט ההתכנסות המונוטונית שכן יש ${s_n}_(n=1)^infinity$ פשוטות כך ש־$s_n arrow.tr f$ נקודתית ונקבל
    $
      integral_E f dif mu = integral_E (lim_(n arrow.r infinity) s_n) dif mu = lim_(n arrow.r infinity) integral_E s_n dif mu = lim_(n arrow.r infinity) integral_X s_n dot.op bb(1)_(E) dif mu = integral_X (lim_(n arrow.r infinity) s_n dot.op bb(1)_(E)) dif mu = integral_X f dot.op bb(1)_(E) dif mu
    $
  + מתקיים $bb(1)_(A union.dot B) (x) = bb(1)_(A)(x)+bb(1)_(B)(x)$
    ולכן מהפעלת הסעיף הקודם פעמיים בקצוות
    $
      integral_(A union.dot B) f dif mu = integral_X f dot.op bb(1)_(A union.dot B) dif mu = integral_X f dot.op (bb(1)_(A) + bb(1)_(B)) dif mu =_"לינאריות" integral_X f dot.op bb(1)_(A) dif mu + integral_X f dot.op bb(1)_(B) dif mu = integral_A f dif mu + integral_B f dif mu
    $
]

#pagebreak()

== משפט ההתכנסות המונוטונית
#theorem("משפט ההתכנסות המונוטונית")[
  יהי $(X, cal(A), mu)$ מרחב מידה ותהיי ${f_n bar X arrow.r [0, infinity]}_(n=1)^infinity$ סדרת פונקציות מדידות.\
  אם ${f_n}_(n=1)^infinity$ סדרה מונוטונית עולה, אזי הפונקציה $ f colon.eq lim_(n arrow.r infinity) f_n = sup_(n in NN) {f_n} $
  מקיימת
  $
    forall A in cal(A) wide integral_A f dif mu = lim_(n arrow.r infinity) integral_A f_n dif mu ==>
    forall A in cal(A) wide integral_A lim_(n arrow.r infinity) f_n dif mu = lim_(n arrow.r infinity) integral_A f_n dif mu
  $
]

#proof[
  נוכיח עבור $A=X$ ואז להתבונן ב־$g_n = f_n bb(1)_(A)$ ולהסיק את המקרה הכללי.\
  ממונוטוניות האינטגרל $0 <= integral f_1 dif mu <= integral f_2 dif mu <= dots.h.c <= integral f dif mu$ ולכן $alpha = sup_(n) integral f_n dif mu$ יקיים $alpha <= integral f dif mu$ ונרצה להראות $alpha >= integral f dif mu$.\
  נראה שלכל $0<=s<=f$ פשוטה מתקיים $integral s dif mu <= alpha$: תהיי $0<=s<=f$ פשוטה ונקבע $0<c<1$, נסמן $E_n colon.eq {x in X bar f_n (x) >= c s(x)}$ ו־$E_n arrow.tr X$ כלומר זוהי סדרה עולה של קבוצות מדידות שאיחודן הוא כל $X$.\
  מרציפות המידה לסדרות עולות נסיק כי לכל $A in cal(A)$
  $ mu(A inter E_n) arrow.r_((star)) mu(A inter (union E_n)) = mu(A) $
  $s$ פשוטה ולכן $s=sum_(i=1)^m alpha_i bb(1)_(A_i)$ ולכל $n$ מתקיים
  $
    alpha >= integral f_n dif mu >= integral_(E_n) f_n dif mu >= c dot.op integral_(E_n) s dif mu = c dot.op sum_(i=1)^m alpha_i mu(A_i inter E_n) arrow.r_((star)) c dot.op sum_(i=1)^m alpha_i mu(A_i) = c dot.op integral s dif mu
  $
]

#pagebreak()

== החלפת סדר אינטגרציה וסכום
#theorem("החלפת סדר אינטגרציה וסכום")[
  יהי $(X, cal(A), mu)$ מרחב מידה. אם ${f_n bar X arrow.r [0,infinity]}_(n=1)^infinity$ סדרת פונקציות מדידות, אזי
  $ integral_X sum_(n=1)^infinity f_n dif mu = sum_(n=1)^infinity integral_X f_n dif mu $
]

#proof[
  באינדוקציה על $N in NN$.\
  מקרה בסיס הוא אדטיביות האינטגרל עבור $N=2$ (עבור $N=1$ הטענה טריוויאלית): תהיינה $s,t : X arrow.r [0,infinity]$ פונקציות פשוטות כלשהן כאשר
  $ s = sum_(i=1)^n alpha_i bb(1)_(A_i) wide t = sum_(j=1)^m beta_j bb(1)_(B_j) $
  עבור ${A_i}_(i=1)^n, {B_j}_(j=1)^m$ הן חלוקות של $X$ ומתקיים
  + ${A_i inter B_j}_((i,j) in [n times m])$ חלוקה של $X$
  + לכל $j in [m]$ מתקיים $union.big.dot_(i=1)^n A_i inter B_j = B_j$ כי ${A_i}_(i=1)^n$ חלוקה של $X$
  + לכל $i in [n]$ מתקיים $union.big.dot_(j=1)^m A_i inter B_j = A_i$ כי ${B_j}_(j=1)^m$ חלוקה של $X$
  מאדטיביות סופית של מידה נקבל
  $ sum_(j=1)^m mu(A_i inter B_j) =^((star)) mu(A_i) wide sum_(i=1)^n mu(A_i inter B_j) =^((star star)) mu(B_j) $
  אבל גם $s+t$ היא פונקציה פשוטה שכן
  $ s+t=sum_(i=1)^n sum_(j=1)^m (alpha_i + beta_j) bb(1)_(A_i inter B_j) $
  ולכן
  $
    integral_X (s+t) dif mu = sum_(i=1)^n sum_(j=1)^m (alpha_i + beta_j) dot.op mu(A_i inter B_j)= sum_(i=1)^n alpha_i dot.op sum_(j=1)^m mu(A_j inter B_j) + sum_(j=1)^m beta_j dot.op sum_(i=1)^n mu(A_i inter B_j) \
    =_((star), (star star)) sum_(i=1)^n alpha_i dot.op mu(A_i) + sum_(j=1)^m B_j dot.op mu(B_j) = integral_X s dif mu + integral_X t dif mu
  $
  אז הטענה נכונה עבור פונקציות פשוטות.\
  תהיינה $f_1, f_2 in {f_n bar X arrow.r [0,infinity]}_(n=1)^infinity$ מדידות ותהיינה ${s_n}_(n=1)^infinity, {t_n}_(n=1)^infinity$ סדרות עולות של פונקציות פשוטות כך שמתקיים
  $ s_n stretch(arrow.r)_(n arrow.r infinity) f_1 wide t_n stretch(arrow.r)_(n arrow.r infinity) f_2 $
  נקודתית ומאריתמטיקה של גבולות נקבל $s_n + t_n stretch(arrow.r)_(n arrow.r infinity) f_1+f_2$ כאשר זו התכנסות עולה לכן לפי משפט ההתכנסות המונוטונית
  $
    integral_X (f_1+g_2) dif mu = lim_(n arrow.r infinity) integral_X (s_n+t_n) dif mu = lim_(n arrow.r infinity) (integral_X s_n dif mu + integral_X t_n dif mu) = lim_(n arrow.r infinity) integral_X s_n dif mu + lim_(n arrow.r infinity) integral_X t_n dif mu \
    = integral_X f_1 dif mu + integral_X f_2 dif mu
  $
  וזה מראה את בסיס האינדוקציה.\
  בשביל לסיים את האינדוקציה נשים לב $sum_(n=1)^N f_n stretch(arrow.r)_(N arrow.r infinity) sum_(n=1)^infinity f_n$ נקודתית כאשר הסדרה ${sum_(n=1)^N f_n}_(n=1)^infinity$ היא סדרה מונוטונית עולה ולכן ממשפט ההתכנסות המונוטוניות נקבל את הטענה, כנדרש.
]

#pagebreak()

== קיום מידת אינטגרל
#theorem("קיום מידת אינטגרל")[
  יהי $(X, cal(A), mu)$ מרחב מידה. אם $h:X arrow.r [0, infinity]$ מדידה אזי הפונקציה $nu: A arrow.r [0,infinity]$ המוגדרת על־ידי
  $ forall E in cal(A), space nu(E) = integral_E h dif mu $
  היא מידה על $(X, cal(A))$ ובמקרה זה נסמן $dif nu colon.eq h dif mu$ ויתר על־כן מתקיים
  $ integral_X g dif nu = integral_X g dot.op h dif mu $
  לכל $g:X arrow.r [0,infinity]$ מדידה.
]

#proof[
  בשביל להראות מידה עלינו להראת ש־$nu$ אינה קבועה אינסוף ושהיא $sigma$ אדטיבית: ואכן, $nu(emptyset)=0$ ושנית תהיי ${E_n}_(n=1)^infinity$ סדרת כלשהי של קבוצות מדידות זרות בזוגות ונסמן $E = union.big_(n=1)^infinity E_n$ ואז
  $ (star) space bb(1)_(E) = bb(1)_(union.big_(n=1)^infinity E_n) = sum_(n=1)^infinity bb(1)_(E_n) $
  ולכן
  $
    nu(union.big.dot_(n=1)^infinity E_n) = nu(E) =_"הגדרה" integral_E h dif mu = integral_X h bb(1)_(E) dif mu =_((star)) integral_X h sum_(n=1)^infinity bb(1)_(E_n) dif mu \
    = integral_X sum_(n=1)^infinity h dot.op bb(1)_(E_n) dif mu = sum_(n=1)^infinity integral_X h dot.op bb(1)_(E_n) dif mu = sum_(n=1)^infinity h dif mu = sum_(n=1)^infinity nu(E_n)
  $
  ולכן $nu$ מידה על $(X, cal(A))$.\
  עבור החלק השני, תהיי $s = sum_(i=1)^k alpha_i bb(1)_(E_i)$ פונקציה פשוטה, אז
  $
    integral_X s dif nu = sum_(i=1)^k alpha_i nu(E_i) = sum_(i=1)^k alpha_i integral_(E_i) h dif mu = sum_(i=1)^k integral_(E_i) alpha_i h dif mu = sum_(i=1)^k integral_X alpha_i bb(1)_(E_i) h dif mu \
    = integral_X sum_(i=1)^k alpha_i bb(1)_(E_i) h dif mu = integral_X h dot.op sum_(i=1)^k alpha_i bb(1)_(E_i) dif mu = integral_X h dot.op s dif mu
  $
  אז עבור $g$ מדידה כלשהי ניקח ${s_n}_(n=1)^infinity$ סדרה עולה של פונקציות פשוטות כך ש־$s_n stretch(arrow.r)_(n arrow.r infinity) g$ ונקבל ממשפט ההתכנסות המונוטוניות על מרחב המידה $(X, cal(A), nu)$ שמתקיים
  $ integral_X g dif nu = lim_(n arrow.r infinity) integral_X s_n dot.op h dif mu = integral_X g dot.op h dif mu $
  כי ${s_n dot.op h}_(n=1)^infinity$ היא עולה ו־$s_n dot.op h stretch(arrow.r)_(n arrow.r infinity) g dot.op h$.
]

#pagebreak()

== הלמה של פאטו
#theorem("הלמה של פאטו")[
  יהי $(X, cal(A), mu)$ מרחב מידה. אם ${f_n : X arrow.r [0,infinity]}_(n=1)^infinity$ סדרת פונקציות מדידות כלשהי, אזי
  $ integral_X liminf_(n arrow.r infinity) f_n dif mu <= liminf_(n arrow.r infinity) integral_X f_n dif mu $
]

#proof[
  לכל $k in NN$ נסמן $g_k colon.eq inf_(n in NN \
  n=>k) {f_n}$ אזי הסדרה ${g_k}_(k=1)^infinity$ סדרה מונוטונית עולה ואי־שלילית.\
  ממשפט ההתכנסות המונוטונית נקבל
  $ integral_X lim_(k arrow.r infinity) g_k dif mu = lim_(k arrow.r infinity) integral_X g_k dif mu $
  ומתקיים מהגדרה
  $
    lim_(k arrow.r infinity) g_k = lim_(k arrow.r infinity) inf_(n in NN \
    n>=k) {f_n} = liminf_(n arrow.r infinity) f_n
  $
  וביחד
  $ (star) space integral_X liminf_(n arrow.r infinity) f_n dif mu = lim_(k arrow.r infinity) integral_X g_k dif mu $
  מצד שני
  $
    forall k in NN, space g_k = inf_(n in NN \
    n>=k ) {f_n} <= f_k ==> g_k <= f_k
  $
  ממונטוניות האינטגרל נקבל
  $ forall k in NN, space a_k colon.eq integral_X g_k dif mu <= integral_X f_k dif mu eq.colon b_k $
  אז לכל $k in NN$ מתקיים $a_k<=b_k$ וכן מ־$(star)$ נובע כי $lim_(k arrow.r infinity) a_k$ קיים ונקבל
  $
    integral_X liminf_(n arrow.r infinity) f_n dif mu =_((star)) lim_(k arrow.r infinity) integral_X g_k dif mu = lim_(k arrow.r infinity) a_k <= liminf_(k arrow.r infinity) b_k = liminf_(k arrow.r infinity) integral_X f_k dif mu ==> integral_X liminf_(n arrow.r infinity) f_n dif mu <= liminf_(k arrow.r infinity) integral_X f_k dif mu
  $
]

#pagebreak()

== הלמה של בורל־קנטלי
#theorem("הלמה של בורל־קנטלי")[
  יהי $(X, cal(A), mu)$ מרחב מידה ותהיי $(E_n)_(n=1)^infinity subset.eq cal(A)$ סדרה של קבוצות מדידות כך שמתקיים
  $ sum_(n=1)^infinity mu(E_n) < infinity $
  אז
  $ mu(limsup_(n arrow.r infinity) E_n)=0 $
]

#proof[
  ממונוטוניות המידה והגדרת החיתוך
  $
    limsup_(n arrow.r infinity) E_n = inter.big_(i=1)^infinity union.big_(j=i)^infinity E_j ==> mu(limsup_(n arrow.r infinity) E_n)=mu(inter.big_(i=1)^infinity union.big_(j=1)^infinity E_j) <=_(forall i in NN) mu(union.big_(j=i)^infinity E_j)<=_"תת־אדטיביות המידה" sum_(j=i)^infinity mu(E_j) < infinity
  $
  כאשר המעבר האחרון נובע מההנחה ומטור זנב ולכן $lim_(i arrow.r infinity) sum_(n=i)^infinity mu(E_n)=0$, כלומר $mu(limsup_(n arrow.r infinity) E_n)<=0$.\
  אבל $mu$ מידה ולכן $0<=mu(limsup_(n arrow.r infinity) E_n)$ כלומר $mu(limsup_(n arrow.r infinity) E_n) = 0$.
]

#pagebreak()

#theorem("אי־שיוויון המשולש האינטגרלי")[
  אם $f in L^1 (mu)$ אזי $abs(integral_X f dif mu)<= integral_X abs(f) dif mu$.
]
#proof[
  $integral_X f dif mu in CC$ ולכן קיים $alpha in CC$ עם $abs(alpha)=1$ עבורו מתקיים $alpha integral_X f dif mu = abs(integral_X f dif mu) in RR$ $(star)$.\
  נקבל אם־כך
  $
    abs(integral_X f dif mu) & =alpha integral_X f dif mu \
                             & = underbrace(integral_X alpha f dif mu, in RR) \
                             & =integral_X re(alpha f) dif mu + cancel(i integral_X im(alpha f) dif mu) \
                             & = integral_X re(alpha f) dif mu \
                             & <= integral_X abs(re(alpha f)) dif mu \
                             & <= integral_X abs(alpha f) dif mu = integral_X abs(f) dif mu
  $
  #remark[שכן אם נסמן $z=integral_X f dif mu$ אז אם $z=0$ אז $alpha z = abs(z) in RR$ לכל $alpha in CC$ עם $abs(alpha)=1$ כי נקבל ש־$0=0$.\
    אחרת, אם $z!=0$ אז קיים $theta in RR$ כך ש־$z = abs(z) dot.op e^(i theta)$ וניקח $alpha = e^(-i theta)$ ונקבל
    $ alpha z = e^(-i theta) dot.op (abs(z) e^(i theta)) = abs(z)(e^(-i theta) dot.op e^(i theta)))=abs(z) in RR $
    ולכן יש $alpha in CC$ המקיים זאת.]
]

#pagebreak()

== משפט ההתכנסות הנשלטת
#theorem("משפט ההתכנסות הנשלטת")[
  #definition("סדרת פונקציות נשלטת")[
    תהיי $X$ קבוצה ותהיי ${f_n bar X arrow.r RR}_(n=1)^infinity$ סדרת פונקציות כלשהי ותהיי $g:X arrow.r RR$ פונקציה.\
    נאמר שהסדרה ${f_n}_(n=1)^infinity$ נשלטת על־ידי הפונקציה $g$ אם ורק אם לכל $n in NN$ מתקיים $abs(f_n)<=g$.
  ]
  תהיי ${f_n bar X arrow.r CC}_(n=1)^infinity$ סדרת פונקציות מדידות המתכנסת נקודתית לפונקציה $f: X arrow.r CC$.\
  אם קיימת $g in L^1(mu)$ כך שהסדרה ${f_n}_(n=1)^infinity$ נשלטת על־ידי $g$ אזי $f in L^1 (mu)$ ומתקיים
  $ integral_X abs(f_n - f) dif mu stretch(arrow.r)_(n arrow.r infinity) 0 $
  ובפרט
  $ integral_X f dif mu = lim_(n arrow.r infinity) integral_X f_n dif mu $
]
#proof[
  ראשית מכך ש־$abs(f_n)<=g$ לכל $n in NN$ נובע כי ${f_n}_(n=1)^infinity subset.eq L^1 (mu)$ וגם מתקיים $abs(f)<=g$ אז $f in L^1 (mu)$.\
  בפרט מתקיים לכל $n in NN$ ש־$abs(f-f_n)<=2g$ אז נגדיר $h_n colon.eq 2g-abs(f-f_n)$ ומהלמה של פאטו עבור סדרת הפונקציות ${h_n}_(n=1)^infinity$ נקבל
  $
    (star) space integral_X liminf_(n arrow.r infinity) h_n dif mu <= liminf_(n arrow.r infinity) integral_X h_n dif mu
  $
  וכן $h_n stretch(arrow.r)_(n arrow.r infinity) 2g$ נקודתית, אז בפרט $2g(x) = liminf_(n arrow.r infinity) h_n (x)$ לכל $x in X$, אז יינבע מכך
  $
    integral_X 2g dif mu = integral_X liminf_(n arrow.r infinity) h_n dif mu <=_((star)) liminf_(n arrow.r infinity) integral_X h_n dif mu = liminf_(n arrow.r infinity) integral_X (2g-abs(f-f_n)) dif mu
  $
  מכאן מתקיים
  $
    integral_X 2g dif mu <= liminf_(n arrow.r infinity) integral_X (2g-abs(f-f_n)) dif mu =_("לינאריות האינטגרל") liminf_(n arrow.r infinity)(integral_X 2g dif mu - integral_X abs(f-f_n) dif mu) \
    = liminf_(n arrow.r infinity) integral_X 2g dif mu + liminf_(n arrow.r infinity) (-integral_X abs(f-f_n) dif mu) =_(liminf_(n arrow.r infinity) (-a_n) = - limsup_(n arrow.r infinity) a_n) integral_X 2g dif mu - limsup_(n arrow.r infinity) integral_X abs(f-f_n) dif mu
  $
  כלומר
  $ integral_X 2g dif mu <= integral_X 2 g dif mu - limsup_(n arrow.r infinity) integral_X abs(f-f_n) dif mu $
  אבל $g in L^1 (mu)$ אי־שלילית ולכן $integral_X 2 g dif mu < infinity$ ולכן ניתן להחסיר ולקבל $limsup_(n arrow.r infinity) integral_X abs(f-f_n) dif mu = 0$ ובפרט מאי־שיוויון המשולש האינטגרלי
  $
    abs(integral_X f dif mu - integral_X f_n dif mu) = abs(integral_X (f-f_n) dif mu)<= integral_X abs(f-f_n) dif mu stretch(arrow.r)_(n arrow.r infinity) 0
  $
]

#pagebreak()

== אי־שיוויון מרקוב
#theorem("אי־שיוויון מרקוב")[
  + תהיי $f$ מדידה ואי־שלילית, אז לכל $0<a<infinity$ מתקיים
    $ mu(f^(-1)[alpha, infinity])<= (integral f dif mu)/a $
  + תהיי $f:X arrow.r [0,infinity]$ אינטגרבילית. אז $mu(f^(-1)({infinity}))=0$ והקבוצה $f^(-1)((0, infinity))$ היא $sigma$־סופית.
]

#proof[
  + נגדיר
    $
      E_a colon.eq f^(-1)([a, infinity]) = {x in X bar f(x) >= a} \
      g(x) = a dot.op bb(1)_(E_a) (x)
    $
    אם $x in E_a$ אזי $f(x)>=a$ ו־$g(x) = a dot.op 1 = a$ ולכן $f(x) >= g(x)$.\
    אם $x in.not E_a$ אז $f(x) >= 0$ו־$g(x) = a dot.op 0 = 0$ ולכן $f(x) >= g(x)$
    כלומר לכל $x in X$ מתקיים $g(x) <= f(x)$.\
    ממונוטוניות אינטגרל לבג נקבל
    $ integral_X g dif mu <= integral_X f dif mu $
    אבל
    $
      integral_X g dif mu = integral_X a dot.op bb(1)_(E_a) dif mu = a dot.op integral_X bb(1)_(E_a) dif mu = a dot.op mu(E_a)
    $
    כלומר
    $ a dot.op mu(E_a) <= integral_X f dif mu $
    היות ו־$0<a<infinity$ ניתן לחלק בלי לשנות את כיוון אי־השיוויון ונקבל
    $ mu(E_a) <= 1/a integral_X f dif mu $
  + מהמקרה הקודם אנחנו מקבלים שאם $integral f dif mu < infinity$ אזי אגף ימין שואף לאינסוף כאשר $a arrow.r infinity$ ולכן מרציפות המידה מלמעלה (חיתוכים יורדים) נסיק כי
    $ mu(f^(-1)({infinity}))=0 $
    מתקיים
    $ mu(f^(-1)[1/n, infinity])<infinity $
    ולכן
    $ f^(-1)((0, infinity))=union.big_(n=1)^infinity f^(-1)([1/n, infinity]) $
    היא $sigma$־סופית.

]

#pagebreak()

= קבוצות ממידה אפס
== סדרת פונקציות כמעט־תמיד
#theorem("סדרות פונקציות וכמעט־תמיד")[
  תהיי ${f_n bar X arrow.r CC}_(i=1)^n$ סדרת פונקציות מדידות המוגדרות $mu$־כמעט תמיד.\
  אם $sum_(n=1)^infinity abs(f_n) dif mu < infinity$ אז
  + הפונקציה $f:X arrow.r CC$ הנתונה על־ידי $x mapsto sum_(n=1)^infinity f_n (x)$ מוגדרת $mu$־כמעט תמיד
  + $f in L^1(mu)$
  + $integral_X f dif mu = sum_(n=1)^infinity f_X f_n dif mu$
]

#proof[
  + נניח ש־$f_n$ מוגדרת על קבוצה $S_n subset.eq X$ כך ש־$mu(S_n^c)=0$, אז $phi = sum_(n=1)^infinity abs(f_n)$ מוגדרת על $S colon.eq inter_(n=1)^infinity S_n$ ומתקיים
    $ mu(S^c) = mu((inter.big_(n=1)^infinity S_n)^c) = mu(union.big_(n=1)^infinity S_n^c) = 0 ==> mu(S^c) =0 $
    ולכן $phi$ מוגדרת $mu$־כמעט תמיד ומהטענה אודות החלפת סדר של גבול ואינטגרל עבור טורים של פונקציות אי־שליליות מתקיים
    $
      integral_X phi dif mu = integral_X sum_(n=1)^infinity abs(f_n) dif mu = sum_(n=1)^infinity integral_X abs(f_n) dif mu < infinity ==> integral_X phi dif mu < infinity
    $
    בפרט $mu(abs(phi(x)))<infinity$ $mu$־כמעט לכל $x in X$ ולכן $phi in L^1 (mu)$ ולכן עבור $mu$־כמעט לכל $x in X$ הטור $sum_(n=1)^infinity f_n (x)$ מתכנס בהחלט $mu$־כמעט תמיד ולכן הוא מתכנס ב־$CC$ $mu$־כמעט תמיד ולכן $f = sum_(n=1)^infinity f_n$ מוגדרת $mu$־כמעט תמיד
  + לכל $k in NN$ נסמן $g_k colon.eq sum_(n=1)^k f_n$ ומתקיים
    $
      forall k in NN, space abs(g_k)=abs(sum_(n=1)^k f_n)<= sum_(n=1)^k abs(f_n) <= sum_(n=1)^infinity abs(f_n) = phi ==> abs(g_k)<=infinity
    $
    כלומר סדרת הפונקציות ${g_k}_(k=1)^infinity$ נשלטת על־ידי $phi in L^1(mu)$ ומכאן ממשפט ההתכנסות הנשלטת עבור $g_k stretch(arrow.r)_(k arrow.r infinity) f$ נובע כי $f in L^1 (mu)$ וכן מהטענה על החלפת סדר סכום ואינטגרל
    $
      integral_X f dif mu = lim_(k arrow.r infinity) integral_X g_k dif mu = lim_(k arrow.r infinity) sum_(n=1)^k integral_X f_n dif mu = sum_(n=1)^infinity integral_X f_n dif mu ==> integral_X f dif mu = sum_(n=1)^infinity integral_X f_n dif mu
    $
    וזה מוכיח גם את $3$.
]

#pagebreak()

== תנאים שקולים לשלמות
#theorem("תנאים שקולים לשלמות")[
  _תזכורת_: יהי $(X, cal(A), mu)$ מרחב מידה. נאמר שהם *שלם* אם כל קבוצה $E subset.eq X$ המוכלת בקבוצה ממידה אפס היא מדידה בעצמה. ההשלמה של $(X, cal(A), mu)$ ניתנת על־ידי ה־$sigma$־אלגברה
  $ overline(cal(A)) colon.eq {A union E bar A in cal(A), E subset.eq N, mu(N)=0} $
  והמידה
  $ overline(mu)(A union E) = mu(A) $
  יהי $(X, cal(A), mu)$ מרחב מידה, אזי הגרירות הבאות נכונות אם ורק אם $mu$ שלמה:
  + אם $f$ מדידה ו־$f=g$ $mu$־כמעט תמיד, אז $g$ היא מדידה
  + אם ${f_n}_(n=1)^infinity$ סדרת פונקציות מדידות ובנוסף $f_n arrow.r f$ $mu$־כמעט תמיד, אזי $f$ היא מדידה
]
#proof[
  בשביל ההוכחה נשתמש בטענה מהסוג הבא שנכונה במרחבי מידה שלמים: נניח כי $E,G$ מדידות ו־$E subset.eq F subset.eq G$ עם $mu(G without E) = 0$.\
  אז $F$ מדידה: זה נכון כי $F without E subset.eq G without E$ והתלכדות המידות גוררת ש־$mu(G without E) =0$ ולכן $F without E$ מדידה וגם $F$.\
  שלמות $<==$ 1: אם $f$ מדידה ו־$f=g$ $mu$־כמעט תמיד, נרשום $ N colon.eq {x bar f(x) != g(x)} $
  מאחר ו־$N$ מוכלת בקבוצה ממידה אפס ו־$mu$ שלמה אזי $N$ מדידה.\
  מתקיים
  $ g^(-1)(A) = (g^(-1)(A) inter f^(-1) (A)) union (g^(-1)(A) without f^(-1)(A)) $
  מאחר ו־$N^c$ היא בידיוק הקבוצה בה הפונקציות מתלכדות, נוכל לכתוב
  $ f^(-1)(A) inter N^c subset.eq f^(-1)(A) inter g^(-1)(A) subset.eq f^(-1)(A) $
  ומהיות
  $ f^(-1)(A) without (f^(-1)(A) inter N^c) subset.eq N $
  נדע ששרשרת ההכלות היא כפי שמופיע בטענה שנוסחה בתחילת ההוכחה ולכן הקבוצה $f^(-1)(A) inter g^(-1)(A)$ היא מדידה ובאופן דומה נשים לב
  $ g^(-1)(A) without f^(-1)(A) subset.eq N $
  ולכן כקבוצה המוכלת בקבוצה ממידה אפס היא מדידה.\
  $1$ $<==$ שלמות: תהיי $E$ קבוצה המוכלת בקבוצה ממידה אפס אזי $bb(1)_(E) = 0$ כמעט־תמיד ולכן $bb(1)_(E)$ מדידה, אבל אינידיקטור מדיד אם ורק אם הקבוצה שהוא מציין מדידה, כלומר $E$ מדידה.\
  $1$ $<==$ $2$: מאחר והוכחנו ש־$1$ שקול לשלמות, אז $mu$ שלמה. נניח ש־$f_n arrow.r f$ $mu$־כמעט תמיד. \
  לכן קיימת קבוצה $N$ כך ש־$mu(N) =0$ ובנוסף $f_n (x) arrow.r f(x)$ לכל $x in N^c$ ונגדיר $ tilde(f)_n (x) = mycases(f_n (x), x in N^c, 0, x in N) $
  אזי מהסעיף הקודם לכל $n in NN$ מתקיים ש־$tilde(f)$ מדידה כי $tilde(f)_n = f_n$ $mu$־כמעט תמיד ו־$tilde(f)$ מתכנסת נקודתית לפונקציה
  $ tilde(f) (x) = mycases(f(x), x in N^c, 0, x in N) $
  ולכן $tilde(f)$ מדידה ול־$f=tilde(f)$ $mu$־כמעט תמיד ולכן $f$ מדידה.\
  $2$ $<==$ $1$: נניח ש־$f=g$ $mu$־כמעט תמיד ו־$f$ מדידה, אז נגדיר את $f_n$ להיות הסדרה הקבועה $f_n = f$ ומתקיים $f_n arrow.r g$ כמעט־תמיד ולכן $g$ מדידה מההנחה של $2$, כנדרש.
]

#pagebreak()

== תנאים שקולים לפונקציה אפסה כמעט־תמיד
#theorem("תנאים שקולים לפונקציה אפסה כמעט־תמיד")[
  + אם $f : X arrow.r [0,infinity]$ מדידה עם $integral_X f dif mu =0$ אם ורק אם $f=_mu 0$
  + אם $f : X arrow.r CC$ מדידה ולכל $E in cal(A)$ מתקיים $integral_E f dif mu =0$ אזי $f=_mu 0$
]

#proof[
  + ההנחה ש־$integral_X f dif mu =0$ גוררת ש־$mu({x in X bar f(x) >=1/n})=0$ חכח $n in NN$ ולכן $f=0$, $mu$־כמעט תמיד
  + נסמן $f=u + i v$ ותהיי $E = {x in X bar u(x)>=0}$. אז מהגדרת $E$ ומההנחה שלכל $E in cal(A)$ מתקיים $integral_E f dif mu=0$ נובע $integral_E re(f) dif mu = 0$ ולכן לכל $h in {u,v}$ מתקיים
  $
    0=integral_E re(f) dif mu = integral_E h dif mu = integral_X h^plus.minus dif mu ==> h^plus.minus =_mu 0 \
    ==> h^plus.minus =_mu 0 ==> u^plus.minus, v^plus.minus =_mu 0 ==> u, v =_mu 0 ==> f =_mu 0
  $
]

#pagebreak()

== טענה על ממוצעי פונקציה
#theorem("טענה על ממוצעי פונקציה")[\
  _תזכורת (ממוצע של פונקציה)_: יהי $(X, cal(A), mu)$ מרחב מידה סופי, תהיי $f in L^1 (mu)$ ותהיי $E in cal(A)$ קבוצה מדידה עם $mu(E)>0$.\
  הממוצע של $f$ על $E$ ביחס ל־$mu$ הוא
  $ A_E (f) colon.eq 1/mu(E) integral_E f dif mu $
  ועכשיו למשפט:\
  יהי $(X, cal(A), mu)$ מרחב מידה סופי ותהיי $f in L^1 (mu)$. אם $Omega subset.eq CC$ קבוצה סגורה כך שלכל קבוצה מדידה $E in cal(A)$ עם $mu(E)>0$ מתקיים \
  $A_E (f) in Omega$ אז $f(x) in Omega$ $mu$־כמעט לכל $x in X$.
]

#proof[
  לכל $r>0$ ולכל $alpha in CC$ נסמן ב־$overline(B)_r (alpha)$, הכדור הסגור ברדיוס $r$ סביב $alpha$.\
  מכך ש־$Omega$ סגורה נובע כי $Omega^c$ פתוחה ולכן יש איחוד בן־מנייה של כדורים פתוחים שעל־ידו ניתן לייצג את $Omega^c$.\
  אבל ב־$CC$, כל כדור פתוח ניתן להצגה כאיחוד בן־מנייה של כדורים סגורים, ולכן $Omega^c$ היא איחוד בן־מנייה של כדורים סגורים.\
  לכן, מספיק להראות שעבור כל $overline(B)_r (alpha) subset.eq Omega^c$ מתקיים $mu(f^(-1)(overline(B)_r (alpha)))=0$, כאשר
  $ f^(-1) (overline(B)_r (alpha)) = {x in X bar f(x) in overline(B)_r (alpha)} $
  נניח בשליילה שקיים כדור סגור $overline(B)_r (alpha) subset.eq Omega^c$ כך ש־$mu(f^(-1)(overline(B)_r (alpha)))>0$ ונסמן $E colon.eq. f^(-1) (overline(B)_r (alpha))$.\
  על $E$ מתקיים $abs(f-alpha)<=r$ ולכן
  $
    abs(A_E (f) - alpha)= abs(1/mu(E) integral_E f dif mu - 1/mu(E) dot.op mu(E) dot.op alpha)= abs(1/mu(E) integral_E f dif mu - 1/mu(E) integral_E alpha dif mu) \
    = abs(1/mu(E) (integral_E f dif mu - integral_E alpha dif mu))=_("לינאריות האינטגרל" \
    mu(E) > 0) 1/mu(E) abs(integral_E (f-alpha) dif mu) <=_"אי־שיוויון המשולש" 1/mu(E) integral_E abs(f-alpha) dif mu <= 1/mu(E) integral_E r dif mu \
    = 1/mu(E) dot.op r dot.op mu(E) = r
  $
  כלומר $abs(A_E (f) - alpha)<=r$ ולכן $A_E (f) in overline(B)_r (alpha) subset.eq Omega^c$ ולכן $A_E (f) in Omega^c$.\
  אבל זו סתירה להנחה ש־$A_E (f) in Omega$.
]

#pagebreak()

= משפט ההצגה של ריס
== משפט ההצגה של ריס – יחידות
#theorem("יחידות במשפט ההצגה של ריס")[
  יהי $Lambda : CC_C (RR) arrow.r CC$ פונקציונל לינארי חיובי ונניח כי $mu_1, mu_2$ הן מידות על $(RR, Borel_RR)$ המקיימות
  + $integral_X f dif mu_i = Lambda f$ לכל $f in C_C (RR)$
  + $mu_i (K) < infinity$ לכל $K subset.eq RR$ קומפקטית
  + כל קבוצות בורל ב־$RR$ הן רגולריות פנימית וחיצונית ביחס ל־$mu_i$
]
#proof[
  נבחין תחילה ש־$mu_1, mu_2$ מוגדרות ביחידות על־ידי הערכים שלהן על קבוצות קומפקטיות.\
  ראשית מ־$(2)$ נובע כי עבור $K subset.eq RR$ קומפקטית מתקיים $mu_i (K) < infinity$.\
  יהי $epsilon>0$ ומהרגולריות החיצונית נובע כי קיימת $K subset.eq V$ כאשר $V$ פתוחה כך שמתקיים $mu_2 (V)<mu_2(K)+epsilon$.\
  מהלמה של אוריסון נובע כי קיימת $f in C_C (RR)$ כך שמתקיים $f(X) subset.eq [0,1]$ ומהלמה של אוריסון מתקיים ש־$K prec f prec V$, כלומר $bb(1)_(K) <= f$ וכן $supp(f) subset.eq V$ ולכן $bb(1)_(supp(f)) subset.eq bb(1)_(V)$ אבל $f(X) subset.eq [0,1]$ ולכן $f<= bb(1)_(V)$, אזי
  $
    mu_1 (k) = integral_X bb(1)_(K) dif mu_1 <= integral_X f dif mu_1 =_((1)) Lambda f =_((1)) integral_X f dif mu_2 <= integral_X bb(1)_(V) dif mu_2 = mu_2 (V) < mu_2 (K) + epsilon
  $
  כלומר $mu_1 (K) <= mu_2 (K)$ לכל $K$ קומפקטית ומהסימטרייה נקבל $mu_2 <= mu_1$, כלומר $mu_1=mu_2$.
]

#pagebreak()

= רגולריות ומידות רדון
== תכונות מידת רדון על מרחב $sigma$־קומפקטי

#theorem($"־קומפקטי"sigma "תכונות מידת רדון על מרחב"$)[
  יהי $(X, cal(m), mu)$ מרחב מידה המכיל את $sigma$־אלגברת בורל על $X$.
  \ אם $X$ הוא $sigma$־קומפקטי ו־$mu$ מידת רדון אז מתקיימים
  + לכל $epsilon > 0$ ולכל $E in cal(m)$ קיימת קבוצה פתוחה $V subset.eq X$ וקבוצה סגורה $F subset.eq X$ עם $F subset.eq E subset.eq V$ כך ש־$mu(V without F)<epsilon$
  + כל קבוצה $E in cal(m)$ היא רגולרית פנימית וחיצונית
  + לכל $E in cal(m)$ קיימות $A,B in cal(m)$ כאשר $A$ היא $F_sigma$ ו־$B$ היא $G_sigma$ כך ש־$A subset.eq E subset.eq B$ וגם $mu(B without A)=0$
]

#proof[
  ראשית מהיות $X$ $sigma$־קומפקטי נובע שקיים אוסף בן־מנייה של קבוצות קומפקטיות ${K_n}_(n=1)^infinity$ כך ש־$X = union_(n=1)^infinity K_n$.\
  + תהיי $E in cal(m)$ מדידה
    + מהיות ${K_n}_(n=1)^infinity$ כיסוי של $X$ מתקיים ש־$E = union_(n=1)^infinity E inter K_n$.\
      מהיות $mu$ מידת רדון ו־$K_n$ קומפקטית נובע ש־$mu(K_n)<infinity$ לכל $n in NN$ ולכן בפרט ממונטוניות $mu(E inter K_n)<infinity$.\ מהרגולריות החיצונית של $mu$ נובע שלכל $epsilon>0$ קיימת $V_n in cal(m)$ פתוחה עם $E inter K_n subset.eq V_n$ כך ש־$mu(V_n)<_((star)) mu(E inter K_n)+epsilon/2^(n+1)$.\
      נסמן $V colon.eq union_(n=1)^infinity V_n$ ומתקיים מכך ש־$E inter K_n subset.eq K_n$
      $
        V without E = (union.big_(n=1)^infinity V_n) without (union.big_(n=1)^infinity E inter K_n) subset.eq union.big_(n=1)^infinity V_n without (E inter K_n)
      $
      ולכן
      $
        mu(V without E)<=_"מונוטוניות" mu(union.big_(n=1)^infinity V_n without (E inter K_n)) <=_"תת־אדטיביות" sum_(n=1)^infinity mu(V_n without (E inter K_n))= sum_(n=1)^infinity (mu(V_n) - mu(E inter K_n))<_((star)) sum_(n=1)^infinity epsilon/2^(n+1) = epsilon/2
      $
    + עבור $E^c in cal(m)$ מתקיים גם ש־$E^c = union_(n=1)^infinity E^c inter K_n$ אפשר לעשות את אותו תהליך שוב:
      מהיות $mu$ מידת רדון נובע כי $E^c inter K_n$ רגולרית חיצונית ולכן קיימת פתוחה $U_n in cal(m)$ עם $E^c inter K_n subset.eq U_n$ כך ש־$mu(U_n)<_((diamond))mu(E^c inter K_n)+epsilon/2^(n+1)$.\
      נסמן $U colon.eq union_(n=1)^infinity U_n$ ואז $U$ פתוחה כאיחוד של פתוחות ו־$E^c subset.eq U$ (כי $E^c = union_(n=1)^infinity E^c inter K_n subset.eq union_(n=1)^infinity U_n = U$) ונקבל
      $
        U without E^c = (union.big_(n=1)^infinity U_n) without (union.big_(n=1)^infinity E^c inter K_n) subset.eq union.big_(n=1)^infinity U_n without (E^c inter K_n)
      $
      ובהתאם
      $
        mu(U without E^c) <= mu(union.big_(n=1)^infinity U_n without (E^c inter K_n))<= sum_(n=1)^infinity mu(U_n without E^c inter K_n) = sum_(n=1)^infinity mu(U_n)-mu(E^c inter K_n)<_((diamond)) sum_(n=1)^infinity epsilon/2^(n+1) = epsilon/2
      $
      אז אם נסמן $F colon.eq U^c$ נקבל
      + $U$ פתוחה $==$ $F$ סגורה
      + $E^c subset.eq U$ $<==$ $U^c subset.eq E$ $<==$ $F subset.eq E$
      + מתקיים
        $
          E without F =E inter F^c = F^c inter E = F^c without E^c ==> mu(E without F) = mu(F^c without E^c) = mu(U without E^c) < epsilon/2
        $
    אם כך קיבלנו בסך־הכל קבוצה פתוחה $E subset.eq V$ ו־$F subset.eq E$ סגורה המקיימות
    $
      (1) space mu(V without E) = mu(V)-mu(E) < epsilon/2 wide (2) space mu(E without F) = mu(E) - mu(F) < epsilon/2
    $
    ולכן
    $
      mu(V without F) = underbrace(mu(V) - mu(E), mu(V without E)) + underbrace(mu(E) - mu(F), mu(E without F)) <_((1), (2)) epsilon/2 + epsilon/2 = epsilon ==> mu(V without F) < epsilon
    $
  + מהסעיף הקודם, לכל $E in cal(m)$ קיימת קיימת קבוצה סגורה $F in cal(m)$ עם $F subset.eq$ ו־$mu(E without F)<epsilon/2$ ושוב מה־$sigma$־קומפקטיות, $F = union_(n=1)^infinity F inter K_n$, אבל לכל $n$, $F inter K_n$ היא קבוצה קומפקטית (כי חיתוך של קבוצה קומפקטית עם קבוצה סגורה הוא קומפקטי) ולכן לכל $N in NN$ נובע כי $union_(n=1)^N (F inter K_n)$ היא קבוצה קומפקטית כאיחוד סופי של קומפקטיות, אז מרציפות המידה לאיחודים עולים נקבל
    $
      lim_(N arrow.r infinity) mu(union.big_(n=1)^N F inter K_n)=mu(union.big_(n=1)^infinity F inter K_n)=mu(F) ==> mu(F) = lim_(N arrow.r infinity) mu(union.big_(n=1)^N F inter K_n)
    $
    כלומר לכל $epsilon >0$ קיים $N in NN$ כך שלכל $k>= N$ מתקיים
    $ mu(F without union.big_(n=1)^k F inter K_n) = mu(F) - mu(union.big_(n=1)^k F inter K_n) < epsilon/2 $
    נסמן $K colon.eq union_(n=1)^N F inter K_n$ ואז $K subset.eq F subset.eq E$ כאשר $K$ קומפקטית ומאי־השיוויון לעיל נקבל שלכל $epsilon > 0$ קיימת $K subset.eq X$ קומפקטית עם $K subset.eq E$ כך שמתקיים
    $
      mu(E) - mu(K) = mu(E) - mu(F) + mu(F) - mu(K) = mu(E without F) + mu(F without K) < epsilon/2 + epsilon/2 = epsilon \
      ==> mu(E) - mu(K) < epsilon <==> mu(K) > mu(E)-epsilon ==> mu(E) = sup {mu(C) bar C subset.eq E "קומפקטית " C}
    $
    כלומר $E in cal(m)$ רגולרית פנימית ומהיות $mu$ מידת רדון ולכן רגולרית חיצונית ביחס לכל קבוצה מדידה, מהיות $E in cal(m)$ שרירותי נובע כי סעיף 2 נכון.
  + תהיי $E in cal(m)$. מסעיף 1 נובע קיום של $V_n in cal(m)$ פתוחה ו־$F_n in cal(m)$ סגורה עם $F_n subset.eq E subset.eq V_n$ כך ש־$mu(V_n without F_n)<1/n$.\
    נגדיר $A colon.eq union_(n=1)^infinity F_n, B colon.eq union_(n=1)^infinity V_n$ אז $A$ היא $F_sigma$ ו־$B$ היא $G_sigma$ ומתקיים
    $
      B without A = inter.big_(n=1)^infinity V_n without union.big_(n=1)^infinity F_n = inter.big_(n=1)^infinity V_n inter(union.big_(n=1)^infinity F_n)^c = (inter.big_(n=1)^infinity V_n) inter (inter.big_(n=1)^infinity F_n^c) subset.eq inter.big_(n=1)^infinity (V_n inter F_n^c) = inter.big_(n=1)^infinity (V_n without F_n)
    $
    אבל $mu(V_n without F_n) < 1/n$ ולכן
    $
      forall n in NN, space 0<=mu(B without A)<=mu(inter.big_(n=1)^infinity V_n without F_n) <=_(inter.big_(n=1)^infinity V_n without F_n subset.eq V_n without F_n) mu(V_n without F_n) < 1/n stretch(arrow.r)_(n arrow.r infinity) 0
    $
]

#pagebreak()

== תנאים שגוררים שמידה היא מידת רדון
#theorem("תנאים שגוררים שמידה היא מידת רדון")[
  יהי $X$ מרחב האוסדרוף קומפקטי־מקומית המקיים שכל קבוצה פתוחה בו היא $sigma$־קומפקטית.\
  אם $mu$ מידה על $BB(X)$ המקיימת $mu(K)<infinity$ לכל $K subset.eq X$ קומפקטית, אזי $mu$ היא מידת רדון על $cal(m)$ וכל קבוצה מדידה $E in cal(m)$ היא רגולרית פנימית וחיצונית.
]
#proof[
  נחלק את ההוכחה לשלבים כדי לבנות מפתח:
  + *סופית על קומפקטיות:* מהיות $mu$ סופית על קומפקטיות, נקבל ש־$Lambda f = integral_X f dif mu$ היינו פונקציונל לינארי חיובי על $C_c (X)$.
  + *משפט ההצגה של ריס*: ממשפט ההצגה של ריס נובע שקיימת מידת רדון $lambda$ על $X$ המקיימת $integral_X f dif lambda =_((star)) integral_X f dif mu$, לכל $f in C_C (X)$.
  + *שימוש ב־$sigma$־קומפקטיות:* תהיי $V in cal(m)$ פתוחה, מהנתון נובע שהיא $sigma$־קומפקטית ולכן קיים אוסף ${K_n}_(n=1)^infinity$ של קבוצות קומפקטיות כך שמתקיים $ V = union.big_(n=1)^infinity K_n $
  + *שימוש בלמה של אוריסון:* מהלמה, נובע שלכל $n in NN$ קיימת $g_n in C_C (X)$ עם $K_n prec g_n prec V$.\
    _תזכורת (הלמה של אוריסון):_ כי מהלמה של אוריסון, במרחב האוסדרוף קומפקטי־מקומית, לכל $K,V subset.eq X$ עם $K subset.eq V$ כאשר $K$ קומפקטית\
    ו־$V$ פתוחה, קיימת $f in C_C (X)$ המקיימת $K prec f prec V <==> bb(1)_(K) <= f, supp(f) subset.eq V$
  + *משפט ההתכנסות המונוטונית:* תהיי ${f_N}_(N=1)^infinity$ סדרת פונקציות המוגדרת על־ידי
    $ forall N in NN, space f_N colon.eq max_(i in [N]) {g_i} $
    נשים לב שמתקיים
    + ${f_N}_(N=1)^infinity subset.eq C_C (X)$
    + ${f_N}_(N=1)^infinity$ מונוטונית עולה
    + $f_N stretch(arrow.r)_(N arrow.r infinity) bb(1)_(V)$ נקודתית כי $V = union_(n=1)^infinity K_n$ ו־$K_n prec g_n prec V$
    אם־כך, אנחנו מקיימים את תנאי משפט ההתכנסות המונוטונית ולכן נקבל
    $
      mu(V) = integral_X bb(1)_(V) dif mu = integral_X lim_(N arrow.r infinity) f_N dif mu = lim_(N arrow.r infinity) integral_X f_N dif mu = lim_(N arrow.r infinity) integral_X f_N dif lambda = integral_X lim_(N arrow.r infinity) f_N dif lambda = integral_X bb(1)_(V) dif lambda
    $
    כלומר לכל $V in cal(m)$ פתוחה מתקיים $mu(V)=lambda(V)$
  + *שימוש בתכונות מידת רדון:* יהי $epsilon>0$, מהיות $lambda$ מידת רדון נובע שלכל $E in cal(m)$ קיימת קבוצה פתוחה $U subset.eq X$  וקבוצה סגורה $F subset.eq X$ עם $F subset.eq E subset.eq U$ כך ש־$mu(V without F)<epsilon$.\
    בפרט, נובע מהיות $F subset.eq E$ כי $U without E subset.eq U without F$ ולכן ממונוטוניות $lambda(U without E)<_((star)) epsilon$.\
    אבל $U without F$ היא פתוחה (כי הפרש של פתוחה וסגורה היא פתוחה) ו־$mu(V)=lambda(V)$ לכל פתוחה ומדידה, ולכן $mu(U without F) = lambda(U without F) < epsilon$, כלומר
    $ mu(U) - mu(E) <=_("מונוטוניות") mu(U) - mu(F) = mu(U without F) < epsilon ==> mu(U) - epsilon < mu(E) $
    ולכן מתקיים
    $
      lambda(E)-epsilon <=_"מונוטוניות" lambda(U) - epsilon =_(lambda(U)=mu(U) \
      "פתוחה" U "עבור") mu(E) <_"מונוטוניות" mu(U) =_(lambda(U)=mu(U) \
      "פתוחה" U "עבור") lambda(U) <_(star) lambda(E) + epsilon \
      ==> lambda(E) - epsilon < mu(E) < lambda(E) + epsilon <==> -epsilon < mu(E) - lambda(E) < epsilon <==> abs(mu(E) - lambda(E))<epsilon
    $
    מהיות $epsilon$ שרירותי נובע כי $mu(E) = lambda(E)$ לכל $E in cal(m)$ כלומר $mu=lambda$ ולכן $mu$ מידת רדון, ומתכונות מידת רדון נובע כי כל קבוצה מדידה \
    $E in cal(m)$ היא רגולרית פנימית וחיצונית.
]

#pagebreak()

= התכנסות חלשה-\*
#theorem("תכניסי פה את הטענה מהמבחן")
#pagebreak()

= שלושת העקרונות של Littlewood
== משפט לוסין
#theorem("משפט לוסין")[יהי $X$ מרחב האוסדרוף קומפקטי מקומית ותהיי $mu$ מידת רדון על $X$.\
  תהיי $f:X arrow CC$ מדידה המקיימת ${x bar f(x)!=0} subset.eq A$ כאשר $mu(A) < infinity$.\
  אזי לכל $epsilon>0$ קיימת $g in C_C (X)$ עבורה $mu({x bar f(x) != g(x)})<epsilon$.]
#proof[
  #todo
]

#pagebreak()

== משפט אגרוב
#theorem(
  "משפט אגרוב",
)[יהי $(X, cal(A), mu)$ מרחב מידה סופי ונניח כי $f_n : X arrow RR$ מתכנסת כמעט־תמיד ל־$f:X arrow RR$ מדידה. אז לכל $epsilon>0$ קיימת $E in cal(A)$ עם $mu(E)<epsilon$ כך ש־$f_n arrow f$ במידה שווה ב־$E^c$.]
#proof[
  יהי $epsilon>0$ ונסמן
  $ n_k (x) colon.eq min{n bar forall N > n, space abs(f_N (x) - f(x))<1/k} wide (min(emptyset) = infinity) $
  עבור $x in X$, $f_n (x) arrow f(x)$ מתקיים $n_k (x) < infinity$ לכל $k in NN$ ולכן מהנתון על התכנסות כמעט־תמיד נובע ש־$n_k^(-1)({infinity})$ היא ממידה אפס לכל $k in NN$.\
  נסתכל על הקרנות $(0,m)$ עבור $m in NN$ ונקבל ש־$n_k$ מדידה:
  $ x in n_k^(-1)((0, m)) <==> n_k (x)>=m <==> x in union.big_(N>=m) { x bar abs(f_N (x) - f(x))<1/k} $
  והימנית מדידה, אז
  $ inter.big_(m=1)^infinity n_k^(-1)((m, infinity]) = n_k^(-1)({infinity}) $
  מרציפות מלמעלה (ניתן להשתמש כי הנחנו שהמרחב מידה סופי).\
  אז לכל $k in NN$ הסדרה $mu(n_k^(-1)((m, infinity]))$ מתכנסת ל־$0$.\
  לכל $k in NN$ נבחר $m_k$ כך שלכל $m>m_k$ מתקיים
  $
    mu(n_k^(-1)((m, infinity]))<epsilon dot.op 2^(-k) ==> mu(union.big_(k=1)^infinity n_k^(-1)((m_k, infinity]))<sum_(k=1)^infinity epsilon dot.op 2^(-k) = epsilon
  $
  אז $E = union.big_(k=1)^infinity n_k^(-1)((m_k, infinity])$ ולכן לכל $x in E^c$ ולכל $k in NN$ מתקיים $x in.not n_k^(-1)((m_k, infinity])$ כלומר $n_k (x) <= m_k (x)$ כלומר לכל $N>= m_k$ מתקיים $abs(f_N (x) - f(x))<1/k$ ולכן $f_n arrow f$ במידה שווה ב־$E^c$.
]

= מרחבי $L^p$
== אי־שיוויון יאנסן
#theorem(
  "אי־שיוויון יאנסן",
)[יהי $(X, cal(A), mu)$ מרחב הסתברות ותהיי $phi : (a,b) arrow.r RR$ קמורה. אם $f : X arrow.r (a,b)$ פונקציה מדידה, אזי
  $ phi(integral_X f dif mu)<=integral_X phi compose f dif mu $]

#proof[
  נסמן $T colon.eq integral_X f dif mu$.\
  מהיות $im(f) subset.eq (a,b)$ ומהיות $X$ מרחב הסתברות, נובע ש־$T in (a,b)$ ונסמן $ beta colon.eq sup_(s in (a, T)) {(phi(T)-phi(s))/(T-s)} $ אזי לכל $s in (a,b)$ עם $s<T$ מתקיים
  $ (phi(T)-phi(s))/(T-s) <= beta <==> phi(T)-phi(s) <= beta(T-s) <==> phi(s) >= phi(T) + beta(s-T) $
  $phi$ קמורה ולכן מהאיפיון השקול לקמירות עבור $s in (a,b)$ עם $s>T$ מתקיים
  $ (phi(T)-phi(s))/(s-T) >= beta <==> phi(s) - phi(T) >= beta(s-T) <==> phi(s) >= phi(T) + beta(s-T) $
  ולכן לכל $s in (a,b)$ מתקיים $phi(s) >= phi(T) + beta(s-T)$.\
  בפרט זה נכון לכל $x in X$ (כי $s = f(x)$) ולכן $phi compose f >= phi(T) + beta(f-T)$ ונקבל
  $
    integral_X phi compose f dif mu >=_"מונוטוניות האינטגרל" integral_X (phi(T) + beta(f-T) dif mu)=_"לינארית האינטגרל" integral_X phi(T) dif mu + beta(integral_X f dif mu - integral_X T dif mu) \
    = phi(T) phi(X) + beta(T - T mu(X)) =_(mu(X)=1) phi(T)+beta(T-T) = phi(integral_X f dif mu)
  $
]


#pagebreak()

== אי־שיוויון הולדר ואי־שיוויון מניקובסקי
#theorem("אי־שיוויון הולדר ואי־שיוויון מניקובסקי")[
  יהי $(X, cal(A), mu)$ מרחב מידה ונניח כי $1<=p,q<=infinity$ ומקיימים
  $ 1/p + 1/q = 1 $
  אז לכל $f,g$ מדידות אי־שליליות מתקיימים
  $
    (1) space integral_X f g dif mu <= (integral_X f^p dif mu)^(1/p) (integral_X g^p dif mu)^(1/q) \
    (2) space (integral_X (f+g)^p dif mu)^(1/p) <= (integral_X f^p dif mu)^(1/p) + (integral_X g^p dif mu)^(1/p)
  $
  כאשר הראשון זה אי־שיוויון הולדר והשני הוא אי־שיוויון מניקובסקי ואם $p=q=2$ זה אי־שיוויון קושי־שוורץ.
]

#proof[
  נוכיח את $(1)$ בהנחה ש־$norm(f)_p = norm(g)_q=1$ ונראה כי $norm(f g)_1 <= 1$: $log$ היא פונקציה קעורה ולכן אם נניח ש־$f g != 0$ נקבל
  $ log(f g) = log f + log g = (log f^p)/p + (log g^q)/q <= log(f^p/p + g^q/q) $
  ואם נעלה את $e$ בחזקת אלו נקבל
  $ (star) space f g <= f^p/p + g^q/q $
  אי־שיוויון זה טריוויאלי במקרה שבו $f g = 0$ ולכן נוכל להתעלם מההנחה הזאת ומלינאריות, מונוטוניות ומההנחה ש־$norm(f)_p = norm(g)_q = 1$ נקבל
  $ integral_X f^p/p + g^q/q dif mu = 1/p + 1/q = 1 $
  ואם ניקח אינטגרל על שני האגפים, $(star)$ יביא לנו $norm(f g)_1 <= 1$.\
  כדי להוכיח את $(2)$ נניח ש־$norm(f)_p = norm(g)_p=1$ ונשתמש בקמירות $x^p$ ונקבל שלכל $t in (0,1)$
  $ ((1-t) f + t g)^p <= (1-t)f^p + t g^p $
  ושוב מלינאריות וממונוטוניות
  $ integral_X ((1-t) f + t g)^p dif mu = (1-t)+t = 1 $
  ולכן
  $ norm((1-t)f + t g)_p^p <= 1 $
  כלומר $norm((1-t) f + t g)<=1$.\
  ללא ההנחה, נכתוב את $f+g$ כממוצע משוקלל של פונקציות מנורמה $1$, כלומר $g=norm(g)_p overline(g), f = norm(f)_p overline(p)$ ונקבל
  $
    norm(f+g)_p = norm(overline(f) dot.op norm(f)_p + overline(g) norm(g)_p)_p = (norm(f)_p + norm(g)_p) dot.op norm(overline(f) norm(g)_p/(norm(f)_p + norm(g)_p)+overline(g) norm(f)_p/(norm(f)_p + norm(g)_p))_p
  $
  נבחין שאת גורם המכפלה מימין הוא בידיוק ביטוי של נורמה של ממוצע משוקלל של פונקציות מנורמה $1$ ולכן נוכל לחסום אותו מלעיל על־ידי $1$ ולקבל
  $ norm(f+g)_p <= norm(f)_p + norm(g)_p $
]

#pagebreak()

== $CC$ הוא מרחב וקטור מעל $cal(L)^p (mu)$
#theorem($CC "הוא מרחב וקטור מעל" cal(L)^p (mu)$)[
  $cal(L)^p (mu)$ הוא מרחב וקטורי מעל $CC$.
]

#proof[
  #theorem[אם $p, q in [1,infinity]$ חזקות צמודות ו־$g in cal(L)^q (mu), f in cal(L)^p (mu)$ אזי $f dot.op g in cal(L)^1 (mu)$.]
  #proof[
    עבור $p, q in (1, infinity)$ הטענה נובעת מאי־שיוויון הולדר. אם $p=1$ ו־$q=infinity$ מתקיים $g in cal(L)^infinity (mu)$ וגם $(star) space$$abs(g(x))<=norm(g)_infinity$ $mu$־כמעט תמיד ולכן
    $
      norm(f dot.op g)_1 = integral_X abs(f dot.op g) dif mu = integral_X abs(f) dot.op abs(g) dif mu <=_((star)) integral_X abs(f) dot.op norm(g)_infinity dif mu = norm(g)_infinity dot.op integral_X abs(f) dif mu < infinity
    $
    כלומר $norm(f dot.op g)_1 < infinity$ ולכן $f dot.op g in cal(L)^1 (mu)$.
  ]
  #theorem(
    "אי־שיוויון המשולש של נורמת p",
  )[אם $p in [1, infinity]$ אזי לכל $f,g in cal(L)^p (mu)$ מתקיים $norm(f+g)_p <= norm(f)_p + norm(g)_p$.]
  #proof[
    אם $p in (1,infinity)$ אז הטענה נובעת מאי־שיוויון מניקובסקי.\
    אם $p in {1, infinity}$ אז הטענה נובעת מאי־שיוויון המשולש של הערך המוחלט ב־$RR$.
  ]
  #proof[
    נשאר להראות הומגניות – אם $f in cal(L)^p (mu)$ ו־$lambda in CC$ אזי $lambda dot.op f in cal(L)^p (mu)$:
    $
      integral_X abs(f lambda f)^p dif mu = integral_X (abs(lambda) dot.op abs(f))^p dif mu = integral_X abs(lambda)^p dot.op abs(f)^lambda dif mu = abs(lambda)^p integral_X abs(f)^p dif mu < infinity
    $
    כאשר השתמשנו בתכונות ערך המוחלט ומהומוגניות האינטגרל למכפלה בקבוע.\
    אי־השיוויון האחרון נובע מהיות $abs(lambda)^p < infinity$ ומהיות $integral abs(f)^p dif mu < infinity$ כי $f in cal(L)^p$ ולכן המכפלה היא סופית.
  ]
]

#pagebreak()

== טענות חשובות מתרגילי הבית
#theorem("טענות חשובות מתרגילי הבית")[
  #theorem($L^p "הכלת מרחבי"$)[
    יהי $(X, cal(A), mu)$ מרחבי מידה $sigma$סופי ויהיו $q<= p in [1, infinity]$
    + $L^p (mu) subset.eq L^q (mu) <==> mu(X) < infinity$
    + $L^q (mu) subset.eq L^p (mu) <==> exists epsilon > 0, space forall A in cal(A), space mu(A) < epsilon ==> mu(A) = 0$
  ]
  #theorem($L^infinity "תכונות"$)[
    נניח ש־$(X, cal(A), mu)$ מרחב מידה סופי ותהיי $f in L^infinity (mu)$
    + אם $norm(f)_infinity = 1$ אז הסדרה ${a_n}_(n=1)^infinity$ המוגדרת על־ידי $a_n = integral_X abs(f)^n dif mu$ מתכנסת
    + אם $norm(f)_infinity > 0$ אזי $ lim_(n arrow.r infinity) norm(f)_(n+1)^(n+1)/norm(f)_n^n = norm(f)_infinity $
  ]
]

#pagebreak()

== לכל $p in [1,infinity]$, המרחב הנורמי $(L^p (mu), norm(dot.op)_p)$ הוא מרחב בנך

#theorem($"הוא מרחב בנך" (L^p (mu), norm(dot.op)_p) "המרחב הנורמי" p in [1,infinity] "לכל"$)[
  לכל $p in [1, infinity]$, המרחב הנורמי $(L^p (mu), norm(dot.op)_p)$ הוא מרחב בנך (אם ורק אם הוא שלם במטריקה המושרית מהנורמה, כלומר כל סדרת קושי היא מתכנסת).
]

#proof[
  תהיי ${[f_n]_mu}_(n=1)^infinity subset.eq L^p (mu)$ סדרת קושי ותהיי ${f_n}_(n=1)^infinity$ נציגים של מחלקות שקילות אלו.\
  + נניח ש־$p in [1, infinity)$, אז לכל $k in NN$ קיים $n_k in KK$ כך ש־$norm(f_(n_(k+1))-f_(n_k))<1/2^k$ כי הסדרה קושי.\
    תהיי ${f_(n_k)}_(k=1)^infinity {f_n}_(n=1)^infinity$ תת־הסדרה המקיימת זאת ולכל $k in NN$ נגדיר
    $ g_k colon.eq sum_(i=1)^k abs(f_(n_(i+1))-f_(n_i)) $ ומתקיים
    $
      norm(g_k)_p = norm(sum_(i=1)^k abs(f_(n_(i+1))-f_(n_i)))_p <= sum_(i=1)^k norm(f_(n_(i+1))-f_(n_i))_p < sum_(i=1)^k 1/2^i < infinity
    $
    ולכן $g_k in L^p (mu)$ ונסמן $g colon.eq sum_(i=1)^infinity abs(f_(n_(i+1))-f_(n_i))$ והסדרה ${g_k^p = [sum_(i=1)^k abs(f_(n_(i+1))-f_(n_i))]^p}_(k=1)^infinity$ היא סדרה מונוטוניות עולה של פונקציות אי־שלילית המקיימת $g_k^p stretch(arrow.r)_(k arrow.r infinity) g^p= [sum_(i=1)^infinity abs(f_(n_(i+1))-f_(n_i))]^p$ נקודתית, אז ממשפט ההתכנסות המונוטונית נקבל
    $
      norm(g)_p^p = integral_X (sum_(i=1)^infinity abs(f_(n_(i+1))-f_(n_i)))^p dif mu = integral_X g^p dif mu = lim_(k arrow.r infinity) integral_X g_k^p dif mu = lim_(k arrow.r infinity) norm(g_k)_p^p < 1
    $
    כאשר אי־השיוויון האחרון נובע מהיות
    $
      norm(g_k)_p < sum_(i=1)^k 1/2^i < sum_(i=1^infinity) 1/2^i =_"סכום טור הנדסי" (1/2)/(1-1/2) = 1 ==> norm(g_k)_p < 1 ==> norm(g_k)_p^p < 1
    $
    ולכן בפרט $norm(g)_p < 1$ ולכן $g(x) < infinity$ $mu$־כמעט לכל $x in X$ כלומר הטור מתכנס בהחלט $mu$־כמעט תמיד אז נגדיר
    $ f colon.eq f_(n_1) + sum_(i=1)^infinity (f_(n_(i+1))-f_(n_i)) $
    ונרצה להראות שהסדרה ${f_m}_(m=1)^infinity$ מתכנסת ל־$f$ וכן ש־$f in L^p (mu)$: $f$ מוגדרת $mu$־כמעט תמיד לכן נקבע $f=0$ היכן ש־$f$ לא מוגדרת ואז
    $ f(x)=f_(n_1) + sum_(i=1)^infinity (f_(n_(i+1))-f_(n_i)) = lim_(i arrow.r infinity) f_(n_i) (x) $
    שכן זהו טור טלסקופי ולכל $m in NN$ מתקיים $abs(f_m -f_(n_i))^p stretch(arrow.r)_(i arrow.r infinity) abs(f_m - f)^p$ כמעט לכל $x in X$, אז
    $
      norm(f_m-f)_p^p = integral_X abs(f_m-f)^p dif mu = integral_X liminf_(i arrow.r infinity) abs(f_m - f_(n_i))^p dif mu <=_"פאטו" liminf_(i arrow.r infinity) integral_X abs(f_m - f_(n_i))^p dif mu = liminf_(i arrow.r infinity) norm(f_m - f_(n_i))_p^p
    $
    אבל ${f_n}_(n=1)^infinity$ היא סדרת קושי, אז לכל $epsilon > 0$ קיים $N in NN$ כך שלכל $n,m in NN$ עם $n,m > N$ מתקיים $norm(f_m - f_(n_i))_p < epsilon$ ובפרט עבור $m > N$ נקבל
    $ norm(f_m-f)_p^p <= liminf_(i arrow.r infinity) norm(f_m - f_(n_i))_p^p < epsilon^p ==> f_m stretch(arrow.r)_(m arrow.r infinity)^norm(dot.op)_p f $ וכן
    $ norm(f)_p <=_"אי־שיוויון המשולש" norm(f-f_m)_p + norm(f_m)_p < infinity ==> f in L^p (mu) $
    #colbreak()
  + אם $p=infinity$ אז ${f_n}_(n=1)^infinity subset.eq L^infinity (mu)$ סדרת קושי של נציגים עבורה קיימת תת־סדרה ${f_(n_i)}_(i=1)^infinity$ כך שמתקיים
    $ forall i in NN, space norm(f_(n_(i+1))-f_(n_i))_infinity < 1/2^k $
    נסמן לכל $n in NN, k in NN$
    $
      A_n colon.eq {x in X bar abs(f_n (x))>norm(f_n)_infinity} = abs(f_n)^(-1) ((norm(f_n)_infinity, infinity]) \
      B_(n,k) colon.eq {x in X bar abs(f_n (x) - f_k (x)) > norm(f_n - f_k)_infinity}=abs(f_n - f_k)^(-1)((norm(f_n - f_k)_infinity, infinity])
    $
    אבל $f_n in L^infinity (mu)$ אז מהגדרה $esssup{abs(dot.op)}=norm(dot.op)_infinity$ ש־$mu(A_n) = mu(B_(n,k))=0$ אז
    $ E colon.eq (union.big_(n in NN) A_n) union (union.big_(n,k in NN) B_(n,k)) $
    ומ־$sigma$־אדטיביות של $mu$ נקבל $mu(E)=0$.\
    כעת $sum_(i=1)^infinity (f_(n_(i+1))-f_(n_i))$ מתכנס במידה שווה ממבחן ה־$M$ של ויירשטראס על $X without E$ (כי $sum_(k=1)^infinity 2^(-k) < infinity$) ולכן  \
    $f_(n_1) + sum_(i=1)^infinity (f_(n_(i+1))-f_(n_i))$ מתכנסת במידה שווה ל־$f$ על $X without E$.\
    אז ${f_n}_(n=1)^infinity$ סדרת קושי ונקבל שהגבול $f(x) = lim_(n arrow.r infinity) f_n (x)$ מוגדר וקיים $mu$־כמעט לכל $x in X$ ו־$f$ חסומה על־ידי $lim_(n arrow.r infinity) norm(f_n)_infinity$ \
    $mu$־כמעט לכל $x in X$, כלומר $f in L^infinity (mu)$ ומתקיים $norm(f-f_n)_infinity stretch(arrow.r)_(n arrow.r infinity) 0$.
]

#pagebreak()

== $L^p (mu)$ צפופה ב־$cal(S)$
#theorem($L^p (mu)"צפופה ב־" cal(S)$)[
  יהי $cal(S) subset.eq CC^X$ האוסף הנתון על־ידי
  $ cal(S) colon.eq { s:X arrow.r CC, "פשוטה" s bar mu({x in X bar s(x) != 0}) < infinity} $
  אזי לכל $p in [1, infinity)$ מתקיים ש־$cal(S)$ צפופה ב־$L^p (mu)$ (כלומר, לכל $f in L^p (mu)$ קיימת סדרת פונקציות ${s_n}_(n=1)^infinity subset.eq cal(S)$ כך ש־$s_n stretch(arrow.r)_(n arrow.r infinity)^norm(op(dot))_p f$).
]

#proof[
  מכך שלכל $s in cal(S)$ מתקיים $abs(s(X))<infinity$, יחד עם התנאי $mu({x in X bar s(x) != 0}) < infinity$ נסיק כי $S subset.eq L^p (mu)$ לכל $p in [1,infinity)$.\
  תהיי $f in L^p (mu)$ אי־שלילית ותהיי ${s_n : X arrow.r CC}_(n=1)^infinity$ המתכנסת אליה נקודתית.\
  אזי מהתנאי $0<=s_n <= f in L^p (mu)$ נובע ${s_n}_(n=1)^infinity subset.eq L^p (mu)$.\
  נניח בשלילה שקיים $n_0 in NN$ כך ש־$s_(n_0) in.not cal(S)$, כלומר $mu({x in X bar s_(n_0) (x) != 0}) = infinity$, אז נסמן
  $ c colon.eq min {0<=alpha < infinity bar mu({x in X bar s_(n_0) (x) = alpha})}=alpha $
  שמוגדר היטב כי $abs(s(X))<infinity$.\
  מתקיים
  $
    s_(n_0)^(-1) ({alpha}) = {x in X bar s_(n_0) (x) = alpha} ==> c = min {alpha in [0, infinity) bar mu(s_(n_0)^(-1)({alpha}))=infinity}
  $
  ולכן
  $
    norm(f)_p^p = integral_X abs(f)^p dif mu =_((1)) integral_X f^p dif mu >=_((2)) integral_X s_(n_0)^p dif mu >=_((3)) integral_(s_(n_0)^(-1)({c})) s_(n_0)^p dif mu >=_((4)) c^p dot.op mu(s_(n_0)^(-1) ({c}))=infinity
  $
  כאשר
  + נובע מהיות $f$ אי־שלילית
  + לכל $n in NN$, $f>=s_n >=0$ אם ורק אם $f^p >= s_n^p >=0$
  + מונוטוניות המידה ביחס להכלה
  + מהגדרת $s_(n_0)^(-1)({c})$ ומהגדרת $c$
  כלומר $norm(f)_p^p = infinity <==> norm(f)_p = infinity$ אבל $f in L^p (mu)$ וזאת סתירה ולכן $mu({x in X bar s_n (x) != infinity})< infinity$ לכל $n in NN$.\
  מתקיים
  $
    s_n stretch(arrow.r)_(n arrow.r infinity) f <==> s_n-f stretch(arrow.r)_(n arrow.r infinity) 0 <==> abs(s_n -f) stretch(arrow.r)_(n arrow.r infinity) 0 <==> abs(s_n -f)^p stretch(arrow.r)_(n arrow.r infinity) 0
  $
  כלומר $abs(s_n -f)^p stretch(arrow.r)_(n arrow.r infinity) 0$ נקודתית ומתקיים לכל $n in NN$
  $ abs(f-s_n)^p = (f-s_n)^p <= f^p in L^p (mu) $
  כלומר הסדרה ${abs(f-s_n)^p}_(n=1)^infinity$ נשלטת על־ידי הפונקציה $f^p$ אבל $f in L^p (mu)$ ולכן $f in L^1 (p)$ וממשפט ההתכנסות הנשלטת
  $
    norm(f-s_n)_p^p = integral_X abs(f-s_n)^p dif mu stretch(arrow.r)_(n arrow.r infinity) 0 ==> s_n stretch(arrow.r)_(n arrow.r infinity)^norm(dot.op)_p f
  $
  מהיות $f$ שרירותית נובע כי ניתן לקרב כל $f in L^p (mu)$ על־ידי איברים מ־$cal(S)$ ולכן $overline(cal(S))=L^p (mu)$.
]
#remark($L^infinity"אי־נכונות הטענה ב־"$)[
  $cal(S)$ איננה צפופה ב־$L^infinity (Leb_(RR))$: ניקח $f(x) = 1$ לכל $x in RR$ ו־$f in L^infinity (RR)$ כי $norm(f)_infinity = 1$.\
  תהיי $s in cal(S)$ ולכן קיימת $E$ כך ש־$mu(E)<infinity$ ו־$s$ נתמכת על $E$ ולכן
  $ s(x) = 0 space forall x in E^c $
  אזי
  $ norm(f-s)_infinity = esssup_(x in RR) abs(f(x)-s(x)) $
  אבל $mu(RR)=infinity$ ו־$mu(E)<infinity$ ולכן $mu(E^c)=infinity$ וכמובן איננה ממידה אפס ועל $E^c$ מתקיים
  $ abs(f(x)-s(x))=abs(1-0)=1 ==> norm(f-s)_infinity >=1 $
  אז אי אפשר לבנות סדרה שמתכנסת ל־$0$ ולכן $cal(S)$ לא צפופה ב־$L^infinity (Leb_(RR))$.
]

#pagebreak()

== קירוב על־ידי פונקציות רציפות
#theorem("קירוב על־ידי פונקציות רציפות")[
  יהי $X$ מרחב האוסדרוף קומפקטי־מקומית ותהיי $mu$ ממידת רדון על $X$.\
  לכל $p in [1, infinity)$ הקבוצה $C_C (X)$ צפופה ב־$L^p (mu)$.
]
#proof[
  + *$C_C (X) subset.eq L^p (mu)$:* אם $f in C_C (X)$ אזי $f$ רציפה ו־$supp(f)$ קומפקטית ולכן $f$ חסומה ב־$supp(f)$ וכן $abs(f)^p$ חסומה ב־$supp(f)$ ולכן קיים $M>0$ כך ש־$abs(f)^p <= M$ על $supp(f)$.\
    $mu$ מידת רדון ולכן היא סופית על קומפקטיות ומתקיים $mu(supp(f))<infinity$ ולכן
    $
      norm(f)_p^p = integral_(supp(f) union.dot)(supp(f))^c abs(f)^p dif mu = integral_(supp(f)) abs(f)^p dif mu + integral_((supp(f))^c) abs(f)^p dif mu = integral_(supp(f)) abs(f)^p dif mu \
      <= integral_(supp(f)) M dif mu = M dot.op mu(supp(f))<infinity ==> f in L^p (X)
    $
  + *שימוש בצפיפות $cal(S)$*:
    אז אם
    $ cal(S) colon.eq { s:X arrow.r CC, "פשוטה" s bar mu({x in X bar s(x) != 0}) < infinity} $
    מספיק שנראה $S subset.eq overline(C_C (X))$ כי אז נקבל $L^p (mu) = overline(S) subset.eq overline(C_C (X)) subset.eq overline(L^p (mu))=L^p (mu)$ שהמעבר האחרון נובע מהיות $(L^p (mu), norm(dot.op)_p)$ מרחב שלם.\
    אז תהיי $s in cal(S)$ וממשפט Lusin, לכל $epsilon > 0$ קיימת $g in C_C (X)$ עם
    $ sup_(x in X) {abs(g(x))}<=sup_(x in X) {abs(s(x))} eq.colon M_s $
    כך שמתקיים
    $ mu({x in X bar s(x) != g(x)})<<epsilon^p/(2^p M_s^p) $
    ומאי־שיוויון המשולש נקבל $abs(g-s)<=2M_s$.\
    נסמן
    $ A colon.eq { x in X bar g(x) = s(x)} $
    ואז על $A$ מתקיים $abs(g-s)^p = eq.triple 0$ וגם $mu(A^c)<epsilon^p/(2^p M_s^p)$ ונקבל
    $
      norm(g-s)_p^p = integral_X abs(g-s)^p dif mu = integral_(A union.dot A^c) abs(g-s)^p dif mu = integral_A abs(g-s)^p dif mu + integral_(A^c) abs(g-s)^p dif mu \
      <= integral_(A^c) 2^p M_s^p dif mu = 2^p M_s^p dot.op mu(A^c) < 2^p M_s^p dot.op epsilon^p/(2^P M_s^p)=epsilon^p
    $
    כלומר
    $ norm(g-s)_p^p < epsilon^p ==> norm(g-s)_p < epsilon $
    אז הטענה נכונה לכל $epsilon>0$ ו־$M_s$ תלוי ב־$s$ ולא ב־$g$ אז לכל $s$ ניתן לצוא חסם $M_s$ שחוסם את $g in C_C (X)$, כלומר כל $s in cal(S)$ ניתן לקירוב על־ידי פונקציה מ־$C_C (X)$ ולכן $C_C (X)$ צפופה ב־$cal(S)$ כשהאחרון צפוף ב־$L^p (mu)$ ולכן $C_C (X)$ צפוף ב־$L^p (mu)$.
]
#remark($L^infinity"אי־נכונות הטענה ב־"$)[
  הדוגמה מהטענה הקודמת מראה את אי־נכונות הטענה גם כאן.
]

#pagebreak()

= יחסים בין מידות
תהיינה $mu, nu$ מידות על מרחב מדיד $(X, cal(A))$.
#definition("מידה רציפה בהחלט")[
  נאמר ש־$nu$ רציפה בהחלט ביחס ל־$mu$ ונסמן $nu lt.double mu$ אם ורק אם
  $ forall E in cal(A), space mu(E) = 0 ==> nu(E) = 0 $]
#definition(
  "מידות שקולות",
)[נאמר ש־$mu$ ו־$nu$ הן שקולות ונסמן $nu ~ mu$ אם ורק אם $mu lt.double nu$ וגם $nu lt.double mu$, כלומר
  $ forall E in cal(A), space mu(E) = 0 <==> nu(E) =0 $
]
#definition("מידות סינגולריות")[
  נאמר ש־$mu$ ו־$nu$ סינגולריות ונסמן $mu perp nu$ אם ורק  אם קיימות $A, B in cal(A)$ מדידות וזרות כך שמתקיים \
  $mu(A^c)=mu(B^c)=0$ (באופן שקול, אם $A union.dot B = X$ ו־$nu(B)=mu(A)=0$).
]

== טענה שקולה לרציפות בהחלט במרחב סופי
#theorem("טענה שקולה לרציפות בהחלט במרחב סופי")[
  אם $mu$ סופית אז $mu lt.double nu$ אם ורק אם לכל $epsilon>0$ קיים $delta>0$ כך שאם $nu(A)<delta$ אזי $mu(A)<epsilon$.
]
#proof[
  $<==$ נניח כי $mu lt.double nu$. יהי $epsilon>0$ ונניח בשלילה שלכל $n in NN$ קיימת $A_n$ עם $nu(A_n)<2^(-n)$ כך ש־$mu(A^n)>epsilon$.\
  לפי בורל־קנטלי $nu(inter union A_n)=0$ אבל מרציפות בהחלט ומסופיות $mu$
  $ mu(inter.big_(m=1)^infinity union.big_(n=m)^infinity A_n)=mu(limsup A_n)>=limsup mu(A_n) >= epsilon $
  $==>$ נניח כי $nu(A)=0$ אז $nu(A) < delta$ לכל $delta>0$ ולכן $mu(A)<epsilon$ לכל $epsilon > 0$ ולכן $mu(A)=0$.
]

== טענה שקולה לרציפות בהחלט במרחב $sigma$־סופי
#theorem($"־סופי"sigma"טענה שקולה לרציפות בהחלט במרחב "$)[
  אם $mu$ מידה $sigma$־סופית ו־$nu$ מידה כלשהי אז $nu lt.double mu$ אם ורק אם $nu|_A lt.double mu|_A$ לכל $A$ עם $mu(A)<infinity$.
]
#proof[
  $<==$ כי אם $nu lt.double mu$ זה נכון גם לצמצום.\
  $==>$ נכתוב $X = union.big_(n) A_n$ עם $mu(A_n)<infinity$ ונניח כי $mu(E)=0$ אז נראה כי $nu(E)=0$: $E_n = A_n inter E$ אז מהיות $mu(E)=0$ נובע כי $mu(E_n) = 0$ ממונוטוניות המידה (כי חיתוך קבוצות מדידות הוא קבוצה מדידה) ולכן $mu|_(A_n) (E) = 0$ ולכן מההנחה $ nu|_(A_n) (E) = 0 = nu(E inter A_n) $ ולכן
  $ nu(E)<= sum_(n=1)^infinity nu(E inter E_n) = 0 $
]

== תנאי שקול למידת האפס
#theorem(
  "אם מידה רציפה בהחלט וסינגולרית ביחס למידה אחרת היא מידת האפס",
)[ אם $mu lt.double nu$ וגם $mu perp nu$ אז $mu$ היא מידת האפס.]

#proof[מהסינגולריות של המידות נובע כי $mu$ נתמכת על הקבוצה $A$ כך ש־$nu(A)=0$ ומרציפות בהחלט נובע כי $mu(A)=0$, כלומר $mu eq.triple 0$.]

== תנאי שקול לסינגולריות על מידות חיוביות
#theorem("תנאי שקול לסינגולריות על מידות חיוביות")[
  יהיו $mu, nu$ מידות חיוביות על $X$. אז $mu perp nu$ אם ורק אם לכל $epsilon>0$ קיימת קבוצה $A subset X$ מדידה כך ש־$mu(A)<epsilon, nu(A^c)<epsilon$.
]

#proof[
  $<==$ אם $mu perp nu$ אזי קיימת קבוצה $A$ כך ש־$mu(A)=0$ ו־$nu(A^c)=0$, כנדרש.\
  $==>$  נבחר $(A_n)_(n=1)^infinity$ סדרת קבוצות כך שמתקיים
  $ mu(A_n)<2^(-n), nu(A_n^c)<2^(-n) $
  נגדיר $A = limsup A_n$ ומבורל־קנטלי נקבל $mu(A)=0$, מצד שני מהלמה של פאטו
  $ nu(A^c)=nu(liminf A_n^c)<=liminf_(n arrow.r infinity) nu(A_n^c)=0 $
]

== מסקנה מתרגילי הבית
#theorem("מסקנה מתרגילי הבית")[
  $mu, nu_1, nu_2, dots.h$ מידות חיוביות על $X$ ונגדיר $nu=sum_(i=1)^infinity nu_i$ אזי
  $
    (1) space forall i in NN, space nu_i perp mu ==> nu perp mu wide (2) space forall i in NN, space nu_i lt.double mu ==> nu lt.double mu
  $
]

#pagebreak()

= מרחבי הילברט
== משפט ההצגה של Riesz–Fréchet
#theorem("משפט ההצגה של Riesz–Fréchet")[
  יהי $cal(H)$ מרחב הילברט, ההעתקה ששולחת כל וקטור $h in cal(H)$ לפונקציונל $phi.alt_h (x) colon.eq chevron.l x,h chevron.r$ הינה איזומורפיזם צמוד־לינארי בין $cal(H)$ ל־$cal(H)^*$ שהיינה גם איזומטריה.
  _תזכורת:_
  $ cal(H)^* colon.eq {phi.alt in Hom(cal(H), CC) bar norm(phi.alt)_op < infinity} $
]
#proof[
  + מהגדרת המכפלה הפנימית נסיק $h mapsto phi.alt_h$ היא צמודה־לינארית
  + מאי־שיוויון קושי־שוורץ לכל $norm(x)=1$ מתקיים
    $ abs(phi_h (x))=abs(chevron.l x","h chevron.r) <= norm(x) dot.op norm(h) = norm(h) $
  + נובע אם כך $norm(phi.alt_h)_op <= norm(h)$ אבל $h/norm(h)$ הוא מנורמה $1$ ומקיים $phi.alt_h (h/norm(h))=chevron.l h/norm(h) "," h chevron.r = norm(h)$
  + אז $norm(phi.alt_h)_op = norm(h)$ ולכן ההעתקה היא איזומטריה
  + יהי $ell in cal(H)^*$ ונסמן $V = ker ell$, אז $V subset.eq cal(H)$ תת־מרחב סגור כי $ell$ פונקציונל חסום ולכן רציף ו־$V$ היא המקור של קבוצה סגורה ${0}$.\
  + אם $V = cal(H)$ אז $ell=phi.alt_0$
  + אחרת, $V subset cal(H)$ ולכן קיים $0 != z in V^perp$ אז נוכיח שהוקטור $w=overline(ell(z))/(norm(z)^2) dot.op z$ מקיים $ell=phi.alt_w$
  + אכן לכל $x in cal(H)$ מתקיים
    $
      ell(ell(z) dot.op x-ell(x) dot.op z) = ell(z) dot.op ell(x)-ell(x) dot.op ell(z) = 0 \
      ==> ell(z) dot.op x - ell(x) dot.op z in ker ell = V \
      ==> chevron.l ell(z) dot.op x - ell(x) dot.op z "," z chevron.r = 0 \
      ==> ell(x) = chevron.l x "," overline(ell(z))/(norm(z)^2) dot.op z chevron.r ==> ell = phi.alt_w
    $
]

#pagebreak()

== אם $mu$ איננה מידת האפס אז יש מידה סופית ששקולה לה
#theorem[אם $mu != 0$ מידה $sigma$־סופית על מרחב מדיד $(X, cal(A))$, אזי קיימת מידה סופית $nu$ על $(X, cal(A))$ כך ש־$mu ~ nu$.]
#proof[
  + *שימוש ב־$sigma$ סופיות:* מהיות $(X, cal(A), mu)$ מרחב מידה $sigma$־סופי נובע שקיים אוסף ${A_n}_(n=1)^infinity$ עם $mu(A_n)$ לכל $n in NN$ כך ש־$X = union_(n=1)^infinity A_n$
  + *הגדרת פונקציית עזר:* נגדיר $w : X arrow.r [0,1]$ על־ידי
    $ w(x) colon.eq sum_(n=1)^infinity 2^(-n)/(1+mu(A_n)) dot.op bb(1)_(A_n)(x) $
  + *$w$ מדידה:* כגבול של סדרת פונקציות שהן צירופים לינאריים סופיים של פונקציות מציינות שהן כמובן מדידות
  + *$0<=w<=1$:* לכל $x in X$ ברור שהביטוי אי־שלילי. כמו־כן, מה־$sigma$־סופיות נובע שקיים לפחות $N in NN$ אחד כך ש־$x in A_n$ ולכן
    $
      w(x) = sum_(n=1)^infinity 2^(-n)/(1+mu(A_n)) dot.op bb(1)_(A_n)(x) >= 2^(-n)/(1+ mu(A_n)) dot.op bb(1)_(A_n)(x) = 2^(-n)/(1+mu(A_n)) > 0
    $
  + *חסימות:* מהיות $mu(A_n)>0$ נובע כי $1+mu(A_n) > 1$ נובע כי $1/(1+mu(A_n))<=1$, אז
    $
      0 < w<=_"הורדנו אינדקטור" sum_(n=1)^infinity 2^(-n)/(1+ mu(A_n))<=sum_(n=1)^infinity 2^(-n) = 1 ==> w(x) in (0,1]
    $
  + *הגדרת מידה חדשה:* נגדיר $u : cal(A) arrow.r [0, infinity]$ מידה המוגדרת על־ידי $dif nu = w dif mu$ ראינו שזאת מידה וש־$nu lt.double mu$
  + *$mu lt.double nu$:* תהיי $E in cal(A)$ כך ש־$0=nu(E)=integral_E w dif mu$.\
    מהיות $w>0$ נסיק כי $mu(E)=0$ כי אחרת אם $w>0$ וגם $mu(E)>0$ נקבל כי $0=nu(E) = integral_E w dif mu > 0$ בסתירה ולכן $mu lt.double nu$
  + *הגדרה של מידות שקולות:* מצאנו כי $mu lt.double nu$ וכן $nu lt.double mu$ ולכן מהגדרה של מידות שקולות נובע כי $mu~nu$
]

#pagebreak()

= נגזרת רדון־ניקודים
== משפט נגזרת רדון־ניקודים־לבג
#theorem("משפט נגזרת רדון־ניקודים־לבג")[
  יהי $(X, cal(A))$ מרחב מדיד ויהיו $mu, nu$ שתי מידות $sigma$־סופיות על $X$.\
  אזי קיימות ויחידות שתי מידות $nu_a, nu_s$ המקיימות $nu = nu_a + nu_s$ כאשר $nu_a lt.double mu$ וגם $nu_s perp mu$ (פירוק לבג).\
  כמו־כן, קיימת ויחידה $h:X arrow [0, infinity)$ מדידה עבורה מתקיים $dif nu_a = h dif mu$ ונקרא ל־$h$ נגזרת רדון־ניקודים של $nu_a$ ביחס ל־$mu$ ונסמנה $(dif nu_a)/(dif mu)$.\
  יתר על־כן אם $nu$ סופית אזי $h in L^1 (mu)$.
]

#proof[
  + הוכחת הטענה נכונה כאשר $nu$ מידה סופית ו־$mu$ מידה $sigma$־סופית ונראה כי זה גורר נכונות עבור מידות $mu, nu$ $sigma$־סופיות: \
    מהיות המרחב $sigma$־סופי ולכן קיים אוסף ${A_n}_(n=1)^infinity subset.eq cal(A)$ של קבוצות מדידות ממידה סופית תחת $nu$ ובלי הגבלת הכלליות נניח שהן זרות זו מזו (תמיד ניתן להזיר אותם) כך ש־$X =_((star)) union.dot_(n=1)^infinity A_n$ ולכל $n in NN$ נסמן את מרחב המידה המצומצם
    $
      v_n colon.eq nu|_(A_n) wide A_n colon.eq cal(A)|_(A_n)
    $
    אז $nu_n$ מידה על מרחב מדיד מצומצם ומהסופיות של $nu_n$ נובע שגם $(A_n, cal(A_n))$ מרחב מידה סופי.\
    מ־$(star)$ נובע כי $nu = sum_(n=1)^infinity nu_n$ ומההנחה ניתן ליישם את הטענה עבור המידות $mu$ ו־$nu_n$ על $(A_n, cal(A)_n)$:\
    אז קיימות $nu_(n,a), nu_(n,s)$ על $(A_n, cal(A)_n)$ עם $nu_(n,a) lt.double mu$ וגם $nu_(n,s) perp mu$ כך ש־$nu_n = nu_(n,a) + nu_(n,s)$ אז נגדיר
    $ nu_s colon.eq sum_(n=1)^infinity nu_(n,s) wide nu_a colon.eq sum_(n=1)^infinity nu_(n,a) $
    ונקבל אם כך
    $
      nu=sum_(n=1)^infinity nu_n = sum_(n=1)^infinity nu_(n,a) + nu_(s,n) = sum_(n=1)^infinity nu_(n,a) + sum_(n=1)^infinity nu_(s,n) = nu_a + nu_s
    $
    ולכל $n in NN$:
    + אם $E in cal(A_n)$ עם $mu(E)=0$ אזי $nu_(n,a) lt.double mu$ ולכן $nu_(n,a) (E) = 0$, מכאן ש־$nu_a (E) = sum_(n=1)^infinity nu_(n,a) = 0$ ולכן $nu_a lt.double mu$
    + מכך ש־$nu_(n,s) perp mu$ ולכן קיימות $A, B in cal(A)$ מדידות וזרות כך ש־$mu(A^c)=nu_(n,s)(B^c)=0$ ולכן $ nu_s (B^c) = sum_(n=1)^infinity nu_(n,s) (B^c) = 0 = mu(A^c) ==> nu_s perp mu $
  + נניח ש־$nu$ מידה סופית.\
    + מטענה שראינו נובע שקיימת פונקציה מדידה וחיובית $w:X arrow (0,1]$ שעבורה $w dif mu$ היא ממידה סופית אז נגדיר את המדיה הסופית $dif lambda = dif nu + w dif mu$
    + לכל $f in L^2 (lambda)$ מתקיים
      $
        abs(integral f dif nu) <= integral abs(f) dif nu <= integral abs(f)(dif nu + w dif mu) = integral abs(f) dot.op 1 dif lambda <=_"קושי־שוורץ" sqrt(integral abs(f^2) dif lambda) sqrt(integral abs(1^2) dif lambda) = sqrt(lambda(X)) norm(f)_(L^2 (lambda))
      $
    + אז הפונקציונל $phi.alt : L^2 (lambda) arrow CC$ הנתון על־ידי $phi.alt (f) = integral f dif nu$ הוא חסום
    + ממשפט הצגה של פרשה־ריס, נסיק שקיימת $g in L^2 (lambda)$ כך שלכל $f in L^2 (lambda)$ מתקיים
      $ (triangle) space integral f dif nu = phi.alt (f) = integral f dot.op g dif lambda $
      + לכל $E in cal(A)$ עם $lambda(E) > 0$ מתקיים $bb(1)_E in L^2 (lambda)$ ולכן $nu(E) = integral_E g dif lambda$, כלומר
      $ 0<= nu(E)/lambda(E) = 1/lambda(E) integral_E g dif lambda <=1 $
      + מלמה שראינו על ממוצעים של פונקציות על קבוצות מדידות נסיק $0<=g<=1$, $lambda$־כמעט תמיד
      + על־ידי שינוי של $g$ על קבוצה מ־$lambda$־מידה אפס נוכל להסיק כי $0<=g<=1$ תמיד
      + נגדיר
        $
          A colon.eq {x in X bar g(x) in [0, 1)} wide B colon.eq {x in X bar g(x) = 1} \
          nu_a colon.eq nu|_A wide nu_s colon.eq nu|_B
        $
      + מכך ש־$X = A union.dot B$ הרי ש־$nu = nu_a + nu_s$
      + שכתוב של $triangle$ מביא שלכל $f$
        $
          integral f dif nu = integral f g dif nu + integral f g w dif mu <==>_((star)) integral f(1-g) dif nu = integral f g w dif mu
        $
      + נראה ש־$nu_s perp mu$: מהיות $(1-g)|_B eq.triple 0$ אז $f=bb(1)_B$ ומ־$(star)$ נקבל
        $ 0 = integral_B (1-g)dif nu = integral_B g w dif mu $
        אבל $w>0$ ולכן $mu(B)=0$ ולכן $nu_s (B^c)=0=mu(B)$ כלומר $nu_s perp mu$
      + נראה ש־$nu_a lt.double mu$: כי $f=(1+g+g^2+ dots.h.c + g^n) bb(1)_E$ אז עבור $E in cal(A)$ מ־$(star)$ נקבל
        $ integral_E (1-g^(n+1)) dif nu = integral_E (1+g+g^2+dots.h.c + g^n) g w dif mu $
        אבל $g|_A < 1$ והרי $(1-g^(n+1)) bb(1)_E arrow.tr 1_(A inter E)$ מונטונית ולכן באגף שמאל נקבל
        $ integral_E (1-g^(n+1)) dif nu arrow.r_(n arrow.r infinity) nu(A inter E) = nu_a (E) $
        מצד שני $(1+g+g^2+ dots.h.c + g^n) g w arrow.tr h$ מתכנסת מונוטונית ל־$h$ מדידה ב־$[0, infinity)$ ולכן באגף ימין
        $ integral_E (1+g+g^2 + dots.h.c + g^n) g w dif mu arrow.r_(n arrow.r infinity) integral_E h dif mu $
        אז $dif nu_a = h dif mu$ ולכן $nu_a lt.double mu$.\ מכך ש־$nu_a$ ממידה סופית נסיק כי $h in L^1 (mu)$.

]

#pagebreak()

= גזירה של מידות רדון ב־$RR^d$
== משפט לב הגזירה
#theorem("משפט לב הגזירה")[
  תהיינה $mu. lambda$ מידות רדון על $RR^d$ ו־$A subset.eq RR^d$ קבוצה מדידה וחסומה ו־$0<t<infinity$
  + אם $underline(D)(mu, lambda, x) <=t$ לכל $x in A$ אזי $mu(A)<= t dot.op lambda(A)$
  + אם $overline(D)(mu, lambda, x)>=t$ לכל $x in A$ אזי $mu(A)>= t dot.op lambda(A)$
]
#proof[
  נוכיח את $(1)$ ו־$(2)$ הוא אנלוגי.
  + *כיסוי בסיקוביץ':* יהי $epsilon>0$ אזי קיים כיסוי בסיקוביץ' $cal(F)$ של $A$ המקיים
    $
      (1) space forall B in cal(F), mu(B)/lambda(B) < t + epsilon wide (2) space forall x in A, inf{r bar B_r (x) in cal(F)}=0
    $
  + *שימוש ברגולריות פנימית:* נבחר $A subset.eq U$ פתוחה עבורה מתקיים $lambda(U)<lambda(A)+epsilon$ $(star)$
  + *צמצום הכיסוי:* נזרוק מ־$cal(F)$ את כל הכדורים שלא מוכלים ב־$U$ והכיסוי החדש עדיין מקיים את $(1), (2)$ ובפרט זה עדיין כיסוי בסיקוביץ' (בגלל (2))
  + *שימוש בטענה שראינו:* ממשפט שראינו נובע שקיי תת־אוסף בן־מנייה $tilde(E) subset.eq cal(F)$ של כדורי זרים בזוגות עם $mu(A without union.big tilde(E))=0$
  + *שימוש במונוטוניות:*
    $
      mu(A)<=mu(union.big tilde(E))+mu(A without union.big tilde(E))<=_"תת־אדטיביות" sum_(B in tilde(E)) mu(B) <=_((2)) sum_(B in tilde(E)) (t+epsilon) lambda(B) =_((star star)) (t+epsilon) dot.op lambda(union.big tilde(E)) \
      <=_((star)) (t+epsilon) lambda(U) <=_((star)) (t+epsilon)(lambda(A)+epsilon)= t dot.op lambda(A) + epsilon(lambda(A) + epsilon + t) arrow_(epsilon arrow 0) t dot.op lambda(A)
    $
    כאשר $(star star)$ נובע מכך שזה אוסף זר של כדורים זרים בזוגות ומ־$sigma$־אדטיביות.

]
#pagebreak()

== הטענות על כיסוי בסיקוביץ'?
#pagebreak()

== משפט הגזירה של לבג־בסיקוביץ'
#theorem("משפט הגזירה של לבג־בסיקוביץ'")[
  תהיינה $mu. lambda$ מידות רדון על $RR^d$
  + $D(mu, lambda, x)$ כמעט וסופי $lambda$־כמעט תמיד
  + $underline(D)(mu, lambda, x)<infinity$  $mu$־כמעט תמיד אם ורק אם $mu lt.double lambda$
  + אם $mu lt.double lambda$ אזי $D(mu, lambda, x) = (dif mu)/(dif lambda)$
]
#proof[
  + לכל $0<r<infinity, 0<=s<t<infinity$ נגדיר
    $
      A_(t,r) colon.eq {x in B_r (0) bar overline(D)(mu, lambda, x) >= t} wide A_(s,t,r) colon.eq {x in B_r (0) bar underline(D)(mu, lambda, x) <= s<t<=overline(D)(mu, lambda, x)}
    $
    ומתקיים $A_(s,t,r) subset.eq A_(t,r)$
    מתקיים מטענה על גזירהה שראינו
    $ t dot.op lambda(A_(s,t,r))<=_(overline(D)>=t) mu(A_(s,t,r))<=_(underline(D)<=s) dot.op lambda(A_(s,t,r)) $
    ומהיות $s<t$ ו־$lambda(A_(s,t,r))<infinity$ הרי ש־$lambda(A_(s,t,r)) = 0$ לכל $s<t,r$.
    עבור $A_(t,r)$ מתקיים
    $ t dot.op lambda(A_(t,r)) <= mu(A_(t,r))<=mu(B_r (0)) < infinity $
    נסמן
    $ A_(infinity, r) colon.eq { x in B_r (0) bar overline(D)(mu, lambda, x)=infinity} $
    ולכן $A_(infinity, r) = inter.big_(n in NN) A_(n,r)$
    מהיות $lambda(A_1, r) < infinity$, ממונוטוניות לסדרות יורדות נסיק
    $ lambda(A_(infinity, r))=lim_(n arrow.r infinity) lambda(A_(n,r))<=lim_(n arrow infinity) 1/n mu(B_r (0)) = 0 $
    אזי
    $
      {x in B_r (0) bar overline(D)(mu, lambda,x) = 0 "או" D(mu, lambda,x) "לא קיים"} = A_(infinity, r) union.big_(s<t in QQ) A_(s,t,r)
    $
    זה איחוד בן־מנייה של קבוצות מ־$lambda$־מידה אפס ולכן זה נכון לכל $r>0$ וזה גורר את $1$
  + $==>$ אם $mu lt.double lambda$ אז מ־$(1)$ נובע ש־$D<infinity$ קיים $mu$־כמעט תמיד.\
    $<==$ אם $A$ עם $lambda(A)=0$, אז אם $underline(D)(mu, lambda, x) < infinity$ $mu$־כמעט תמיד אז
    $ mu(A) = mu(union.big_(n in NN \ k in NN) A_(n,k)) $
    כאשר
    $ A_(n,k) colon.eq {x in A inter B_k (0) bar underline(D)(mu,lambda, x) <=n} $ ולכן מטענה שראינו נובע
    $ mu(A_(n,k)) <= n dot.op lambda(A_(n,k)) <= n dot.op lambda(A) = 0 ==> mu(A) = 0 ==> mu lt.double lambda $
  + תהיי $B subset.eq RR^d$ מדידה וחסומה כלשהי ונראה ש־$integral_B D(mu,lambda, x) dif lambda <= mu(B)$ ויתקיים שיוויון כאשר $mu lt.double lambda$.\
    נבחר $1<t<infinity$ כלשהו ונסמן עבור $p in ZZ$
    $
      B_p colon.eq {x in B bar t^p <= D(mu,lambda, x) <= T^(p+1)} wide B_plus colon.eq {x in B bar 0<D(mu,lambda,x) < infinity} = union.big.dot_(p in ZZ) B_p
    $
    אז
    $
      integral_B D(mu,lambda,x) dif lambda =_((1)) integral_(B_plus) D(mu,lambda,x) dif lambda = sum_(p in ZZ) integral_(B_p) D(mu,lambda,x) dif lambda <= sum_(p in ZZ) t^(p+1) lambda(B_p) <=_((star)) sum_(p in ZZ) t^(p+1)(1/t^p mu(B_p))=t sum_(p in ZZ) mu(B_p) <= t mu(B)
    $
    כאשר $(1)$ נובע מסעיף $(1)$ ומכך שזרקנו קבוצה עליה האינטגרנד הוא אפס ו־$(star)$ נובע מהטענה שראינו על גזירה. כאשר $t arrow.br 1$ נקבל את הטענת עזר.\
    אם $mu lt.double lambda$ אז מ־$(1)$ והחלפת תפקידים בין $mu, lambda$ נסיק $D(lambda, mu, x) < infinity$ $mu$־כמעט תמיד ולכן $D(mu, lambda, x) > 0$ $mu$־כמעט תמיד \
    ומאחר ש־$mu lt.double lambda$ הרי ש־$D(mu,lambda, x)<infinity$ $mu$־כמעט תמיד ולכן $mu(B)=mu(B_plus)$ ולכן
    $
      integral_B D(mu,lambda,x) dif lambda = integral_(B_plus) D(mu,lambda,x) dif lambda = sum_(p in ZZ) integral_(B_p) D(mu,lambda,x) dif lambda >= sum_(p in ZZ) t^p lambda(B_p) >= sum_(p in ZZ) t^p/t^(p+1) mu(B_p) = t^(-1) sum_(p in ZZ) mu(B_p) = t^(-1) mu(B_plus) = t^(-1) mu(B)
    $
    נשאיף את $t arrow.br 1$ ונקבל שיוויון ואת $(3)$.
]

#pagebreak()

== משפט הגזירה של לבג
#theorem(
  "משפט הגזירה של לבג",
)[תהיי $f in L^1 ([a,b])$. אזי הפונקציה $F(x)=integral_a^x f dif lambda$ גזירה כמעט בכל מקום ומקיימת $F'(x) = f(x)$ עבור כמעט כל $x in [a,b]$ (ביחס למידת לבג).]
#proof[
  +נראה שכמעט לכל $x in [a,b]$ מתקיים
  $ lim_(h arrow 0) 1/h integral_x^(x+h) f dif lambda = f(x) $
  + אם $f$ רציפה אז זה המשפט היסודי ולכן נניח ש־$f$ חסומה.
  + לפי משפט לוזין לכל $n in NN$ יש קבוצה $A_n$ כך ש־$lambda(A_n) < 1/n$ ופונקציה רציפה $g_n$ כך שמחוץ ל־$A_n$, $f$ ו־$g_n$ מתלכדות ונסמן $lambda_n$ מידת לבג מצומצמת ל־$A_n$.\
  + שימוש במשפט הגזירה של בסיקוביץ: מהיות $(dif lambda_n)/(dif lambda) = bb(1)_(A_n)$, ממשפט הגזירה של בסיקוביץ כמעט לכל $x in A_n^c$ מתקיים
    $
      lim_(h arrow 0) (lambda_n ((x-h,x+h)))/(lambda((x-h, x+h))) = lim_(h arrow 0) (lambda(A_n inter (x-h,x+h)))/(2h) = bb(1)_(A_n) (x) = 0
    $
    אם $x in A_n^c$ מתקיים
    $
      abs(1/h integral_x^(x+h) f dif lambda - 1/h integral_x^(x+h) g dif lambda)<=1/h integral_x^(x+h) abs(f-g) dif lambda) = 1/h integral_(A_n inter(x, x+h)) abs(f-g) dif lambda
    $
    $g$ חסומה ב־$[a,b]$ כפונקציה רציפה ו־$f$ חסומה מההנחה ולכן קיים $M>0$ כך שמתקיים $abs(f-g)<M$, כלומר
    $ 1/h integral_(A_n inter(x, x+h)) abs(f-g) dif lambda<= M dot.op (lambda(A_n inter(x-h, x+h)))/h $
    אגף ימין שואף ל־$0$ כאשר $h arrow 0$ ולכן אם ניקח גבול נקבל
    $
      lim_(h arrow 0) abs(1/h integral_x^(x+h) f dif lambda - 1/h integral_x^(x+h) g dif lambda) = 0 ==> lim_(h arrow 0) 1/h integral_x^(x+h) f dif lambda = lim_(h arrow 0) 1/h integral_x^(x+h) g dif lambda = g(x) = f(x)
    $
    קיבלנו את השיוויון שרצינו לכל $x in A_n^c$ ומאחר ונוכל לקחת את $A_n$ להיות עם מידה קטנה כרצוננו, כמעט כל $x in [a,b]$ יהיה באחת מ־$A_n^c$ והטענה נכונה עבור $f$ חסומה.\
  + עבור $f$ כללית: נסמן לכל $n in NN$ את $F_n = bb(1)_(abs(f)<n) dot.op f$ וממשפט הגזירה של בסיקוביץ' (על המידות $abs(f-f_n)dif lambda, dif lambda$) מתקיים כמעט לכל $x in [a,b]$
    $
      lim_(h arrow 0) 1/h integral_x^(x+h) abs(f-f_n) dif lambda <= lim_(h arrow 0) 2/(2h) integral_x^(x+h) abs(f-f_n) dif lambda = abs(f(x)-f_n (x))
    $
    אגף ימין הוא אפס כמעט לכל $x in bb(1)_(abs(f)<n)$ ומאחר $f in L^1$ אז $abs(f)^(-1)({infinity})$ קבוצה ממידה אפס ולכן כמעט כל $x in [a,b]$ נמצא ב־$bb(1)_(abs(f)<n)$ עבור $n$ כלשהו ולכן
    $ f(x)=f_n (x) = lim_(h arrow 0) 1/h integral_x^(x+h) f_n (x) = lim_(h arrow 0) 1/h integral_x^(x+h) f(x) $
]
