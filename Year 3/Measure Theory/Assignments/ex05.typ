#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)
#let ev = math.op("ev")

#question()
בעזרת משפט ההצגה של ריס ניתן להגדיר את מידת לבג על $(RR, cal(B)_RR)$ בתור המידה המתאימה לפונקציונל הניתן על־ידי אינטגרל רימן, ונסמנה לרוב באות $lambda$.

#subquestion()
נראה כי $lambda$ אינווריאנטית להזזות, כלומר לכל $E in cal(B)_RR$ ולכל $x in RR$ מתקיים $lambda(E)=lambda(E+x)$ וכן נראה $lambda([0,1])=1$.

#proof[
  ממשפט ההצגה של ריס נקבל שלכל קטע $I=[a,b] subset.eq RR$ מידת לבג מניבה לנו $lambda([a,b])=b-a$ אבל אם נסתכל על ההזזה שלו ב־$x in RR$ נקבל
  $ lambda(I + x) = lambda([a+x, b+x]) = (b+x)-(a+x) = b-a $
  כלומר לקטעים סגורים מתקיים
  $ lambda(I+x)=lambda(I) $
  באותו אופן בגלל שמידת לבג היא מידת רדון, מהרגולריות הפנימית והחיצונית זה נובע גם עבור קטע פתוח.\
  נרצה לראות שזה מתאים גם לקבוצות פתוחות.\
  באינפי 3 ראינו שכל $U subset.eq RR$ פתוחה ניתנת לכתיבה על־ידי אחיד בן־מנייה של קטעים זרים, כלומר $U = union.big_(n=1)^infinity I_n$, אבל ראינו שקטע פתוח הוא אינווריאנטי להזזה, כלומר לכל $x in RR$ מתקיים
  $ U + x = union.big_(n=1)^infinity (I_n + x) $
  מ־$sigma$־אדטיביות של המידה נקבל
  $
    lambda(U+x) = lambda (union.big_(n=1)^infinity (I_n + x)) + sum_(n=1)^infinity lambda(I_n + x) = sum_(n=1)^infinity lambda(I_n) = lambda(U)
  $
  נגדיר
  $ C = {E subset.eq RR bar forall x in RR, space lambda(E+x) = lambda(E) } subset.eq cal(B)_RR $
  ממה שראינו לעיל נובע שכל הקבוצות הפתוחות ב־$RR$ נמצאות ב־$C$ ונשאר להראות ש־$C = cal(B)_RR$ כדי לסיים, בעצם נראה ש־$C$ אכן $sigma$־אלגברה.\
  אז $RR in C$ ברור כי $lambda(RR)=infinity$ ולכל $x in RR$ מתקיים $RR + x = RR$ ולכן $RR in C$.\
  עבור סגירות תחת משלים, יהי $E in C$ ונרצה להראות ש־$E^c in C$: כלומר, נרצה להראות ש־$E^c+x = (E+x)^c in C$.\
  $E in cal(B)_RR$ ולכן $E^c in cal(B)_RR$ ולכן
  $
    lambda(E^c + x) = lambda((E+x)^c) = lambda(RR) - lambda(E+x) =_(E in C) lambda(RR) - lambda(E) = lambda(E^c) ==> E^c in C
  $
  נשאר להראות סגירות תחת איחוד בן־מנייה: יהיו ${E_n}_(n=1)^infinity subset.eq C$ זרות. מתקיים
  $ (union.big_(n=1)^infinity E_n) + x - union.big_(n=1)^infinity (E_n+x) $
  אבל גם ${E_n + x}$  זרות, לכן ממה שראינו לעיל מתקיים
  $
    lambda(union.big_(n=1)^infinity E_n + x) = sum_(n=1)^infinity lambda(E_n + x) =_(E_n in C) sum_(n=1)^infinity lambda(E_n) = lambda(union.big_(n=1)^infinity E_n) ==> union.big_(n=1)^infinity E_n in C
  $
  אז זו $sigma$־אלגברה שמכילה את $sigma$־אלגברת בורל שהיא מינימלית ולכן $C = cal(B)_RR$, כלומר לכל $E in cal(B)_RR$, $lambda(E) = lambda(E+x)$.\
  נסיק אם כך $lambda([0,1])=1-0=1$.
]

#pagebreak()

#subquestion()
תהיי $f: [0,1] arrow.r [0,infinity)$ פונקציה חסומה אינטגרבילית רימן.\
נסיק מהסעיף הקודם שהאינטגרל שלה לפי $lambda$ זהה לאינטגרל רימן שלה.

#proof[
  נראה תחילה עבור פונקציות מדרגה: תהיי $psi : [0,1] arrow.r RR$ ותהיי $P = {x_0, x_1, dots.h, x_n}$ חלוקה של הקטע $[0,1]$ כך שמתקיים
  $ 0=x_0<x_1 < dots.h.c < x_n = 1 $
  והגדרנו את האינטגרל רימן של פונקצייה מדרגה להיות
  $ integral_0^1 psi(x) d x = sum_(k=1)^n c_k (x_k - x_(k-1)) $
  אבל זאת פונקציה פשוטה! היות ונקודות הקצה הן נקודות ממידה אפס הן לא משפיעות על ערך האינטגרל לבג שלה ולכן לפי אינטגרל לבג מתקיים
  $ integral_0^1 psi d lambda = sum_(k=1)^n c_k lambda((x_(k-1), x_k)) = sum_(k=1)^n c_k (x_k - x_(k-1)) $
  אבל זה בידיוק האינטגרל רימן שלה.\
  משפט דרבו אומר לנו שאם $f$ אינטגרבילית רימן אז עבור חלוקה $P$ של הקטע מתקיים
  $ integral_0^1 f(x) d x = sup_p L(P,f) = inf_P U(P,f) $
  כאשר $L(P,f), U(P,f)$ הם סכומי דרבו התחתונים והעליונים שמתאימים לחלוקה $P$, כלומר במילים אחרות קיימות שתי סדרות של פונקציות מדרגות (כאשר האיינטגרלים המדוברים הם אינטגרלי רימן) ${psi_n}, {gamma_n}$ כך שמתקיימים
  $
    forall x in [0,1], space psi_n (x) <= f(x) <= gamma_n (x) \
    lim_(n arrow.r infinity) integral_0^1 psi_n (x) d x = integral_0^1 f(x) d x \
    lim_(n arrow.r infinity) integral_0^1 gamma_n (x) d x = integral_0^1 f(x) d x
  $
  בלי הגבלת הכלליות נבחר ${psi_n}$ כך שלכל $n$ מתקיים
  $ psi_1 <= psi_2 <= dots.h.c <= f $
  (תמיד נוכל להגדיר סדרה שמבוססת על בחירת מקסימום בהתאם בצורה רקורסיבית)
  ובאותו אופן נבחר ${gamma_n}$ כך שמתקיים $f<= dots.h.c <= gamma_2 <= gamma_1$
  ונשים לב ש־$ lim_(n arrow.r infinity) psi_n arrow.r^(a.e.) f, space lim_(n arrow.r infinity) gamma_n arrow.r^(a.e.) f $
  אלו פונקציות פשוטות ולכן $integral psi d lambda = integral psi d x$ ($d x$ עבור האינטגרל רימן ו־$d lambda$ עבור האינטגרל לבג), אז ממשפט ההתכנסות המונוטונית
  $
    integral_([0,1]) f d lambda = lim_(n arrow.r infinity) integral_([0,1]) psi_n d lambda = lim_(n arrow.r infinity) integral_0^1 psi_n (x) d x = integral_0^1 f(x) d x
  $
]

#subquestion()
נניח כי $mu$ היא מידת רדון אינווריאנטית להזזה על $(RR, cal(B)_RR)$.\
נסיק מדרך ההוכחה של הסעיף הקודם כי היא בהכרח כפולה חיובית של מידת לבג.

#proof[
  נרשום $mu = c dot.op lambda$ כאשר $c=mu([0,1])$.\
  אם $c=0$ אז זו מידת האפס וסיימנו ולכן נניח $c>0$ אז נגדיר מידה חדשה, $nu = 1/c mu$ ומהיות $mu$ אינווריאנטית להזזה גם $nu$ אינווריאנטית להזזה ונרמלנו ולכן מתקיים $nu([0,1])=1$, נרצה להראות ש־$nu=lambda$.\
  נסתכל על הקטע $[0,1]$, ניתן להציגו גם בצורה הבאה
  $ [0,1] = union.big_(k=0)^(n-1) ([0,1/n]+k/n) $
  לכל $n in NN$ ולכן מ־$sigma$־אדטיביות ואינווריאנטיות להזזה
  $ nu([0,1]) = sum_(k=0)^(n-1) nu([0,1/n]+k/n) = sum_(k=0)^(n-1) nu([0,1/n]) = n dot.op nu([0,1/n]) $
  נשים לב
  $ nu([0,1])=1/c mu([0,1]) = 1/c c lambda([0,1]) = 1 $
  אז
  $ nu([0,1/n]) = 1/n = lambda([0,1/n]) $
  נשים לב שגם לכל $a,b in QQ$ ניתן לעשות את אותה חלוקה למקטעים באורך $1/n$ ולכן
  $ nu([a,b]) = m dot.op nu([0,1/n]) = m/n = b-a = lambda([a,b]) $
  יהי $epsilon > 0$, אז לכל $[a,b]$ יש $[a',b']$ כך שמתקיים
  $ [a,b] subset.eq [a',b'], space b'-a' < (b-a)+epsilon $
  בגלל שמדובר במידות רדון יש לנו רגולריות פנימית וחיצונית אז נגדיר ${I_n}$ סדרת קטעים סגורים רציונליים כך ש־$I_n arrow.b [a,b]$ ובאותו אופן גם ${J_n}$ סדרת קטעים רציונליים סגורים כך שמתקיים $J_n arrow.t [a,b]$ ומרציפות המידה
  $ nu([a,b]) = lim_(n arrow.r infinity) nu(I_n) = lim_(n arrow.r infinity) nu(J_n) = lambda([a,b]) $
  שכן $lambda, nu$ מסכימות על קטעים רציונליים ולכן $nu(I)=lambda(I)$ עבור כל הקטעים הסגורים והחסומים.\
  שתיהן מידות רדון ולכן בורל שמסכימות אחת עם השנייה לכל $E in cal(B)_RR$ ולכן
  $ nu(E)=lambda(E) <==> 1/c mu(E) = lambda(E) <==> mu(E) = c dot.op lambda(E) $
  (לא ראיתי איך אפשר לעשות את זה מדרך ההוכחה של הסעיף הקודם אז הוכחתי ישירות)
]

#subquestion()
יהי $x_0 in RR$ ונסתכל על הפונקציונל הלינארי $ev_(x_0) : C_C (RR) arrow.r CC$ המוגדר על־ידי $ ev_(x_0) (f) = f(x_0) $
נראה כי ניתן להשתמש עליו במשפט ההצגה של ריס ונמצא את המידה על $RR$ המייצגת אותו.

#proof[
  ראשית תנאי משפט ההצגה של ריס מתקיימים כי אם $f>=0$ אז $ev_(x_0) (f) = f(x_0)>=0$.\
  משפט ההצגה של ריס מביא מידת רדון יחידה $mu$ המקיימת
  $ forall f in C_C (RR), space f(x_0) = ev_(x_0) (f) = integral f d mu $
  נסמן $mu = delta_(x_0)$ מידת דיראק: לכל $A subset.eq RR$ נגדיר
  $ mu(A) = mycases(1, x_0 in A, 0, x_0 in.not A) $
  לכל $f in C_C (RR)$ מהגדרת מידת דיראק מתקיים
  $ integral_RR f d mu = f(x_0) $
  כלומר לפי משפט ההצגה של ריס נובע שהמידה המייצגת את הפונקציונל הלינארי הזה היא מידת דיראק (והיא מהמשפט יחידה).
]

#question()
#subquestion()
נחשב את הגבול
$ lim_(n arrow.r infinity) integral_0^n (1-x/n)^n e^(x/2) d x $

#solution[
  נגדיר $f_n : RR arrow.r RR$ על־ידי
  $ f_n (x) = mycases((1-x/n)^n e^(x/2), x in [0,n], 0, x in.not [0,n]) $
  ונרצה לחשב את
  $ lim_(n arrow.r infinity) integral_0^n (1-x/n)^n e^(x/2) d x = lim_(n arrow.r infinity) integral_RR f_n (x) d x $
  ניזכר באריתמטיקה של גבולות
  $ lim_(n arrow.r infinity) (1+a/n)^n = e^a $
  אז עבור $x in [0,infinity)$, בבחירת  $a = -x$ מתקיים
  $ f(x) = lim_(n arrow.r infinity) f_n (x) = e^(-x)e^(x/2)=e^(-x/2) $
  אז יש לנו התכנסות נקודתית $f_n arrow.r f$ כאשר $ f(x) = mycases(e^(-x/2), x>=0, 0, "אחרת") $
  נרצה להשתמש במשפט ההתכנסות הנשלטת ולכן עלינו לחסום את $abs(f_n (x))$ עבור $x in [0,n]$.\
  נשים לב ש־$x/n in [0,1]$ ולכן $1-x/n >=0$, ונזכר באי־השיוויון הבא עבור $y in [0,infinity)$,
  $ 1-y <= e^(-y) $
  אז מהאי־שליליות ומהאי־שיוויון הזה נקבל
  $ (1-x/n)^n <= e^(-x/n)^n = e^(-x) ==> abs(f_n (x))=(1-x/n)^n e^(x/2)<=e^(-x)e^(x/2)=e^(-x/2) $
  ולכן נוכל להגדיר את הפונקציה השולטת
  $ g(x) = mycases(e^(-x/2), x>=0, 0, x<0) $
  כדי להשתמש במשפט ההתכנסות הנשלטת עלינו להראות ש־$g(x)$ אינטגרבילית, ואכן
  $
    integral_RR g(x) d x = integral_0^infinity e^(-x/2) d x= [e^(-x/2)/(-1/2)]^infinity_0 = [-2e^(-x/2)]^infinity_0 = 0 - (-2) = 2
  $
  ולכן $g$ אינטגרבילית ומתקיים במקרה זה יחד עם משפט ההתכנסות הנשלטת
  $
    lim_(n arrow.r infinity) integral_RR f_n (x) d x = integral_RR lim_(n arrow.r infinity) f_n (x) d x = integral_RR f(x) d x = integral_RR g(x) d x = 2
  $
]

#subquestion()
נחשב את הגבול
$ lim_(n arrow.r infinity) integral_0^n (1+x/n)^n e^(-x/2) d x $.

#solution[
  באופן זהה לסעיף הקודם
  $
    f_n (x) = mycases((1+x/n)^n e^(-x/2), x in [0,n], 0, x in.not [0,n]) \
    f(x) = mycases(e^(x/2), x>=0, 0, x<0)
  $
  נגדיר $g_n (x) = (1+x/n)^n$ ולכל $n in NN$, $g_n (x)$ מונוטונית עולה עבור $x>=0$ וכן גם עם המכפלה בקבועה $e^(-x/2)$ סדרת הפונקציות הללו מונוטונית עולה, כלומר $f_n (x) <= f_(n+1) (x)$.\
  ממשפט ההתכנסות המונוטונית מתקיים
  $
    L = lim_(n arrow.r infinity) integral_RR f_n (x) d x = integral_RR lim_(n arrow.r infinity) f_n (x) d x = integral_RR e^(x/2) d x = infinity
  $
  ולכן הגבול מתבדר.
]

#question()
תהיי $mu$ מידת בורל על מרחב טופולוגי $X$ ונגדיר
$ supp(mu) = {x in X bar forall U in.rev x "open", mu(U)>0} $

#subquestion()
נניח כי $X=RR^d$ עם הטופולוגיה הסטנדרטית עליו ונראה כי לכל $mu$ מידת בורל, $supp(mu)$ תהיה הקבוצה הסגורה הקטנה ביותר $C$ (מינימלית ביחס ההכלה) כך שמתקיים $mu(C^c)=0$.

#proof[
  כדי להראות סגירות נראה שהמשלים זו קבוצה פתוחה: אם $x in.not supp(mu)$, אז יש סביבה פתוחה $U_x in.rev x$ כך ש־$mu(U_x)=0$ ולכן לכל $x in C^c$ יש סביבה פתוחה שמוכלת ב־$C^c$, כלומר $C^c$ היא קבוצה פתוחה ולכן $supp(mu)$ סגורה.\
  צריך להראות $mu(C^c)=0$: $RR^d$ הוא מרחב המקיים את אקסיומת המנייה השנייה ולכן יש לו בסיס בן־מנייה נסמנו $cal(B) = {B_1, B_2, dots.h}$ אז לכל $x in C^c$ ניתן לבחור $B_(n(x)) in cal(B)$ כך ש־$x in B_(n(x)) subset U_x$ כאשר $U_x in.rev x$ פתוחה המקיימת $mu(U_x)=0$ וממונוטוניות המידה נקבל $mu(B_(n(x)))=0$ אז כל $x in C^c$ מוכל באחד מאיברי הבסיס האלו, כלומר
  $ C^c = union.big_(n : mu(B_n)=0) B_n $
  כלומר $C^c$ היא איחוד קבוצות בן־מנייה ממידה אפס, ולכן בפרט $mu(C^c)<=sum_(n: mu(B_n)=0) mu(B_n) = 0$.\
  נשאר להראות מינימליות ביחס ההכלה: תהיי $C$ סגורה כך ש־$mu(C^c)=0$.\
  אם $x in C^c$ אז יש סביבה פתוחה של $x$ ממידה אפס ולכן כמובן $x in.not supp(mu)$ ו־$C^c subset supp(mu)^c$ ולכן $supp(C) subset C$ והיא הקבוצה המינימלית ביחס ההכלה, כנדרש.
]

#subquestion()
תהיי $phi:[0,1] arrow.r RR^2$ מסילה רציפה. נבחן איפה המידה $phi_* lambda$ נתמכת (הדחיפה קדימה של מידת לבג).

#proof[
  הדחיפה קדימה מוגדרת על־ידי $ phi_* lambda(E) = lambda(phi^(-1)(E)) $
  נסמן $I = phi([0,1])$, $phi$ רציפה ו־$[0,1]$ זה קטע סגור וחסום ולכן קומפקטי ב־$RR$ ממשפט היינה־בורל ולכן $K$ היא קבוצה קומפקטית, כי פונקציה רציפה שולחת קבוצות קומפקטיות לקבוצות קומפקטיות (וכן גם $K$ סגורה וחסומה).\
  נרצה להראות ש־$lambda(phi^(-1)(RR^2 without K))=0$.\
  מהגדרת $K$ נקבל
  $
    phi^(-1) (RR^2 without K) = {t in [0,1] bar phi(t) in RR^2 without K}=emptyset ==> lambda(phi^(-1)(RR^2 without K))=0
  $
  מסעיף א' אנחנו יודעים שהתומך  הוא הקבוצה הסגורה הקטנה ביותר המקיימת $mu(RR^2 without C)=0$, אבל $K$ קומפקטית ולכן סגורה וחסומה ולכן התומך הוא לכל הפחות תת־קבוצה של $K$, נראה שזה כל $K$: יהי $y_0 in K$ ולכן יש $t_0 in [0,1]$ כך שמתקיים $phi(t_0)=y_0$ וכן
  $ A_0 = phi^(-1)({y_0}) = { t in [0,1] bar phi(t)=y_0} $
  $phi$ רציפה ו־$RR^2$ זה מרחב האוסדרוף ולכן $A_0$ היא תת־קבוצה סגורה.\
  ניקח $U$ סביבה פתוחה של $y_0$ ב־$RR^2$ נשים לב
  $ lambda(phi^(-1)(U)) > 0 $
  שכן $phi$ רציפה ו־$U$ פתוחה ולכן $V=phi^(-1)(U)$ קבוצה פתוחה ו־$y_0 in U$ ולכן $t_0 in V$, אז $V$ לא ריקה וקבוצה פתוחה ב־$[0,1]$ כלומר היא מכילה קטע לא מנוון ובפרט מהגדרת מידת לבג, מידתו גדולה מ־$0$ ולכן הטענה נובעת.\
  אז ראינו שלכל $y_0 in K$, $lambda(phi^(-1)({y_0})) > 0$ ולכן $K subset.eq supp(phi_* lambda)$, ראינו הכלה דו־כיוונית ולכן קיבלנו שיוויון ו־$supp(phi_* lambda)=K$.
]

#pagebreak()

#subquestion()
תהיי ${q_n}$ מנייה של $QQ$ ונגדיר את המידה
$ mu = sum_(n=1)^infinity 2^(-n) delta_(q_n) $
כש־$delta_x$ היא מידת דיראק סביב הנקודה $x in RR$. \
נמצא איפה $mu$ נתמכת.

#proof[
  ראשית נבחין שמהגדרה ברור כי כל רציונלי בתומך מהגדרה, אבל נטען שגם כל ממשי בתומך, כלומר $supp(mu)=RR$: יהי $x in RR$, מצפיפות הרציונליים בממשיים, כל $U_x$ פתוחה סביב $x$ מכילה רציונלי ולכן $mu(U)>=2^(-n)>0$ ולכן $x in supp(mu)$, כלומר $supp(mu)=RR$.
]

#subquestion()
נראה כי לכל קבוצה קומפקטית $K subset RR$ קיימת מידת הסתברות בורל הנתמכת עליה (כלומר, מידת בורל עם $mu(RR)=1$).

#proof[
  $K$ היא קבוצה קומפקטית ב־$RR$ ולכן סגורה וחסומה אז $K=[a,b]$ עבור $a,b in RR$.\
  נשתמש בשאלה $1$ ונגדיר $mu(E) = 1/(b-a) lambda(E inter K)$.\
  נשים לב שהיא אכן נתמכת על־ידי $K$ כי
  $ mu(RR without K) = 1/(b-a) lambda((RR without K) inter K) = 1/(b-a) lambda(emptyset) = 0 $
  וכן
  $ mu(RR) = 1/(b-a) lambda(RR inter K) = 1/(b-a) lambda([a,b]) = (b-a)/(b-a)=1 $

]
