#import "../../../src/article.typ": *
#show: article.with(title: [ פתרון מטלה 02 (לא להגשה) --- אנליזה פונקציונלית, 80417 ], signature: [#align(
    center,
  )[#image("../../../src/duck.png", width: 30%, fit: "contain")]])


#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#let Lip = math.op("Lip")

#question()
תהיי ${f_n}_(n=1)^infinity$ משפחה חסומה במידה אחידה של פונקציות אינטגרביליות רימן בקטע $[a,b]$, ונגדיר $F_n (x) = integral_a^x f_n (t) d t$.\
נראה כי קיימת תת־סדרה ${f_n_k}_(k=1)^infinity$ שמתכנסת במידה שווה על $[a,b]$.

#proof[
  ${f_n}_(n=1)^infinity$ חסומה במידה אחידה ולכן קיים $0<K in RR$ כך שלכל $(star) abs(f_n)<=K$.\
  יהיו $x < y in [a,b]$, מתקיים
  $
    abs(F_n (x) - F_n (y)) = abs(integral_a^x f_n (t) d t - integral_a^y f_n (t) d t) = abs(integral_x^y f_n (t) d t) <=_("אי־שיוויון המשולש האינטגרלי") integral_x^y abs(f_n (t) d t)<=_((star)) integral_x^y K d t = K(y-x)
  $
  וגם לכל $x in [a,b]$ ולכל $n in NN$ מתקיים $abs(F_n (x) - F_n (a))<=K(x-a)<=K(b-a)$ מאותם שיקולים לעיל, ולכן ${F_n}_(n=1)^infinity$ חסומה במידה אחידה.\
  יהי $epsilon > 0$ ונגדיר $delta = epsilon/K$, לכל $n in NN$ ולכל $x,y in [a,b]$ המקיימים $abs(x-y)<delta$ מתקיים
  $ abs(F_n (x) - F_n (y))<= K abs(x-y) < K delta = K epsilon/K = epsilon $
  ולכן ${F_n}_(n=1)^infinity$ רציפה במידה אחידה, ובפרט זה גורר שלכל $n in NN$ מתקיים ש־$F_n$ פונקציה רציפה, בפרט ראינו מסקנה בהרצאה ($3.6$ בסיכום של דניאל) שיש ${f_n_k}_(k=1)^infinity subset.eq {f_n}_(n=1)^infinity$ שמתכנסת במידה שווה.
]

#question()
נקבע $0<K<infinity$ ו־$0<d$.\
נגדיר
$ Lip_(K, d) colon.eq {f in C[0,1] mid(bar) forall x,y in [0,1] : abs(f(x)-f(y))<=K abs(x-y)^d} $

#subquestion()
נראה כי אם $d in (0,1]$ אז הקבוצה $A={f in Lip_(K,d) bar f(0) = 0}$ היא תת־קבוצה קומפקטית של $C[0,1]$.

#proof[
  בתרגול ראינו שתת־קבוצה של $C[a,b]$ היא קומפקטית אם ורק אם היא סגורה, חסומה במידה אחידה ורציפה במידה אחידה.\
  מכך ש־$f(0) = 0$ לכל $f in A$, מתקיים  לכל $x in [0,1]$
  $ abs(f(x))=abs(f(x)-f(0)) <= K abs(x-0)^d = K abs(x)^d <=K $
  וזה מביא לנו חסימות במידה אחידה.\
  עבור רציפות במידה אחידה, יהי $epsilon > 0$ וניקח $delta^d = epsilon/K$ ולכן לכל $x,y in [0,1]$ המקיימים $abs(x-y)<delta$ מתקיים
  $ abs(f(x)-f(y)) <= K abs(x-y)^d <= K delta^d = K epsilon/K = epsilon $
  וקיבלנו רציפות במידה אחידה.\
  נשאר להראות סגירות: תהיי ${f_n}_(n=1)^infinity subset.eq A$ שמתכנסת במידה שווה ל־$f in C[0,1]$, אם נראה ש־$f in A$ נסיים:
  $
    abs(f(x)-f(y)) = lim_(n arrow.r infinity) abs(f_n (x) - f_n (y))<= lim_(n arrow.r infinity) K abs(x-y)^d = K abs(x-y)^d
  $
  אבל ${f_n}_(n=1)^infinity subset.eq A$ ולכן $display(lim_(n arrow.r infinity) f_n (0) = lim_(n arrow.r infinity) 0 = 0 = f(0))$ משמע $f in A$.\
  הראינו ש־$A$ סגורה, חסומה במידה אחידה ורציפה במידה אחידה ולכן קומפקטית, כנדרש.\
  #underline("הערה:") כדי להראות שמרחב מטרי הוא קומפקטי, ראינו טענה בתרגול שאומרת שמרחב מטרי הוא קומפקטי אם ורק אם הוא שלם וחסום טוטאלית.\
  את השלמות, היות והתת־מרחב המטרי המבוקש הוא תת־מרחב מטרי של $C[0,1]$ שהוא שלם, מספיק להראות שתת־מרחב שלו הוא סגור.\
  זה שהראינו חסימות במידה אחידה ורציפות במידה אחידה, ממשפט ארצלה זה שקול לכך שהמרחב הוא חסום טוטאלי, אז בעצם הראינו אותו הדבר.
]

#subquestion()
נראה כי אם $d>1$ ו־$f in Lip_(K,d)$ אז $f$ קבועה.

#proof[
  היות ו־$abs(x-y)<=1$, נובע כי $abs(x-y)^d <=abs(x-y)$ עבור $d>1$ ולכן מתקיים $abs(f(x)-f(y))<K abs(x-y)$, אבל זו בידיוק ההגדרה של $K$־ליפשיציות ולכן $f$ היא $K$־ליפשיצית, ועל כן גזירה והנגזרת שלה חסומה, נחשב את הנגזרת:
  $
    abs(f'(x)) = lim_(h arrow.r 0) abs((f(x+h)-f(x)))/h <= lim_(h arrow.r 0) abs(x+h-x)^d/h <= lim_(h arrow.r 0) h^(d-1) = 0
  $
  כלומר $f$ גזירה ונגזרתה $0$ בכל מקום ולכן $f$ קבועה.
]

#question()

#subquestion()
נמצא סדרה ${f_n}_(n=1)^infinity$ של פונקציות רציפות על הקטע $[0,1]$ שמתכנסת נקודתית לפונקציה לא רציפה $f$ על הקטע $[a,b]$.

#solution[
  ניקח $f_n (x) = x^n$ ולכל $x<1$ מתקיים $x^n stretch(arrow.r)_(n arrow.r infinity) 0$ ולכל $x=1$ מתקיים $1^n stretch(arrow.r)_(n arrow.r infinity) 1$ ולכן $f_n$ מתכנסת נקודתית לפונקציה
  $ f(x) = mycases(1, x =1, 0, x<1) $
]

#subquestion()
נראה ישירות מההגדרה כי ההתכנסות אינה במידה שווה.

#proof[
  יהי $epsilon > 0$ ונראה שלכל $N in NN$ קיים $n >= N$ כך ש־$x in [0,1]$ מקיים $abs(f(x)-f_n (x))>epsilon$: ניקח $epsilon = 1/2$ ו־$N in NN$, אז עבור $x<1$ מתקיים $f(x)=0$ ולכן $abs(f(x)-f_n (x)) = abs(x^n)=x^n$ ולכן אם נבחר $1/root(n, 2) < x < 1$ מתקיים $x^n > epsilon$ משמע לא מכנס במידה שווה.\
  בדרך אחרת: יהי $n in NN$, ניקח $x=root(n, 2)<1$ ואז מתקיים $abs(f_n (x) - f(x)) = 1/2$ וגם $norm(f_n - f)_infinity >=1/2$ ($norm(dot.op)_infinity = sup_(x in [0,1]) abs(f(x))$)
]

#subquestion()
נראה ישירות מהגדרה שהמשפחה ${f_n}_(n=1)^infinity$ אינה רציפה במידה אחידה.

#proof[
  נבחר $epsilon = 1/2$ וכן $root(n, 1/2) stretch(arrow.r)_(n arrow.r infinity) 1$ ונבחין שמתקיים $abs(f(x)-f(y)) = abs(x^n-x^y)$, נקבע $y=1$ ולכן $1-x^n > 1/2 <==> 1/root(n, 2) > x$.\
  יהי $delta > 0$ ונבחר $1-delta<x<1/root(n, 2)$ ונקבל סתירה לרציפות במידה אחידה לפני הגדרה.
]

#question()
לכל משפחה של פונקציות רציפות מ־$[0,1]$ אל $RR$, נקבע האם לכל סדרה מתוך המשפחה יש תת־סדרה שמתכנסת במידה שווה.
#subquestion()
המשפחה ${f_n bar n in NN}$ כאשר $f_n (x) = x^n$.

#proof[
  השאלה הקודמת – לא לכל סדרה יש תת־סדרה מתכנסת במידה שווה.
]

#subquestion()
המשפחה ${f_n bar n in NN}$ כאשר $f_n (x) = sin(n x)$.

#proof[
  זו סדרה של פונקציות רציפות וגזירות ברציפות ולכן אם היא מתכנסת במידה שווה אז היא מתכנסת לפונקציה רציפה וגזירה.\
  אבל $f'_n (0) = n$ לכל $n in NN$ ולכן $lim_(n arrow.r infinity) f'_n = infinity$, בסתירה, ולכן לא כל סדרה מכילה תת־סדרה מתכנסת במידה שווה.
]

#subquestion()
המשפחה ${f_d bar d in RR}$ כאשר $f_d (x) = sin(d x)$.

#proof[
  מספיק שניקח את ${f_n bar n in NN} subset.eq {f_d bar d in RR}$ ומהסעיף הקודם נסיים.
]

#subquestion()
המשפחה ${f_d bar d in RR}$ כאשר $f_d (x) = sin(x+d)$.

#proof[
  נשים לב שזו סדרת של פונקציות גזירות ברציפות, מתקיים $f'_n (x) = cos(x + d)$ ואכן $f'_n (x), f_n (x) <= 1$ לכל $x, d$ ולכן ממשפט ארצלה אסכולי נקבל שהסדרה ${f_n}_(n=1)^infinity$ רציפה במידה אחידה וחסומה במידה אחידה ולכן יש לה תת־סדרה מתכנסת במידה שווה.
]

#subquestion()
המשפחה ${f_d bar d in RR}$ כאשר $f_d (x) = arctan(d x)$.

#proof[
  נסתכל על הסדרה ${f_(1/n)}_(n=1)^infinity in {f_d bar d in RR}$ ונשים לב שכאשר $x=0$ אז $f_(1/n) (0) = arctan(0) = 0$ לכל $n in NN$, ואם $x>0$ אז $lim_(n arrow.r infinity) f_(1/n) (x) = arctan(infinity) = pi/2$ ואם $x<0$ אז $lim_(n arrow.r infinity) f_(1/n) (x) = arctan(-infinity) = -pi/2$ ולכן הסדרה מתכנסת נקודתית לפונקציה (הלא רציפה)
  $ f(x) = mycases(-pi/2, x<0, 0, x=0, pi/2, x>0) $
  ובהתאם לשאלה הקודמת לא לכל תת־סדרה כאן יש תת־סדרה מתכנסת במידה שווה.
]
