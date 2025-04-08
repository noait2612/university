#import "../../../../src/article.typ": *
#show: article.with(
	title: [ פתרון מטלה 02 --- מבנים אלגבריים 2, 80446 ],
	author: [ ],
	signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]]
)

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("Ker")
#let deg = math.op("deg")

#question()
יהי $K subset.eq CC$ שדה שאינו מוכל ב־$RR$. נראה שלא בהכרח שמתקיים $[K : K inter RR] = 2$.
#proof[
נבחן את $K = QQ(i, root(4,2))$ ובבירור $K subset.eq.not RR$, אבל $root(4,2) in K ==> sqrt(2) = (root(4,2))^2 in RR$, ולכן $K inter RR = Q(sqrt(2))$.
נשאר לחשב את $[K : K inter RR] = [K : QQ(sqrt(2))]$. \
היות ו־$i in QQ$ נובע שנצטרך להוסיף ל־$[ K: QQ(sqrt(2))]$ 2.
נראה כי $root(4,2) in.not QQ(sqrt(2))$ ונמצא את הפולינום המינימלי של $root(4,2)$ מעל $QQ(sqrt(2))$: \
נראה כי $root(4,2) in.not QQ(sqrt(2))$: נניח שכן, ולכן $root(4,2) = {a+b sqrt(2) bar a, b in QQ}$, אז מתקיים
$ root(4,2) = a+b sqrt(2) <==> sqrt(2) = (a+b sqrt(2))^2 = a^2 + 2a b sqrt(2) + 2b^2 $
ולכן $ a^2+2b^2 = 0 <==> a=0 and b=0 \ 2a b = 1 <==> a b = 1/2 $ 
וקיבלנו כמובן סתירה ולכן $root(4,2) in.not QQ(sqrt(2))$. \
אנחנו כבר יודעים כי הפולינום המינימלי ב־$QQ(sqrt(2))$ הוא $x^2-sqrt(2)$ והוא כמובן מדרגה 2.\
 מכפליות הדרגה קיבלנו בסה"כ ש־$[K : QQ(sqrt(2))] = 4$ ולכן תחת תנאי השאלה לא בהכרח שמתקיים $[K : K inter RR] = 2$.
]

#question()
#subquestion()
עבור $alpha = sqrt(3) + sqrt(7)i in CC$, נמצא את $f_(alpha slash QQ) (x)$, הפולינום המינימלי של $alpha$ מעל $QQ$.
#solution[
$ alpha = sqrt(3) + sqrt(7)i <==> alpha - sqrt(3) = sqrt(7)i <==> (alpha - sqrt(3))^2 = -7 <==> (alpha - sqrt(3))^2+7=0 <==> alpha^2-2 sqrt(3) alpha + 10 = 0 \ <==> a^2 + 10 = 2sqrt(3) alpha <==> (a^2+10)^2 = (2sqrt(3) alpha)^2 <==> alpha^4 +20 alpha^2 + 100 = 12 alpha^2 <==> alpha^4 + 8 alpha^2 + 100 = 0 $
ולכן נסמן $f_(alpha slash QQ)(x) = x^4 + 8 x^2 + 100$ ונראה כי הוא אכן הפולינום המינימלי של $alpha$ מעל $QQ$. \
על־מנת שנגיד כי $f_(alpha slash QQ)(x)$ הוא הפולינום המינימלי, עלינו להראות כי מתקיימים שלושת התנאים הבאים: \
1. צריך להתקיים $f_(alpha slash QQ)(alpha) = 0$, ואכן:
	$ alpha^4 + 8 alpha^2 + 100 = 0 ==> (sqrt(3)+sqrt(7)i)^4 + 8(sqrt(3)+sqrt(7)i)^2 + 100 = 16-cancel(16sqrt(3)sqrt(7)i)-84 -32 + cancel(16sqrt(3)sqrt(7)i) + 100 = 0 $
2. הוא אכן פולינום מתוקן – המקדם של $x^4$ הוא $1$
3. נשאר להראות שהוא אי־פריק: בשביל זה נחשב את $[QQ(sqrt(3), sqrt(7)i) : QQ]$:\
	$ [QQ(sqrt(3),sqrt(7)i): QQ] = [QQ(sqrt(3),sqrt(7)i) : QQ(sqrt(3))] dot.op [QQ(sqrt(3)) : QQ] $
	את $[QQ(sqrt(3)) : QQ]$ אנחנו יודעים לחשב שכן הפולינום המינימלי במקרה זה הוא $x^2-3$ ולכן $[QQ(sqrt(3)) : QQ] = 2$. \
	גם את $[QQ(sqrt(3),sqrt(7)i) : QQ(sqrt(3))]$ אנחנו יודעים לחשב: ראינו שהפולינום $x^2+7$ ללא שורש וללא פירוק ב־$QQ(sqrt(3))$ ולכן זהו הפולינום המינימלי של $sqrt(7)i$ מעל $QQ(sqrt(3))$ והוא $[QQ(sqrt(3),sqrt(7)i) : QQ(sqrt(3))]=2$.\
	ולכן $ [QQ(sqrt(3),sqrt(7)i): QQ] = [QQ(sqrt(3),sqrt(7)i) : QQ(sqrt(3))] dot.op [QQ(sqrt(3)) : QQ] = 4 $
	ומכיוון שהפולינום שמצאנו הוא ממעלה $4$ ומקיים את התנאים לעיל, מיחידות הפולינום המינימלי נוכל להסיק כי בהכרח הפולינום שמצאנו הוא אי-פריק.
ולכן $f_(alpha slash QQ)(x) = x^4 + 8 x^2 + 100$ הוא הפולינום המינימלי הנדרש.
]

#pagebreak()
#subquestion()
יהי $d in NN$ מספר טבעי שאינו חזקה שלילית של מספר רציונלי ויהיו $0!=s, t in QQ$.\
נסמן ב־$alpha = root(3, d) in CC$ את אחד השורשים השלישיים של $d$. \
עבור $beta = s alpha + t alpha^2$ נביע את הפולינום המינימלי של $display(f_(beta slash QQ))$ של $beta$ מעל $QQ$ באמצעות $d,s,t$.
#solution[]

#question()
#subquestion()
יהי $f in QQ[x]$ ונסמן $f(x) = a_n x^n + ... + a_1 x + a_0$. \
נראה שאם $display(r/s in QQ)$ שורש של $f$ אז $s divides a_n$ וגם $r divides a_0$.
#proof[]

#subquestion()
נסביר כיצד להשתמש בסעיף הקודם ובשאלה 4 מהתרגיל הקודם כדי לבדוק ש־$f in QQ[x]$ נתון מדרגה 2 או 3 הוא אי־פריק.\
נבצע בדיקה זו לפולינומים הבאים:
1. $f(x) = x^3-d x+2$
2. $f(x) = x^3-4x^2+3x+3$
#solution[]

#question()
תהיי $E slash F$ הרחבת שדות ויהי $f in F[x]$ אי־פריק כך ש־$L = F[x] slash (f)$ הוא שדה. \
נסמן ב־$alpha$ את התמונה של $x$ ב־$L$, משמע $a = x + (f) in L$. \
נניח שנתון $F$־הומומורפיזם $phi : L arrow.r E$ משמע הומומורפיזם המקיים $phi harpoon.tr_F = id_F$.

#subquestion()
נוכיח ש־$phi(alpha) in E$ הוא שורש של $f in F[x] subset.eq E[x]$.
#proof[]

#subquestion()
נוכיח שאם $psi : L arrow.r E$ הוא $F$־הומומורפיזם נוסף כך ש־$psi(alpha) = phi(alpha)$ אזי $psi = phi$.
#proof[]

#question()
בשאלה זו נבנה הרחבת שדות $E slash QQ$ כך ש־$[E: QQ]=3$ אבל אין $d in QQ$ כך ש־$E tilde.eq.rev QQ(root(3,d))$.

#subquestion()
יהי $d in QQ$ שאינו חזקה שלישית של מספר רציונלי. נוכיח שקיים הומומורפיזם $phi: QQ(root(3,d)) arrow.r CC$ כך ש־$im(phi) subset.eq.not RR$.
#proof[]

#subquestion()
יהי $f in QQ[x]$ אי־פריק מדרגה $3$ כך ששלושת השורשים של $f$ הם ממשיים ואי־רציונליים. \
נראה ש־$L = QQ[x] slash (f)$ שדה כך ש־$[L:QQ]=3$ ושאם $phi : L arrow.r CC$ הומומורפיזם אזי $im(phi) subset.eq RR$.
#proof[]

#subquestion()
נוכיח ש־$f(x) = x^3-4x+2$ פולינום המקיים את התנאים של הסעיף הקודם ונסיק ש־$E = QQ[x] slash (f)$ הרחבה מדרגה 3 של $QQ$ שאינה איזומורפית לשדה מהצורה $QQ(root(3,d))$.
#proof[]