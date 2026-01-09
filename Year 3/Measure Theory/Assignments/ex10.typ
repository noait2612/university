#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 10 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)
#let dist = math.op("dist")

#question()
נבנה קבוצה מדידה $E subset.eq RR$ כך שאם $lambda|_E (A) = lambda(A inter E)$ אז מתקיים
$ overline(D)(lambda|_E, lambda, 0)=1, wide underline(D)(lambda|_E, lambda, 0)=0 $

#proof[
  נגדיר
  $ a_n = 1/(2n)! wide b_n=1/(2n+1)! $
  מתקיים
  $ 0 < dots.h.c < a_(n+1) < b_n < a_n < b_(n+1) < dots.h.c > 1 $
  ונגדיר
  $
    E = union.big_(n=1)^infinity ([-a_n, b_n] union [b_n, a_n] = union.big_(n=1)^infinity ([-1/(2n)!, -1/(2n+1)!] union [1/(2n+1)!, 1/(2n)!])
  $
  עבור $r_n = a_n$ נקבל
  $ lambda(E inter (-a_n, a_n)) >= lambda([-a_n, -b_n])+ lambda([b_n, a_n]) = 2(a_n - b_n) $
  שכן $E inter (-a_n, a_n)$ מכיל את שני הקטעים שלנו ועוד זנב כלשהו של שארית בסמוך לראשית, כלומר
  $
    lambda(E inter (-a_n, a_n))/lambda((-a_n, a_n)) >= (2(a_n - b_n))/(2a_n) = 1-b_n/a_n = 1-(1/(2n+1)!)/(1/(2n)!) = 1-(2n)!/(2n+1)! = 1-1/(2n+1) stretch(arrow.r)_(n arrow.r infinity) 1
  $
  אז אכן $overline(D)(lambda|_E, lambda, 0)=1$.\
  עבור המקרה השני, נבחר $r_n = b_n$ ובמקרה זה האינטרוולים $[-a_n, -b_n], [b_n, a_n]$ הם מחוץ לחיתוך במקרה זה כי $E inter (-b_n, b_n)$ מכיל רק זנב של אינדקסים, כלומר
  $ lambda(E inter (-b_n, b_n))= 2 sum_(k=n+1)^infinity (a_k - b_k) < 2 sum_(k=n+1)^infinity a_k < 2 dot.op 2a_(n+1) $
  כאשר האי־שיוויון האחרון נובע מקצב הגדילה של עצרת.\
  אז מתקיים
  $
    lambda(E inter (-b_n, b_n))/lambda(-b_n, b_n) < (2(2a_(n+1)))/(2b_n) = 2 a_(n+1)/b_n = 2 (1/(2n+2)!)/(1/(2n+1)!) = 2 (2n+1)!/(2n+2)! = 2 cancel((2n+1)!)/((2n+2)cancel((2n+1)!))=1/(n+1) stretch(arrow.r)_(n arrow.r infinity) 0
  $
  אז אכן $underline(D)(lambda|_E, lambda, 0)=0$.\
]

#question()
תהיי $mu$ מידת רדון על $RR^d$ ונסמן ב־$lambda$ את מידת לבג על אותו מרחב.\
בשאלה זו נוכיח שהפונקציה
$overline(D)(mu, lambda, dot.op) :RR^d arrow.r [-infinity, infinity]$ המוגדרת על־ידי
$ overline(D)(mu, lambda, x) = limsup_(r arrow.r 0) (mu(B_r (x)))/(lambda(B_r (x))) $
היא פונקציה מדידה בורל כאשר $B_r (x)$ הוא הכדור הסגור ברדיוס $r$ מסביב ל־$x$.

#subquestion()
נעזר ברגולריות החיצונית של $mu$ כדי להראות שהפונקציה $x mapsto mu(B_r (x))$ היא רציפה מלמעלה, כלומר שמתקיים
$ x_i arrow.r x ==> limsup_(i arrow.r infinity) mu(B_r (x_i)) <= mu(B_r (x)) $

#proof[
  מהיות $mu$ מידת רדון, מהרוגלריות החיצונית
  $ mu(B_r (x) = inf{mu(U) bar U "is open", B_r (x) subset U}) $
  יהי $epsilon>0$ אז קיימת $U_epsilon$ פתוחה כך שמתקיימים
  $ (1) space B_r (x) subset U_epsilon wide (2) space mu(U_epsilon) <= mu(B_r (x))+epsilon $
  כמו־כן, קיימת $delta>0$ כך שמתקיים
  $ B_(r+delta) (x) subset U_epsilon $
  מכך ש־$x_i arrow.r x$, קיים $N$ כך שלכל $i>N$ מתקיים
  $ abs(x_i - x)<delta $
  וכן
  $ B_r (x_i) subset B_(r+delta) (x) subset U_epsilon $
  וכן ממונוטוניות המידה
  $ mu(B_r (x_i))<=mu(U_epsilon)<=mu(B_r (x)) + epsilon $
  ובפרט אם ניקח $limsup$ נקבל
  $ limsup_(i arrow.r infinity) mu(B_r (x_i))<=mu(U_epsilon)<=mu(B_r (x)) + epsilon $
  וזה נכון לכל $epsilon$ אז
  $ limsup_(i arrow.r infinity) mu(B_r (x_i)) <= mu(B_r (x)) $
]

#subquestion()
נראה כי ניתן להגדיר את $overline(D)$ בעזרת $limsup$ על רציונליים ששואפים לאפס.\
כלומר שנראה שמתקיים
$ overline(D)(mu, lambda, x) = limsup_(r arrow.r 0, r in QQ) mu(B_r (x))/lambda(B_r (x)) $

#proof[
  ראשית מכך שמתקיים
  $ {r in QQ bar r>0} subset { r in RR bar r>0} $
  נקבל ישירות
  $ limsup_(r arrow.r 0, r in QQ) mu(B_r (x))/lambda(B_r (x)) <= limsup_(r arrow.r 0) mu(B_r (x))/lambda(B_r (x)) $
  נוכיח את אי־השיוויון בכיוון השני: תהיי $(r_n)_(n=1)^infinity$ סדרת ממשיים המתכנסת ל־$0$.\
  לכל $n$ נבחר את $q_n in QQ$ להיות
  $ r_n < q_n < r_n + 1/n $
  מצפיפות הרציונליים בממשיים ומכלל הכריך נקבל $q_n arrow.r 0$ וכן $B_(r_n) (x) subset B_(q_n) (x)$.\
  ממונוטוניות המידה מתקיים
  $ mu(B_(r_n) (x)) <= mu(B_(q_n) (x)) $
  בגלל ש־$lambda$ מידת לבג
  $ lambda(B_r (x)) = lambda(B_1 (0)) r^d $
  ולכן
  $
    mu(B_(r_n) (x))/lambda(B_(r_n) (x)) <= mu(B_(q_n) (x))/(lambda(B_r (x)) r_n^d) = mu(B_(q_n) (x))/(lambda(B_1 (0)) q_n^d) (q_n/r_n)^d
  $
  אבל $q_n/r_n arrow.r 1$ ולכן
  $
    limsup_(n arrow.r infinity) mu(B_(r_n) (x))/lambda(B_(r_n) (x))<=limsup_(n arrow.r infinity) mu(B_(q_n)(x))/lambda(B_(q_n) (x))
  $
  הסדרה $(r_n)_(n=1)^infinity$ הייתה שרירותית ולכן קיבלנו את אי־השיוויון בצד השני.\
  מטריכוטומיה נקבל
  $ overline(D)(mu, lambda, x) = limsup_(r arrow.r 0, r in QQ) mu(B_r (x))/lambda(B_r (x)) $
]

#subquestion()
נסיק כי $overline(D)$ היא מדידה בורל.

#proof[
  נקבע $(q_n)_(n=1)^infinity$ רציונליים חיוביים השואפים לאפס, כלומר $QQ_plus inter (0,1) = {q_1, q_2, q_3, dots.h}$ ונגדיר
  $ f_n (x) colon.eq mu(B_(q_n) (x))/lambda(B_(q_n) (x)) $
  אז
  $ overline(D)(mu, lambda, x) = limsup_(n arrow.r infinity) f_n (x) $
  בסעיף א' ראינו שמתקיים $x mapsto mu(B_r (x))$ רציפה מלמעלה ולכן היא גם מדידה בורל, כלומר
  $ f_n (x) = mu(B_(q_n) (x))/(lambda(B_r (x)) q_n^d) $
  היא מדידה בורל לכל $n$.\
  היות וסופרמה ואינפימה משמרים מדידות בורל ורציפות נובע כי $x mapsto limsup_(n arrow.r infinity) f_n (x)$ היא מדידה בורל.\
  כלומר $x mapsto overline(D)(mu, lambda,x)$ היא מדידה בורל, כנדרש.
]

#question()
נסמן
$ C_r (x) = [x_1 - r, x_1 + r] times [x_2 - r, x_2 + r] times dots.h.c times [x_d - r, x_d + r] subset RR^d $
כלומר $C_r (x)$ היא הקובייה מאורך צלע $2r$ שמרכזה ב־$(x_1, dots.h, x_d)$.\
נוכיח כי
$ cal(F) = {C_r (x) bar x in RR^d, r>0} $
מקיימת את תכונת כיסוי בסיקוביץ' החלשה, כלומר נראה כי קיים $N$ התלוי רק ב־$d$ כך שאם $C_(r_1) (z_1), dots.h, C_(r_k) (z_k)$ מקיימים
$ (1) space inter.big_(i=1)^k C_(r_i) (z_i) = emptyset wide (2) space forall i!=j, z_j in.not C_(r_i) (z_i) $
אז $k<=N$.

#proof[
  יהי $(C_(r_i) (z_i))_(i=1)^k$ אוסף המקיים את התנאים לעיל ובלי הגבלת הכלליות נניח כי לכל $i in {1, dots.h, k}$ מתקיים $0 in C_(r_i) (z_i)$.\
  מהנתון על האוסף והמרכוז ניתן להסיק
  $
    (1) space norm(z_i)_infinity <=r_i wide (2) space forall m in {1, dots.h, d}, abs((z_i)_m)<=r_i wide (3) space forall i!=j, z_j in.not C_(r_i) (z_i) ==> norm(z_j-z_i)_infinity > r_i
  $
  אז בהתאם לרמז נחלק את $RR^d$ לתוך $2^d$ רביעים סגורים לפי הסימן של הקורדינאטה, כלומר לכל $sigma in {-1, 1}^d$ נגדיר
  $ Q_sigma = {x in RR^d bar forall m in {1, dots.h, d}, space sigma_m x_m >= 0} $
  כאשר נקודות עם קורדינאטות אפסיות יכולות להתאים לכל סימן.\
  אז אם נניח בשלילה ש־$k>2^d$, לפי עיקרון שובך היונים קיימים $i!=j$ אינדקסים כך שהמרכז שלהם $z_i, z_j$ נמצאים באותו הרביע ובלי הגבלת הכלליות נניח $r_i >= r_j$.\
  מכך ש־$z_i, z_j$ באותו רביע נובע שלכל $m$, $(z_i)_m, (z_j)_m$ כאשר $m in {1, dots.h, d}$ הם עם אותו הסימן או אפס.\
  אנחנו יודעים שמתקיים לכל שני איברים עם אותו הסימן
  $ abs(a-b)<=max(abs(a), abs(b)) $
  ומ־$(1)$ אנחנו יודעים $abs((z_i)_m)<=r_i, abs((z_j)_m)<=r_j$ ומההנחה $r_i >= r_j$ ולכן $abs((z_j)_m)<=r_i$ ונקבל
  $ abs((z_i)_m - (z_j)_m)<=max(abs(z_i)_m, abs(z_j)_m)<=r_i $
  אז זה נכון לכל $m in {1, dots.h, d}$ ולכן
  $ norm(z_i-z_j)_infinity <= r_i $
  אבל זה אומר ש־$z_j in C_(r_i) (z_i)$ וזאת סתירה.
]

#question()
#subquestion()
נראה כי משפט הכיסוי של בסיקוביץ' לא מתקיים עבור קבוצות לא חסומות ב־$RR^d$, כלומר ניתן דוגמה לקבוצה $A subset RR^d$ עם כיסוי בסיקוביץ' ללא תת־כיסוי מריבוי סופי.

#proof[
  ניזכר כי $cal(F)$ ייקרא כיסוי בסיקוביץ' של קבוצה $A$ אם:
  + לכל $x in A$ קיים כדור $B_(r_x) (x) in cal(F)$ שמרכזו הוא $x$
  + לכל $x$ מתקיים ש־$r_x > 0$
  + $cal(F)$ מכסה את $A$ כלומר $A subset.eq union.big_(U in cal(F)) U$
  נגדיר עבור $x_n colon.eq (2^(-n), 0, dots.h, 0)$ את
  $
    A colon.eq {0} union {x_n bar n in NN} subset RR^d
  $
  ובנוסף נגדיר
  $
    B_0 colon.eq B_1 (0), space B_n colon.eq B_(2^(-(n+2))) (x_n)
  $
  אז
  $ cal(F) colon.eq {B_0} union {B_n bar n in NN} $
  ובאופן די ישיר זה כיסוי בסיקוביץ'.
  כעת, נניח בשלילה שקיים לכיסוי בסיקוביץ' תת־כיסוי סופי שמכסה את $A$, נסמנו
  $ E colon.eq {B_(n_1), dots.h, B_(n_k)} subset cal(F) $
  אם $B_0 in not E$ אז $0 in.not union.big B_(n_i)$ וזאת סתירה.\
  אם $B_0 in E$, אז $E$ מכסה רק כמות סופית של $x_n$־ים כי
  $ abs(x_n)=2^(-n) stretch(arrow.r)_(n arrow.r infinity) 0 $
  אז לכל $n > n_k$ מתקיים לכל $m<=n_k$
  $ abs(x_n-x_m) > 2^(-(m+2)) $
  כלומר
  $ x_n in.not union.big_(m=0)^(n_k) B_m $
  וזאת סתירה.
]

#subquestion()
נניח כי $d=2$ ונסמן $ R_(a,b) (x) = [x_1 - a, x_1 + a] times [x_2 - b, x_2 + b] $
לכל $N>=1$ נבנה "זר" של $N$ מלבנים סביב $0$, כלומר נמצא מלבנים
$ R_(a_1, b_1) (z_1), dots.h, R_(a_N, b_N) (z_N) $
המקיימים
$ (1) space 0 in inter.big_(i=1)^N R_(a_i, b_i) (z_i) wide (2) space forall i!=j, space z_j in.not R_(a_i, b_i) (z_i) $
כלומר מלבנים ב־$RR^2$ לא מקיימים את תכונת הכיסוי החלשה של בסיקוביץ'.\
נסיק כי משפט הכיסוי של בסיקוביץ' לא מתקיים עבור מלבנים ב־$RR^d$ עבור $d>=2$.

#colbreak()

#proof[
  יהי $N in NN$ ונגדיר לכל $i in {1, dots.h, N}$
  $ z_i colon.eq (2^(-i), 0) wide a_i colon.eq 2^(-i) wide b_i colon.eq 2^(-2N) $
  לכל $i$ מתקיים בכיוון האופקי
  $ abs(0-2^(-i)) = 2^(-i) <= a_i $
  ובכיוון האנכי
  $ abs(0-0)=0<=b_i $
  כלומר לכל $i$ מתקיים $0 in R_(a_i, b_i) (z_i)$ ובהכרח $0 in inter.big_(i=1)^N R_(a_i, b_i) (z_i)$.\
  בנוסף, לכל $j<i$ בחלק האופקי מתקיים
  $ abs(2^(-j)-2^(-i))>=2^(-j)-2^(-i) >= 2^(-j-1) $
  אבל
  $ a_i = 2^(-i) < 2^(-j-1) $
  כלומר $z_j in.not R_(a_i, b_i) (z_i)$.\
  באופן דומה מתקיים גם עבור $j>i$ בהחלפת תפקידים ולכן מלבנים ב־$RR^2$ לא מקיימים את תכונת הכיסוי החלשה של בסיקוביץ'.\
  עבור ההסקה, עבור $epsilon > 0$ קטן דיו נגדיר
  $ R_i^(d) colon.eq R_i times [-epsilon, epsilon]^(d-2) $
  ועדיין החלק הראשון מתקיים ולכן בפרט לא ייתכן שמשפט הכיסוי של בסיקוביץ' יתקיים.
]
