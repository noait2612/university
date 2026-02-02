#import "article.typ": *
#show: article.with(title: [ בלה ], signature: [#align(center)[#image(
  "duck.png",
  width: 30%,
  fit: "contain",
)]])
#show figure.caption: emph
#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let Gal = math.op("Gal")
#let Aut = math.op("Aut")

#proof[
  יהי $0<K<infinity, d in (0,1]$ ונגדיר
  $ f_n (x) = n + K x^d $
  נראה שהפונקציה היא $K$ לישפיצית עבור $x,y in [0,1]$
  $ abs(f_n (x) - f_n (y)) = abs((n+K x^d)-(n+K y^d)) = abs(K x^d-K y^d) = K abs(x^d-y^d) $
  נסתכל על הפונקציה $f: [0,1] arrow.r RR$ הנתונה על־ידי $f(x)=x^d$, זו פונקציה קעורה (כי הנגזרת היא מונוטונית יורדת ממש, $f'(x) = d x^(d-1)$, היא קעורה כי $0<d<1$ אז זה די ברור, אבל אם $d=1$ זו פונקציה קבועה שהיא מונוטונית יורדת חלש).\
  מדף התכונות של הפונקציה בויקיפדיה, #link("https://en.wikipedia.org/wiki/Concave_function#Functions_of_a_single_variable")[
    כאן, תכונה 6
  ], מתקיים
  $ f(x)+f(y)>=f(x+y) <==> -f(x+y)>=-f(x)-f(y) $
  וזה מצויין ליהודים, כי אם ניקח $y in [0,1]$ זה אומר שמתקיים עבור $g : [y,1] arrow.r RR$ הנתונה על־ידי $ g(x)=x^d-y^d-(x-y)^d = f(x)-f(y)-f(x-y) $
  זה בידיוק אומר שמתקיים $g(x)<=0$, אז אם נחזור לביטוי ממקודם שמצאנו
  $ abs(f_n (x) - f_n (y))=K abs(x^d-y^d)<=K abs(x-y)^d $
]

#proposition[
  נניח כי $A,B$ בנות־מנייה. אז $A times B$ בת־מנייה.
]
#proof("של יאיר")[
  בתרגיל הבית הוכחתם ש־$NN times NN$ היא בת־מנייה ובתרגול ראיתם כי אם $abs(A) = abs(C), abs(B) = abs(D)$ אזי $abs(A times B) = abs(C times D)$ ומשילוב שתי הטענות, הטענה נובעת.
]
#proof("של נעה")[למה צריך בכלל את החלק השני?
  הרי אם יש לי $A, B$ בנות־מנייה, זה אומר שקיימות $f:A arrow.r NN, g: B arrow.r NN$ חד־חד ערכיות ועל.\
  עכשיו, $A times B$ זה הרי ${(a,b) bar a in A, b in B}$ אבל אם נגדיר $h : A times B arrow.r NN times NN$ על־ידי $h(a,b) = (f(a), g(b))$ יש לנו חד־חד ערכיות ועל קורדינאטה קורדינאטה, אז זו פונקציה חד־חד ערכית ועל לקבוצה בת־מנייה, ולכן גם $A times B$ קבוצה בת־מנייה.]

$
  4 = S(3) = {underbrace({{{emptyset}, emptyset}, {emptyset}, emptyset}, = 3), {{emptyset}, emptyset}, {emptyset}, emptyset}
$

$ product_(n < omega) A_n = { f : NN arrow.r union.big A_n bar forall n<omega, f(n) in A_n } != emptyset $
כל פונקציה בוחרת איבר אחד מ־$A_n$, אז זה כל הפונקציות בחירה מעל הסדרה $A_n$ ו־$abs(A_n)=2$ אז כל $f(n)$ יכול לקחת שני ערכים בידיוק, אז המכפלה זה סט כל הפונקציות מ־$NN$ ל־$2$ איברים (שיכול להיות ששונים זה מזה).\
נגדיר $phi_n : A_n arrow.r {0,1}$, אז כל $f in product A_n$ ונגדיר $f mapsto (phi_0 (f(0)), phi_1 (f(1)), dots.h.c) in {0,1}^(NN)$ (זה מוגדר היטב כי $f(n) in A_n$ מהגדרת המכפלה)
ואז
$ Phi : product_(n < omega) A_n arrow.r {0,1}^NN $
הנתונה על־ידי
$ Phi(f)(n) = phi_n (f(n)) $
היא חד־חד ערכית ועל: \
חד־חד ערכית: כי אם $f!=g$ עבור $n in NN$ אז $f(n)!= g(n)$ ולכן $phi_n (f(n)) != phi_n (g(n))$ ואז $Phi(f)(n)!= Phi(g)(n)$ \
על: נובע מכך שניתן לקחת כל סדרה בינארית $(b_n)$ ולהגדיר $f$ לפיה על־ידי $f(n)=phi_n^(-1) (b_n)$ (כזכור $phi_n$ חד־חד ערכית ועל מהגדרת שיוויון עוצמות).
ראינו ש־$abs({0,1}^NN)=aleph_0$ ומצאנו איזומורפיזם ולכן מהגדרת שיוויון עוצמות גם $abs(product_(n < omega) A_n) = aleph_0$

#question()
צריך לפרק את הפולינום $x^8-1$ מעל השדה $FF_13$.

#solution[
  ראשית מתקיים
  $ x^8-1=(x^4+1)(x^4-1)=(x^2-1)(x^2+1)(x^4+1)=(x-1)(x+1)(x^2+1)(x^4+1) $
  וגם $x-1 eq.triple_(mod 13) x+12$, ווגם את $x^2+1$ אפשר לפרק מעל $FF_13$ כי אם נציב $i in {0, dots.h.c, 12}$ נקבל ש־$i^2+1 eq.triple_(mod 13) 0 <==> i in {5,8}$ ולכן יש לנו שורשים אז הפולינום יכול להתפרק $ x^2+1 eq.triple_(mod 13) (x-5)(x-8) eq.triple_(mod 13) (x+8)(x+5) $
  יש לי עוד לאן לפרק את $x^4+1$ מעל $FF_13$ וזה בעצם $Phi_8 (x)$, אז אפשר בתהליך קצר ארוך של בדיקה האם יש פיתרון ב־$FF_13$ לאחד מהבאים
  + $x^4 eq.triple_(mod 13) 12$ על־ידי חישוב לכל $i in {0, dots.h.c, 12}$ האם $i^4 eq.triple_(mod 13) 12$
  + האם יש פירוק $(x^2+a x+1)(x^2+b x+1) (mod 13)$
  + האם יש פירוק $(x^2+ a x + c)(x^2 + b x + d) (mod 13)$
  כאשר את שני האחרונים זה פשוט לפתור מערכות משוואות כמו בלינארית, ואז יוצא שהפירוק הוא $x^4+1 = (x^2+5)(x^2+8)$, ובסך־הכל
  $ x^8-1 eq.triple_(mod 13) (x+12)(x+1)(x+5)(x+8)(x^2+5)(x^2+8) $

  ההשאלה היא האם יש דרך קצרה יותר שאני מפספסת: בעיקר לפירוק של $x^4+1$: חשבתי משהו בכיוון של מה השדה פיצול של $Phi_8 (x)$ מעל $FF_13$ ויצא לי ש־$FF_169=FF_(13^2)$ הוא הראשון שמכיל שורש יחידה מסדר $8$, אז החבורת גלואה היא מסדר $2$ ופועלת על $4$ השורשים בהצמדה בזוגות (וגם $x mapsto x^13$ עם הפרובניוס), אבל אז אני חוזרת לאותה נקודה
  $
    Phi_8 (x) = (x-alpha)(x-alpha^13)(x-beta)(x-beta^13) = (x^2-(alpha+alpha^13)x + alpha alpha^13)(x^2-(beta+beta^13)x + beta beta^13)
  $
]

#question()
צריך להוכיח שקיימת פונקציה $f : NN arrow.r NN$ הנתונה על־ידי $f(n)=n^2$.

#proof[
  ניזכר שהגדרנו $dot.op : NN times NN arrow.r NN$ להיות $n dot.op m = underbrace(n + dots.h.c + n, "פעמים" m)$ ובהרצאה ראינו ש־$NN times NN$ היא קבוצה (נובע מאקסיומת הזוג הלא סדור, אקסיומת ההחלפה ואקסיומת האיחוד).\
  נגדיר את התכונה $P(n,m) colon.eq m = n dot.op n$ ואז מאקסיומת ההפרדה $F = {(n,m) in NN times NN bar P(n,m)}$ קיימת.\
  נגדיר
  $ f = {(x,y) in NN times NN bar y = x dot.op x} $
  זו פונקציה, כי לכל $x in NN$ קיים ויחיד
]

#question()
נוכיח כי $min : NN times NN arrow.r NN$ היא פונקציה, כלומר נראה כי היא קבוצה המקיימת את תנאי הפונקציה.

#proof[
  שוב $NN times NN$ קבוצה כי מכפלה קרטזית מגדירה קבוצות וגם $NN times NN times NN$ היא קבוצה.\
  ונגדיר
  $ min(x, y) = mycases(x, x<=y, y, y<x) $
  היות והטבעיים הוא סדר טוב מתקיים אחד מהבאים בידיוק: או ש־$x<=y$ או ש־$y<x$ ולכן הפונקציה מוגדרת היטב.\
  נגדיר את התכונה $P(x,y,z)$ להיות $z = min(x, y)$
  ולכן מאקסיומת ההפרדה הקבוצה הבאה מוגדרת והיא מקיימת את תנאי הפונקציה
  $ f = {((x,y),z) in (NN times NN) times NN bar P(x,y,z)} $
]

#question()
יהיו $a,b in RR$ כך שמתקיים $a<b$ ותהיי $f$ פונקציה רציפה בקטע $[a,b]$ כך ש־$f(x) > 0$ לכל $x in [a,b]$.

#subquestion()
ניתן אינסוף דוגמאות שונות לפונקציות $g:[a,b] arrow.r RR$ המקיימות $forall x in [a,b], abs(g(x))=f(x)$.

#proof[
  לכל $n in NN$ נגדיר את
  $ forall x in [a,b], s_n (x) = mycases(1, s, -1, s) $
]

#subquestion()
נמצא את כל הפונקציות הרציפות $g : [a,b] arrow.r RR$ המקיימות $forall x in [a,b], abs(g(x))=f(x)$.

#proof[
  היות ו־$f(x)>0$, עלינו לקיים $g(x) = plus.minus f(x)$.\
  נטען שבגלל הדרישה לרציפות $g(x)$ חייב להתקיים $g(x) = plus.minus f(x)$ בלבד (זאת אומרת, הרציפות של $g$ גוררת שאין החלפת סימן):\
  נניח בשלילה שלא כך ולכן יש לנו $g_3 (x) : [a,b] arrow.r RR$ רציפה המקיימת $abs(g_3 (x)) = f(x)$ שמחליפה סימן ב־$x_0 in [a,b]$ כלשהו.\
  יהי $x_0 in [a,b]$ כך ש־$g_3$ מחליפה בו סימן, לפי הגדרת הגבול זה אומר (בלי הגבלת הכלליות לכיוון)
  $ lim_(x arrow.r x_0^(minus)) g_3 (x) = f(x_0), space lim_(x arrow.r x_0^(plus)) g_3 (x) = - f(x_0) $
  $g_3$ רציפה בכל $[a,b]$ ולכן רציפה ב־$x_0$, אז מהגדרת הגבול מתקיים
  $ lim_(x arrow.r x_0^(minus)) g_3 (x) = lim_(x arrow.r x_0^(plus)) g_3 (x) $
  אבל בגלל ש־$f(x) > 0$, לא ייתכן ש־$f(x)=-f(x)$ כי התכונה הזאת מתקיימת רק עבור $f(x)=0$, אז
  $ f(x_0) != -f(x_0) => lim_(x arrow.r x_0^(minus)) g_3 (x) != lim_(x arrow.r x_0^(plus)) g_3 (x) $
  בסתירה לרציפות $g_3$, ולכן אין $g_3$ המחליפה סימן ועל־כן $g_1 (x) = f(x), g_2 (x) = -f(x)$ הן הפונקציות הרציפות היחידות המקיימות $ forall x in [a,b], forall i in [2], abs(g_i (x)) = f(x) $
]

#question()
נחשב את סכום החזקות השלישיות של הפולינום $x^3-x+1$.

#solution[
  נסמן ב־$r_1, r_2, r_3$ את השורשים של הפולינום ואנחנו רוצים לחשב את $r_1^3+r_2^3+r_3^3$.\
  באופן כללי, לכל $i in {1,2,3}$ מתקיים $r_i^3 = r_i - 1$, אז $r_1^3+r_2^3+r_3^3 = r_1+r_2+r_3 - 3$ ונטען שהתשובה היא $-3$:\
  נחשב
  $
    (x-r_1)(x-r_2)(x-r_3) = x^3-x^2r_3-x^2r_1+x r_1r_3-x^2r_2+x r_2 r_3+r_1r_2r_3x-r_1r_2r_3 \
    = x^3-x^2(r_1+r_2+r_3) + x r_1r_2r_3 - r_1r_2r_3
  $
  נסמן ב־$a,b,c,d$ את המקדמים של הפולינום שלנו $a x^3 + b x^2 + c x + d$ ובמקרה שלנו $a=1, b=0, c=-1, d=1$, ולכן עם השורשים לעיל זה אמור להתאים למקדמים של הפולינום כמובן, אז
  $ a = 1, b = (r_1 + r_2+ r_3) = 0, c = r_1 r_2 r_3 = 1, c = - r_1 r_2 r_3 = -1 $
  ולכן
  $ r_1^3+r_2^3+r_3^3 = r_1+r_2+r_3 - 3 = -3 $
]

#question()
נמצא את הפולינום המינימלי של $sqrt(3)+sqrt(5)$ מעל $QQ$, נראה שהוא אי־פריק מעל $QQ$, אי־פריק מעל $ZZ[t]$ שנהיה פריק מודלו $p$ לכל מודולו $p$.

#proof[
  נסמן $alpha = sqrt(3) + sqrt(5)$, אז
  $
    alpha=sqrt(3)+sqrt(5) <==> alpha^2 = 3+2 sqrt(3) sqrt(5) + 5 <==> alpha^2-8 = 2 sqrt(3) sqrt(5) <==> alpha^4-16alpha^2+64=60 <==> alpha^4-16alpha^2+4
  $
  נשתמש בשיטה של "Rational root theorem" ממטלה $2$:
  #remark(
    "תזכורת – Rational root theorem",
  )[$f in QQ[x]$ עם מקדמים שלמים ונסמן $f(x)=a_n x^n + dots.h.c + a_1 x + a_0$.\
    אם $r/s in QQ$ שורש של $f$ אז $s divides a_n, r divides a_0$]
  במקרה שלנו $s=1$ ו־$r= plus.minus 1, plus.minus 2, plus.minus 4$, הצבה קצרה מביאה לנו שכל תוצאה לא מניבה $0$ ולכן אין שורש מעל $QQ$ וזה אומר שאין גורם לינארי (זה בעצם אומר שאין פיצול למכפלה של $f = g h$ כאשר $deg(g)=1, deg(h)=3$ או ההפך).\
  נשאר לבחון האם יש פיצול למכפלה של $f = g h$ עם $deg(g)=deg(h)=2$, אז נניח בשלילה שהוא פריק, ולכן
  $
    alpha^4-16alpha^2+4 = (alpha^2 + a alpha + b)(alpha^2 + c alpha + d)=alpha^4 + c alpha^3 + d alpha^2 + a alpha^3 + a c alpha^2 + a d alpha + b alpha^2 + b c alpha + b d =
    \ alpha^4 + alpha^3 (c+a)+alpha^2(d+a c+b) + alpha(a d + b c) + b d
  $
  אז $c+a = 0 => a = -c$ וכן $b d = 4$ ולכן $ a d + b c = 0 <==> -c d + b c = 0 <==> b c = c d space (2) $ וכן
  $ d + a c + b = -16 <==> d - c^2 + b = -16 $
  מ־$(2)$ יש $2$ אופציות, או ש־$c=0$ או ש־$c!=0$.\
  אם $c!=0$ אז נחלק את $(2)$ בו ונקבל $b = d$ ולכן מכך ש־$b d = 4$ אז $b = plus.minus 2$ אבל אז למשוואה $d + a c + b = -16$ אין פיתרון כי או ש־$-4 = -16$ או ש־$4=-16$ וכמובן שניהם לא נכונים.\
  אז $c=0$, ולכן
  $d + b = -16$ וגם $b d = 4$, אבל גם פה נובע ש־$b=d = plus.minus 2$ ושוב אין פיתרון ולכן ההנחה בשלילה לא נכונה והפולינום אי־פריק מעל $QQ$.\
  עכשיו, נזכר בלמה השנייה של גאוס: $f$ פולינום אי־פריק ב־$ZZ[alpha]$ אם ורק אם $f$ פרימיטיבי ואי־פריק ב־$QQ[alpha]$, ונשים לב שאכן הפולינום שלנו הוא פרימטיבי כי
  $ op("cont")(alpha^4-16alpha^2+4) = op("cont")(1,-16,4) = gcd(1, -16, 4) = 1 $
  ולכן הפולינום הוא פרימיטיבי ועל־כן אי־פריק מעל $ZZ[alpha]$ מהלמה השנייה של גאוס.\
  נשאר רק להראות שהוא פריק מודלו $p$ לכל מודולו $p$: נסמן $y=alpha^2$ אז $alpha^4-16alpha^2+4 mapsto y^2 - 16y+7$ ומתקיים $ Delta = ((-16)^2 - 4(1))4 = 256-16=240 $
]

#question()
יהי $f$ פולינום אי־פריק מעל שדה $K$ ויהי $L$ שדה הפיצול שלו. נניח ש־$G=op("Gal")(L slash K)$ היא אבלית ונוכיח שכל שורש של $f$ יוצר $L$.

#proof[
  נניח שלא ככה, ולכן עבור $alpha$ שורש של $f$ מתקיים $E = K(alpha)$ ו־$E subset.neq L$ ונשים לב ש־$[K(alpha) : K] = deg(f)$.\
  מהתאמת גלואה, יש התאמה חד־חד ערכית ועל בין $H<=op("Gal")(L slash K)$ לבין שדות ביניים $K subset.eq E subset.eq L$.\
  היות ו־$G$ אבלית, נובע כי כל תת־חבורה שלה היא נורמלית ולכן בפרט $H = op("Gal")(L slash K(alpha))={sigma in op("Gal")(L slash K) bar sigma(alpha)=alpha}$ זאת־אומרת, $K(alpha)=L^H$ ובגלל שכל תת־חבורה אבלית היא נורמלית
  $ K(sigma(alpha)) = L^H = L^(op("Gal")(L slash K(sigma(alpha))))=L^(sigma H sigma^(-1))=L^H = K(alpha) $
  זה בידיוק אומר שכל השורשים של $f$ יוצרים את אותו שדה ביניים $K(alpha)$, אבל זה בידיוק ההגדרה של שדה פיצול ושדה פיצול יחיד עד־כדי איזומורפיזם ולכן $L subset.eq K(alpha)$ זאת־אומרת $L=K(alpha)$ בסתירה להנחה.
]

#question()
שאלה 4 – מועד א' תשפ"ב של שיא.\
יהי התחום $D = {vec(x, y, z) in RR^3 bar x+y+z=1}$ ותהיי $f:RR^3 arrow.r RR$ הפונקציה הנתונה על־ידי $f(x,y,z)=x^2+2y^2+3z^2$.\
נקבע האם $f$ משיגה מינימום ומקסימום ב־$D$ ואם כן נחשב את הערך.

#solution[\

  _שיטה ראשונה: בעזרת הלגראנז’יאן_:\
  #definition(
    "הלגראנז’יאן",
  )[תהיי $B subset.eq RR^k$ פתוחה ו־$f, g_1, dots.h.c, g_n : B arrow.r RR$ גזירות ברציפות עבור $n+1<=k$.\
    נגדיר את הקבוצה
    $ A colon.eq { x in B bar g_1 (x) = dots.h.c = g_n (x) = 0} $
    נניח כי לכל $a in A$ מתקיים ש־$gradient g_1 (a), dots.h.c, gradient g_n (a) in RR^k$ בלתי־תלויים לינארית.\
    נגדיר את *הלגראנז’יאן* $cal(L) : RR^n times B arrow.r RR$ באמצעות
    $ cal(L)(lambda, x) = f(x)-sum_(i=1)^n lambda_i g_i (x) $
    תהיי $(lambda, a) in RR^n times A$ נקודת קריטית של הלגראנז’יאן ונסמן $hat(H) = H cal(L)_((lambda, a))$. אז מתקיים
    + $a$ היא מינימום מקומי של $f|_A$ אם $H cal(L)_a^lambda$ חיובית בהחלט על $ker(D g_a)$ ולפי ההסיאן המוגבל זה קורה אם $(-1)^n det(hat(H)_i)) > 0$ לכל \ $2n+1<=i<=k+n$
    + $a$ היא מקסימום מקומי של $f|_A$ אם $H cal(L)_a^lambda$ שלילית בהחלט על $ker(D g_a)$ ולפי ההסיאן המוגבל זה קורה אם $(-1)^(n+i) det(hat(H)_i)) > 0$ לכל $2n+1<=i<=k+n$
    + $a$ היא אוכף של $f|_A$ אם $H cal(L)_a^lambda$ אינה מוחלטת על $ker(D g_a)$ ולפי ההסיאן המוגבל זה קורה אם $det(hat(H)_(2n+1)), dots.h.c, det(hat(H)_i)$ בעלי סימנים המתאימים לאחד משני המקרים הקודמים אבל ל־$det(hat(H)_(i+1))$ יש סימן הפוך
  ]
  אז נגדיר $g(x,y,z) = x+y+z-1$ ונשים לב ש־$D g_((x,y,z)) = mat(1, 1, 1) != 0$ לכל $(x,y,z) in RR^3$ נובע שניתן להשתמש בשיטת הלגראנז’יאן, והלגראנז’יאן נתון על־ידי
  $ cal(L)(lambda, x,y,z) = x^2+2y^2+3z^2-lambda x - lambda y - lambda z + lambda $
  נחשב את הנקודות הקריטיות של $cal(L)$ זוהי כמובן פונקציה רציפה
  $ D cal(L)_((lambda, x,y,z)) = mat(-x-y-z+1, 2x-lambda, 4y-lambda, 6z - lambda) $
  נשווה ל־0 ונפתור את מערכת המשוואות
  $
    2x-lambda = 0 ==> 2x = lambda \
    4y-lambda = 0 ==> 4y=lambda \
    6z - lambda = 0 ==> 6z = lambda \
    -x-y-z+1 = 0 ==> x+y+z=1
  $
  אז
  $ 2x = 4y = 6z ==> x = 2y = 3z $
  ולכן
  $ x+y+z=1 <==>_(x=2y) 3y+z = 1 <==> z = 1-3y $
  אבל
  אבל
  $ x = 3z <==> x = 3-9y <==> 11y = 3 <==> y = 3/11 $
  אז בסך־הכל
  $
    x = 6/11, y = 3/11, z = 2/11, lambda = 12/11
  $
  ואכן גם מתקיימים
  $
    x+y+z = 3/11+6/11+2/11 = 11/11 = 1 checkmark \
    12/11 = 2 dot.op 6/11 = 4 dot.op 3/11 = 6 dot.op 2/11 checkmark
  $
  ולכן יש נקודה אחת חשודה לקיצון והיא $(lambda, x, y, z) =(12/11, 6/11, 3/11, 2/11)$, נחשב את ההסיאן של $cal(L)$:
  $
    H cal(L)_((lambda,x,y,z)) = mat(
      0, -1, -1, -1;
      -1, 2, 0, 0;
      -1, 0, 4, 0;
      -1, 0, 0, 6
    )
  $
  צריך לבדוק את המינורים הראשיים מסדר מסדרים $3$ ו־$4$.\
  מתקיים $(-1)^3 det(H cal(L)) = 44$ ועבור המינור מסדר $3$ מתקיים $(-1)^3 det mat(0, -1, -1; -1, 2, 0; -1, 0, 4) = 6$ ולכן זו נקודת מינימום יחידה.

]

#question()
שאלה $4$ ממטלה $11$ של דניאל: תהיי $f:RR^3 arrow.r RR$ הנתונה על־ידי $f(x,y,z)=2x+2y+3z$.\
נסביר ונמצא למה $f$ מקבלת ערך מקסימלי ומינימלי בקבוצה $A colon.eq {(x,y,z) in RR^3 bar x^2+y^2+3z^3=35, space x+y+z=7}$.

#proof[
  נטען ש־$A$ קבוצה קומפקטית ולכן $f$ שהיא פונקציה רציפה (פולינום בכמה משתנים) מקבלת עליה מינימום ומקסימום.\
  נגדיר $B colon.eq {(x,y,z) in RR^3 bar x^2+y^2+3z^3=35 }$ ונטען ש־$B$ סגורה וחסומה ולכן לפי משפט היינה־בורל נקבל שהיא קומפקטית.\
  סגורה: אם $(x_n, y_n, z_n)_(n=1)^infinity$ סדרה ב־$B$ שמתכנסת ל־$(x,y,z)$ ובפרט $x_n arrow.r x, y_n arrow.r y, z_n arrow.r z$. \
  לכל $n in NN$ מתקיים $x_n^2 + y_n^2 + 3z_n^2 = 35$ לכן מאריתמטיקה של גבולות נסיק שמתקיים $(x,y,z) = lim_(n arrow.r infinity) x_n^2 + y_n^2 + 3z_n^2 = 35$ ולכן $(x,y,z) in B$.\
  חסומה: נשים לב שמתקיים $x^2/35 + y^2/35 + z^2/(35/3)=1$ וזה בבירור חסום כי לדוגמה $x$ מקבל ערך מקסימלי כאשר $y=z=0$ ואז $x=sqrt(35)$.\
  אז $B$ סגורה וחסומה ולכן לפי משפט היינה־בורל היא קומפקטית.\
  נגדיר $C colon.eq {(x,y,z) in RR^3 bar x+y+z=7}$, זו בבירור קבוצה לא חסומה אבל זו כן קבוצה סגורה כי אם $(x_n, y_n, z_n)_(n=1)^infinity$ קבוצה ב־$C$ שמתכנסת ל־$(x,y,z)$ בפרט $x_n arrow.r x, y_n arrow.r y, z_n arrow.r z$.\
  לכל $n in NN$ מתקיים $x_n+y_n+z_n=7$ ולכן מאריתמטיקה של גבולות נסיק שמתקיים $x+y+z = lim_(n arrow.r infinity) x_n+y_n+z_n = 7$ ולכן $(x,y,z) in C$, אז $C$ קבוצה סגורה.\
  נשים לב ש־$A = B inter C$ ובהרצאה ראינו שחיתוך סופי של קבוצות סגורות הוא סגור (זה נובע מכך שאיחוד סופי של קבוצות פתוחות הוא פתוח, וקבוצה סגורה היא קבוצה שהמשלים שלה הוא פתוח ועם כללי דה־מורגן נקבל את הנדרש).\
  אז $A$ קבוצה סגורה אבל מהגדרה $A subset.eq B$ ש־$B$ קומפקטית וראינו שתת־קבוצה סגורה של קבוצה קומפקטית היא קומפקטית, ולכן $A$ קומפקטית ולכן בהכרח $f$ שרציפה מקבלת עליה מינימום ומקסימום.\
  אם $f$ מינימום/מקסימום בנקודה פנימית של $A$, נוכל לבדוק לפי איפוס הגרדיאנט
  $ gradient f(x,y,z) = mat(2, 2, 3) != mat(0, 0, 0) $
  אז אין אף נקודה פנימית שבה $f$ מקבלת מינימום/מקסימום, ולכן נצטרך להשתמש בשיטת כופלי לגראנז' (כי הנקודות קיצון מתקבלות רק על השפה של האילוצים).\
  נגדיר $g_1 : RR^3 arrow.r RR$ על־ידי $g_1 (x,y,z) = x^2+y^2+3z^2-35$ ו־$g_2 : RR^3 arrow.r RR$ על־ידי $g_2 (x,y,z) = x+y+z-7$ וכמובן ש־$g_1, g_2$ דיפרנציאביליות ברציפות כי אלו פולינומים ומתקיים
  $ gradient g_1 (x,y,z) = mat(2x, 2y, 6z), space gradient g_2 (x,y,z) = mat(1, 1, 1) $
  יש לנו בפועל שלוש משוואות של אילוצים שאנחנו יכולים להוציא
  $
    gradient f (x,y,z) = lambda gradient g_1 (x,y,z)+ mu gradient g_2 (x,y,z) <==> mat(2, 2, 3) = lambda (2x, 2y, 6z) + mu mat(1, 1, 1)
  $
  בבירור $lambda !=0$ כי $mat(2, 2, 3)$ ו־$mat(1, 1, 1)$ בלתי תלויים לינארית ולכן $x= (2 - mu)/lambda = y$ ואם נציב $x=y$ באילוץ השני נקבל
  $ z=7-2x $
  ומהצבה באילוץ הראשון
  $ 2x^2 + 3(7-2x)^2=35 <==> x = 2,4 $
  ולכן הנקודות הן $(2,2,3), (4,4,-1)$ ומתקיים $f(2,2,3)=17, f(4,4,-1)=13$ ולכן המינימום הוא $13$ בנקודה $(4,4,-1)$ והמקסימום הוא 17 בנקודה$(2,2,3)$.\
  אפשר גם בצורה אלימה לפתור את מערכת המשוואות
  אז נקבל מערכת משוואות
  $
    2 = 2x lambda + mu ==> mu = 2-2x lambda \
    2 = 2y lambda + mu ==> mu = 2-2y lambda \
    3 = 6z lambda + mu ==> mu = 3-6z lambda \
    x^2+y^2+3z^2=35 \
    x+y+z=7
  $
  אבל אני אוותר.
]

#question()

$
  f:RR^2 arrow.r RR, space f(x) = f vec(x_1, x_2) = mycases(x_1^3/(x_1^2+x_2^2), x_1 != 0 "או" x_2 != 0, 0, x_1 = x_2 = 0) \
  f vec(t, 0) =_(t!=0) t^3/t^2 ==> partial_(x_1) f(0) = lim_(t arrow.r 0) (f vec(t, 0)-f vec(0, 0))/t = lim_(t arrow.r 0) (t^3/t^2)/t = 1 \
  partial_(x_2) f(0) = lim_(t arrow.r 0) (f vec(0, t) - f vec(0, 0))/t = lim_(t arrow.r 0) = (0/(0+t^2))/t = lim_(t arrow.r 0) 0/t = 0
$

#question()
תהיי $B colon.eq {(x,y) in RR^2 bar x^2-x y+y^2<2}$ ונחשב את האינטגרל $integral_B (x^2-x y + y^2) d x d y$ באמצעות משפט חילוף משתנה.

#solution[
  #theorem(
    "משפט חילוף משתנה – תזכורת",
  )[תהיינה $A, B subset.eq RR^k$ קבוצות פתוחות ו־$g:A arrow.r B$ דיפאומורפיזם (חד־חד ערכית, על, גזירה ברציפות ובעלת הופכית גזירה ברציפות) ו־$f:B arrow.r RR$ פונקציה רציפה.\
    אז $f$ אינטגרבילית על $B$ אם ורק אם הפונקציה $x mapsto (f compose g)(x) abs(det(D g_x))$ אינטגרבילית על $A$ ובמקרה זה מתקיים
    $ integral_B f(t)d t = integral_A (f compose g)(x)abs(det(D g_x)) d x $]
  הקבוצה $B$ מהווה אליפסה סביב הראשית שאינה מקבילה לצירים, ולכן נצטרך לבצע חילוף משתנה לינארי כדי להפוך את האליפסה לעיגול. נשתמש בהשלמה לריבוע:
  $ x^2-x y + y^2 = (x-1/2y)^2 - 1/4y^2 + y^2 = (x-1/2y)^2 + (sqrt(3)/2y)^2 $
  נבצע את חילוף המשתנה הלינארי $vec(u, v) = vec(x-1/2y, sqrt(3)/2y)$ ואז
  $ T^(-1) = mat(1, -1/2; 0, sqrt(3)/2)^(-1) $
  נזכר שמתקיים $det(T^(-1)) = 1/det(T)$ ולכן
  $ d x d y = abs(det(T^(-1))) d u d v = 2/sqrt(3) d u d v $
  נסמן $A = T(B) = B_2 (0) without {0}$ אז ממשפט חילוף משתנה, הפונקציה $f$ אינטגרבילית על $B$ אם ורק אם $f compose T^(-1)$ אינטגרבילית על $A$ ומתקיים
  $
    integral_B f(x,y) d x d y = integral_A u^2+v^2 dot.op s/sqrt(3) d u d v = 2/sqrt(3) =_("קוטביות") 2/sqrt(3) integral_0^(2pi) integral_0^2 r^2 d r d theta = 2/sqrt(3) integral_0^(2pi) [r^3/3]_(r=0)^(r=2) d theta = (24pi)/(3sqrt(3))
  $
]

#question()
תהיי
$ C colon.eq {(x,y) in RR^2 bar x>0, space y> 0, space 1<x y< 3, space x^2<y^2<x^2+1} $
ונחשב באמצעות משפט חילוף משתנה את האינטגרל
$ integral_C (y^2-x^2)^(x y) (x^2+y^2)d x d y $

#solution[
  #theorem(
    "משפט חילוף משתנה – תזכורת",
  )[תהיינה $A, B subset.eq RR^k$ קבוצות פתוחות ו־$g:A arrow.r B$ דיפאומורפיזם (חד־חד ערכית, על, גזירה ברציפות ובעלת הופכית גזירה ברציפות) ו־$f:B arrow.r RR$ פונקציה רציפה.\
    אז $f$ אינטגרבילית על $B$ אם ורק אם הפונקציה $x mapsto (f compose g)(x) abs(det(D g_x))$ אינטגרבילית על $A$ ובמקרה זה מתקיים
    $ integral_B f(t)d t = integral_A (f compose g)(x)abs(det(D g_x)) d x $]
  נשים לב שמהאילוץ $x^2<y^2<x^2+1$ אנחנו מקבלים $0<y^2-x^2<1$ לכן הגיוני שנגדיר $vec(u, v) = vec(x y, y^2-x^2)$ ואז
  $
    J = mat((partial u)/(partial x), (partial u)/(partial y); (partial v)/(partial x), (partial v)/(partial v)) = mat(y, x; -2x, 2y)
  $
  אז
  $ det(J) = 2 y dot. y + x dot.op 2x = 2(x^2+y^2) $
  ולכן
  $ d x d y = abs(det(J^(-1))) d u d v ==> d x d y = 1/(2(x^2+y^2)) d u d v $
  אז תחום האינטגרציה שלנו יהיה $A = {(u,v) in RR^2 bar 1<u<3, 0<v<1}$ ולכן
  $
    integral_C f(x,y) d x d y = integral_A (v^u cancel((x^2+y^2)))/(2 cancel((x^2+y^2))) d u d v = 1/2 integral_A v^u d u d v = 1/2 integral_0^1 integral_1^3 v^u d u d v = 1/2 integral_0^1 [v^u/ln(v)]^(u=3)_(u=1) d v \
    = 1/2 integral_0^1 v^3/ln(v) - v/ln(v) d v
  $
  אבל האינטגרל האחרון הוא לא אינטגרל שאנחנו יודעים לחשב, ולכן נשתמש במשפט פוביני
  $
    1/2 integral_0^1 integral_1^3 v^u d u d v = 1/2 integral_1^3 integral_0^1 v^u d v d u = 1/2 integral_1^3 [v^(u+1)/(u+1)]_(v=0)^(v=1) = 1/2 integral_1^3 1^(u+1)/(u+1) d u = 1/2 integral_1^3 1/(u+1) d u = 1/2 [ln(u+1)]_(u=1)^(u=3) \
    = 1/2 (ln(4)-ln(2))
  $
  $ T^(-1) = mat(1, 1; 0, -1) $
]

#question()
צטטי והוכיחי את משפט הקירוב האופטימלי של טורי פורייה.

#proof[
  *ניסוח:* יהי $(V, angle.l dot.op , dot.op angle.r)$ מרחב מכפלה פנימית ותהיי $(v_n)_(n=1)^infinity in V$. יהיו $v in V$ ו־$N in NN$, אזי מתקיים
  $
    min_(alpha_n in CC) norm(v-sum_(i=1)^N alpha_n v_n) = norm(v-sum_(i=1)^N underbrace((angle.l v_n"," v angle.r)/norm(v_n)^2, "מקדמי פורייה") v_n)
  $
  כלומר, מקדמי פורייה נותנים את הקירוב הטוב ביותר לטור.\
  *הוכחה*:
  $
    angle.l v-sum_(i=1)^N alpha_n v_n, v-sum_(i=1)^N alpha_n v_n angle.r = norm(v)^2 - sum_(i=1)^N overline(alpha_n) angle.l v_n, v angle.r - sum_(i=1)^N alpha_n angle.l v, v_n angle.r + sum_(i=1)^N abs(alpha_n)^2 norm(v_n)^2
  $
  נסמן $x_n = (angle.l v_n, v angle.r)/norm(v_n)^2$ ונקבל
  $
    norm(v-sum_(i=1)^N alpha_n v_n)^2 = norm(v)^2 - sum_(i=1)^N (overline(alpha_n) x_n - alpha_n overline(x_n) + abs(alpha_n)^2) norm(v_n)^2
  $
  נשים לב שמתקיים
  $
    abs(alpha_n-x_n)^2 = (alpha_n - x_n)(overline(alpha_n)- overline(x_n)) = abs(alpha_n)^2 - overline(alpha_n) x_n - alpha_n overline(x_n) + abs(x_n)^2
  $
  ולכן
  $ norm(v-sum_(i=1)^N alpha_n v_n)^2 = norm(v)^2 + sum_(i=1)^N (abs(alpha_n-x_n)^2 - abs(x_n)^2) norm(v_n)^2 $
  אז יש לנו ביטוי שתלוי רק ב־$alpha_n$ ולכן הוא מקסימלי כאשר $abs(alpha_n-x_n)$ מתאפס, כלומר $alpha_n = x_n$ ואז
  $ min_(alpha_n in CC) norm(v-sum_(i=1)^N alpha_n v_n)^2 = norm(v)^2 - sum_(i=1)^N abs(x_n)^2 norm(v_n)^2 $
]

#question()
צטטי והוכיחי את עקרון המקומיות.

#proof[
  *ניסוח*: תהיי $f: RR arrow.r RR$ מחזורית עם מחזור $2pi$ ואינטגרבילית רימן על $[-pi, pi]$. \
  נסמן
  $ S_N (x) = a_0/2 + sum_(k=1)^N (a_k cos(k x) + b_k sin(k x)) $
  אז לכל $0<delta<=pi$ ולכל $x in RR$ מתקיים
  $ lim_(N arrow.r infinity) S_N (x) - 1/pi integral_0^delta (f(x+u)+f(x-u)) D_N (u) d u = 0 $
  כאשר $ D_N (u) = sin((N+1/2)u)/(2sin(u/2)) $
  גרעין דירכלה.\
  *הוכחה*: מנוסחת דירכלה אנחנו יודעים שמתקיים $ S_N (x) = 1/pi integral_0^pi (f(x+u)+f(x-u)) D_N (u) d u $
  ולכן ניתן לכתוב
  $
    S_N (x) - 1/pi integral_0^delta (f(x+u)+f(x-u)) D_N (u) d u &= 1/pi integral_0^pi (f(x+u)+f(x-u)) D_N (u) d u - 1/pi integral_0^delta (f(x+u)+f(x-u)) D_N (u) d u \
    &= 1/pi integral_delta^pi (f(x+u)+f(x-u)) D_N (u) d u \
    &= integral_delta^pi (f(x+u)+f(x-u))/(2sin(u/2)) sin((N+1/2)u) d u
  $
  נגדיר $phi(u) = (f(x+u)+f(x-u))/(2sin(u/2))$ ונשים לב שהיא אינטגרבילית ומוגדרת בכל $[delta, pi]$ מאריתמטיקה של פונקציות אינטגרביליות.\
  נזכיר את *הלמה של רימן*: $f:[-pi, pi] arrow.r RR$ אינטגרבילית רימן על $[-pi, pi]$ אזי מתקיים
  $
    lim_(N arrow.r infinity) integral_(-pi)^pi f(x)cos(N x) d x = lim_(N arrow.r infinity) integral_(-pi)^pi f(x)sin(N x) d x = 0
  $
  ולכן בשילוב עם הלמה של רימן ומה שמצאנו מתקיים
  $
    lim_(N arrow.r infinity) S_N (x) - 1/pi integral_0^delta f(x+u) D_N (u) d u = lim_(N arrow.r infinity) integral_delta^pi f(x+u)/(2sin(u/2)) sin((N+1/2)u) d u = 0
  $
]

#question()
צטטי והוכיחי את משפט "התכנסות נקודתית של טורי פורייה".

#proof[
  *ניסוח*: תהיי $f : RR arrow.r RR$ מחזורית עם מחזור $2pi$.\
  יהיו $x_0 in RR$ ו־$0<delta<=pi$ ונניח ש־$f$ מקיימת את תנאי ליפשיץ ב־$x_0$.  כלומר, יש $C>0$ ו־$u in (0, delta)$ כך שמתקיים $ abs(f(x_0-u)-f(x_0-0))<= C u, abs(f(x_0+u)-f(x_0+0))<= C u $
  תחת תנאים אלו מתקיים
  $ lim_(N arrow.r infinity) S_n (x_0) = (f(x_0+0)+f(x_0-0))/2 $
  *הוכחה*: נוכיח תכילה שמתקיים $ lim_(N arrow.r infinity) 1/pi integral_0^delta D_N (u) d u = 1/2 $
  נגדיר $g:RR arrow.r RR$ על־ידי $g(t)=1/2$ אז $ a_0 = 1/pi integral_(-pi)^pi g(t) d t = (2pi)/(2pi) = 1, a_k = 1/(2pi) integral_(-pi)^pi cos(k t) d t = 1/(2pi) integral_(-pi)^pi sin(k t) d t = b_k $
  אז מעיקרון המקומיות מתקיים
  $
    lim_(N arrow.r infinity) underbrace(S^g_N (x), = 1/2) - 1/pi integral_0^delta (underbrace(g(x+u), =1/2)+underbrace(g(x-u), = 1/2)) D_n (u) d u = 0 ==> 1/pi integral_0^delta D_n (u) d u = 1/2
  $
  בפרט, מכפל בקבוע נקבל
  $ 1/pi integral_0^delta (f(x_0+0)+f(x_0-0)) D_n (u) d u = (f(x_0+0)+f(x_0-0))/2 $
  לכל $f$ שמקיימת את תנאי המשפט. אז נפעיל שוב את עיקרון המקומיות ונקבל
  $
    lim_(N arrow.r infinity) S^f_N (x_0) - (f(x_0+0)+f(x_0-0))/2 = lim_(N arrow.r infinity) 1/pi integral_0^delta (f(x_0+u)+f(x_0-u)-f(x_0+0)-f(x_0-0)) D_n (u) d u space (star)
  $
  נגדיר $phi(u) = (f(x_0+u)+f(x_0-u)-f(x_0+0)-f(x_0-0))/(2 pi sin(u/2))$ ולכן
  $ (star) = lim_(N arrow.r infinity) integral_0^delta phi(u) sin((N+1/2)u) d u $
  נראה כי $phi(u)$ אינטגרבילית על $[0, delta]$ ואז מהלמה של רימן נוכל לסיים. ואכן, $phi(u)$ אינטגרבילית על $[epsilon, delta]$ לכל $epsilon > 0$ מאריתמטיקה של פונקציות אינטגרביליות ולכן מספיק שנראה חסימות ב־$0$:
  $
    abs(phi(u)) <=_"אי־שיוויון המשולש" (abs(f(x_0+u)-f(x_0+u))+abs(f(x_0-u)-f(x_0-u)))/(2pi sin(u/2)) <=_"ליפשיציות" (2 C u)/(2 pi sin(u/2)) = (C u)/(pi sin(u/2))
  $
  ונשים לב שמלופיטל $u/sin(u/2) arrow.r_(u arrow.r 0) 2$ ולכן $(C u)/(pi sin(u/2))$ חסום וקיבלנו ש־$phi(u)$ אינטגרבילית על $[0,delta]$ ולכן נוכל להשתמש בלמה של רימן ולקבל
  $ lim_(N arrow.r infinity) integral_0^delta phi(u) sin((N+1/2)u) d u = 0 space checkmark $
  נזכיר את *הלמה של רימן*: $f:[-pi, pi] arrow.r RR$ אינטגרבילית רימן על $[-pi, pi]$ אזי מתקיים
  $
    lim_(N arrow.r infinity) integral_(-pi)^pi f(x)cos(N x) d x = lim_(N arrow.r infinity) integral_(-pi)^pi f(x)sin(N x) d x = 0
  $
]

#question()
נסחי והוכיחי את משפט האוסדרוף.

#proof[\
  *ניסוח*: יהי $(X,d)$ מרחב מטרי ותהיי $A subset.eq X$. $A$ חסומה לחלוטין אם ורק אם לכל $(x_n)_(n=1)^infinity subset.eq A$ יש תת–סדרה קושי.\
  *הוכחה*: \
  $==>$ נניח כי לכל $(x_n)_(n=1)^infinity subset.eq A$ יש תת–סדרה קושי ונרצה להראות שהיא חסומה לחלוטין.\
  יהי $epsilon > 0$ ונניח בשלילה שהיא לא חסומה לחלוטין, ולכן לכל $x_1 in A$ קיים $x_2 in A$ כך שמתקיים $d(x_1, x_2) >= epsilon$ ובאותו אופן יש $x_3 in A$ כך שמתקיים $d(x_2, x_3) >= epsilon$. נמשיך אינדוקטיבית ונבנה סדרה $(x_n)_(n=1)^infinity$ כזאת, אבל זו סדרה שבה המרחק בין כל שני איברים הוא יותר מ־$epsilon$ ולכן בפרט אין לה תת־סדרה קושי, וזו סתירה להנחה ש־$A$ לא חסומה לחלוטין.\
  $<==$ נניח כי $A$ חסומה לחלוטין ונרצה להראות שלכל סדרה $(x_n)_(n=1)^infinity subset.eq A$ יש תת־סדרה קושי.\
  תהיי $(x_n)_(n=1)^infinity subset.eq A$ סדרה. מהנחת החסימות לחלוטין, עבור $epsilon = 1$ יש $B^1_(epsilon = 1)$ כדור המכיל אינסוף מאיברי הסדרה $(x_n)_(n=1)^infinity$ ונסמן $V^0=A$.\
  נגדיר $V^1 = V^0 inter B^1_(epsilon = 1)$ ומתקיים $op("diam")(V^1)<=2$ וגם $V^1$ חסומה לחלוטין (כתת־קבוצה של קבוצה חסומה לחלוטין).\
  נמשיך אינדוקטיבית ונגדיר $V^k = V^(k-1) inter B^k_(epsilon = 1/k)$ ומתקיים $op("diam")(V^k) <= 2/k$ ונשים לב שמתקיים $V^k subset V^(k-1) dots.h.c subset V^1 subset V^0=A$ $(star)$.\
  נבחר אם־כך $x_n_1 in V^1, x_n_2 in V^2, dots.h.c, x_n_k in V^k$ כך שמתקיים $n_k < n_l$ לכל $k<l$ ומתקיים $d(x_n_k, x_n_(k+1)) < 1/k stretch(arrow.r)_(k arrow.r infinity) 0$ בגלל $(star)$ ולכן $(x_n_k)_(k=1)^infinity$ היא סדרת קושי.
]

#question()
נסחי והוכיחי את המשפט שבמרחב הילברט המרחק לקבוצה קמורה וסגורה (ולא ריקה) מתקבל.

#proof[
  \
  *ניסוח*: יהי $(V, sqrt(angle.l dot.op"," dot.op angle.r))$ מרחב הילברט (כלומר, מרחב מכפלה פנימית שלם) עם הנורמה המושרית מהמכפלה הפנימית.\
  תהיי $emptyset != U subset.eq V$, קבוצה קמורה וסגורה ב־$V$ ונגדיר לכל $f in V$, $op("Dist")(f, U) = inf_(u in U) norm(f-u)$.\
  אז קיים ויחיד $g in U$ כל שמתקיים $op("Dist")(f, U) = norm(f-g)$.\
  *הוכחה*: תהיי $g_1 in U$, אם מתקיים $op("Dist")(f,U) = norm(f-g_1)$ סיימנו. אחרת, יש $g_2 in U$ כך שמתקיים $op("Dist")(f,U)<= norm(f-g_2) < norm(f-g_1)$.\
  נגדיר $a_n = norm(f-g_n)$ לכל $n in NN$ ונקבל סדרה מונוטונית יורדת ממש כך שמתקיים $lim_(n arrow.r infinity) a_n = op("Dist")(f,U)$.\
  נראה כעת שהסדרה היא קושי, לשם כך עלינו להראות *למה*: במרחב מכפלה פנימית מתקיים _כלל המקבילית_, כלומר לכל $x,y in V$
  $ norm(x+y)^2+norm(x-y)^2 = 2(norm(x)^2+norm(y)^2) $
  *הוכחת הלמה*: זה נובע ישירות מהגדרת המכפלה הפנימית
  $
    norm(x+y)^2+norm(x-y)^2 &= angle.l x+y, x+y angle.r + angle.l x-y, x-y angle.r \
    &= angle.l x, x angle.r + angle.l x, y angle.r + overline(angle.l x"," y angle.r) + angle.l y,y angle.r + angle.l x, x angle.r - angle.l x, y angle.r - overline(angle.l x"," y angle.r) + angle.l y,y angle.r \
    &= 2 angle.l x,x angle.r + 2 angle.l y,y angle.r \
    &= 2(norm(x) + norm(y))
  $
  נשתמש בלמה, מתקיים
  $
    norm(g_i - g_j)^2 = norm(g_i - g_j + f - f)^2 = norm((f-g_j)-(f-g_i))^2 = 2 norm(f-g_i)^2+2norm(f-g_j)^2-norm(2f - g_i - g_j)^2 \
    = norm(f-g_i)^2+2norm(f-g_j)^2-4norm(f - (g_i - g_j)/2)^2 <=_("קמורה U" \ (g_i - g_j)/2 in U) 2 norm(f-g_i)^2+2norm(f-g_j) - 4 op("Dist")(f,U)^2 \
    stretch(arrow.r)_(j arrow.r infinity \
    i arrow.r infinity) 2op("Dist")(f,U)^2+2op("Dist")(f,U)^2-4op("Dist")(f,U)^2 = 0
  $
  ולכן $(a_n)_(n=1)^infinity$ היא סדרת קושי ומהיות המרחב השלם נובע שהיא מתכנסת ולכן קיים $g_0 in V$ כך שמתקיים $lim_(n arrow.r infinity) a_n = g_0$ אבל $U$ קבוצה סגורה ולכן $g_0 in U$.\
  *יחידות*: ניזכר שפונקציית המרחק היא אינווריאטית להזזה וקבוצה היא קמורה וסגורה אם ורק אם גם ההזזה של היא קבוצה קמורה וסגורה, ולכן מספיק שנראה עבור המקרה של $f=0$.\
  נניח בשלילה שהמרחק לא יחיד, ולכן יש $g_1 != g_2 in U$ כך שמתקיים $d = op("Dist")(0, U) = norm(g_1) = norm(g_2)$.\
  נגדיר $w = (g_1+g_2)/2 in_"קמירות" U$ ונחשב
  $
    norm(w)^2 = 1/4 (norm(g_1)^2+norm(g_2)^2+2frak(R)(angle.l g_1, g_2 angle.r))<=_("אי־שיוויון קושי־שוורץ") 1/4(norm(g_1)^2+norm(g_2)^2+norm(g_1)norm(g_2)) - 1/4 (d^2+d^2+2d^2) = d^2
  $
  יש שיוויון אם ורק אם $g_1, g_2$ תלויים לינארית:\
  אם $g_1, g_2$ לא תלויים לינארית אז יש אי־שיוויון חלש ואז $norm(w)^2 < d^2$ וזו סתירה להנחה, ולכן יש תלות לינארית.\
  בלי הגבלת הכלליות, $g_2 = alpha g_1$ ומההנחה $alpha!=1 in CC$. אבל $norm(g_1)=norm(g_2) ==> norm(g_1) = abs(alpha) norm(g_2)$ ולכן $abs(alpha)=1$ אז
  $
    norm(w)^2 = 1/4 (norm(g_1)^2+norm(g_2)^2+2frak(R)(angle.l g_1, g_2 angle.r)) = 1/4 (d^2+d^2 + 2frak(R)(angle.l g_1, alpha g_2 angle.r))= 1/4 (d^2+d^2+2frak(R)(alpha)^2 d^2) = d^2/2 (1+frak(R)(alpha)) \
    <_(frak(R)(alpha)<1) d^2/2 (1+1) = d^2
  $
  וזאת שוב סתירה, ולכן ההנחה שלנו של שני ערכים שונים היא סתירה ועל־כן יש רק ערך אחד שמביא את המרחק.

]

#question()
צטטי והוכיחי את משפט הקירוב של ויירטשראס.

#proof[\
  *ניסוח*: תהיי $f in C[0,1]$. אז קיימת $(P_n)_(n=1)^infinity$ סדרת פולינומים כך שמתקיים $P_n arrows.rr f$ (מתכנס במידה שווה).\
  *הוכחה*: נתחיל מרידוד הבעיה, נגדיר $g(x) = f(x)-f(0)-x(f(1)-f(0))$ כלומר $f(x)=g(x)+f(0)+x(f(1)-f(0))$ אז החלק המוסף הוא פולינום ועל־כן רציף ולכן מספיק לבחון את הקירוב ל־$g$, בלי הגבלת הכלליות נגדיר $f(0)=f(1)=0$.\
  נגדיר $F:RR arrow.r RR$ על־ידי $F(x) = mycases(f(x), x in [0,1], 0, x in RR without [0,1])$ זו פונקציה רציפה במידה שווה על כל הישר $RR$ (מההנחה שעשינו).\
  נגדיר $P_n (x) = integral_(-1)^1 F(x+u) Q_n (u) d u$ כאשר $Q_n = C_n (1-u^2)^n$ ו־$C_n$ הוא קבוע נרמול כך שיתקיים $integral_(-1)^1 Q_n (u) d u = 1$.\
  מהגדרת התומך, $F(x+u)!=0$ אם ורק אם $x+u in [0,1]$ כלומר $u in [-x, 1-x]$ ולכן
  $ integral_(-x)^(1-x) F(x+u) Q_n (u) d u = integral_0^1 F(t) Q_n (t-x) d t $
  ומהמשפט היסודי, מהיות $Q_n$ פולינום נקבל ש־$P_n$ פולינום.\
  $F$ רציפה, אז עבור $epsilon > 0$ יש $delta > 0$ כך שאם $abs(x-y)<=2delta$ אזי $abs(F(x)-F(y))<epsilon$. נחשב
  $
    abs(P_n (x) - F(x)) &= abs(integral_(-1)^1 F(x+u) Q_n (u) d u - F(x)) \
    &=_((1)) abs(integral_(-1)^1 F(x+u) Q_n (u) d u - integral_(-1)^1 F(x) Q_n (u) d u) \
    &<=_((2)) integral_(-1)^1 abs(F(x+u)-F(x))Q_n (u) d u \
    &<= underbrace(integral_(-1)^delta abs(F(x+u)-F(x))Q_n (u) d u, I_1) + underbrace(integral_(-delta)^delta abs(F(x+u)-F(x))Q_n (u) d u, I_2) + underbrace(integral_delta^1 abs(F(x+u)-F(x))Q_n (u) d u, I_3)
  $
  כאשר $(1)$ נובע מהיות $integral_(-1)^1 Q_n (u) d u = 1$ ו־$(2)$ זה אי־שיוויון המשולש האינטגרלי.\
  מרציפות $F$ ישר נקבל
  $ I_2 < epsilon integral_(-delta)^delta Q_n (u) d u <= epsilon integral_(-1)^1 Q_n (u) d u = epsilon $
  וכן מהרציפות נובע ש־$F$ חסומה, ולכן קיים $0<M in RR$ חסם ואז
  $
    I_3 <= 2 M integral_delta^1 Q_n (u) = 2 M C_n integral_delta^1 (1-u^2)^n <= 2 M C_n underbrace((1-delta^2), "סופרמום")underbrace((1-delta), "גבולות אינטגרציה")<= 2 M C_n (1-u^2)^n
  $
  כעת, נרצה לחסום את $C_n$ ונזכור שהוא מנרמל כך שיתקיים $integral_(-1)^1 Q_n (u) d u = 1$, אז
  $
    integral_(-1)^1 (1-u^2)^n d u >= integral_((-1)/sqrt(n))^(1/sqrt(n)) (1-u^2)^n d u >=_((1)) 2 integral_0^(1/sqrt(n))(1-u^2)^n d u >=_((2)) 2 integral_0^(1/sqrt(n))1-n u^2 d u \
    >= 2[u-(n u^3)/3]_(u=0)^(u=1/sqrt(n)) = 2/sqrt(n)-(2n 1/sqrt(n)^3)/3 = 2/sqrt(n)-2/(3sqrt(n)) = 4/(3sqrt(n)) >= 1/sqrt(n) ==> C_n <= sqrt(n)
  $
  כאשר $(1)$ נובע מהיות הפונקציה סימטרית על קטע סימטרי, $(2)$ זה אי־שיוויון ברנולי.\
  נבחין שהקטעים $I_1, I_3$ הם סימטריים ולכן בסך־הכל מתקיים
  $abs(P_n (x) - F(x)) < epsilon + 4 M C_n (1-delta^2)^n stretch(arrow.r)_(n arrow.r infinity) 0$\
  כלומר, לכל $n in NN$ יש $M > n$ כך שמתקיים לכל $x in RR$
  $abs(P_n (x) - F(x)) < 2epsilon$ וזה בידיוק אומר $P_n arrows.rr^RR f$ ובפרט $P_n arrows.rr^([0,1]) f$.
]

#question()
צטטי והוכיחי את משפט סטון־ויירשטראס.

#proof[\
  *ניסוח*: יהי $(X, rho)$  מרחב מטרי ו־$K subset.eq X$ קבוצה קומפקטית. נסתכל על המרחב $(C(K), norm(dot.op)_infinity)$ כאשר $ C(K) colon.eq {f : K arrow.r RR bar "רציפה" f}, wide norm(dot.op)_infinity = sup_(x in K) abs(f(x)) $
  תהיי $A subset.eq C(K)$ אלגברה, מפרידה בין נקודות ואינה מתאפסת באף נקודה. אז $overline(A)=C(K)$.\
  *הוכחה*: נשתמש בשתי למות ללא הוכחה
  *למה 1*: $A$ אלגברה בתנאי המשפט ויהיו $x_1, x_2 in X$ ו־$c_1, c_2 in RR$.\ אז יש $f in A$ כך שמתקיים $f(x_1)=c_1, f(x_2)=c_2$.\
  *למה 2*: אם $A$ אלגברה ב־$C(K)$ אז גם $overline(A)$ אלגברה ב־$C(K)$.\
  כעת נוכיח שתי למות נוספות: \
  *למה 3*: $A$ אלגברה בתנאי המשפט ו־$f in A$, אז $abs(f) in overline(A)$.\
  *הוכחת למה 3*: יהי $epsilon>0$, מספיק להוכיח שיש $phi in overline(A)$ כך שמתקיים $sup_(x in K) abs(f(x)-phi(x))<epsilon$.\
  ניקח $d = sup_(x in K) abs(f(x))$ ונגדיר $g(t) : [-d, d] arrow.r RR$ על־ידי $g(t)=abs(t)$ זו פונקציה רציפה ולכן ממשפט הקירוב של ויירשטראס יש $(P_n)_(n=1)^infinity$ סדרת פולינום כך שלכל $t in [-d, d]$ מתקיים $abs(abs(t)-P_n (x))<epsilon$ ולכן בפרט לכל $x in K$ מתקיים גם $abs(abs(f(x))-P_n (f(x)))<epsilon$ אז \ $overline(A) in.rev phi = P_n (f(x))$ ונקבל $abs(f) in overline(A)$.\
  *למה 4*: אם $f, g in overline(A)$ אז $max(f, g), min(f, g) in overline(A)$.\
  *הוכחת למה 4*: נגדיר $max(f, g) = (f+g+ abs(f-g))/2, min(f, g) = (f+g-abs(f-g))/2$ ויחד עם למות 2,3 זה מסיים (המקרה הכללי באינדוקציה).\
  *הוכחת המשפט*: יהיו $epsilon > 0, f in C(K), x in K$. נרצה לבנות פונקציה $g_x$ כך שיתקיים
  #block(height: 1em, columns(3)[
    1. $g_x in overline(A)$
    2. $g_x (x) = f(x)$
    3. $forall t in K, space g_x (t) > f(t)-epsilon$
  ])
  מהלמה הראשונה, לכל $y in K$ יש $h_y in A$ כך שמתקיים $h_y (y) = f(y), h_y (x) = f(x)$ ולכן נגדיר $J_y = {t in K bar h_y (t) > f(t) - epsilon}$, ברור $y in J_y$ וזה כיסוי פתוח של $K$ ומהקומפקטיות יש לו תת־כיסוי סופי, כלומר $K = union.big_(i=1)^n J_(y_i)$.\
  נגדיר $g_x = max(h_(y_1), dots.h.c h_(y_n))$ ומהלמה הרביעית נקבל $g_x in overline(A)$ ומתקיים $h_(y_1) (x) = dots.h.c = h_(y_n) = f(x)$ ולכן $g_x (x) = f(x)$.\
  לכל $t in K$ יש $i in [n]$ כך ש־$t in h_(y_i)$ ולכן $g_x (t) >= h_(y_i) (t) > f(t) - epsilon$.\
  נגדיר $hat(J)_x = {t in K bar g_x (t) < f(t)+epsilon}$ וכמובן $x in hat(J)_x$ ושוב זה כיסוי פתוח של $K$ ומהקומפקטיות $K = union.big_(i=1)^m hat(J)_(x_i)$ ונגדיר $phi(t) = min(g_(x_1) (t), dots.h.c, g_(x_m) (t))$ ולכן $t in K$ יש $j in [m]$ כך שמתקיים $t in hat(J)_(x_j)$ ואז $g_(x_j) (t) < f(t) + epsilon$ ולכן בפרט $phi(t)<=g_(x_j) (t) < f(t)+epsilon$ וגם $phi(t) = g_(x_j) (t) > f(t) - epsilon$ ולכן בפרט $norm(phi-f)_infinity$ כלומר $overline(A)=C(K)$.
]

#question()
עבור $p!=3$ ראשוני נגדיר $K_p$ שדה הפיצול של הפולינום $x^9-1$ מעל $FF_p$.\
נמצא את כל חבורות גלואה האפשריות $G(K_p slash FF_p)$.

#proof[
  ראשית, שדה הפיצול הוא יחיד עד־כדי איזומורפיזם וידוע ש־$K_p = FF_p (xi_9)$, ולכן מטענה שראינו על חבורות גלואה של הרחבות ציקלוטומיות מתקיים $op("Gal")(K_p slash FF_p) tilde.eq (ZZ slash 9 ZZ)^times = {1,2,4,5,7,8}$.\
  זו חבורה מגודל $6$ וגם $phi_"אויילר" (9) = 6$ ולכן המחלקים האפשריים של חבורה מסדר $6$ הם ${1,2,3,6}$ אז $op("ord")_9 (p) in {1,2,3,6}$.\
  אנחנו רוצים למצוא את ה־$n$ המינימלי כך ש־$FF_(p^n)$ מכיל את $xi_9$, אז זה בידיוק ה־$n$ המינימלי כך ש־$9 divides (p^n-1)$ כאשר $n in {1,2,3,6}$ ו־$p!=3$ ראשוני. אז
  + עבור $9 divides (p^1-1)$ נבחר $p=19$ שראשוני ואז $19-1=18 eq.triple_(mod 9) = 0$ כלומר $19 eq.triple_(mod 9) = 1$
  + עבור $9 divides (p^2-1)$ נשים לב ש־$p=2$ לא מתאים, עבור $p=5$ נקבל $25 eq.triple.not_(mod 9) 1$ אז לא מתאים, עבור $p=7$ נקבל $49 eq.triple.not_(mod 9) 1$ אז גם לא מתאים, עבור $p=9$ כמובן שלא מתאים, $p=11$ אז $11^2=121 eq.triple.not_(mod 9) 1$ וגם $13^2 = 169 eq.triple.not_(mod 9) 1$ ועבור $p=17$ נקבל $17^2 eq.triple_(mod 9) 1$ כלומר $p=17$ מקיים את מה שרצינו
  + עבור $9 divides (p^3-1)$ ברור ש־$p!=2$ ואז עבור $p=5$ נקבל $125-1=124 eq.triple.not_(mod 9) 0$ ועבור $p=7$ נקבל $7^3=343 eq.triple_(mod 9) 1$ אז $p=7$
  + עבור $9 divides (p^6-1)$ אם נבחר $p=2$ נקבל $2^6=64 eq.triple_(mod 9) = 1$
  עשיתי את כל החישובים בכוח, אפשר גם לא בכוח?\
]

#question()
נמצא במפורש את כל ההרחבות הריבועיות של $QQ(xi_21)$.

#proof[
  הפולינום המינימלי הוא $Phi_21 (x)$ שאין שום מצב שאזכור אותו, אז נתעלם ממנו. מתקיים
  $ phi_"אויילר" (21) = abs({x in [20] bar gcd(21, x) = 1}) = abs({1,2,4,5,8,10,11,13,16,17,19,20})=12 $
  ולפי משפט שראיינו מתקיים $[QQ(xi_21) : QQ] = 12$ ולכן לפי עוד משפט שראינו מתקיים $Gal(QQ(xi_21) slash QQ) tilde.eq (ZZ slash 21 ZZ)^times = {1,2,4,5,8,10,11,13,16,17,19,20}$ היא אכן חבורה מסדר $12$.\
  במטלה ראינו שמשפט השאריות הסיני רלוונטי לחבורות הכפליות ולכן
  $
    (ZZ slash 21ZZ)^times tilde.eq (ZZ slash 3ZZ)^times times (ZZ slash 7ZZ)^times tilde.eq C_2 times C_6 tilde.eq C_6 times C_2 tilde.eq_"משפט המיון" (C_2 times C_2) times C_3
  $
  יש $3$ תתי־חבורות מסדר $2$, אחת מסדר $3$, אחת מסדר $4$ ו־$3$ מסדר $6$ (גוגל).\
  מהתאמת גלואה, יש התאמה חד־חד ערכית ועל בין תתי־חבורות לבין שדות ביניים כך שלכל תת־חבורה מתאים שדה ביניים  כך שדרגת ההרחבה של שדות היא האינדקס של של תת־החבורה (כלומר, תת־חבורה מסדר $6$ היא מאינדקס $2$ ולכן מובילה להרחבה ריבועית):
  #set table(stroke: (_, y) => if y > 0 { (top: 0.8pt) })
  #table(
    columns: 3,
    align: center,
    table.header([*סדר תת־החבורה*], [*אינדקס*], [*דרגת ההרחבה*]),

    [$ 1 $], [$ 12 $], [$ 12 $ ],

    [$ 2 $], [$6$ ], [$ 6 $ ],

    [$ 3 $], [ $4$ ], [$ 4 $ ],

    [$ 4 $], [ $3$ ], [$ 3 $ ],

    [$ 6 $], [ $2$ ], [$ 2 $ ],

    [$1 2$], [ $1$], [ $1$ ],
  )
  לפי תרגיל 7.5.13 "שראינו" בסיכומים של מיכאל מתקיים $QQ(xi_3, xi_7) = QQ(xi_21)$ ו־$xi_3, xi_7$ הם בלתי תלויים לינארית (הם יוצרים הרחבה מדרגה $12$ ביחד בעוד שהדרגה של המכפלה שלהם היא $phi_"אויילר" (3) dot.op phi_"אויילר" (7) = 2 dot.op 6 = 12$ והפולינומים המינימליים שלהם זרים, אז אין תלות לינארית ביניהם).\
  נזכור שתת־חבורה של חבורה אבלית היא תמיד חבורה נורמלית וכל חבורה כזאת וויתרתי באמצע.
]

#question()
נוכיח שלא בהכרח אם $f in FF[x]$ פולינום אי־פריק וספרבילי מדרגה $n$ ו־$E$ שדה פיצול שלו אז ב־$Gal(E slash F)$ יש איבר מסדר $n$.

#proof[
  ניקח $F = QQ$ ואת $f(x)=x^4-10x^2+1$.\
  ראשית הוא אי־פריק באמצעות Rational root theorem כי $r= plus.minus 1 divides a_0 = 1$ וגם $s=plus.minus 1 divides a_n=1$.\
  אז $f(1)=1^4-10+1=-8, f(-1) = (-1)^4-10 dot.op (-1)^2 + 1 = -8$ אז אין לו שורשים ב־$QQ$ אז בפרט זה אומר שלא ניתן לפרק אותו למכפלה של פולינום מדרגה $1$ ועם פולינום מדרגה $3$.\
  אז אם הוא פריק, יש לו פירוק למכפלה של דרגות $2$, כלומר
  $
    x^4-10x^2+1 = (x^2+a x+b)(x^2+c x +d) = x^4+c x^3 + d x^2 + a x^3 + a c x^2 + a d x + b x^2 + b c x + b d \
    = x^4 + x^3(a+c) + x^2 (d + a c + b) + x( a d + b c) + b d
  $
  אז
  $
    b d = 1 <==> b = d = 1 or b = d = (-1) \
    a + c = 0 <==> a = -c \
    a d + b c = 0 <==> a d = - b c <==> -c d = - b c
  $
  אם $a=c=0$ אז $d + a c + b = d + b = 10$ וזה לא ייתכן כי $b=d=-1 or b=d=1$. אז $c!=0$.
  $ d + a c + b = 10 <==> d -c^2 + b = 10 = mycases(c^2 = -8 crossmark, d=b=1, c^2=-12 crossmark, d=b=(-1)) $
  אז שוב הגענו למצב שאין פיתרון ולכן $f(x)$ אי־פריק מעל $QQ$.\
  הוא ספרבילי, כי $f'(x) = 4x^3-20x = 4x(x^2-5)$ כלומר השורשים הם $x=0, x=plus.minus sqrt(5)$ אבל $f(0)!=0 and f(sqrt(5))!=0 and f(-sqrt(5))!=0$ (הם לא שורשים של $f$ וראינו ששורש של $f$ הוא שורש מרובה אם ורק אם $f'(x)=0$).\
  נרצה למצוא את השורשים של $f$: נגדיר $y=x^2$ ואז $f$ נהפך להיות $y^2-10y+1$, מנוסחת השורשים
  $
    y = (-b plus.minus sqrt(b^2-4 a c))/(2 a) = (10 plus.minus sqrt(100-4))/2 = (10 plus.minus sqrt(96))/2 = (10 plus.minus sqrt(16 dot.op 6))/2 = (10 plus.minus 4 sqrt(6))/2 = 5 plus.minus 2 sqrt(6)
  $
  כלומר $sqrt(5 + 2 sqrt(6)), sqrt(5 - 2 sqrt(6)), -sqrt(5 + 2 sqrt(6)), -sqrt(5 - 2 sqrt(6))$ הם השורשים של $f$.\
  נניח כעת שאפשר לפשט את הביטוי הזה, כלומר
  $ sqrt(5+2sqrt(6)) = sqrt(a)+sqrt(b) <==> 5+2sqrt(6) = a+b+2sqrt(a b) <==> mycases(a+b=5, a b = 6) <==> a=2, b=3 $
  אז בעצם $E = QQ(sqrt(3), sqrt(2))$ ולכן $[E:QQ] = 4$ ואנחנו יודעים שמתקיים $abs(Gal(E slash QQ)) = 4$ ויש רק שני חבורות מסדר $4$ והן $ZZ_4, V_4$ (חבורת קליין והחבורה הציקלית מסדר $4$).\
  נטען שזו חייבת להיות חבורת קליין: חבורת גלואה מכילה את כל האוטומורפיזמים שהם תמורות על השורשים.\
  נסמן $alpha = sqrt(2)+sqrt(3), beta = sqrt(2)-sqrt(3)$ אז ייתכן רק $sigma: sqrt(alpha) mapsto -sqrt(alpha), tau: sqrt(beta) mapsto -sqrt(beta)$ ואז ייתכן שחבורת גלואה מכילה רק את אוטומורפיזם הזהות, הנגדי ל־$sqrt(alpha)$, הנגדי ל־$sqrt(beta)$ והאוטומורפיזם ששולח לנגדי של $sqrt(alpha), sqrt(beta)$.\
  כל איבר פה הוא מסדר $2$ ואין אף איבר מסדר $4$ ולכן לא ייתכן שהחבורה תהיה איזומורפית לחבורה הציקלית מסדר $4$ ולכן $Gal(E slash QQ) tilde.eq V_4$.\
  אז זה מהווה דוגמה נגדית לטענה.
]

#question()
נמצא את $abs(Aut(QQ(root(n, 2)) slash QQ))$ עבור $n in NN$.

#solution[
  הפולינום המינימלי של השדה $QQ(root(n, 2))$ הוא $f(x)=x^n-2$.\
  שדה הפיצול מעל $QQ$ יהיה $F=K L$ עבור $K = QQ(xi_n)$ ו־$L=QQ(root(n, 2))$ אז הסדר של חבורת גלואה יהיה
  $
    [F : QQ] = ([K : QQ] dot.op [L : QQ])/[K inter L : QQ] = (n phi_"אויילר" (n))/[K inter L : QQ] = (n phi_"אויילר" (n))/m
  $
  ונתקעתי פה כי זה לא בחומר מסתבר? \
  $f$ אי־פריק מקריטריון אייזנשטיין מעל $ZZ[x]$ עם $p=2$ ומתקיים $op("cont")(x^n-2) = gcd(1, 2) = 1$ ולכן מהלמה השנייה של גאוס הוא אי־פריק מעל $QQ$ ועל־כן $[QQ(root(n, 2)) : QQ]=n$.\
  השורשים של הפולינום נתונים על־ידי $root(n, 2) xi^k$ עבור $xi=e^((2 pi i)/n), 0<=k<=n-1$.\
  כלומר, $Gal(QQ(root(n, 2)) slash QQ) tilde.eq ZZ slash n ZZ$ כי היא נוצרת על־ידי איבר אחד ($root(n, 2) mapsto root(n, 2) xi^k$ עבור $0<=k<=n-1$).
]

#question()
נוכיח שהטענה הבאה לא נכונה: עבור $n in NN$, שדה הפיצול של $x^n-2$ מעל $QQ$ הוא מדרגה $n dot.op phi_"אויילר" (n)$.

#proof[
  ראינו כבר ש־$sqrt(2) in QQ(xi_8) = QQ(sqrt(2), i)$ (בגלל שמצאנו את כל השדות ביניים של $QQ(xi_8)$).\
  שדה הפיצול של $x^8-2$ הוא $QQ(root(8, 2), i)$ שהוא מדרגה $16$ מעל $QQ$ בעוד $ 8 dot.op phi_"אויילר" (8) = 8 dot.op abs({x in {1, dots.h.c, 7} bar gcd(x, 8)=1}) = 8 dot.op abs({1,3,5,7})) = 8 dot.op 4 = 32 $
  נשים לב
  $ [QQ(root(8, 2), i) : QQ] = 8 dot.op 2 = 16 $
  כי $root(8, 2)$ הוא שורש של הפולינום $x^8-2$ שהוא אי־פריק מעל $QQ$ עם קריטריון אייזנשטיין עם $p=2$
]

#question()
יהי $E$ שדה הפיצול של $f(x)=x^7+x^6+x^3+x^2+x+1 in FF_2 [x]$. נמצא את הגודל של $E$ ונמצא את טיפוס האיזומורפיזם של $Gal(E slash FF_2)$.

#proof[
  ל־$f$ יש שורש יחיד ב־$FF_2$ כי $FF_2 = {0,1}$ ומתקיים
  $
    f(1)=1+1+1+1+1+1 = 6 = 0 \
    f(0) = 0+0+0+0+0+1 = 1 != 0
  $
  אז $x=1$ הוא שורש, כלומר $f(x) = (x+1)g(x)$ עבור $g(x) in FF_2 [x]$ פולינום מדרגה $6$ ואם נעשה חלוקת פולינומים
  $
    (x^7+x^6+x^3+x^2+x+1)/(x+1) = ((x+1)(x^6)+x^3+x^2+x+1)/(x+1) = x^6 + (x^3+x^2+x+1)/(x+1) = x^6 + ((x+1)x^2+x+1)/(x+1) \
    = x^6 + x^2 + (x+1)/(x+1) = x^6+x^2+1=g(x)
  $
  אין שורש ל־$g(x)$ כי $g(0)=1!=0, g(1) = 3 = 1 !=0$.\
  נשים לב $x^6+x^2+1=_(in FF_2 [x]) (x^3+x+1)(x^3+x+1)$ וזה כבר פולינום אי־פריק כי הוא מדרגה $3$ ובלי שורשים ולפי מטלה $1$ נקבל שהוא אי־פריק. אז
  $ f(x)= x^7+x^6+x^3+x^2+x+1 = (x+1)(x^3+x+1)^2 $
  בשביל השדה פיצול נצטרך להוסיף את השורשים של $x^3+x+1$ אז אם נסמן ב־$alpha$ את השורש של הפולינום הזה ונסתכל על $E = FF_2 (alpha)$.\
  הוספנו את $alpha$, כלומר הוספנו אופציה לביטוי לינארי אז החזקות שיכולות להיות הן של $alpha$ עד חזקת $2$, אז כל איבר ב־$FF_2 (alpha)$ הוא מהצורה
  $ a_0 + a_1 alpha + a_2 alpha^2 space (a_0, a_1, a_2 in FF_2) $
  ולכן בסיס להרחבה הוא
  $ {1, alpha, alpha^2} $
  צריך להראות שהבסיס בלתי־תלוי לינארי ובשביל זה צריך להראות ש־$alpha, alpha^2$ בלתי־תלויים לינארית:
  כי אם הם היו תלויים לינארית, היה צריך להתקיים
  $ a_1 alpha + a_2 alpha^2 = 0 (a_1, a_2 in FF_2) $
  אם $a_1=a_2 = 0$, סיימנו. אם $a_1, a_2 = 1$ אז $alpha+alpha^2 = 0 <==> alpha(1+alpha)=0$ וזו סתירה לאי־פריקות שמצאנו.\
  נשאר $(a_1 = 1 and a_2 = 0) or (a_1 = 0 and a_2) = 1$ ושניהם מובילים לאותה סתירה על האי־פריקות שמצאנו.\
  אז זה אכן בסיס, ויש לנו $2^3=8$ אפשרויות לאיברים, כלומר כל האיברים בהרחבה הם
  $ {0, 1, alpha, alpha^2, 1+alpha,1+alpha^2, alpha+alpha^2,1+alpha+alpha^2 } $
  אז $abs(E)=8=2^3$, אז $E =FF_2 (alpha) = FF_(2^3)$ (כי יש רק שדה אחד עם $8$ איברים).\
  עובר טיפוס האיזומורפיזם לפי משפט שראינו יתקיים $Gal(E slash FF_2) = Gal(FF_(2^3) slash FF_2) = ZZ slash 3ZZ$.

]

#question()
$X,Y$ משתנים מקריים בלתי־מתואמים בעלי שונות $1$ ו־$theta in RR$, נוכיח גם שהמשתנים
$
  Z = cos(theta) dot.op X + sin(theta) dot.op Y \
  Y = sin(theta) dot.op X + cos(theta) dot.op Y
$
הם בלתי־מתואמים ובעלי שונות $1$.

#proof[
  מהיות $X,Y$ בלתי־מתואמים נובע
  $
    0=Cov(X, Y) ==> EE(X Y) = EE(X)EE(Y) \
    Var(X) = EE(X^2)-EE(X)^2 = 1 \
    Var(Y) = EE(Y^2)-EE(Y)^2 = 1
  $
  ראשית מלינאריות התוחלת
  $
    EE(Z) = cos(theta) dot.op EE(X) + sin(theta) dot.op EE(Y) \
    EE(W) = sin(theta) dot.op EE(X) + cos(theta) dot.op EE(Y)
  $
  עלינו להראות
  $ Cov(Z, W)=EE(Z W) = EE(Z)EE(W) $
  כמה חישובים
  $
    EE(Z) = cos(theta) dot.op EE(X) + sin(theta) dot.op EE(Y) \
    EE(W) = sin(theta) dot.op EE(X) + cos(theta) dot.op EE(Y)
  $
  ולכן
  $
    EE(Z)EE(W) & = (cos(theta) dot.op EE(X) + sin(theta) dot.op EE(Y))(sin(theta) dot.op EE(X) + cos(theta) dot.op EE(Y)) \
               & = cos(theta)sin(theta)EE(X)^2+cos^2(theta)EE(X)EE(Y)+sin^2(theta)EE(X)EE(Y)+sin(theta)cos(theta)EE(Y)^2 \
               & = cos(theta)sin(theta)EE(X)^2+EE(X)EE(Y)+cos(theta)sin(theta)EE(Y)^2
  $
  כעת מלינאריות התוחלת
  $
    EE(Z W) &= EE((cos(theta) dot.op X + sin(theta) dot.op Y)(sin(theta) dot.op X + cos(theta) dot.op Y)) \
    &= EE(cos(theta)sin(theta) dot.op X^2 + cos^2(theta) dot.op X dot.op Y + sin^2(theta) dot.op X dot.op Y + sin(theta)cos(theta) dot.op Y^2) \
    &= cos(theta)sin(theta)(EE(X^2)+EE(Y^2))+EE(X dot.op Y) \
    &= cos(theta)sin(theta)(EE(X^2)+EE(Y^2)) + EE(X)EE(Y)
  $
  כאשר המעבר האחרון זה מהאי־תאימות.\
  נסמן $t=sin(theta)cos(theta)$ לנוחות
  וכעת
  $
    Cov(Z, W)=EE(Z W) - EE(Z)EE(W) = t(EE(X^2)+EE(Y^2))+EE(X)EE(Y) - t EE(X)^2 - EE(X)EE(Y)-t EE(Y)^2 \
    = t EE(X^2)+t EE(Y^2) - t EE(X)^2-t EE(Y)^2 \
    = t(EE(X^2)-EE(X)^2)-t(EE(Y^2)-EE(Y)^2) = t-t = 0
  $
  שכן השונות בסוגריים עם ה־$t$ היא $1$.\
  חישובים דוחים אבל הזהות הכי טובה בעולם באופן דומה השונות של כל אחד מהם תהיה אחת.
]
