#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 09 --- חשבון אינפיניטסימלי 3, 80415 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
תהיי $H in M_(k times k) (RR)$ מטריצה סימטרית ונוכיח כי קיים ל־$H$ ערך עצמי ממשי.

#proof[
  נעזר בהדרכה, ספירת היחידה נתונה על־ידי $S_1 = {x in RR^k bar norm(x)=1}$, נגדיר את $q(x)$ הפונקציה שלנו ואת פונקציית האילוץ לכך ש־$x in S_1$ על־ידי
  $ q(x) = angle.l H x, x angle.r, g(x) = norm(x)^2-1=0 $
  ממשפט כופלי לגראנז' נקבל שאנחנו בוחנים את המערכת
  $ gradient q(x) = lambda gradient g(x) $
  נחשב את הגרדיאנטים, מהיות $H$ מטריצה סימטרית נקבל מגזירת מכפלה פנימית
  $
    gradient q(x) = gradient (angle.l H x, x angle.r) = gradient (x^T H x) = H x + H^T x = H x + H x = 2H x \
    gradient g(x) = gradient(x^T x - 1) = 2x
  $
  ממשפט כופלי לגראנז' נקבל שמתקיים
  $ 2 H x = lambda dot.op 2x <==> H x = lambda x $
  זה בידיוק הגדרה ש־$x$ הוא וקטור עצמי של $H$, אז כל נקודת קיצון של $q(x)$ על ספירת היחידה היא בידיוק $x$ שהוא וקטור עצמי של $H$ ו־$lambda$ הוא הערך העצמי.\
  נשאר להראות שהערך העצמי הוא ממשי: \
  נשים לב ש־$q(x) = x^T H x in RR$ לכל $x in RR^k$ וזו פונקציה רציפה (בגלל ש־$H$ סימטרית ממשית) ו־$lambda in RR$, ופונקציה רציפה על מרחבת קומפקטית מקבלת מקסימום אז כל הערכים העצמיים הם ממשיים.
]


#question()
תהיי $B subset.eq RR^k$ פתוחה ו־$f : B arrow.r RR$ גזירה פעמיים ברציפות.

#subquestion()
נוכיח שלכל $epsilon > 0$ ומסילה גזירה פעמיים ברציפות $gamma : (-epsilon, epsilon) arrow.r B$ כך ש־$gamma(0)=a$ ו־$gamma'(0)=v$ מתקיים
$ ( f compose gamma)'' (0) = v^t H f_a v + D f_a (gamma''(0)) $

#proof[
  #todo
]

#subquestion()
תהיי $g: B arrow.r RR^n$ גזירה פעמיים ברציפות עבור $n+1<=k$. נגדיר $A = g^(-1)({0})$ ונסמן ב־$cal(L) : RR^n times B arrow.r RR$ את הלגראנז'יאן של $f$ ביחס ל־$g$.\
תהיי $(lambda, a) in RR^n times A$ נקודה קריטית של $cal(L)$ כך ש־$D g_a$ מדרגה $n$.\
נוכיח כי לכל $epsilon > 0$ ומסילה גזירה פעמיים ברציפות $gamma : (-epsilon, epsilon) arrow.r A$ כך ש־$gamma(0)=a$ ו־$gamma'(0)=v$ מתקיים
$ (f compose gamma)''(0) = v^t H cal(L)_a^lambda v space (cal(L)^lambda (x) = cal(L)(lambda,x)) $

#proof[
  #todo
]

#question()
תהיי $f:RR^3 arrow.r RR$ הפונקציה הנתונה על־ידי $f(x,y,z)=12x+y^2-x z$.\
נמצא את הנקודות הקריטיות של $f$ תחת האילוץ של $z=x^2+y^2$ ונסווגן.

#solution[
  נגדיר $g(x,y,z): RR^3 arrow.r RR$ על־ידי $g(x,y,z) = x^2+y^2-z$ ומתקיים $gradient g = (2x, 2y, -1)$ ולכל $(x,y,z) in RR^3$ מתקיים $gradient g(x,y,z) !=0$.\
  הלגראנז'יאן נתון על־ידי
  $ 12x+y^2-x z - lambda x^2 - lambda y^2 + lambda z $
  נמצא נקודות חשודות לקיצון של הלגראנז'יאן
  $ gradient cal(L)_((lambda, x,y,z)) = (-x^2-y^2+z, 12-2x lambda-z, 2y-2y lambda, -x+lambda ) $
  נחפש מתי הביטוי מתאפס אבל קודם כל נשים לב שמתקיים
  $ -x+lambda = 0 => x = lambda $
  ואז
  $ 12-2x lambda-z = 0 <==> 12-2x^2-z = 0 <==> z = 12-2x^2 $
  ואז
  $ -x^2-y^2+z = 0 <==> -x^2-y^2+12-2x^2 = 0 <==> y^2 = -3x^2+12 $
  ראינו ששהסיאן המוגבל מוגדר באמצעות הנגזרת השנייה של להגראנז'יאן
  $ H cal(L)_((lambda,a)) = mat(0, - D g_a; -D g^t_a, H cal(L)^lambda_a) $
  #todo
]

#question()
תהיי $A subset.eq RR^k$ תיבה סגורה ו־$f : A arrow.r RR$ פונקציה אינטגרבילית.

#subquestion()
נוכיח שמתקיים לכל $c in RR$ שהפונקציה $c f$ אינטגרבילית ומתקיים
$ integral_A (c f)(x)d x = c integral_A f(x) d x $

#proof[
  יהי $epsilon > 0$. $f$ אינטגרבילית ולכן קיימת חלוקה $P$ של $A$ עבורה מתקיים $overline(S_f)(f, P) - underline(S_f)(f, P) < epsilon$.\
  נסמן ב־$overline(S)_(c f) (P),underline(S_(c f))(P)$ את הסכום העליון והתחתון של $c f$ המתאימים לחלוקה $P$.\
  אם $c=0$ אז הטענה טריוויאלית כי פונקציית ה־$0$ אינטגרבילית, ולכן נחלק לשני מקרים $c>0, c<0$.\
  אם $c > 0$, אנחנו יודעים שלכל קבוצה חסומה $B$ גם $c dot.op B$ חסומה ומתקיים
  $ sup(c dot.op B) = c dot.op sup(B), space inf(c dot.op B) = c dot.op inf(B) $
  ובפרט $c dot.op B$ ולכן
  $ overline(S_(c f))(P) = c dot.op overline(S_(f))(P), space underline(S_(c f))(P) = c dot.op underline(S_f)(P) $
  השיוונות הללו נכונים לכל חלוקה $P$, אז נסמן $(star)$
  $
    L_(c f) = { underline(S_(c f))(c f,P) bar A "חלוקה של " P}=c dot.op { underline(S_(f))(f,P) bar A "חלוקה של " P} = c dot.op L_(f) \
    U_(c f) = { overline(S_(c f))(c f,P) bar A "חלוקה של " P}=c dot.op { overline(S_(f))(f,P) bar A "חלוקה של " P} = c dot.op U_(f)
  $
  $f$ אינטגרבילית ולכן מתקיים $overline(integral)_A f = underline(integral)_A f$, משמע מתקיים
  $ inf(U_(f))=sup(L_(f))=integral_A f $
  ולכן גם
  $
    c dot.op inf(U_(f))= c dot.op sup(L_(f))=c dot.op integral_A f
  $
  אבל ראינו שמתקיים
  $ c dot.op inf(U_(f)) = inf(c dot.op U_(f)), space c dot.op sup(L_(f)) = sup(c dot.op L_(f)) $
  ולכן גם מתקיים
  $
    inf(c dot.op U_(f))=sup(c dot.op L_(f))= c dot.op integral_A f(x) d x=>_((star)) inf(U_(c f)) = sup(L_(c f)) = c dot.op integral_A f(x) d x
  $
  ולכן עבור $c > 0$ אנחנו מקבלים ש־$c dot.op f$ אינטגרבילית על $A$ ושמתקיים $ integral_A c dot.op f(x) d x =inf(c dot.op U_(f))=sup(c dot.op L_(f)) = c dot.op integral_A f(x) d x $
  נשאר להראות עבור $c<0$. ההוכחה זהה לחלוטין, למעט הנקודות הבאות:
  + עבור קבוצה חסומה $B$, הקבוצה $c dot.op B$ גם חסומה ומתקיים
    $ sup(c dot.op B) = c dot.op inf(B), space inf(c dot.op A) = c dot.op sup(B) $
  + החלוקה מתחלפת (אינפה לסופרמה, סופרמה לאינפמה)
    $ overline(S_(c f))(P) = c dot.op underline(S_(f))(P), space underline(S_(c f))(P) = c dot.op overline(S_f)(P) $
  שאר ההוכחה זהה.
]

#subquestion()
הפונקציה הקבועה $1$ אינטגרבילית על $A$ ומתקיים
$ integral_A 1 d x = V(A) $

#proof[
  פונקציה קבועה היא פונקציה רציפה ופונקציה רציפה היא אינטגרבילית ולכן $integral_A 1 d x$ זה ביטוי מוגדר היטב.\
  אז הפונקציה הקבועה $1$ אינטגרבילית, ולכן
  $ underline(integral)_A 1 d x = overline(integral)_A 1 d x $
  שזה אומר
  $ sup {underline(S)(f,P) bar A "חלוקה של " P }=inf {overline(S)(f,P) bar A "חלוקה של " P } $
  אבל אנחנו יודעים שלכל חלוקה $P$ של $A$ ההגדרה אומרת שמתקיים
  $
    overline(S)(f, P) = sum_(A_i in P) M_i V(A_i) = sum_(A_i in P) sup_(x in A_i) 1 V(A_i) = sum_(A_i in P) 1 V(A_i)=V(A)
  $
  בפרט גם $inf {overline(S)(f,P) bar A "חלוקה של " P } = V(A)$ כי זה נכון לכל חלוקה.\
  עם כל מה שמצאנו לעיל אכן מתקיים $integral_A 1 d x = V(A)$.
]

#subquestion()
אם $abs(f(x))<=M$ לכל $x in A$ עבור $M>=0$ אז מתקיים
$ integral_A f(x) d x <= M dot.op V(A) $

#proof[
  נשים לב שמשילוב שני הסעיפים הקודמים נקבל שמתקיים עבור כל פונקציה קבועה עם פרמטר $M>=0$ מתקיים $ integral_A M d x = M integral_A 1 d x = M dot.op V(A), space integral - M d x = -M integral_A 1 d x = - M dot.op V(A) $
  מכך שמתקיים $abs(f(x)) <= M$ נובע שמתקיים $-M <= f(x) <= M$, בפרט אם ניקח אינטגרל על כל האגפים נקבל
  $ integral_A -M d x <= integral_A f(x) d x <= integral_A M d x $
  משמע מתקיים
  $ integral_A f(x) d x <= M dot.op V(A) $
  נסביר למה מותר לנו לקחת אינטגרל: בתרגול ראינו שאם הפונקציות $f, g$ אינטגרבליות על $A$ מתקיים
  $ integral_A (f+g) d x = integral_A f(x) d x + integral_A g(x) d x $
  בפרט ממה שראינו בסעיף א' זה נכון גם עבור המקרה בו
  $
    integral_A (alpha f + beta g) d x = integral_A alpha f(x) d x + integral_A beta g(x) d x = alpha integral_A f(x) + beta integral_A g(x)
  $
  ויחד עם ההצדקה מסעיף א' ראינו שמתקיים גם שאם $f(x) <= g(x)$ אז מתקיים
  $ integral_A f(x) d x <= integral_A g(x) d x $
  ולכן לקחת אינטגרל הייתה פעולה חוקית על שני האגפים וקיבלנו שאכן מתקיים $integral_A f(x) d x <= M dot.op V(A)$.
]

#question()
תהיינה $A, B subset.eq RR^k$ תיבות סגורות כך שמתקיים $A^circle.stroked.small inter B^circle.stroked.small = emptyset$ ו־$A union B$ גם היא תיבה סגורה.\
נוכיח כי אם $f:A union B arrow.r RR$ אינטגרבילית אז גם $f|_A$ ו־$f|_B$ אינטגרביליות.

#proof[
  ראשית, $f$ אינטגרבילית על $A union B$ ולכן בפרט זה אומר ש־$f$ חסומה על $A union B$ ובפרט זה אומר שהיא חסומה על $A$ ועל $B$ בנפרד.\
  יהי $epsilon > 0$, נבחר חלוקות $P_A$ ו־$P_B$ כך שמתקיים
  $
    -epsilon + integral_A f(x) <= underline(S)(f, P_A) <= overline(S)(f, P_A)<integral_A f d x + epsilon \
    -epsilon + integral_B f(x) <= underline(S)(f, P_B) <= overline(S)(f, P_B)<integral_B f d x + epsilon
  $
  כעת, קיימת חלוקה $P$ של $A union B$ שמכילה את $P_A$ ואת $P_B$. למה? כי לכל תיבה $C subset.eq RR^k$ ו־$X subset.eq C$ קבוצה סופית, קיימת חלוקה \ $P = P_1 times P_2 times ... times P_d$ של $C$ שמכילה את כל $X$, מהגדרת החלוקה. \
  אז מתקיים
  $
    integral_A f d x + integral_B f d x- 2 epsilon < underline(S)(f, P_A)+ underline(S)(f, P_B)<=underline(S)(f, P)<=overline(S)(f, P)<=overline(S)(f, P_A) + overline(S)(f, P_B) < integral_A f d x + integral_B f d x + 2epsilon
  $
  אז לא רק ש־$f|_A$ ו־$f|_B$ אינטגרביליות זה גם משלים את הטענה מהכיתה
  $ integral_(A union B) f d x = integral_A f d x + integral_B f d x $
]

