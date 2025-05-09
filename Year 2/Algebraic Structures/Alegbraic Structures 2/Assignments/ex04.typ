#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- מבנים אלגבריים 2, 80446 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("Ker")
#let deg = math.op("deg")

#question()
תהיי $L slash F$ הרחבת שדות ויהיו $g, h in F[x]$. נוכיח שה־$gcd$ של $g,h$ כאיברים של $L[x]$ (שמכיל את $F[x]$) זהה ל־$gcd$ שלהם ב־$F[x]$.
#proof[
  נסמן $ d = gcd(g, h) in F[x]\
  D = gcd(g, h) in L[x] $
  בכיוון הראשון, מתקיים $d(x) = a(x) g(x) + b(x) h(x)$, אבל $D$ מחלק את $g, h$ ולכן גם $D divides d$.\
  בכיוון השני, ב־$L[x]$, $d$ הוא פולינום שמחלק את $g, h$ ולכן מהגדרה הוא מחלק גם את ה־$gcd$ שלהם ולכן $d divides D$.\
  מצאנו שגם $d divides D$ וגם $D divides d$ ולכן $d=D$.
]

#question()
יהי $F$ שדה.
#subquestion()
תהיינה $f,g,h in F[x]$ ו־$c in F$.

#sub_subquestion()
נראה שמתקיימת הזהות $(g+h)' = g' +h'$.
#proof[
  נסמן $g = sum_(i=0)^n a_i x^i, h = sum_(j=0)^m b_j x^j$ ולכן $g' = sum_(i=1)^n i a_i x^(i-1), h' = sum_(j=1)^m j b_j x^(j-1)$ ואז $ g'+h' = sum_(i=1)^n i a_i x^(i-1)+sum_(j=1)^m j b_j x^(j-1) $
  מצד שני, מתקיים
  $
    (g+h)' = (sum_(k=0)^p (a_k + b_k)x^(k))'= sum_(k=1)^p k(a_k + b_k)x^(k-1) =_(star) sum_(i=1)^n i a_i x^(i-1) + sum_(j=1)^m j b_j x^(j-1) = g' + h'
  $
  כאשר $(star)$
  כאשר המעבר $star$ נובע מכך שחל מהאינדקסים, בפוטנציאל הם $0$.\
  מצאנו שאכן מתקיימת הזהות $(g+h)' = g' + h'$.
]

#sub_subquestion()
נראה שמתקיימת הזהות $(c dot.op g)' = c dot.op g'$.
#proof[
  נשים לב שמתקיים
  $ (c g)' = (sum_(i=0)^n c a_i x^i)' = sum_(i=1)^n i c a_i x^(i-1) = c sum_(i=1)^n i a_i x^(i-1) = c g' $
]

#sub_subquestion()
נראה שמתקיימת הזהות $(g dot.op h)' = g' dot.op h + g dot.op h'$
#proof[
  שוב נסמן
  $
    g = sum_(i=0)^n a_i x^i, wide
    h = sum_(j=0)^m b_j x^j
  $
  מצד אחד מתקיים
  $
    (g dot.op h)' = (sum_(i=0)^n a_i x^i sum_(j=0)^m b_j x^j)' = (sum_(i=0)^n sum_(j=0)^m a_i b_j x^(i+j))' =_((star)) sum_(k=1)^(n+m) k c_k x^(k-1)
  $
  כאשר $(star)$ נובע מהגדרת המכפלה בין טורים כאשר $c_k = sum_(i+j=k) a_i b_j$.
  מצד שני מתקיים
  $
    g' dot.op h + g dot.op h' = sum_(i=1)^n i a_i x^(i-1) dot.op h + g dot.op sum_(j=1)^m j b_j x^(j-1) = sum_(i=1)^n i a_i x^(i-1) dot.op sum_(j=0)^m b_j x^j + sum_(j=1)^m j b_j x^(j-1) dot.op sum_(i=0)^n a_i x^i \
    = sum_(i=1)^n sum_(j=0)^m i a_i b_j x^(i-1+j) + sum_(j=1)^m sum_(i=0)^n j a_i b_j x^(j-1+1) = sum_(k=1)^(m+n) (sum_(i+j=k+1) i a_i b_j)x^k + sum_(k=1)^(m+n) (sum_(i+j=k+1) j b_j a_i)x^k
    \ = sum_(k=1)^(m+n)(sum_(i+j=k+1) i a_i b_j + sum_(i+j=k+1) j b_j a_i)x^k = sum_(k=1)^(m+n)(sum_(i+j=k) (i+j)a_i b_j)x^k = sum_(k=1)^(m+n) k c_k x^(k-1) = (g dot.op h)'
  $
  כאשר האינדקס של $i+j=k$ זה סכימת כל הזוגות $(i,j)=k$ כאשר $1<=k<=m+n$ ו־$c_k$ כמקודם.
]

#pagebreak()

#subquestion()
נוכיח את המקרה הפרטי הבא של כלל לופיטל (L’Hôpital):\ אם $a in F$ הוא שורש של $g in F[x]$ כך ש־$g(x) = h(x) dot.op (x-a)$ אז $g'(a)=h(a)$.
#proof[
  ראשית, מההנחה ש־$a in F$ הוא שורש של $g$ נקבל ש־$(x-a) divides g$, ולכן קיימת $h(x) in F[x]$ כך שיתקיים $g(x) = h(x) dot.op (x-a)$.\
  מהסעיף הקודם נקבל שמתקיים $ g'(x) = (h(x) dot.op (x-a))' = h'(x)(x-a)+h(x)(x-a)' = h'(x)(x-a)+h(x) $ שכן הנגזרת של פולינום ממעלה $1$ הוא המקדם של האיבר המוביל ובמקרה שלנו זה $1$.\
  אבל $a$ הוא שורש של $g$, ולכן בהצבה נקבל
  $ g'(a) = h'(x)underbrace((a-a), 0)+h(a) = h(a) $
]

#question()
בכל סעיף נבדוק האם הפולינום הוא ספרבילי מעל $QQ$ ונמצא שורש כפול ב־$QQ$ במידה ויש כזה.
#subquestion()
הפולינום $f = x^3-3x+2$.
#solution[
  נשים לב ש־$f(1) = 1^3-3 dot.op 1 + 2 = 1$ ולכן $1$ הוא שורש של הפולינום $1$ ומתקיים $(x-1) divides f$.\
  נבחן מה הריבוי שלו ובשביל זה נבצע חלוקת פולינומים
  $ (x^3-3x+2) / (x-1) => x^2 + (x^2-3x+2) / (x-1) => x^2+x +(-2x+2) / (x-1) => x^2+x-2=(x-1)(x+2) $\
  משמע מתקיים $ x^3-3x+2 = (x-1)^2(x+2) = (x^2-2x+1)(x+2) = x^3+2x^2-2x^2-4x+x+2 = x^3-3x+2 $
  ולכן מצאנו ש־$(x-1)$ הוא שורש מרובה עם ריבוי $2$ ב־$f$ ולכן $f$ לא פולינום ספרבילי.
]

#subquestion()
הפולינום $f = x^3-7x+6$.
#solution[
  $f$ ממעלה $3$ ולכן ניתן להשתמש באלגוריתם ממטלה $2$ כדי לבחון אם יש לו שורשים. \
  נסמן $a_n = 1$ ו־$a_1 = 6$, ולכן $s=1, r in {plus.minus 1, plus.minus 3, plus.minus 2}$, נבחן את כל המקרים האפשריים
  + $r = s = 1$ ואז
    $ f(r / s) = f(1) = 1^3- 7 dot.op 1 + 6 = 1-7+6 = 0 $
  + $s=1, r=-1$ ואז
    $ f(r / s) = f(-1) = (-1)^3 - 7 dot.op (-1) + 6 = -1 + 7 +6 = 12 != 0 $
  + $s=1, r=2$
    $ f(r / s) = f(2) = 2^3 - 7 dot.op 2 + 6 = 8-14+6 = 0 $
  + $s=1, r=-2$
    $ f(r / s) = f(-2) = (-2)^3 - 7 dot.op (-2) + 6 = -8+14+6 = 12 != 0 $
  + $s=1, r=3$
    $ f(r / s) = f(3) = 3^3 - 7 dot.op 3 + 6 = 27-21+6 = 12 != 0 $
  + $s=1, r=-3$
  $ f(r / s) = f(-3) = (-3)^3 - 7 dot.op (-3) + 6 = -27+14+6 = 0 $
  ולכן ${1, 2, -3}$ הם קבוצת השורשים של $f$, שכן $f$ ממעלה $3$ ולכן יש לו לכל היותר $3$ שורשים. עוד מתקיים
  $ (x-1)(x-2)(x+3) = (x^2-3x+2)(x+3)=x^3+3x^2-3x^2-9x+2x+6=x^3-7x+6 $
  ולכן כל אחד מהשורשים של $f$ הוא עם ריבוי $1$ ולכן מהגדרה הוא ספרבילי.
]
#pagebreak()

#subquestion()
הפולינום $f = x^4-4x^3+6x^2-4x+1$.
#solution[
  המקדמים של $f$ שלמים ולכן ניתן להשתמש באלגוריתם ממטלה $2$: נמצא $r / s in QQ$ שבר מצומצם כך ש־$r divides a_0$ ו־$s divides a_n$ ונבחן האם $r / s$ הוא שורש של $f$, משמע האם $f(r / s)=0$.\
  נשים לב שייתכן רק $r, s in {plus.minus 1}$ ולכן המקרים $r=s=1 and r=s=-1$ זהים וגם $r=-1, s=1 and r=1, s=-1$ גם כן שווים.\
  בלי הגבלת הכלליות נבדוק:
  + $r=s=1$
    $ f(r / s) = f(1) = 1^4-4 dot.op 1^3 + 6 dot.op 1^2 - 4 dot.op 1 + 1 =1-4+6-4+1 =0 $
  + $r = 1, s = -1$
    $ f(r / s) = f(1 / (-1)) = f(-1) = 1^4-4 dot.op (-1)^3 + 6 dot.op (-1)^2 - 4 dot.op (-1) + 1 = 16 != 0 $
  ולכן $x=1$ הוא שורש של $f$, נבצע חילוק פולינומים
  $
    (x^4-4x^3+6x^2-4x+1) / (x-1) = x^3 + (-3x^3+6x^2-4x+1) / (x-1) = x^3-3x^2 + (3x^2-4x+1) / (x-1) \
    = x^3-3x^2+3x+(-x+1) / (x-1) = x^3-3x^2+3x-1 = g
  $
  שוב נעשה את אותו התהליך כמקודם ושוב $r, s in {plus.minus 1}$, נבדוק כל אופציה
  + $r=s=1$
    $ g(r / s) = g(1) = 1^3-3 dot.op 1^2 + 3 dot.op 1 - 1 =0 $
  + $r = 1, s = -1$
    $ g(r / s) = g(1 / (-1)) = g(-1) = (-1)^3-3 dot.op (-1)^2 + 3 dot.op (-1) - 1 =8 != 0 $
  ושוב $x=1$ הוא שורש של $g$, נבצע שוב חילוק פולינומים
  $ (x^3-3x^2+3x-1) / (x-1) = x^2+(-2x^2+3x-1) / (x-1) = x^2-2x+(x-1) / (x-1) = x^2-2x+1 = h $
  אבל אנחנו כבר יודעים ש־$h$ מתפרק מעל $QQ[x]$ ל־$h = x^2-2x+1 = (x-1)^2$, ולכן בסך־הכל קיבלנו
  $ f = x^4-4x^3+6x^2-4x+1 = (x-1)^4 $
  לכן ל־$f$ יש שורש אחד עם ריבוי מסדר $4$ ולכן בהגדרה הוא אינו פולינום ספרבילי.
]

#question()
נקבע בכל סעיף האם ההרחבת שדות הנתונה היא נורמלית.
#subquestion()
נראה שההרחבה $QQ(sqrt(2), sqrt(3)) slash QQ$ היינה נורמלית.
#proof[
  נסתכל על הפולינום $f = (x^2-2)(x^2-3)$. אנחנו יודעים ששהשדה הפיצול שלו צריך להכיל את $sqrt(2), sqrt(3)$ ואנחנו יודעים שההרחבה המינימלית שמכילה את האיברים האלו היא בידיוק $QQ(sqrt(2), sqrt(3))$, ולכן זה שדה הפיצול של הפולינום $f$.\
  ראינו שלהיות הרחבה נורמלית זה שקול ללהיות שדה פיצול של פולינום כלשהו ולכן ההרחבה $QQ(sqrt(2), sqrt(3)) slash QQ$ היא הרחבה נורמלית.
]

#subquestion()
נראה שההרחבה $QQ(root(3, 2)) slash QQ$ אינה נורמלית.
#proof[
  נניח בשלילה שההרחבה $QQ(root(3, 2))$ היינה נורמלית, ולכן כל $p in QQ[x]$ אי־פריק עם שורש ב־$QQ(root(3, 2))$ מתפצל לגורמים לינאריים\
  ב־$QQ(root(3, 2))[x]$.\
  בפרט, זה נכון עבור הפולינום $f = x^3-2$ שהוא אי־פריק ב־$QQ$ (ממטלה 1, זה פולינום ממעלה $3$ שהשורשים שלו לא ב־$QQ$ ולכן אי־פריק).\
  נשים לב ש־$alpha = root(3, 2) in QQ(root(3, 2))$ ו־$alpha$ הוא שורש של $f$, ולכן $x-alpha divides f$ לגורמים לינאריים ב־$QQ(root(3, 2))$.\
  אנחנו כבר יודעים ששאר השורשים של $f$ הם מעל המרוכבים: נסמן $omega = -1 / 2 + sqrt(3) / 2i$ ואז $omega root(3, 2), omega^2 root(3, 2)$ הם גם שורשים של $f$.\
  $f$ ממעלה $3$ ולכן יש לו לכל היותר $3$ שורשים, משמע מצאנו את כולם, ולכן חלוקה בגורם $x-alpha$ (שהוא השורש הממשי של $f$) תשאיר אותנו עם מכפלה של איברים שאינם ב־$QQ(root(3, 2))$ (מרוכבים) ולכן בפרט לא יכול להתפצל למכפלה של גורמים לינאריים ב־$QQ(root(3, 2))[x]$ וזאת סתירה ולכן ההרחבה $QQ(root(3, 2)) slash QQ$ אינה נורמלית.
]

#subquestion()
נראה שההרחבה $QQ(root(3, 2), omega root(3, 2)) slash QQ(omega)$ כאשר $omega = -1 / 2 + sqrt(3) / 2i$ שורש יחידה פרימיטיבי מסדר $3$ היא הרחבה נורמלית.
#proof[
  שוב נסתכל על הפולינום $f = x^3-2$, אנחנו יודעים שהשורשים שלו הם ${root(3, 2), omega root(3, 2), omega^2 root(3, 2)}$, אם נראה ש־$omega^2 root(3, 2) in QQ(root(3, 2), omega root(3, 2))$, סיימנו (כי $f$ יתפצל לחלוטין ב־$QQ(root(3, 2), omega)$ ולכן מהשקילות נקבל שההרחבה היא נורמלית).\
  נשים לב שמתקיים
  $ (1) space [QQ(root(3, 2)) : QQ] = 3, space (2) space [QQ(omega) : QQ] = 2 $
  כאשר $(1)$ נובע מכך ש־$x^3-2$ הוא הפולינום המינימלי ב־$QQ(root(3, 2))$ והוא ממעלה $3$ ו־$(2)$ נובע מכך שהפולינום המינימלי הוא $x^2+x+1$ והוא ממעלה $2$.\
  מכפליות הדרגה מתקיים $ [QQ(root(3, 2), omega) : QQ)] = [ QQ(root(3, 2)) : QQ] dot.op [ QQ(omega) : QQ] = 2 dot.op 3 = 6 $
  ולכן הבסיס של $QQ(root(3, 2), omega)$ הוא
  $ B_(QQ(root(3, 2), omega root(3, 2))) = {1, root(3, 2), root(3, 4), omega, root(3, 2) omega, omega root(3, 4)} $
  כאשר $B_QQ(omega root(3, 2)) = {1, omega root(3, 2)}, B_QQ(root(3, 2)) = {1, root(3, 2), root(3, 4)}$.\
  נשים לב ש־$omega^2 root(3, 2)$ אם כך הוא צירוף לינארי של איברי הבסיס ולכן $omega^2 root(3, 2) in QQ(root(3, 2), omega)$ ונקבל ש־$f$ מתפצל לחלוטין ב־$QQ(root(3, 2), omega root(3, 2)) slash QQ(omega)$ וההרחבה הזאת נורמלית.
]

#question()
עבור $a,b,c in QQ$ שאינם כולם $0$, נמצא נוסחה מפורשת ל־$x,y, z in QQ$ כך שמתקיים
$ (a+b dot.op root(3, 5) + c dot.op root(3, 5^2))=x+y dot.op root(3, 5) + z dot.op root(3, 5^2) $
כלומר, נוסחה מפורשת להופכי של איבר ב־$QQ(root(3, 5))$.
#solution[
  נסמן $omega = -1 / 2 + sqrt(3) / 2i$ ונגדיר
  $
    S = (a+b dot.op omega root(3, 5) + c dot.op omega^2 root(3, 5^2)) dot.op (a+b dot.op omega^2 root(3, 5) + c dot.op omega root(3, 5^2))
  $
  אנחנו יודעים כבר $omega^2 + omega + 1 = 0 => omega^2 + omega = -1, omega^3 = 1, omega^2 = overline(omega)$, נחשב ונקבל עם הזהויות הללו
  $
    S = a^2 + a b dot.op omega^2 root(3, 5^2) + a c dot.op omega root(3, 5^2) + a b dot.op omega root(3, 5)+ root(3, 5^2) b^2 + b c dot.op 5omega^2 + a c dot.op omega^2 root(3, 5^2) + b c dot.op 5omega+5 root(3, 5) c^2 \
    = a^2 + b^2 root(3, 5^2) + 5c^2 root(3, 5) + underbrace(a b dot.op omega^2 root(3, 5) + a b dot.op omega root(3, 5), (star)) + underbrace(a c dot.op omega root(3, 5^2) + a c dot.op omega^2 root(3, 5^2), (star star)) + underbrace(b c dot.op 5 omega + b c dot.op 5omega^2, (star star star)) \
    = a^2 + root(3, 5^2) b^2 + 5 root(3, 5) c^2 + underbrace(- a b root(3, 5), (star)) + underbrace(- a c root(3, 5^2), (star star)) + underbrace(- 5 b c, (star star star))
  $
  כאשר $(star), (star star), (star star star)$ נובעים מהזהות $omega^2 + omega = -1$ וקיבלנו ש־$S in QQ(root(3, 5))$ (שכן $root(3, 5^2)$ הוא בבסיס של הרחבה זאת כפי שראינו בשאלה הקודמת).\
  נסמן $alpha = a + b root(3, 5) + c root(3, 5^2)$
  ונראה כעת $S dot.op alpha in QQ$ על־ידי חישוב
  $
    S dot.op alpha =
    (a^2 + root(3, 5^2) b^2 + 5 root(3, 5) c^2- a b root(3, 5)- a c root(3, 5^2)- 5 b c)(a + b root(3, 5) + c root(3, 5^2)) \
    = a^3+5b^3+25c^3-15a b c+ cancel(root(3, 5)a^2b, stroke: #(paint: fuchsia))+ cancel(root(3, 5^2)a^2c, stroke: #(paint: red))+ cancel(root(3, 5^2)b^2a, stroke: #(paint: blue))+cancel(5 root(3, 5)b^2c, stroke: #(paint: green))+cancel(5 root(3, 5)a c^2, stroke: #(paint: yellow))+cancel(5 root(3, 5^2)c^2b, stroke: #(paint: orange)) \
    cancel(- root(3, 5)a^2b, stroke: #(paint: fuchsia))- cancel(root(3, 5^2)a b^2, stroke: #(paint: blue)) cancel(- root(3, 5^2)a^2c, stroke: #(paint: red)) cancel(-5root(3, 5)a c^2, stroke: #(paint: yellow)) cancel(-5 root(3, 5)b^2c, stroke: #(paint: green)) cancel(-5 root(3, 5^2)b c^2, stroke: #(paint: orange)) \
    = a^3 +5b^3+25c^3-15 a b c
  $
  ולכן קיבלנו $S dot.op alpha in QQ$.\
  נבחר אם כך $S / (S dot.op alpha)$ ונקבל
  $
    S / (S dot.op alpha) dot.op (a + b root(3, 5) + c root(3, 5^2)) = 1 <==> S / (S dot.op alpha) = a + b root(3, 5) + c root(3, 5^2)^(-1) = (a + b root(3, 5) + c root(3, 5^2))^(-1)
  $
  ולכן
  $
    x=(a^2-5b c) / (a^3+5b^3+25c^3-15a b c), y = (5c^2-a b) / (a^3+5b^3+25c^3-15a b c), z= (b^2-a c) / (a^3+5b^3+25c^3-15a b c)
  $
]

#question()
נפרק את הפולינום $f(x,y,z) = x^3+y^3+z^3 - 3 x y z in ZZ[x,y,z]$ לגורמים אי־פריקים.
#solution[
  בתור התחלה, נגיע לחזקות $3$ של $x, y$:
  $ (x+y)^3 = (x+y)^2(x+y)=(x^2+2y x+y^2)(x+y) = x^3+y x^2+ 2y x^2 +2 y^2x + y^2x+y^3 = x^3+3y x^2+3y^2x+y^3 $
  ולכן
  $ x^3+y^3+z^3 - 3 x y z = (x+y)^3+z^3-3 x y z -3y x^2 - 3y^2x = (x+y)^3+z^3-3x y(x+y+z) $
  ננסה לפרק את הביטוי $(x+y)^3+z^3$ עם גורם $x+y+z$ כדי שיתאים לגורם הימני שלנו
  $
    (x+y)^3 + z^3 &= ((x+y)+z)((x+y)^2-(x+y)z+z^2) \
    &= (x+y)^3cancel(-(x+y)^2z)+cancel((x+y)z^2)+cancel(z(x+y)^2)cancel(-(x+y)z^2)+z^3 \
    &= (x+y)^3+z^3 space ("\"טריק \"הלא עשיתי כלום")
  $
  ולכן
  $ x^3+y^3+z^3 - 3 x y z= (x+y)^3+z^3-3x y(x+y+z)=(x+y+z)((x+y)^2-(x+y)z+z^2-3x y) $
  נסדר את הביטוי הימני
  $ (x+y)^2-(x+y)z+z^2-3x y = x^2+2y x + y^2 -x z - y z + z^2-3x y = x^2+y^2+z^2 - x z - y z - x y $
  בסך־הכל קיבלנו
  $ x^3+y^3+z^3 - 3 x y z = (x+y+z)(x^2+y^2+z^2 - x z - y z - x y) $
  הגורם $x+y+z$ הוא פולינום אי־פריק ממעלה $1$, ונשאר רק להראות שגם $x^2+y^2+z^2 - x z - y z - x y$ הוא אי־פריק, נסתכל עליו בעוד דרך
  $
    (x^2+y^2+z^2 - x z - y z - x y) &= 1 / 2((x-y)^2+(y-z)^2+(z-x)^2) \
    &=1 / 2(x^2-2x y + y^2 + y^2-2 y z + z^2 - z^2 - 2 z x + x^2) \
    & = 1 / 2 (2x^2-2x y + 2y^2 - 2 y z + z^2 - 2 z x ) \
    &= x^2+y^2+z^2- x z - y z - x y space ("\"שוב טריק \"הלא עשיתי כלום")
  $
  נבחן מתי הביטוי $(x-y)^2+(y-z)^2+(z-x)^2)$ מתאפס: יש לנו סכום של איברים חיובים ולכן הוא מתאפס אם ורק אם כל איבר בסכום מתאפס וזה קורה אם ורק אם $x=y=z=0$.\
  לכן כל גורם במכפלה לעיל הוא אי־פריק והגענו לביטוי הנדרש.
]
