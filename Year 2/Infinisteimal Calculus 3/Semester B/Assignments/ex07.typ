#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 07 --- חשבון אינפיניטסימלי 3, 80415 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#let hom = math.op("Hom")
#let im = math.op("Im")

#question()
תהיי $f : A subset.eq arrow.r RR^m$ פונקציה הגזירה פעמיים ברציפות ב־$a in A$. נסמן ב־$P : RR^k arrow.r RR^m$ את פולינום טיילור מסדר $2$ של $f$ סביב $a$:
$ P(x) = f(a) + D f_a (x-a) + 1 / 2 D^2 f_a (x-a, x-a) $

#subquestion()
נוכיח שמתקיים $D P_a = D f_a, D^2 P_a = D^2 f_a$.
#proof[

]

#subquestion()
נוכיח כי $f(x)=P(x) + o(norm(x-a)^2)$, משמע שמתקיים $lim_(x arrow.r a) (f(x)-P(x)) / (norm(x-a)^2) = 0$.
#proof[

]

#question()
נחשב את פולינום טיילור מסדר $2$ של הפונקציה $f(x,y) = e^(x sin(y))$ סביב הנקודות $(1,0), (2, pi)$.
#proof[

]

#question()
בכל סעיף נמצא את הנקודות הקריטיות ונסווגן.\
_הערה_: יונתן אמר אפשר להניח שהפונקציות גזירות פעמיים ברציפות.

#subquestion()
$f(x,y) = x^3-2 x y^2$
#proof[
  נחשב נגזרות חלקיות
  $ (partial f) / (partial x) = 3x^2-2y^2, space (partial f) / (partial y) = -4x y $
  נשים לב שכל הנגזרות החלקיות רציפות מאריתמטיקה של פונקציות רציפות ולכן $f(x,y)$ דיפרנציאבילית בכל נקודה ומתקיים
  $ gradient f (x,y) = vec(3x^2-2y^2, -4x y) $
  נשים לב ש־$gradient f(x,y) = 0 <==> x=y=0$ ולכן $(0,0)$ נקודה קריטית.
  נחשב את מטריצת ההסיאן של $f$
  $
    H f_((x,y)) = mat((partial^2 f) / (partial x^2), (partial^2 f) / (partial x partial y); (partial^2 f) / (partial y partial x), (partial^2 f) / (partial y^2)) = mat(6x, -4y; -4y, -4x)
  $
  ונשים לב שמתקיים $H f_((0,0)) = det mat(delim: "[", 0, 0; 0, 0) = 0$ ולא ניתן להשתמש במבחן ההסיאן לסיווג נקודות קיצון, ולכן עלינו לעבוד כמו בתרגול ולראות איך מתנהגת $f$ בסביבת הנקודה $(0,0)$:
  יהי $epsilon > 0$ ונבחן עבור $x=y$ ו־$x in (-epsilon, epsilon)$ את התנהגות $f(x)=x^3-2x^3$.\
  בתחום $x in (0, epsilon)$ אנחנו מקבלים ש־$x^3<=2x^3$, אבל עבור $x in (-epsilon, 0)$ אנחנו מקבלים ש־$2x^3<=x^3$, ולכן נסיק אם כך ש־$(0,0)$ היא נקודת קיצון מסוג אוכף.
]

#subquestion()
$g(x,y) = x^3+y^3-3x y +4$
#proof[
  נחשב נגזרות חלקיות
  $ (partial g) / (partial x) = 3x^2-3y, space (partial g) / (partial y) = 3y^2-3x $
  נשים לב שכל הנגזרות החלקיות רציפות מאריתמטיקה של פונקציות רציפות ולכן $g(x,y)$ דיפרנציאבילית בכל נקודה ומתקיים
  $ gradient g (x,y) = vec(3x^2-3y, 3y^2-3x) $
  נשים לב ש־$ gradient g(x,y) = 0 <==> vec(3x^2-3y, 3y^2-3x)= vec(0, 0) $
  מהקורדינאטה הראשונה נקבל $3x^2-3y = 0 <==> x^2 = y$ ובהצבה בקורדינאטה השנייה נקבל $ 3y^2-3x = 0 <==> 3(x^2)^2 - 3x = 0 <==> x^4-x = 0 <==> x(x^3-1) = 0 <==> x = 0 or x=1 $
  אם $x = 0$ אז $y =0$ ואם $x=1$ אז $y=1$ ולכן הנקודות הקריטיות שלנו הן $(0,0)$ ו־$(1,1)$. נחשב את מטריצת ההסיאן של $g$
  $
    H g_((x,y)) = mat((partial^2 g) / (partial x^2), (partial^2 g) / (partial x partial y); (partial^2 g) / (partial y partial x), (partial^2 g) / (partial y^2)) = mat(6x, -3; -3, 6y)
  $
  נציב את הנקודות הקריטיות שלנו ונשים לב שמתקיים
  $
    H g_((0,0)) = mat(0, -3; -3, 0) => det mat(delim: "[", 0, -3; -3, 0) = -9 \
    H g_((1,1)) = mat(6, -3; -3, 6) => det mat(delim: "[", 6, -3; -3, 6) = 36-9=27
  $
  אז $det(H g_(0,0)) < 0$ ולכן $(0,0)$ נקודת אוכף לפי האלגוריתם שראינו בתרגול, ומכך ש־$det(H g_((1,1))) > 0$ ו־$tr(H g_((1,1))) = 12 > 0$ נקבל מהאלגוריתם מהתרגול ש־$(1,1)$ היא נקודת קיצון מסוג מינימום.
]

#subquestion()
$h(x,y) = 3x^2y+y^3-3x^2-3y^2+2$
#proof[
  נחשב נגזרות חלקיות
  $ (partial h) / (partial x) = 6x y - 6x, space (partial h) / (partial y) = 3x^2 + 3y^2-6y $
  נשים לב שכל הנגזרות החלקיות רציפות מאריתמטיקה של פונקציות רציפות ולכן $h(x,y)$ דיפרנציאבילית בכל נקודה ומתקיים
  $ gradient h (x,y) = vec(6x y - 6x, 3x^2 + 3y^2 -6y) $
  ונשים לב שמתקיים
  $ gradient h(x,y) = 0 <==> vec(6x y - 6x, 3x^2 + 3y^2 -6y)=vec(0, 0) $
  עבור הקורדינאטה הראשונה מתקיים $ 6x y - 6x = 0 <==> x(y-x) = 0 <==> x = 0 or x=y $
  נציב בקורדינאטה השנייה
  $
    3x^2 + 3y^2 - 6y = 0 <==>_(x=0) 3y^2-6y = 0 <==> y(y-2)=0 <==> y=0 or y=2 \
    3x^2 + 3y^2 -6y = 0 <==>_(x=y) 6y^2-6y =0 <==> y(y-1) = 0 <==> y=1, y=0
  $
  ולכן הנקודות הקריטיות שלנו הן $(0,0), (0,2), (1,1), (-1, 1)$, נחשב את מטריצת ההסיאן של $h$
  $
    H h_((x,y)) = mat((partial^2 h) / (partial x^2), (partial^2 h) / (partial x partial y); (partial^2 h) / (partial y partial x), (partial^2 h) / (partial y^2)) = mat(6y-6, 6x; 6x, 6y-6)
  $
  נציב את הנקודות הקריטיות שלנו ונשים לב שמתקיים
  $
    H h_((0,0)) = mat(-6, 0; 0, -6) => det mat(delim: "[", -6, 0; 0, -6) = 36 \
    H h_((1,1)) = mat(0, 6; 6, 0) => det mat(delim: "[", 0, 6; 6, 0) = -36 \
    H h_((-1,1)) = mat(0, -6; -6, 0) => det mat(delim: "[", 0, -6; -6, 0) = -36 \
    H h_((0,2)) = mat(6, 0; 0, 6) => det mat(delim: "[", 6, 0; 0, 6) = 36
  $
  אז לפי האלגוריתם שראינו בתרגול, בנקודה $(0,0)$ נקבל מקסימום (דטרמיננטה חיובית אבל עקבה שלילית), בנקודה
  $(0,2)$ נקבל מינימום (דטרמיננטה חיובית ועקבה חיובית),
  בנקודות $(1,1), (-1,1)$ נקבל נקודות אוכף (דטרמיננטה שלילית).
]

#question()
תהיי $f L A subset.eq RR^k arrow.r RR$ פונקציה הגזירה שלוש פעמים ברציפות ב־$a in A$. נניח כי $D f_a = 0 = D^2 f_a$ אבל $D^3 f_a !=0$. נגדיר $phi : RR^k arrow.r RR$ על־ידי $phi(v) = D^3 f_a (v,v,v)$.

#subquestion()
נוכיח כי לכל $u,v,w in RR^k$ מתקיים
$ D^3 f_a (u,v,w) = 1 / 6(phi(u+v+w)-phi(u+v)-phi(u+w)-phi(v+w)+phi(u)+phi(v) + phi(w)) $
#proof[

]

#subquestion()
נסיק שקיים $v in RR^k$ כך שמתקיים $phi(v)!=0$.
#proof[

]

#subquestion()
נוכיח כי $a$ היא נקודת אוכף של $f$.
#proof[

]

#question()
תהיי $A subset.eq RR^k$ פתוחה, $f : A arrow.r RR^k$ גזירה ברציפות ותהיי $a in A$ כך ש־$D f_a$ הפיכה.\
נסמן $b = f(a), T = D f)_a$ ונגדיר $g : RR^k arrow.r RR^k$ ו־$accent(f, tilde) : accent(A, tilde) = g^(-1) (A) arrow.r RR^K$ על־ידי
$ g(x) = T^(-1)(x) + a, accent(f, tilde)(x) = f(g(x))-b $

#subquestion()
נוכיח כי $g$ היא העתקה פתוחה, כלומר לכל קבוצה פתוחה $W subset.eq RR^k$ מתקיים ש־$g(W)$ פתוחה.
#proof[

]

#subquestion()
נגיד שקבוצה פתוחה $U subset.eq A$ היא סביבה טובה של $a in U$ אם $f bar_U$ היא חד־חד ערכית, $V = f(U)$ פתוחה ו־$(f bar_U)^(-1) : V arrow.r U$ היא גזירה ברציפות. באותו אופן נגדיר סביבה טובה של $0 in accent(A, tilde)$.\
נוכיח שאם $accent(U, tilde) subset.eq accent(A, tilde)$ היא סביבה טובה של $0 in accent(U, tilde)$ אז $U = g(accent(U, tilde))$ היא סביבה טובה של $a in U$.
#proof[]
