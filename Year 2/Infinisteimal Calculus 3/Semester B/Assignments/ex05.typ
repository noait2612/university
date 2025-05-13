#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- חשבון אינפיניטסימלי 3, 80415 ],
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
תהיי $A subset.eq RR^k$ פתוחה ו־$f, g : A arrow.r RR^m$ פונקציות גזירות.
#subquestion()
נוכיח כי לכל $alpha, beta in RR$ הפונקציה $alpha f + beta g$ היא גזירה עם נגזרת הנתונה על־ידי
$ D(alpha f + beta g)_x = alpha(D f)_x + beta(D g)_x $
#proof[
  מהיות $f,g$ גזירות נובע שמתקיים $display(lim_(v arrow.r 0) (f(x+v)-f(x)-D f_x (v)) / norm(v))=0$ $(star)$, $display(lim_(v arrow.r 0) (g(x+v)-g(x)-D g_x (v)) / norm(v))=0$ $(star star)$.\
  הפונקציה $h = alpha f + beta g$ גזירה אם קיימת העתקה לינארית $D h$ המקיימת $ lim_(v arrow.r 0) (h(x+v)-h(x)-D h_x (v)) / norm(v)=0 $
  אם $h$ גזירה עם נגזרת הנתונה על־ידי $D h_x = alpha(D f)_x + beta(D g)_x$, נבחן אם מתקיים הגבול לעיל
  $
    lim_(v arrow.r 0) (h(x+v)-h(x)-D h_x (v)) / norm(v)= lim_(v arrow.r 0) ( alpha f(x+v) + beta g(x+v) - alpha f (x)-beta g(x)- alpha(D f)_x (v) - beta(D g)_x (v)) / norm(v) \
    lim_(v arrow.r) (alpha f(x+v) - alpha f(x) - alpha (D f)_x + beta g(x+v) beta g(x) - beta (D g)_x) / norm(v)\
    = lim_(v arrow.r 0) alpha(f(x+v)-f(x)-D f_x (v)) / norm(v) + lim_(v arrow.r 0) beta(g(x+v)-g(x)-D g_x (v)) / norm(v) \
    = alpha lim_(v arrow.r 0) (f(x+v)-f(x)-D f_x (v)) / norm(v) + beta lim_(v arrow.r 0) (g(x+v)-g(x)-D g_x (v)) / norm(v) \ =_((star), (star star)) alpha dot.op 0 + beta dot.op 0 = 0
  $
]

#subquestion()
נוכיח כי הפונקציה $angle.l f,g angle.r : A arrow.r RR$ היא גזירה עם נגזרת הנתונה על־ידי
$ D(angle.l f, g angle.r )_x = angle.l D f_x, g(x) angle.r + angle.l f(x), D g_x angle.r $
#proof[
  נתחיל מלהראות כי $angle.l f,g angle.r$ היא פונקציה גזירה: אנחנו יודעים שמכפלה פנימית ניתנת לתיאור על־ידי
  $
    angle.l f(x), g(x) angle.r = sum_(i=1)^m f_i (x) g_(i) (x) = f_1 (x) g_1 (x) + f_2 (x) g_2 (x) + ... + f_m (x) g_m (x)
  $
  כמו־כן, $f, g$ פונקציות גזירות ולכן גם $f_i, g_i$ גזירות לכל $1<=i<=m$, ולכן ניתן להפעיל את כלל גזירת מכפלה
  $
    D(angle.l f(x), g(x) angle.r)_x (v) = sum_(i=1)^m (D f_i (x)(v) dot.op g_i (x) + f_i (x) dot.op D g_i (x) (v))\
    = sum_(i=1)^m D f_i (x)(v) dot.op g_i (x) + sum_(i=1)^m f_i (x) dot.op D g_i (x) (v)= angle.l D f_x (v), g(x) angle.r + angle.l f(x), D g_x (v) angle.r
  $
  מהיות $f,g$ דיפרנציאביליות נקבל $(star)$$ f(x+v)=f(x)+ D f_x (v) + r_f (v) space (lim_(v arrow.r 0) (r_f (v)) / norm(v) = 0)
  \ g(x+v)=g(x)+ D g_x (v) + r_g (v) space (lim_(v arrow.r 0) (r_g (v)) / norm(v) = 0) $

  #colbreak()
  אם $D(angle.l f, g angle.r)_x$ שמצאנו נכונה, הגבול הבא צריך להתקיים
  $
    (star star) lim_(v arrow.r 0) (angle.l f(x+v), g(x+v) angle.r - angle.l f(x), g(x) angle.r -angle.l D f_x (v), g(x) angle.r - angle.l f(x), D g_x (v) angle.r ) / norm(v) =_? 0
  $
  נשים לב
  $
    angle.l f(x+v), g(x+v) angle.r = angle.l f(x)+ D f_x (v) + r_f (v) , g(x)+ D g_x (v) + r_g (v) \
    \= angle.l f(x), g(x) angle.r + angle.l D f_x (v), g(x) angle.r + angle.l f(x), D g_x (v) angle.r + angle.l r_f (v), g(x) angle.r + angle.l f(x), r_g (v) angle.r \ + angle.l D f_x (v), D g_x (v) angle.r + angle.l r_f (v), D g_x (v) angle.r + angle.l D f_x (v), r_g (v) angle.r + angle.l r_f (v), r_g (v) angle.r
  $
  ולכן נקבל
  $
    (star star) = lim_(v arrow.r 0) ( angle.l r_f (v), g(x) angle.r + angle.l f(x), r_g (x) angle.r + angle.l D f_x (v), D g_x (v) angle.r + angle.l r_f (v), D g_x (v) angle.r + angle.l D f_x (v), r_g (v) angle.r + angle.l r_f (v), r_g (v) angle.r ) / norm(v)
  $
  אבל $(angle.l r_f (v), g(x) angle.r) / norm(v) arrow.r 0$
  כי $norm(r_f (v)) / norm(v) arrow.r 0$ ולכן גם $(angle.l f(x), r_g (v) angle.r ) / norm(v) arrow.r 0$. \
  אבל גם $(angle.l D f_x (v), D g_x (v) angle.r) / norm(v) <= C norm(v) arrow.r 0$ מאי־שיוויון קושי־שוורץ, ובאותו אופן גם $(angle.l r_f (v), D g_x (v) angle.r) / norm(v), (angle.l D f_x (v), D r_f (v) angle.r) / norm(v) arrow.r 0$.\
  אחרון חביב $(angle.l r_f (v), r_g (v) angle.r) / norm(v) arrow.r 0$ מ־$(star)$
  כל המחוברים בגבול שואפים לאפס ולכן מאריתמטיקה של גבולות גם סכומם שואף לאפס ולכן
  $
    (star star) lim_(v arrow.r 0) (angle.l f(x+v), g(x+v) angle.r - angle.l f(x), g(x) angle.r -angle.l D f_x (v), g(x) angle.r - angle.l f(x), D g_x (v) angle.r ) / norm(v) = 0
  $
]

#question()

#subquestion()
נראה באמצעות הגדרת הנגזרת כי הפונקציה $f : RR^k arrow.r RR$ הנתונה על־ידי $f(x) = norm(x)_2^2$ היא גזירה.
#proof[
  ראשית, נשים לב
  $ f(x) = norm(x)_2^2 = sqrt(x_1^2 + ... x_k^2)^2 = x_1^2+...+x_k^2=sum_(i=1)^k x_i^2 $
  זה פולינום, ולכן ננחש שהנגזרת היא
  $ gradient f(x) = gradient f(x_1, ..., x_k) = vec(2x_1, dots.v, 2x_k)=2x $
  משמע $gradient f(x)$ הוא העתקה לינארית (וכל העתקה לינארית היא רציפה ולכן $f$ היא גזירה), נחשב את הגבול לפי הגדרה
  $
    lim_(v arrow.r 0) 1 / norm(v)(f(x+v) -f(x)-gradient f(x) dot.op v)\
    = lim_(v arrow.r 0) 1 / norm((v_1, ..., v_k)) (f(x_1+v_1, ..., x_k+v_k) - f(x_1, ..., x_k) - gradient f(x_1, ..., x_k) dot.op (v_1, ..., v_k))\
    = lim_(v arrow.r 0) 1 / norm((v_1, ..., v_k))(cancel(x_1^2, stroke: #(paint: blue))+cancel(2x_1v_1, stroke: #(paint: red))+v_1^2 + ... + cancel(x_k^2, stroke: #(paint: blue))+cancel(2x_k v_k, stroke: #(paint: red))+v_k^2 - cancel((x_1^2 + ... + x_k^2), stroke: #(paint: blue))-cancel((2x_1v_1, ..., 2x_k v_k), stroke: #(paint: red)) ) \
    = lim_(v arrow.r 0) 1 / norm((v_1, ..., v_k))(v_1^2 + ...+ v_k^2) \=_((star)) lim_(v arrow.r 0) (v_1^2 + ...+ v_k^2) / sqrt(v_1^2 + ... + v_k^2) = lim_(v arrow.r 0) norm(v)_2^2 / norm(v)_2 = lim_(v arrow.r 0) norm(v)_2 = 0
  $
  ולכן מהגדרת הדיפרנציאביליות מצאנו כי $f$ גזירה.\
  בהמשך ל־$(star)$, כמוסכמה אנחנו עובדים עם הנורמה האוקלידית ומותר לנו לעשות את זה כי כל הנורמלות שקולות.
]

#subquestion()
נמצא את כל הנקודות בהן הפונקציה $g: RR^k arrow.r RR$ הנתונה על־ידי $g(x) = norm(x)_1$ היא גזירה.
#proof[
  קודם כל
  $ g(x) = g(x_1, ..., x_k) = norm((x_1, ..., x_k))_1 = abs(x_1) + ... + abs(x_k) $
  ניזכר שעבור $f : RR arrow.r RR$ המוגדרת על־ידי $f(x) = abs(x)$, ראינו באינפי $2$ שהיא גזירה בכל $RR without {0}$.\
  עבור כל $x in RR^k$ שהפונקציה $g$ גזירה מתקיים
  $ gradient g(x) = gradient g(x_1, ..., x_k) = (s g n(x_1), ..., s g n (x_k)) $
  כאשר $s g n : RR arrow.r {-1, 0, 1}$ היא פונקציית הסימן.\
  אז כמו במקרה של $RR$, נפריד לשני מקרים
  + לכל $1<=i<=k$ מתקיים $abs(x_i)!=0$
  + קיים $1<=i<=k$ אחד לכל הפחות כך שמתקיים $abs(x_i) = x_i = 0$
  אם אנחנו במקרה הראשון, הפונקציה גזירה קורדינאטה קורדינאטה וסיימנו (שכן ראינו בהרצאה שזה שקול).\
  במקרה השני, נניח בשלילה כי $g$ עדיין גזירה, ולכן בפרט כל הנגזרות הכיווניות שלה קיימות בכל נקודה, בפרט זה נכון גם בראשית.\
  נסתכל על הראשית עם וקטור כיוון $(0, 1..., 1) in RR^k$ ומהגדרת הנגזרת הכיוונית נקבל
  $ lim_(t arrow.r 0) (g(x+t)-g(x)) / t = (abs(t)) / t = plus.minus 1 $
  וזאת סתירה להנחה ש־$g$ גזירה בכל $RR^k$.\
  נסיק אם כך ש־$g$ גזירה בכל $RR^k without {x in RR^k bar exists i in [k] space s.t. space x_i = 0 }$, זאת אומרת בכל $x in RR^k$ שאף קורדינאטה שלו היא אינה $0$.
]

#question()
#subquestion()
נראה כי הפונקציה $f: RR^3 arrow.r RR^2$ הנתונה על־ידי
$ f(x,y,z) = vec(x^4-2x y^2 + 3z^3, sin(y+z^2)) $
היא גזירה ונחשב את נגזרתה.
#proof[
  נסמן $f_1 = x^4-2x y^2 + 3z^3, f_2 = sin(y+z^2)$.\
  נשים לב נשים לב ש־$f_1, f_2$ גזירות מאריתמטיקה של פונקציות גזירות ולכן נחשב נגזרות חלקיות והמועמדת לנגזרת של $f$ היא
  $
    D f_((x,y,z)) = mat(partial_x f_1, partial_y f_1, partial_z f_1; partial_x f_2, partial_y f_2, partial_z f_2) = mat(4x^3-2y^2, -4y x, 9z^2; 0, cos(y+z^2), 2z cos(y+z^2))
  $
  כל הרכיבים (הנגזרות החלקיות) רציפים מאריתמטיקה של פונקציות רציפות לכל $(x,y,z) in RR^3$ ולכן $f$ גזירה לכל $(x,y,z) in RR^3$.\
]

#subquestion()
נראה כי הפונקציה $f: RR^2 arrow.r RR^3$ הנתונה על־ידי
$ g(x,y) = vec(e^(x y) + 4x, y sqrt(1+x^2), ln(1+x^2+y^2)) $
היא גזירה ונחשב את נגזרתה.
#proof[
  נסמן $g_1 = e^(x y) + 4x, g_2 = y sqrt(1+x^2), g_3 = ln(1+x^2+y^2)$ ו תהיי $(x,y) in RR^2$.
  \ נשים לב ש־$g(x,y)$ מוגדרת היטב:
  $
    g_3 = ln(1+x^2+y^2)>=ln(1)=0\
    g_2 = sqrt(1+x^2)>=sqrt(1) = 1
  $
  שכן בגלל החזקה אנחנו מוסיפים רק ערכים חיוביים ולא שוברים את תחום ההגדרה של כל פונקציה.\
  בפרט, $g_1, g_2, g_3$ הן פונקציות גזירות מאריתמטיקה של פונקציות גזירות, ולכן המועמדת לנגזרת של $g$ היא
  $
    D g_((x,y)) = mat(partial_x g_1, partial_y g_1; partial_x g_2, partial_y g_2; partial_x g_3, partial_y g_3)=mat(e^(x y) y + 4, e^(x y) x; (y x) / sqrt(1+x^2), sqrt(1+x^2); (2x) / (1+x^2+y^2), (2y) / (1+x^2+y^2))
  $
  נשים לב שכל הרכיבים רציפים: זה שוב נובע מכך שלכל $x, y in RR^2$ מתקיים $1+x^2>0, 1+x^2+y^2>=1$ ולכן כל הפונקציות מוגדרות היטב ובפרט רציפות מאריתמטיקה של פונקציות רציפות.\
  מצאנו שכל הנגזרות החלקיות רציפות בכל $(x,y) in RR^2$ ולכן $g$ גזירה בכל $(x,y) in RR^2$.
]

#question()
תהיי $f : RR^k arrow.r RR$ פונקציה גזירה בנקודה $x in RR^k$.

#subquestion()
נוכיח כי $norm(D f_x)_"op" = norm(gradient f(x))$.
#proof[
  ראשית $D f_x : RR^k arrow.r R$ זו העתקה לינארית (פונקציונל לינארי) ולכן כפי שראינו בתרגול
  $
    D f_x (v) = angle.l v , D f_x angle.r = angle.l v, gradient f(x) angle.r => norm(D f_x (v))_"op" = norm((angle.l v , D f_x angle.r))_"op" = norm((angle.l v, gradient f(x) angle.r))_"op"
  $
  מאי־שיוויון קושי שוורץ נקבל
  $ norm((D f_x (v)))_"op" <= norm(gradient f_x)_"op" dot.op norm(v)_2 = norm(gradient f_x)_"op" $
  אם $gradient f_x = 0$ נקבל שיוויון. אם $gradient f_x !=0$ אז נוכל לסמן $v = f_x / norm(gradient f_x)$ ונקבל
  $
    D f_x (v) = angle.l v, gradient f_x angle.r = angle.l f_x / norm(gradient f_x) gradient f_x angle.r = norm(gradient f_x)^2 / norm(gradient f_x) = norm(gradient f_x)
  $
]

#subquestion()
נמצא את כל וקטורי היחידה $v in RR^k$ (כלומר $norm(v)=1$) בהם מתקבל המקסימום $norm(D f_x (v)) = norm(gradient f(x))$
#solution[
  מהסעיף הקודם אנחנו מקבלים שהוקטורים בהם יתקבל המקסימום יהיו אלו שתלויים ב־$gradient f_x$ ומאורך 1
  $
    norm(lambda gradient f_x)=1 <==> abs(lambda) norm(gradient f_x) = 1 <==> lambda = plus.minus 1 / norm(gradient f_x)
  $
  משמע המקסימום מתקבל כאשר $v = plus.minus gradient f_X / norm(gradient f_x)$.
]

#question()
תהיי $f : RR^2 arrow.r RR$ הפונקציה הנתונה על־ידי
$ f(x,y) = mycases(1, y=x^2!=0, 0, "אחרת") $

#subquestion()
נראה כי לכל $v in RR^2$ הנגזרת הכיוונית של $f$ בכיוון $v$ קיימת בראשית, כלומר קיים הגבול
$ lim_(t arrow.r 0) (f(0+t v) - f(0,0)) / t $
#proof[
  לכל כיוון $accent(v, arrow) = (a,b) in RR^2$ נגדיר $g(t) = f(t v)$ ואז הפונקציה $g$ היא זהותית $0$ למעט נקודה אחת ואז $g'(0) = 0$.\
  נעבור להראות אם־כך שהגבול הנתון באמת קיים:
  $ lim_(t arrow.r 0) (f(0+t v) - f(0,0)) / t = lim_(t arrow.r 0) (f(t a, t b)) / t $
  נשים לב תחילה
  $ f(t a, t b) = 1 <==> t b = t^2 a^2 => b = t a^2 $
  משמע בידיוק ב־$t!=0$ אחד וספציפי נקבל $f(t a , t b) = 1$, ולכן כמעט לכל $t$ נקבל $f(t a, t b) = 0$ ולכן בפרט עבור $t$ קטן דיו, הנגזרת הכיוונית של $f$ מתאפסת בראשית לכל וקטור כיוון $v in RR^2$ ונקבל
  $ lim_(t arrow.r 0) (f(0+t v) - f(0,0)) / t = lim_(t arrow.r 0) (f(t a, t b)) / t = 0 $

]

#subquestion()
נוכיח ש־$f$ לא גזירה בראשית.
#proof[
  ניזכר כי אם פונקציה גזירה בנקודה, היא בהכרח רציפה בנקודה ונטען ש־$f$ בכלל לא רציפה בראשית.\
  נניח בשלילה שהיא כן רציפה ונבחר סדרות היינה $x_n = 1 / n$ ו־$y_n = 1 / n^2$ ונקבל $f(1 / n, 1 / n^2) = 1$ שכן $y_n = 1 / n^2 = (1 / n)^2=x_n^2$. \
  מנגד, מתקיים $f(1 / n, 1 / n^2) stretch(arrow.r)_(n arrow.r infinity)1$ אבל $f(0,0) = 0$ וזו סתירה ולכן $f$ אינה רציפה בראשית ובטח לא דיפרנציאבילית בראשית.
]
