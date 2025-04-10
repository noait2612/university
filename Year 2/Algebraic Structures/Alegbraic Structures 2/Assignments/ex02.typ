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
נבחן את $K = QQ(i, sqrt(2)i) = QQ(i, sqrt(2))$ ובבירור $K subset.eq.not RR$ וכן $K inter RR = QQ$.
נשאר לחשב את $[K : K inter RR] = [K : QQ]$. \
נסתכל על מגדל ההרחבות
$ [K : QQ] = [QQ(i, sqrt(2)) : QQ ] dot.op [QQ(sqrt(2)) : QQ] $
כאשר אנחנו כבר יודעים $ [QQ(sqrt(2)) : QQ] = 2 $
וגם $ [QQ(i, sqrt(2) : QQ(sqrt(2)))] = 2 $
שכן הפולינום $x^2+1 = 0$ אי־פריק (אין $a+b sqrt(2) in QQ(sqrt(2))$ כך שהריבוע שלו הוא $-1$). \
ולכן מכפליות הדרגה נקבל
$ [K : QQ] = [QQ(i, sqrt(2)) : QQ ] dot.op [QQ(sqrt(2)) : QQ] = 4 != 2 $
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
יהי $d in NN$ מספר טבעי שאינו חזקה שלישית של מספר רציונלי ויהיו $0!=s, t in QQ$.\
נסמן ב־$alpha = root(3, d) in CC$ את אחד השורשים השלישיים של $d$. עבור $beta = s alpha + t alpha^2$ נביע את הפולינום המינימלי של $display(f_(beta slash QQ))$ של $beta$ מעל $QQ$ באמצעות $d,s,t$.
#solution[
$ beta = s alpha + t alpha^2 <==> beta^3 &= (s alpha + t alpha^2)^3 \
&= s^3 alpha^3 +3s^2 alpha^4t +3t^2s alpha^5 + t^3alpha^6 \ 
&= alpha^3 (s^3+alpha^3 t^3) + 3 t s alpha^3 (s alpha + t alpha^2) \ 
&= d(s^3 + d t^3) + 3 t s d (s alpha + t alpha^2) $
ולכן
$ (s alpha + t alpha^2)^3 - (d(s^3 + d t^3) + 3 t s d (s alpha + t alpha^2)) = 0 $
משמע הפולינום $p(x) = x^3 - 3 x t s d (s alpha + t alpha^2) - d(s^3 + d t^3)$ מאפס את $beta$, וזהו פולינום מתוקן ולכן אם נשאר להראות שהוא אי־פריק: נשים לב כי $beta = s alpha + t alpha^2 in QQ(alpha)$ ומכך ש־$QQ(alpha)$ היא הרחבה מדרגה 3 (כי הפולינום המינימלי הוא $x^3-d$) אזי הדרגה של הפולינום המינימלי של $beta$ מעל $QQ$ היא לכל היותר $3$. נטען שהיא בידיוק $3$: \
נניח שהדרגה של $beta$ היא 1, ולכן $beta in QQ$ ואז $beta = s alpha + t alpha^2 in QQ$ משמע $t alpha^2 + s alpha - beta =0$ הוא פיתרון למשוואה ריבועית וזו סתירה להיות $x^3-d$, הפולינום המינימלי ב־$QQ(alpha)$. \
אם הדרגה של $beta$ היא 2, ומכך ש־$beta in QQ(alpha)$ נקבל את שרשרת ההכלות
$ QQ subset.eq QQ(beta) subset.eq QQ(alpha) $
ומכפליות הדרגה נקבל
$ [QQ(alpha) : QQ] =[QQ(alpha) : QQ(beta)] dot.op [QQ(beta) : QQ] ==> [QQ(alpha) : QQ(beta)] = 3/2 $
וזו כמובן סתירה (דרגה היא מספר טבעי), ולכן $[QQ(beta): QQ] = 3$. \
מצאנו פולינום מתוקן, שמתאפס בהצבה של $beta$ והוא מהדרגה של הפולינום המינימלי ולכן $ p(x) = x^3 - 3 x t s d (s alpha + t alpha^2) - d(s^3 + d t^3) $ הוא הפולינום המינימלי של $display(f_(beta slash QQ))$ של $beta$ מעל $QQ$ באמצעות $d,s,t$.
]

#question()
#subquestion()
יהי $f in QQ[x]$ ונסמן $f(x) = a_n x^n + ... + a_1 x + a_0$. \
נראה שאם $display(r/s in QQ)$ שורש של $f$ אז $s divides a_n$ וגם $r divides a_0$.
#proof[
בלי הגבלת הכלליות נניח כי $display(r/s in QQ)$ הוא שבר מצומצם ונניח כי $display(r/s in QQ)$ הוא שורש של $f$, משמע $display(f(r/s)=0)$ ולכן:
$ f(r/s) = a_n (r/s)^n + a_(n-1) (r/s)^(n-1) + ... + a_1 (r/s) + a_0 = 0 \
<==> a_n r^n + a_(n-1) r^(n-1) s + ... + a_1 r s^(n-1) + a_0 s^n = 0 \
<==> r(a_n r^(n-1) + a_(n-1) s r^(n-1) + ... + a_1 s^(n-1)) = -a_0 s^n $
משמע $r$ מחלק את $a_0 s^n$ אבל $gcd(r,s) = 1$ ולכן גם $gcd(r, s^n) = 1$
ולכן $r$ מחלק את $a_0$. \
באותו אופן, מתקיים: 
$ f(r/s) = a_n (r/s)^n + a_(n-1) (r/s)^(n-1) + ... + a_1 (r/s) + a_0 = 0 \ 
<==> a_n r^n + a_(n-1) r^(n-1) s + ... + a_1 r s^(n-1) + a_0 s^n = 0 \
<==> s(a_(n-1)r^(n-1) + a_(n-2) s r^(n-2) ... + a_0 s^(n-1)) = -a_n r^n $
משמע $s$ מחלק את $a_n r^n$ אבל $gcd(r,s) = 1$ ולכן גם $gcd(s, r^n) = 1$
ולכן $s$ מחלק את $a_n$. \
]

#subquestion()
נסביר כיצד להשתמש בסעיף הקודם ובשאלה 4 מהתרגיל הקודם כדי לבדוק ש־$f in QQ[x]$ נתון מדרגה 2 או 3 הוא אי־פריק.\
נבצע בדיקה זו לפולינומים הבאים:
1. $f(x) = x^3-4x+2$
2. $f(x) = x^3-4x^2+3x+3$
#solution[
לפי האלגוריתם בסעיף הקודם נוכל לקבוע האם קיימים לפולינום (מתוקן) מדרגה 2 או 3 שורשים ואם כן מה הם. אם לא נמצא לו שורשים, בשאלה 4 במטלה הקודמת הראינו שאם לפולינום מדרגה זו אין שורשים ($forall alpha in QQ, space f(alpha)!=0$) אז הוא ראשוני ולכן אי־פריק (כי תחום ראשי).\
ניישם את התהליך עבור הפולינומים הנתונים:
1. $f(x) = x^3-4x+2$ \
	במקרה זה, $a_n = 1$ ו־$a_0 = 2$ ולכן $r in {plus.minus 1, plus.minus 2}$ ו־$s = 1$.
	נציב ונראה כי אף אחד מהם לא שורש של הפולינום:
	1. $r = s = 1$ ואז $ f(r/s) = f(1) = 1^3-4 dot.op 1 + 2 = -1 != 0 $
	2. $r = -1 "," space s=1$ ואז $ f(r/s) = f(-1) = (-1)^3-4 dot.op (-1) + 2 = 5!=0 $
	3. $r = 2 "," space s=1$ ואז $ f(r/s)= f(2) = 2^3-4 dot.op 2 +2 = 2!=0 $
	4. $r = -2 "," space s=1$ ואז $ f(r/s) = f(-2) = (-2)^3 -4 dot.op (-2) +2 = 2!=0 $ 
	מצאנו שאין ל־$f$ שורשים ולכן $f$ אי־פריק לפי האלגוריתם.
2. $f(x) = x^3-4x^2+3x+3$
	במקרה זה, $a_n = 1$ ו־$a_0 = 3$ ולכן $r in {plus.minus 1, plus.minus 3}$ ו־$s = 1$.
	נציב ונראה כי אף אחד מהם לא שורש של הפולינום:
	1. $r = s = 1$ ואז $ f(r/s) = f(1) = 1^3-4 dot.op 1^2  + 3 dot.op 1+ 3 = 3 != 0 $
	2. $r = -1 "," space s=1$ ואז $ f(r/s) = f(-1) = (-1)^3-4 dot.op (-1)^2  + 3 dot.op (-1)+ 3 = -5 != 0 $
	3. $r = 3 "," space s=1$ ואז $ f(r/s) = f(1) = 3^3-4 dot.op 3^2  + 3 dot.op 3+ 3 = 3 != 0 $
	4. $r = -3 "," space s=1$ ואז $ f(r/s) = f(1) = (-3)^3-4 dot.op (-3)^2  + 3 dot.op (-3)+ 3 = -69 != 0 $ 
	מצאנו שאין ל־$f$ שורשים ולכן $f$ אי־פריק לפי האלגוריתם.
]

#question()
תהיי $E slash F$ הרחבת שדות ויהי $f in F[x]$ אי־פריק כך ש־$L = F[x] slash (f)$ הוא שדה. \
נסמן ב־$alpha$ את התמונה של $x$ ב־$L$, משמע $a = x + (f) in L$. \
נניח שנתון $F$־הומומורפיזם $phi : L arrow.r E$ משמע הומומורפיזם המקיים $phi harpoon.tr_F = id_F$.

#subquestion()
נוכיח ש־$phi(alpha) in E$ הוא שורש של $f in F[x] subset.eq E[x]$.
#proof[
נגיד ש־$phi(alpha) in E$ הוא שורש של $f in F[x] subset.eq E[x]$ אם מתקיים $f(phi(alpha))=0$. \
נגדיר $pi: F[x] arrow.r L$ הומומורפיזם ההטלה $pi(a) = a + (f)$, ונשים לב שמתקיים:
$ f(phi(alpha)) = sum_(i=0)^n a_i phi(alpha)^i = phi(sum_(i=0)^n a_i alpha^i) = phi compose pi (sum_(i=0)^n a_i x^i) = phi(pi(f)) = phi(0) = 0 $
]

#subquestion()
נוכיח שאם $psi : L arrow.r E$ הוא $F$־הומומורפיזם נוסף כך ש־$psi(alpha) = phi(alpha)$ אזי $psi = phi$.
#proof[
במטלה הקודמת ראינו שקיים $F$־הומומורפיזם יחיד כך ש־$sigma : F[x] arrow.r F[alpha]$ המוגדר על־ידי $sigma(x) = alpha$. \
נבחן תחילה את $phi compose pi$ כאשר $pi$ כמו בסעיף הקודם $pi: F[x] arrow.r L$ הומומורפיזם ההטלה $pi(a) = a + (f)$. \
יהי $beta in F[x]$, מתקיים:
$ (phi compose pi)(beta) = phi(beta + (f)) = phi(beta(alpha)) = beta(phi(alpha)) $
נשים לב כי ההרכבה $phi compose pi$ היא אכן $F$־הומומורפיזם, שכן הרכבה של הומומורפיזמים היא הומומורפיזם ועבור $c in F subset.eq F[x]$ מתקיים\  $(phi compose pi)(c) = phi(c+(f))=c$ ולכן $phi compose pi$ הוא $F$־הומומורפיזם מ־$F[x]$ ל־$F[alpha]$. \
מההנחה כי $psi(alpha) = phi(alpha)$ נובע גם כי $psi(pi(alpha)) = phi(pi(alpha))$ אבל $psi(pi(alpha))$ משמע גם $psi compose pi$ הוא $F$־הומומורפיזם מ־$F[x]$ ל־$F[alpha]$ ולכן מהיחידות שמצאנו במטלה הקודמת נקבל כי $psi = phi$.
]

#question()
בשאלה זו נבנה הרחבת שדות $E slash QQ$ כך ש־$[E: QQ]=3$ אבל אין $d in QQ$ כך ש־$E tilde.eq.rev QQ(root(3,d))$.

#subquestion()
יהי $d in QQ$ שאינו חזקה שלישית של מספר רציונלי. נוכיח שקיים הומומורפיזם $phi: QQ(root(3,d)) arrow.r CC$ כך ש־$im(phi) subset.eq.not RR$.
#proof[
אנחנו יודעים שמעל $CC$ הפולינום $x^3-d$ מתפרק לשלושה שורשים שונים, כאשר $root(3,d) in RR$ הוא השורש היחידי שממשי והשאר הם מעל המרוכבים, מדה־מואבר אנחנו יודעים שמתקיים $ root(3,d) = {abs(root(3,d^k)) dot.op e^((2pi i + 2pi k)/3) bar k in {0,1,2} } $
אז נגדיר את $phi: QQ(root(3,d)) arrow.r CC $ על־ידי:
$ phi(1) = 1, space phi(root(3,d)) = e^((2pi i + 2pi k)/3), space phi(root(3,d^2)) = e^((2pi i + 4pi)/3) $
אנחנו יודעים שהדרגה של ההרחבה היא $3$ וכן שהבסיס שלה הוא ${1, root(3,d), root(3,d^2)}$ ומכיוון ש־$phi$ הומומורפיזם של שדות מוגדר לפי איברי הבסיס ולכן משמר את תכונות ההומומורפיזם ובבירור $im(phi) subset.eq.not RR$ שכן התמונה מכילה מספרים מרוכבים.
]

#subquestion()
יהי $f in QQ[x]$ אי־פריק מדרגה $3$ כך ששלושת השורשים של $f$ הם ממשיים ואי־רציונליים. \
נראה ש־$L = QQ[x] slash (f)$ שדה כך ש־$[L:QQ]=3$ ושאם $phi : L arrow.r CC$ הומומורפיזם אזי $im(phi) subset.eq RR$.
#proof[
$QQ[x]$ הוא תחום ראשי ובתחום ראשי איבר הוא אי־פריק אממ האידיאל שהוא יוצר הוא אידיאל מקסימלי ולכן $(f)$ אידיאל מקסימלי ומטענה מהתרגול נובע כי $L = QQ[x] slash (f)$ הוא שדה. \ 
נראה כי דרגת ההרחבה היא אכן $3$: כל $x in L$ הוא מהצורה
$ r_0 + r_1 alpha + r_2 alpha^2, space r_i in QQ, alpha = x+(f)  $
ולכן הבסיס של ההרחבה הוא ${1, alpha, alpha^2}$ משמע $[L: QQ] = deg(f) = 3$. \
יהי $phi : L arrow.r CC$ הומומורפיזם ונראה כי $im(phi) subset.eq RR$: \ מכיוון שכל השורשים של $f$ הם אי־רציונליים והומומורפיזמים בין שדות משמרים את החיבור וכפל בשדה ובפרט משמרים שורשים, משמע אם $alpha$ הוא אחד משורשי $phi$ אזי $phi(f(alpha)) = f(phi(alpha)) = 0$ משמע $phi(alpha)$ הוא שורש של $f$ ב־$CC$ אבל כל השורשים הם ב־$RR without QQ$. \
כעת, נפעיל את ההומומורפיזם על האיבר הכללי של $L$ ונקבל
$ phi(x) = r_0 + r_1 phi(alpha) + r_2 phi(alpha^2) $
זהו כמובן סכום של איברים ב־$RR without QQ$ ולכן $im(phi) subset.eq RR$.
]

#subquestion()
נוכיח ש־$f(x) = x^3-4x+2$ פולינום המקיים את התנאים של הסעיף הקודם ונסיק ש־$E = QQ[x] slash (f)$ הרחבה מדרגה 3 של $QQ$ שאינה איזומורפית לשדה מהצורה $QQ(root(3,d))$.
#proof[
בשאלה 3 ראינו שהפולינום $f(x) = x^3-4x+2$ הוא אי־פריק וכמובן מדרגה $3$, נראה כי השורשים ממשיים: \
נשים לב ש־$f'(x) = 3x^2-4$ היא פרבולה שמתאפסת כאשר $x = plus.minus sqrt(4/3)$ ולכן אלו נקודות הקיצון של $f$. \
$f$ פולינום שמוגדר על כל $RR$ ולכן נחלק את הישר לשלושה חלקים בהתאם לאיפוס הנגזרת ונבחן מה קורה לנגזרת:
1. בקטע $( minus infinity, minus 2/sqrt(3))$ נבחר $x=-2$ ומתקיים $f'(2)=8 > 0$ ולכן $f$ עולה (ולכן גם $f(x) stretch(arrow.r)_(x arrow.r -infinity) -infinity$)

2. בקטע $(minus 2/sqrt(3), 2/sqrt(3))$ נבחר $x=0$ ומתקיים $f'(0)=-4 < 0$ ולכן $f$ יורדת

3. בקטע $(2/sqrt(3), infinity)$ נבחר $x=2$ ומתקיים $f'(2)=8 > 0$ ולכן $f$ עולה (ולכן גם $f(x) stretch(arrow.r)_(x arrow.r infinity) infinity$)
ואם נציב את הנקודות קיצון $f(sqrt(4/3)) = 2/sqrt(3) dot.op 4/3 - 4 dot.op 2/sqrt(3) + 2 = -16/sqrt(27)+2 < 0, f(-sqrt(4/3)) = 16/sqrt(27)+2 > 0$ וכמובן שהם ב־$RR without QQ$. \
ממשפט ערך הביניים נקבל שקיימים $x_1 < -16/sqrt(27)+2 < x_2 < 16/sqrt(27)+2 < x_3$ כך ש־$f(x_1)=f(x_2)=f(x_3)=0$ ולכן כל התנאים של סעיף ב' מתקיימים.\
נסיק ש־$E = QQ[x] slash (f)$ אינה איזומורפית לשדה מהצורה $QQ(root(3,d))$: מסעיף ב' נובע כי לכל $phi : QQ[x] slash (f) arrow.r CC$ מתקיים ש־$im(phi) subset.eq RR$. \
לו היה מתקיים $QQ[x] slash (f)tilde.eq.rev QQ(root(3,d))$ עבור $d in QQ$ היה נובע מסעיף א' כי $im(phi) subset.eq.not RR$ אבל $im(phi) subset.eq RR$ ולכן זו סתירה.
]