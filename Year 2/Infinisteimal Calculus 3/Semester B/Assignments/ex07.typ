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
תהיי $f : A subset.eq RR^k arrow.r RR^m$ פונקציה הגזירה פעמיים ברציפות ב־$a in A$. נסמן ב־$P : RR^k arrow.r RR^m$ את פולינום טיילור מסדר $2$ של $f$ סביב $a$:
$ P(x) = f(a) + D f_a (x-a) + 1 / 2 D^2 f_a (x-a, x-a) $

#subquestion()
נוכיח שמתקיים $D P_a = D f_a, D^2 P_a = D^2 f_a$.
#proof[
  $P(x)$ הוא פולינום ולכן פונקציה חלקה ולכן ניתן לגזור אותו, נגזור פעם אחת ונקבל ש־$D P_(a) = D f_a$. למה? כי $D f_a (x-a)$ היא פונקציה לינארית של $x$, ולכן בהצבה של $x=a$ נקבל $D f_a (a-a) = D f_a (0)$ ובפרט בגלל ש־$f$ גזירה פעמיים ברציפות נובע גם כי $D f_a$ גזירה. אבל $D f_a$ היא העתקה לינארית ולכן $D f_a (0)$ זה פשוט ערך הנגזרת בנקודה $a$, וזה בידיוק $D f_a$.\
  הביטוי $f(a)$ כמובן נעלם כקבוע, והביטוי $D^2 f_a (x-a, x-a)$ נעלם כי זו תבנית בילנארית ותבנית בילינארית המקבלת זוג $0$־ים מתאפסת ולכן $D^2 f_a (0,0) = 0$ ולכן $D P_a (f) = D f_a$.\
  נשאר להראות שמתקיים $D^2 P_a = D^2 f_a$. נגזור את $D P_x$ שמצאנו ו־$D f_a$ זה קבוע ולכן בגזירה נעלם, ומהלינאריות של $D^2 f_a (x-a)$ נקבל $D^2P_a = D^2f_a$.
]

#subquestion()
נוכיח כי $f(x)=P(x) + o(norm(x-a)^2)$, משמע שמתקיים $lim_(x arrow.r a) (f(x)-P(x)) / (norm(x-a)^2) = 0$.
#proof[
  נגדיר $h = x-a, x = a+h$ ונגדיר $phi.alt : [0,1] arrow.r RR^m$ על־ידי
  $ phi.alt(t) = f(a + t h) $
  ולכן $phi.alt(0) = f(a), phi.alt(1) = f(a+h) = f(x)$.\
  זו פונקציה גזירה כהרכבה של פונקציות גזירות ומכלל השרשרת $ phi.alt'(t) = D f_(a + t h) (h), phi.alt''(t) = D^2 f_(a+t h) (h,h) $
  ממשפט טיילור החד־מימדי אנחנו יודעים שמתקיים
  $ phi.alt(1) = phi.alt(0) + phi.alt'(0) + 1 / 2 phi.alt''(0) + R $
  עם שארית המקיימת
  $ norm(R) <= 1 / 2 sup_(t in (0,1)) norm(phi.alt''(t) - phi.alt''(0)) $
  אז
  $ f(x) = f(a+h) = f(a) + D f_a (h) + 1 / 2 D^2 f_a (h,h) + R(h) $
  כאשר
  $ norm(R(h)) <= 11 / 2 sup_(t in (0,1)) norm(D^2f_(a + t h) - D^2f_a) dot.op norm(h)^2 $
  $f$ גזירה ברציפות פעמיים ולכן $D^2f$ רציפה, ולכן כאשר $t h arrow.r 0$ מתקיים
  $ norm(D^2f_(a + t h) - D^2f_a) stretch(arrow.r)_(h arrow.r 0) 0 $
  אבל $R(x) = f(x)-P(x)$ וזה מסיים.
]

#question()
נחשב את פולינום טיילור מסדר $2$ של הפונקציה $f(x,y) = e^(x sin(y))$ סביב הנקודות $(1,0), (2, pi)$.
#proof[
  נתחיל מלחשב נגזרות חלקיות מסדר ראשון ושני
  $
    (partial f) / (partial x) = e^(x sin(y)) sin(y) \
    (partial f) / (partial y) = e^(x sin(y)) x cos(y) \
    (partial^2 f) / (partial x^2) = e^(x sin(y)) sin^2(y) \
    (partial^2 f) / (partial x partial y) = (partial^2 f) / (partial y partial x) = cos(y) (e^(x sin(y))x sin(y) + e^(x sin(y))) \
    (partial^2 f) / (partial y^2) = x(e^(x sin(y))x cos^2(y) - e^(x sin(y)) sin(y)) \
  $
  ולכן
  $
    D f_((x,y)) = (e^(x sin(y)) sin(y),e^(x sin(y)) x cos(y) ) => D f_((1,0)) = (0, 1), D f_((2,pi)) = (0, -2) \
    D^2 f_((x,y)) = mat(e^(x sin(y)) sin^2(y), cos(y) (e^(x sin(y))x sin(y) + e^(x sin(y))); cos(y) (e^(x sin(y))x sin(y) + e^(x sin(y))), x(e^(x sin(y))x cos^2(y) - e^(x sin(y)) sin(y))) \
    => D^2 f_((1,0)) = mat(0, 1; 1, 1), D^2 f_((2,pi)) = mat(0, -1; -1, 4)
  $
  ובתרגול ראינו שהצורה הכללית של פולינום טיילור מסדר $2$ היא
  $ P_(f, (a,b), 2) (x,y) = f(a,b) + D f_((a,b)) vec(x-a, y-b) + 1 / 2 D^2 f_((a,b)) (vec(x-a, y-b), vec(x-a, y-b)) $
  ולכן
  $
    P_(f, (1,0), 2) (x,y)= f(1,0) + D f_((1,0))vec(x-1, y) + 1 / 2 D f_((1,0)) (vec(x-1, y), vec(x-1, y)) = 1 +y +x y -y+y^2 / 2 \
    P_(f, (2,pi), 2) (x,y)= f(2,pi) + D f_((2,pi))vec(x-2, y-pi) + 1 / 2 D f_((2,pi)) (vec(x-2, y-pi), vec(x-2, y-pi)) = \
    1-2y+2pi +1 / 2(4y^2-8 pi y -2 x y + 4y+4pi^2-4pi+2pi x)=1+2y^2-4pi y - x y + 2 pi^2 + pi x
  $
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
תהיי $f : A subset.eq RR^k arrow.r RR$ פונקציה הגזירה שלוש פעמים ברציפות ב־$a in A$. נניח כי $D f_a = 0 = D^2 f_a$ אבל $D^3f_a !=0$. נגדיר $phi : RR^k arrow.r RR$ על־ידי $phi(v) = D^3f_a (v,v,v)$.

#subquestion()
נוכיח כי לכל $u,v,w in RR^k$ מתקיים
$ D^3f_a (u,v,w) = 1 / 6(phi(u+v+w)-phi(u+v)-phi(u+w)-phi(v+w)+phi(u)+phi(v) + phi(w)) $
#proof[
  $f$ גזירה ברציפות $3$ פעמים ולכן היא העתקה מולטי־לינארית סימטרית ולכן $D^3f_a (v_1, v_2, v_3)$ לא תלוי בסדר הוקטורים, ולכן $D^3f_a (v_1, v_2, v_3) = D^3f_a (v_3, v_2, v_1)$ וכד'.\
  יהיו $u, v, w in RR^k$ ונבחן את $phi(u+v)$, מהיות $D^3f_a$ העתקה מולטי־לינארית ומהסימטריות מתקיים
  $ phi(u, v) = D^3f_a (u+v, u+v, u+v) = D^3f_a (u,u,u) + 3D^3f_a (u,u,v) + 3D^3f_a (u,v,v) + D^3f_a (v,v,v) $
  נפתח באותו אופן כל־אחד מהגורמים
  $
    phi(u+w) = D^3f_a (u+w, u+w, u+w) = D^3f_a (u,u,u) + 3D^3f_a (u,u,w) + 3D^3f_a (u,w,w) + D^3f_a (w,w,w)\
    phi(v+w) = D^3f_a (v+w, v+w, v+w) = D^3f_a (v,v,v) + 3D^3f_a (v,v,w) + 3D^3f_a (v,w,w) + D^3f_a (w,w,w) \
    phi(u+v+w) = D^3f_a (u+v+w, u+v+w, u+v+w) = D^3f_a (u,u,u) + D^3f_a (v,v,v) + D^3f_a (w,w,w) \
    + 3(D^3f_a (u,u,v)+D^3f_a (u,u,w)+D^3f_a (v,v,u)+D^3f_a (v,v,w)+D^3f_a (w,w,v)+D^3f_a (w,w,u))+6D^3f_a (u,v,w)
  $
  ונבחן כעת את
  $
    phi(u+v+w)-phi(u+v)-phi(u+w)-phi(v+w)+phi(u)+phi(v) + phi(w) =\
    = cancel(D^3f_a (u,u,u), stroke: #(paint: red)) + cancel(D^3f_a (v,v,v), stroke: #(paint: blue)) + cancel(D^3f_a (w,w,w), stroke: #(paint: green)) \
    + 3(cancel(D^3f_a (u,u,v), stroke: #(paint: orange))+cancel(D^3f_a (u,u,w), stroke: #(paint: purple))+cancel(D^3f_a (v,v,u), stroke: #(paint: maroon))+cancel(D^3f_a (v,v,w), stroke: #(paint: yellow))+cancel(D^3f_a (w,w,v), stroke: #(paint: fuchsia))+cancel(D^3f_a (w,w,u), stroke: #(paint: teal)))+6D^3f_a (u,v,w)
    \ - cancel(D^3f_a (u,u,u), stroke: #(paint: red)) + 3cancel(D^3f_a (u,u,v), stroke: #(paint: orange)) - cancel(3D^3f_a (v,v,u), stroke: #(paint: maroon)) - cancel(D^3f_a (v,v,v), stroke: #(paint: blue)) - cancel(D^3f_a (u,u,u), stroke: #(paint: red)) - 3cancel(D^3f_a (u,u,w), stroke: #(paint: purple)) - cancel(3D^3f_a (w,w,u), stroke: #(paint: teal)) - cancel(D^3f_a (w,w,w), stroke: #(paint: green))
    \ - cancel(D^3f_a (v,v,v), stroke: #(paint: blue)) - 3cancel(D^3f_a (v,v,w), stroke: #(paint: yellow)) - cancel(3D^3f_a (w,w,v), stroke: #(paint: fuchsia)) - cancel(D^3f_a (w,w,w), stroke: #(paint: green))+ cancel(D^3f_a (u,u,u), stroke: #(paint: red)) + cancel(D^3f_a (v,v,v), stroke: #(paint: blue)) + cancel(D^3f_a (w,w,w), stroke: #(paint: green)) \
    = 6D^3f_a (u,v,w)
  $
  ולכן
  $
    D^3f_a (u,v,w) = 1 / 6(phi(u+v+w)-phi(u+v)-phi(u+w)-phi(v+w)+phi(u)+phi(v) + phi(w)) = 1 / 6 dot.op 6 D^3f_a (u,v,w)
  $
]

#subquestion()
נסיק שקיים $v in RR^k$ כך שמתקיים $phi(v)!=0$.
#proof[
  נניח שלא ככה, ולכן לכל $v in RR^k$ מתקיים $phi(v)=0$, אבל אז בנוסחה מסעיף א' נקבל
  $
    D^3f_a (u,v,w) = 1 / 6(phi(u+v+w)-phi(u+v)-phi(u+w)-phi(v+w)+phi(u)+phi(v) + phi(w)) =_(forall v in RR^k, phi(v)=0) 0
  $
  אבל מהנתון $D^3f_a (u,v,w) != 0$ וזו סתירה.
]

#subquestion()
נוכיח כי $a$ היא נקודת אוכף של $f$.
#proof[
  מכך ש־$D^3f_a (v,v,v)$ היא העתקה מולטי־לינארית סימטרית נובע כי היא לינארית בכל וקטור משמע $ phi(lambda v) = D^3f_a (lambda v, lambda v, lambda v) = lambda^3 phi(v) $
  דהיינו $phi$ פונקציה הומוגנית מדרגה $3$ ובפרט נובע מכך ש־$phi(-v) = - phi(v)$.\
  מסעיף ב' אנחנו יודעים שקיים $v in RR^k$ כך שמתקיים $phi(v)!=0$ ומהיותה העתקה מולטי־לינארית סימטרית אי־זוגית נובע שאם $phi(v) > 0$ אז $phi(-v) < 0$ ולהפך.\
  נבחן את
  $ f(a +t v) = f(a) + t^3 / 6 phi(v) + o(t^3) $
  ועבור $t>0$ קטן דיו מתקיים
  + אם $phi(v) > 0$ אז $f(a+ t v ) > f(a)$
  + אם $phi(v)) < 0$ אז $f(a + t v) < f(a)$
  ובכך שניקח את $v, -v$ נקבל שבכיוונים מנוגדים יש לנו עלייה בכיוון אחד וירידה בכיוון שני, הווה אומר לא נקודת מינימום ולא נקודת מקסימום ב־$a$ אבל כן נקודה קריטית מסוג אוכף.
]

#question()
תהיי $A subset.eq RR^k$ פתוחה, $f : A arrow.r RR^k$ גזירה ברציפות ותהיי $a in A$ כך ש־$D f_a$ הפיכה.\
נסמן $b = f(a), T = D f_a$ ונגדיר $g : RR^k arrow.r RR^k$ ו־$accent(f, tilde) : accent(A, tilde) = g^(-1) (A) arrow.r RR^K$ על־ידי
$ g(x) = T^(-1)(x) + a, accent(f, tilde)(x) = f(g(x))-b $

#subquestion()
נוכיח כי $g$ היא העתקה פתוחה, כלומר לכל קבוצה פתוחה $W subset.eq RR^k$ מתקיים ש־$g(W)$ פתוחה.
#proof[
  ראשית נטען ש־$g$ פונקציה רציפה: $T^(-1)$ העתקה לינארית וראינו שהעתקות לינאריות הן רציפות על מרחב סוף מימדי, אז $x mapsto T^(-1)+a$ שזו בעצם $g(x)$ היא פונקציה רציפה.\
  כמו־כן, $g$ גזירה מאריתמטיקה של פונקציות גזירות נגזרתה נתונה על־ידי $D g(x) = T^(-1)$.\
  כמובן ש־$g$ חד־חד ערכית ועל מהיות $D f_a = T$ הפיכה, נמצא את ההופכית של $g$:
  $ y = g(x) = T^(-1)(x)+a <==> y-a = T^(-1)(x) <==> T(y-a) = T(T^(-x)(x))=x => g^(-1)(y) = T(y-a) $
  שגם היא רציפה כהעתקה לינארית.\
  ממשפט הפונקציה ההפוכה נקבל ש־$g$ היא דיפאומורפיזם.\
  תהיי $U subset.eq RR^k$ קבוצה פתוחה ונסמן $A = T^(-1)$, ואז $A(U) = (A^(-1))^(-1)(U)$ היא פתוחה (התמונה ההפוכה של $U$ ביחס להעתקה רציפה) ואז בפרט $g(U)$ היא העתקה פתוחה.
]

#subquestion()
נגיד שקבוצה פתוחה $U subset.eq A$ היא סביבה טובה של $a in U$ אם $f bar_U$ היא חד־חד ערכית, $V = f(U)$ פתוחה ו־$(f bar_U)^(-1) : V arrow.r U$ היא גזירה ברציפות. באותו אופן נגדיר סביבה טובה של $0 in accent(A, tilde)$.\
נוכיח שאם $accent(U, tilde) subset.eq accent(A, tilde)$ היא סביבה טובה של $0 in accent(U, tilde)$ אז $U = g(accent(U, tilde))$ היא סביבה טובה של $a in U$.
#proof[
  נניח בשלילה ש־$U = g(accent(U, tilde))$ היא לא סבירה טובה של $a in A$, ולכן לא קיימת סביבה $V$ של $a$ כך ש־$V subset.eq U$ ו־$f$ רציפה על $V$.\
  היות ו־$accent(U, tilde)$ היא סביבה טובה של $0$ ב־$accent(A, tilde)$ נובע שקיימת סביבה $accent(V, tilde) subset.eq accent(U, tilde)$ ו־$accent(f, tilde)$ רציפה על $accent(V, tilde)$.\
  בסעיף הקודם ראינו ש־$g$ היא דיפאומורפיזם סביב $0$ ולכן $g$ ממפה סביבות של $0$ ב־$RR^k$ אל סביבות של $a$ ב־$RR^k$.\
  היות ו־$accent(V, tilde)$ היא סביבה של $0$, $g(accent(V, tilde))$ היא סביבה של $a$ ולכן $g(accent(V, tilde)) in U$ שכן $accent(V, tilde) subset.eq accent(U, tilde)$ ולכן $g(accent(V, tilde)) subset.eq g(accent(U, tilde))=U$.\
  אבל $accent(f, tilde)$ רציפה על $accent(V, tilde)$ ולכן $accent(f, tilde) = f(g(x))-b$ אבל מהרציפות נובע כי $f(g(x))$ רציפה כסכום פונקציות רציפות על $accent(V, tilde)$ ולכן $f$ רציפה על $g(accent(V, tilde))$ שהיא סביבה של $a$, אבל זאת סתירה כי הנחנו ש־$U$ היא לא סביבה טובה של $a$.
]
