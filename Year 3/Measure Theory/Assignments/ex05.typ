#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

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
$ lim_(n arrow.r infinity) integral_0^n (1+x/n)^n e^(-x/2) d x $
