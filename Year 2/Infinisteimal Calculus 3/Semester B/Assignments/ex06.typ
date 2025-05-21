#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 06 --- חשבון אינפיניטסימלי 3, 80415 ],
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
#let relu = math.op("ReLU")

#question()
נתונה רשת נוירונים מהצורה הבאה
$ RR^2 stretch(arrow.r)^W^1 RR^3 stretch(arrow.r)^alpha^1 stretch(arrow.r)^W^2 RR^2 stretch(arrow.r)^alpha^2 RR^2 $
המידע הנחוץ על הרשת הוא
+ $W^1 in M_(3 times 2) (RR), W^2 in M_(2 times 3) (RR)$
+ $alpha^1 : RR^3 arrow.r RR^3, alpha^2 : RR^2 arrow.r RR^2$ פועלות בתור $relu$ על כל קורדינאטה בנפרד, כאשר $relu : RR arrow.r RR$ מוגדרת באמצעות $relu(t) = max{t,0}$ וניתן להתעלם מהאי גזירות של $relu$ ב־0
+ פונקציית ההפסד $C : RR^2 times RR^2 arrow.r RR$ היא $C(x,y) = norm(x-y)_2^2$
נניח כי נתון לנו זוג קלט פלט $(x,y) in RR^2 times RR^2$ ונגדיר את הוקטורים
$ x^0 = x, space x^1 = alpha^1(W^1x^0), space x^2 = alpha^2(W^2x^1) $
ונגדיר את הפונקציות הבאות ל־$RR$:
+ $g^2(z^2) = C(alpha^2(z^2), y)$ עבור $z^2 in RR^2$
+ $h^2(W^2)=g^2(W^2x^1)$ עבור $W^2 in M_(2 times 3) (RR)$
+ $g^1(z^1)=g^2(W^2alpha^1(z^1))$ עבור $z^1 in RR^3$
+ $h^1(W^1) = g^1(W^1x^0)$ עבור $W^1 in M_(3 times 2) (RR)$
ונתון
$ x = vec(1, 2), space y=vec(0, 0), space W^1 = mat(3, -1; -2, 0; 0, 1), space W^2 = mat(0, -1, 1; -1, 4, 1) $

#subquestion()
נחשב את $delta^2 = gradient g^2(W^2x^1)$ ואת $gradient h^2(W^2)$.
#solution[
  ראשית ניזכר
  $ (star) relu'(t) = mycases(0, t<0, times, t=0, 1, t>0) $
  ועכשיו נחשב
  $
    z^1 = W^1 x = mat(3, -1; -2, 0; 0, 1) vec(1, 2) = vec(3-2, -2, 2) = vec(1, -2, 2) \
    x^1 = alpha^1 (z^1) = relu(z^1) = vec(max(1, 0), max(-2, 0), max(2, 0)) = vec(1, 0, 2) \
    z^2 = W^2 x^1 = mat(0, -1, 1; -1, 4, 1) vec(1, 0, 2) = vec(2, 1) \
    x^2 = alpha&2 (z^2) = relu(z^2) = vec(2, 1)
  $
  עבור פונקציית ההפסד מתקיים
  $ g^2(z^2) = C(relu(z^2), y) = norm(relu(z^2)-y^2)_2^2 =_(y = vec(0, 0)) norm(relu(z^2))^2 $
  ואז עבור הנגזרת מכיוון ש־$y = vec(0, 0)$ מתקיים
  $ gradient C(x^2,y) = 2x^2 = 2 vec(1, 2) = vec(4, 2) $
  אבל $x^2 = relu(z^2)$, אז נשתמש בכלל השרשרת ונקבל
  $
    delta^2 = gradient g^2 (z^2) = 2((x^2 - y) dot.circle relu' (z^2)) =_((star)) vec(4, 2) dot.circle vec(1, 1) = vec(4, 2)
  $
  עכשיו
  $
    gradient h^2(W^2)_(i j) = delta_i^2 dot.op x_j^1 => gradient h(W^2) = delta^2 dot.op x^1^t = vec(4, 2) (1,0,2) = mat(4, 0, 8; 2, 0, 4)
  $
]

#subquestion()
נחשב את $delta^1 = gradient g^1(W^1x^0)$ ואת $gradient h^1(W^1)$.
#solution[
  נשים לב שמתקיים
  $ (W^2)^t delta^2 = mat(0, 1; -1, 4; 1, 1) vec(4, 2) = vec(2, 4, 6) $
  ומהגדרת $relu'(t)$ עם סעיף א' מתקיים
  $ (D alpha^1)z^1 = D relu(vec(1, -2, 2)) = mat(1, 0, 0; 0, 0, 0; 0, 0, 1) $
  ולכן
  $ delta^1 = (D alpha^1)z^1 dot.op (W^2)^t delta^2 = mat(1, 0, 0; 0, 0, 0; 0, 0, 1) vec(2, 4, 6) = vec(2, 0, 6) $
  ואז כמו בסעיף א'
  $ gradient h^1 (W^1) = delta^1 dot.op (x^0)^t = vec(2, 0, 6) (1,2) = mat(2, 4; 0, 0; 6, 12) $
]

#question()
תהיי $A subset.eq RR^k$ ו־$gamma:[0,1] arrow.r A$ מסילה הגזירה ב־$(0,1)$ כך ש־$gamma(0)=gamma(1)$ (מסילה סגורה).

#subquestion()
נוכיח כי לכל $v in RR^k$ קיים $t in (0,1)$ כך ש־$v$ אורתוגונלי ל־$gamma'(t)$.
#proof[
  יהי $v in RR^k$ ונגדיר $g : [0,1] arrow.r RR$ על־ידי $g(t) = angle.l gamma(t), v angle.r$.\
  נגדיר $h(x) = angle.l x, v angle.r$ זו פונקציה לינארית ב־$x$ ולכן גזירה בכל מקום, ומתקיים $g(t) = h(gamma(t))$.\
  $g$ גזירה בקטע $(0,1)$ כהרכבה של פונקציות גזירות (ורציפה בקטע $[0,1]$ כהרכבה של פונקציות רציפות).\
  מהנתון שמתקיים $gamma(0) = gamma(1)$ נקבל שבפרט מתקיים $g(0)=g(1)$ מהגדרת המכפלה הפנימית.\
  ממשפט רול קיימת $t in (0,1)$ כך ש־$g'(t)=0$, ולכן מכלל השרשרת מתקיים
  $ 0 = g'(t) = D h_gamma(t) compose gamma'(t) = angle.l gamma'(t), v angle.r $
  ולכן עבור ה־$t$ שמשפט רול מביא לנו נקבל ש־$gamma'(t)$ ו־$v$ אורתוגונליים.

]

#subquestion()
נוכיח כי קיים $t in (0,1)$ כל ש־$gamma(t)$ אורתוגונלי ל־$gamma'(t)$.
#proof[
  במטלה הקודמת הראנו שמתקיים עבור $f,g : A subset.eq RR^k arrow.r RR^m$ מתקיים ש־$angle.l f, g angle.r : A arrow.r RR$ היא גזירה עם נגזרת הנתונה על־ידי
  $ D(angle.l f, g angle.r)_x = angle.l D f_x, g(x) angle.r + angle.l f(x), D g_x angle.r $
  ולכן נגדיר $g(t) = angle.l gamma(t), gamma(t) angle.r = norm(gamma(t))^2$.\
  כמקודם, $g$ גזירה בקטע$(0,1)$ כהרכבה של פונקציות גזירות (במטלה הקודמת ראינו גם שהנורמה גזירה בכל נקודה) ורציפה בקטע$[0,1]$ כהרכבת פונקציות רציפות.\
  מתקיים כל תנאי משפט רול ולכן קיימת $t in (0,1)$ כך שיתקיים
  $ 0 = g'(t) = 2 angle.l gamma'(t), gamma(t) angle.r $
  כשהנגזרת חושבה מהתרגיל הקודם + כלל שרשרת (ותכונות המכפלה הפנימית ללינאריות).\
  בנקודה $t$ שמשפט רול מביא לנו נקבל ש־$gamma'(t)$ ו־$gamma(t)$ אורתוגונליים.
]

#subquestion()
נוכיח כי לכל פונקציה גזירה $f : A arrow.r RR$ קיים $t in (0,1)$ כך ש־$gradient f(gamma(t))$ אורתוגונלי ל־$gamma'(t)$.
#proof[
  נגדיר $g(t) = f(gamma(t))$ וכמקודם זו הרכבה של פונקציות גזירות בקטע $(0,1)$ ורציפות בקטע $[0,1]$ ולכן גזירה ורציפה בקטעים האלו בהתאמה. \
  נשים לב שמתקיים
  $ g(0) = f(gamma(0)), g(1) = f(gamma(1)) $
  אבל $gamma$ מסילה סגורה ולכן $g(1)-g(0)=0$, ושוב מהפעלה של משפט ערך הממוצע ומשפט רול נקבל שקיימת $t in (0,1)$ כך שמתקיים $g'(t) = 0$, אבל לפי כלל השרשרת מתקיים
  $ g'(t) = gradient f(gamma(t)) dot.op gamma'(t) $
  ומתקיים $gradient f(gamma(t)) dot.op gamma'(t) = 0$, אבל מכפלה סקלרית $0$ דהיינו שהם אורתוגונליים, משמע $gradient f$ ו־$gamma'(t)$ אורתחוגונליים.
]

#subquestion()
נסיק כי אם $f(gamma(t))=c$ לכל $t in [0,1]$ עבור $c in RR$ קבוע אז $gradient f(gamma(t))$ אורתוגונלי ל־$gamma'(t)$ לכל $t in (0,1)$.\
במילים אחרות, אם התמונה של $gamma$ מוכלת בקו־הגובה של $f^(-1){c}$ אז $gradient f(gamma(t))$ אורתוגונלי לישר המשיק ל־$gamma(t)$.
#proof[
  נשתמש ב־$g$ מהסעיף הקודם ומתקיים $g(t) = c$ עבור $c in RR$ קבוע. נגזור ולפי הסעיף הקודם נקבל ונקבל
  $ g'(t) = gradient f(gamma(t)) dot.op gamma'(t) = 0 = c' $
  וזה בידיוק אומר שלכל $t in (0,1)$ מתקיים ש־$gradient f(gamma(t))$ אורתוגונלי ל־$gamma'(t)$.
]

#question()
יהיו $A,B subset.eq RR^k$ פתוחות ו־$f: A arrow.r B$ פונקציה הפיכה כך ש־$f$ גזירה ב־$x in A$ ו־$f^(-1)$ גזירה ב־$f(x) in B$.\
נוכיח כי $D f_x$ הפיכה עם הופכית הנתונה על־ידי
$ (D f_x)^(-1) = (D f^(-1))_f(x) $
#proof[
  ראשית, $f$ הפיכה ולכן לכל $v in A$ מתקיים $f compose f^(-1) = f^(-1) compose f = I_k$ (כי $D f_x in M_(k times k)$).\
  נעבוד עם כלל השרשרת (כל התנאים ההכרחיים מתקיימים).\
  ראשית ניזכר שמתקיים $I_k = (D I_k)_x$, ולכן
  $
    I_k = (D I_k)_x = (D(f^(-1) compose f))_x = (D f^(-1))_f(x) compose D f_x \
    I_k = (D I_k)_x = (D(f compose f^(-1)))_x = D f_x compose (D f^(-1))_f(x)
  $
  משמע מצאנו ש־$D f_x$ הפיכה וההופכית נתונה על־ידי $(D f^(-1))_f(x)$.
]

#question()
תהיי $f : A subset.eq RR^k arrow.r RR^m$ פונקציה.
#subquestion()
נוכיח כי אם $f$ היא $M$־ליפשיצית וגזירה ב־$x in A$ אז $norm(D f_x)_"op" <= M$.
#proof[
  יהי $v in RR^k$ וקטור יחידה.\
  $f$ דיפרנציאבילית ב־$x in A$ ולכן כל הנגזרות הכיווניות קיימות ובפרט קיימות בכיוון $v$ ומתקיים
  $
    norm(D f_x (v)) = norm(partial_v f(x)) = norm(lim_(t arrow.r 0) (f(x+t v)- f(x)) / t) <=_("ליפשיציות") lim_(t arrow.r 0) (M norm(t v)) / abs(t) = lim_(t arrow.r 0) abs(t) / abs(t) C norm(v) =_(norm(v)=1) C
  $
  ולכן
  $ norm(D f_x)_"op" = sup_(norm(v) = 1) abs(D f_x (v)) <= C $
]

#subquestion()
נניח כי $A$ היא פתוחה וקמורה, כלומר לכל $x,y in A$ מתקיים
$ [x,y] colon.eq {(1-t)x + t y bar t in [0,1]} subset.eq A $
נוכיח כי אם $f$ גזירה ב־$A$ אז מתקיים
$ sup{norm(D f_x)_"op" mid(bar) x in A}=inf { M>0 mid(bar) "־ליפשיצית"M "היא" f} $
כאשר המוסכמה היא ש־$inf emptyset = infinity$.
#proof[
  מסעיף א' אנחנו מקבלים שמתקיים $sup_(x in A) norm(D f_x)_"op" <= inf { M > 0 mid(bar) "־ליפשיצית"M "היא" f }$ ונראה את ההכלה בכיוון השני: \
  נגדיר $v = y-x$. מהיות $A$ קמורה ש־$[x,y] subset.eq A$ ונגדיר $h : [0,1] arrow.r RR^n$ על־ידי $f(x+t v)$ שגזירה ורציפה מכך ש־$f$ גזירה ורציפה.\
  ממשפט ערך הממוצע של הנגזרת נקבל שמתקיים עבור $t_0 in (0,1)$
  $ h(1)-h(0) = f(y)-f(x) = h'(t_0) $
  אבל
  $ h'(t_0) = partial / (partial t) f(x+t v) = D f_(x + t v) (v) $
  ולכן
  $ f(y) - f(x) = D f_(x + t_0 v) (v) $
  אבל מתקיים לפי מה שראינו
  $
    norm(f(y)-f(x)) = D f_(x + t_0 v) (v)<= norm(D f_(x + t_0 v))_"op" dot.op norm(v) norm(D f_(x + t_0 v))_"op" dot.op norm(x-y)
  $
  ולכן $f$ היא $M$־ליפשיצית עם $M = sup_(x in A) norm(D f_x)_"op"$.\
  קיבלנו הכלה דו־כיוונית ולכן יש שיוויון.
]

#question()
תהיי $f : RR^2 arrow.r RR$ הנתונה על־ידי
$ f(x,y) = mycases((x^3y-x y^3) / (x^2 + y^2), (x,y)!=(0","0), 0, (x,y)=(0","0)) $
נוכיח כי הנגזרות החלקיות מסדר שני של $f$ קיימות בראשית אבל $f$ איננה גזירה פעמיים בראשית.
#proof[
  ראשית, נשים לב ש־$f$ רציפה בראשית:
  $
    lim_((x,y) arrow.r (0,0)) (x^3y-x y^3) / (x^2 + y^2) =_"קורדינאטות קוטביות" lim_(r arrow.r 0) ((r cos(theta))^3 r sin(theta) - (r sin(theta))^3 (r cos(theta))) / ((r cos(theta))^2 + (r sin(theta))^2)
    \ =_(cos(theta)^2+sin(theta)^2=1) lim_(r arrow.r 0) (r^4 (cos(theta)^3 sin(theta) - sin(theta)^3 cos(theta))) / r^2 = lim_(r arrow.r 0) r^2 (cos(theta)^3 sin(theta) - sin(theta)^3 cos(theta))=0
  $
  נראה שהנגזרות החלקיות מסדר ראשון קיימות:
  $
    (partial f) / (partial x) = (-y^5+4x^2y^3+x^4y) / (x^2+y^2)^2 \
    (partial f) / (partial y) = (x^5-4x^3y^2-x y^4) / (x^2+y^2)^2
  $
  בנקודה $(0,0)$, נחשב את הנגזרות החלקיות ישירות מהגדרה כגבול:
  $
    (partial f) / (partial x) (0,0)= lim_(t arrow.r 0) (f(t,0)-f(0,0)) / t = 0 \
    (partial f) / (partial y) (0,0)= lim_(t arrow.r 0) (f(0,t)-f(0,0)) / t = 0
  $
  נראה שהנגזרות החלקיות רציפות ולכן $f$ דיפרנציאבילית פעם אחת (לפחות), נשים לב שהנגזרות החלקיות "סימטריות" עד־כדי הוצאת $(-1)$ גורם משותף (אין משמעות להאם זה $x^5$ או $y^5$ לרציפות), ולכן מספיק שנבדוק רציפות של נגזרת חלקית אחת ונקבל מכך גם את של הנגזרת החלקית השנייה:
  $
    lim_((x,y) arrow.r 0) (-y^5+4x^2y^3+x^4y) / (x^2+y^2)^2 =_("קורדינאטות קוטביות")= ((-r sin(theta))^5+4(r cos(theta))^2(r sin(theta))^3 + (r cos(theta))^4(r sin(theta))) / ((r cos(theta))^2+(r sin(theta))^2)^2
    \ =_(cos(theta)^2+sin(theta)^2=1) lim_(r arrow.r 0) (-r^5)(sin(theta))^5+ / r^4 = lim_(r arrow.r 0) -r cos(theta)^2(-1 + 4sin(theta)+cos^2(theta)sin(theta)) = 0
  $
  אז $f$ דיפרנציאבילית בכל נקודה.\
  עבור הנגזרות השניות נבדוק בראשית ישירות מהגדרת הגבול ונשתמש בגבול לעיל ובנגזרות החלקיות מסדר ראינו שחישבנו בראשית:
  $
    (partial^2 f) / (partial x^2) (0,0) = lim_(t arrow.r 0) ((partial f) / (partial x)(t,0)-(partial f) / (partial x)(0,0)) / t = 0, space
    (partial^2 f) / (partial y^2) (0,0) = lim_(t arrow.r 0) ((partial f) / (partial y)(0,t)-(partial f) / (partial y)(0,0)) / t = 0, \
    (partial^2 f) / (partial x partial y) (0,0) = lim_(t arrow.r 0) ((partial f) / (partial x)(0,t)-(partial f) / (partial x)(0,0)) / t = lim_(t arrow.r 0) ((-t^5) / t^4) / t = -1, space
    (partial^2 f) / (partial y partial x) (0,0) = lim_(t arrow.r 0) ((partial f) / (partial y)(t,0)-(partial f) / (partial y)(0,0)) / t = lim_(t arrow.r 0) (t^5 / t^4) / t = 1
  $
  זאת אומרת, הנגזרות החלקיות קיימות אבל $(partial^2 f) / (partial x partial y) (0,0) != (partial^2 f) / (partial y partial x) (0,0)$.\
  כעת, ניזכר שאם $f$ דיפרנציאבילית פעמיים, הנגזרות החלקיות השניות המעורבות שלה אמורות להיות זהות – שכן פונקציות שדיפרנציבאליות פעמיים מניבות לנו מטריצה סימטרית (למטריצת הנגזרות השניות) (זה נובע גם ממשפט קלרו שהוזכר בתרגול).\
  לכן הנגזרות החלקיות מסדר שני של $f$ קיימות בראשית אבל $f$ איננה גזירה פעמיים בראשית.
]
