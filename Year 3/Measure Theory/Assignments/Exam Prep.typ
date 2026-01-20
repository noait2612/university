#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן מועד א' --- משפטים והוכחות נבחרים --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

#pagebreak()

= מידה
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
  + *תעתיקי מהמטלה*
  + *תעתיקי מהמטלה*
  + *תעתיקי מהמטלה*
  + תהיי $s = sum_(i=1)^n alpha_i bb(1)_(A_i)$ פונקציה פשוטה ואם נסתכל על $E$ אזי $0<=s<=f$ וכן $f|_E eq.triple;e 0$ ולכן על $E$, $s(x) = 0$ לכל $x in E$.\
    מהגדרת האינטגרל של פונקציה פשוטה
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
  + מתקיים
    $ bb(1)_(A union.dot B) (x) = bb(1)_(A)(x)+bb(1)_(B)(x) $
    ולכן מהפעלת הסעיף הקודם פעמיים בקצוות
    $
      integral_(A union.dot B) f dif mu = integral_X f dot.op bb(1)_(A union.dot B) dif mu = integral_X f dot.op (bb(1)_(A) + bb(1)_(B)) dif mu =_"לינאריות" integral_X f dot.op bb(1)_(A) dif mu + integral_X f dot.op bb(1)_(B) dif mu = integral_A f dif mu + integral_B f dif mu
    $
]

#pagebreak()

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
  נוכיח עבור $A=X$ (עבור $A subset X$ ההוכחה זהה) וראינו כי $f= sup_(n in NN) {f_n}$ מדידה.\
  ${f_n}_(n=1)^infinity$ מונוטונית עולה ולכן קיים $alpha in [0,infinity]$ כך ש־$alpha=lim_(n arrow.r infinity) integral_X f_n dif mu$ ונרצה להראות
  $ alpha <=_((1)) integral_X f dif mu <=_((2)) alpha ==> alpha = integral_X f dif mu $
  $(1)$ נכון כי מתקיים
  $ forall n in NN space 0<=f_n <= sup_(n in NN) {f_n} = f ==> 0<= f_n <=f $
  וממונוטוניות האינטגרל
  $ forall n in NN space 0<=integral_X f_n dif mu <=integral_X f dif mu $
  בפרט בלקיחת גבול נקבל $alpha <= integral_X f dif mu$.\
  עבור $(2)$ : תהיי $s: X arrow.r [0,infinity)$ פונקציה פשוטה כלשהי המקיימת $0<=s<=f$ ולכן יש ${A_i}_(i=1)^k$ חלוקה כלשהי של $X$ כך שניתן לכתוב $s=sum_(i=1)^k alpha_i bb(1)_(A_i)$.\
  יהי $x in X$ ויהי $c in (0,1)$, נסמן
  $ forall n in NN, space E_n colon.eq {x in X bar c dot.op s(x) <= f_n (x)} $
  מהיות $f(x) = lim_(n arrow.r infinity) f_n (x)$ מתקיים $f(x)=0$ (ואז $f eq.triple 0$) או $f(x) != 0$ ולכן בהכרח $f(x)>0$.\
  במקרה הראשון
  $ 0<= c dot.op s(x) <= f_n (x) <= f(x) =0 $
  ואז $x in E_n$ לכל $n$ וסיימנו.\
  אחרת, קיים $n_0 in NN$ כך שלכל $n > n_0$ מתקיים $f_n (x) > c dot.op s(x)$ ולכן ${E_n}_(n=1)^infinity$ סדרה עולה ביחס להכלה $(star)$ ממונטוניות ${f_n}$ ולכן $lim_(n arrow.r infinity) E_n = union.big_(n=1)^infinity E_n = X$ ונקבל
  $
    alpha = lim_(n arrow.r infinity) integral_X f_n dif mu >=_("מונוטוניות ביחס להכלה") lim_(n arrow.r infinity) integral_(E_n) f_n dif mu >=_("מונוטוניות") lim_(n arrow.r infinity) integral_(E_n) c dot.op s dif mu = c dot.op lim_(n arrow.r infinity) integral_(E_n) s dif mu = c dot.op lim_(n arrow.r infinity) sum_(i=1)^k alpha_i mu(E_n inter A_i)
  $
  אז מ־$(star)$ נובע
  $ forall i in [k], space forall n,m in NN, space n<=m ==> A_i inter E_n subset.eq A_i inter E_m $
  ולכן גם ${A_i inter E_n}_(n=1)^infinity$ סדרה עולה גם היא ו־${A_i}$ חלוקה של $X$ אז
  $
    forall i in [k], space union.big_(n=1)^infinity A_i inter E_n = A_i inter (union.big_(n=1)^infinity E_n) = A_i inter X = A_i
  $
  אז מרציפות המידה לאיחודים עולים נקבל $mu(A_i inter E_n) stretch(arrow.r)_(n arrow.r infinity) mu(A_i)$ ומכאן
  $
    alpha>= c dot.op lim_(n arrow.r infinity) sum_(i=1)^k alpha_i mu(A_i inter E_n) = c dot.op sum_(i=1)^k alpha_i lim_(n arrow.r infinity) mu(A_i inter E_n)
    = c dot.op sum_(i=1)^k alpha_i mu(A_i) = c dot.op integral_X s dif mu
  $
  מהיות $c in (0,1)$ שרירותי נובע $alpha>=integral_X s dif mu$ לכל $0<=s<=f$ פשוטה אבל מהגדרת אינטגרל של פונקציה אי־שלילית נקבל $alpha >= integral_X f dif mu$.
]

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

#theorem("טענה חשובה ללא שם")[
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
    = integral_X sum_(n=1)^infinity h dot.op 1 bb(1)_(E_n) dif mu = sum_(n=1)^infinity integral_X h dot.op bb(1)_(E_n) dif mu = sum_(n=1)^infinity h dif mu = sum_(n=1)^infinity nu(E_n)
  $
  ולכן $nu$ מידה על $(X, cal(A))$.\
  עבור החלק השני, תהיי $s = sum_(i=1)^k alpha_i bb(1)_(E_i)$ פונקציה פשוטה, אז
  $
    integral_X s dif nu = sum_(i=1)^k alpha_i nu(E_i) = sum_(i=1)^k alpha_i integral_(E_i) h dif mu = sum_(i=1)^k integral_(E_i) alpha_i h dif mu = sum_(i=1)^k integral_X alpha_i bb(1)_(E_i) h dif mu \
    = integral_X sum_(i=1)^k alpha_i bb(1)_(E_i) h dif mu = integral_X h dot.op sum_(i=1)^k alpha_i bb(1)_(E_i) dif mu = integral_X h dot.op s dif mu
  $
  אז עבור $g$ מדידה כלשהי ניקח ${s_n}_(n=1)^infinity$ סדרה עולה של פונקציות פשוטות כך ש־$s_n stretch(arrow.r)_(n arrow.r infinity) g$ ונקבל ממשפט ההתכנסות המונוטוניות על מרחב המידה $(X, cal(A), nu)$ שמתקיםי
  $ integral_X g dif nu = lim_(n arrow.r infinity) integral_X s_n dot.op h dif mu = integral_X g dot.op h dif mu $
  כי ${s_n dot.op h}_(n=1)^infinity$ היא עולה ו־$s_n dot.op h stretch(arrow.r)_(n arrow.r infinity) g dot.op h$.
]
#remark[אם $dif nu = h dif mu$ אז לכל $E in cal(A)$ מדידה מתקיים
  $ mu(E) = 0 ==> nu(E)=0 $
  כלומר רציפות בהחלט.]

#pagebreak()

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
  $integral_X f dif mu in CC$ ולכן קיים $alpha in CC$ עם $abs(alpha)=1$ עבורו מתקיים $alpha integral_X f dif mu = abs(integral_X f dif mu) in RR$:\
  שכן אם נסמן $z=integral_X f dif mu$ אז אם $z=0$ אז $alpha z = abs(z) in RR$ לכל $alpha in CC$ עם $abs(alpha)=1$ כי נקבל ש־$0=0$.\
  אחרת, אם $z!=0$ אז קיים $theta in RR$ כך ש־$z = abs(z) dot.op e^(i theta)$ וניקח $alpha = e^(-i theta)$ ונקבל
  $ alpha z = e^(-i theta) dot.op (abs(z) e^(i theta)) = abs(z)(e^(-i theta) dot.op e^(i theta)))=abs(z) in RR $
  ולכן יש $alpha in CC$ המקיים זאת.\
  נקבל אם־כך
  $
    abs(integral_X f dif mu) & =alpha integral_X f dif mu \
                             & = underbrace(integral_X alpha f dif mu, in RR) \
                             & =integral_X re(alpha f) dif mu + cancel(i integral_X im(alpha f) dif mu) \
                             & = integral_X re(alpha f) dif mu \
                             & <= integral_X abs(re(alpha f)) dif mu \
                             & <= integral_X abs(alpha f) dif mu = integral_X abs(f) dif mu
  $
]

#pagebreak()

#theorem("משפט ההתכנסות הנשלטת")[
  #definition("סדרת פונקציות נשלטת")[
    תהיי $X$ קבוצה ותהיי ${f_n bar X arrow.r RR}_(n=1)^infinity$ סדרת פונקציות כלשהי ותהיי $g:X arrow.r RR$ פונקציה.\
    נאמר שהסדרה ${f_n}_(n=1)^infinity$ נשלטת על־ידי הפונקציה $g$  מתקיים ורק אם ורק אם לכל $n in NN$ מתקיים $abs(f_n)<=g$.
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

= קבוצות ממידה אפס
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
  לכן קיימת קבוצה $N$ כך ש־$mu(N) =0$ ובנוסף $f_n (x) arrow.r f(x)$ לכל $x in N^c$ ונגדיר $ accent(f, tilde)_n (x) = mycases(f_n (x), x in N^c, 0, x in N) $
  אזי מהסעיף הקודם לכל $n in NN$ מתקיים ש־$accent(f, tilde)$ מדידה כי $accent(f, tilde)_n = f_n$ $mu$־כמעט תמיד ו־$accent(f, tilde)$ מתכנסת נקודתית לפונקציה
  $ accent(f, tilde) (x) = mycases(f(x), x in N^c, 0, x in N) $
  ולכן $accent(f, tilde)$ מדידה ול־$f=accent(f, tilde)$ $mu$־כמעט תמיד ולכן $f$ מדידה.\
  $2$ $<==$ $1$: נניח ש־$f=g$ $mu$־כמעט תמיד ו־$f$ מדידה, אז נגדיר את $f_n$ להיות הסדרה הקבועה $f_n = f$ ומתקיים $f_n arrow.r g$ כמעט־תמיד ולכן $g$ מדידה מההנחה של $2$, כנדרש.
]

#pagebreak()

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

= מרחבי $L^p$
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
