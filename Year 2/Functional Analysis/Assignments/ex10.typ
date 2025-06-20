#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 10 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let dist = math.op("dist")

#question()
תזכורת: עבור $f,g : RR arrow.r RR$ אינטגרביליות רימן בקטע $[-pi, pi]$ ומחזוריות עם מחזור $2pi$ נגדיר
$ (f*g)(x) = integral_(-pi)^pi f(x-u)g(u)d u $

#subquestion()
נוכיח שאם $g in accent(C, tilde)[-pi, pi]$ אזי $f*g in C[-pi, pi]$.

#proof[
  נניח כי $g in accent(C, tilde)[-pi, pi]$ ולכן $g$ רציפה ו־$2pi$ מחזורית ומהיותה רציפה היא כמובן אינטגרבילית רימן ונתון כי $f$ אינטגרבילית רימן ומחזורית $2pi$ אך־לאו דווקא רציפה.\
  ראשית, $f*g$ מוגדרת היטב: מכפלה של פונקציה אינטגרבילית בפונקציה רציפה היא פונקציה אינטגרבילית (כמסקנה ממשפט לבג).\
  אם $f*g$ לא פונקציה רציפה, ניקח את $x_0 in RR$ נקודת אי־רציפות של $f*g$: בהכרח היא מסדר שני (אם לפונקציה קדומה יש נקודת אי־רציפות היא רק מסדר שני, ראינו את זה באינפי $2$), $g$ רציפה ולכן גם הפונקציה הקדומה שלה רציפה, ולכן זו נקודת אי־רציפות של $f$, אבל אז ל־$f$ יש נקודת אי־רציפות מסדר שני, ולכן בהגדרה היא לא יכולה להיות אינטגרבילית. על־כן, $f*g$ פונקציה רציפה.
]

#subquestion()
נוכיח שאם $g in accent(C^1, tilde)[-pi, pi]$ אז $f*g in C^1[-pi, pi]$ ושלכל $x in [-pi, pi]$ מתקיים $(f*g)'(x)=(f*g')(x)$.

#proof[
  מהיות $f$ אינטגרבילית, נסמן ב־$F$ את הפונקציה הקדומה של $f$
  נעשה אינטגרציה בחלקים (שניתן לעשות מכך ש־$g in accent(C^1, tilde)[-pi,pi]$) ונקבל
  $
    (star) (f*g)(x) = integral_(-pi)^pi f(x-u)g(u)d u = [-F(x-u) g(x)]^(pi)_(-pi) + integral_(-pi)^pi g'(x)F(x-u) d u \
    =_(g in accent(C^1, tilde)[-pi, pi]) 0 + integral_(-pi)^pi g'(x)F(x-u) d u =_"הגדרה" (F*g')(x) =_"מהרמז" (g'*F)(x)
  $
  אז $f(*g) in C[-pi, pi]$ כמכפלה של פונקציות רציפות, עלינו להראות שהיא גם גזירה (וגם שהנגזרת רציפה).\
  נעבוד לפי הגדרת הנגזרת, מתקיים
  $
    (star star) (f*g)'(x) &= lim_(h arrow.r 0) 1 / h ((f*g)(x+h))-(f*g)(x) \
    &= lim_(h arrow.r 0) 1 / h integral_(-pi)^pi f(x-u)g(u)-f(x-u-h)g(u+h) d u \
    &= lim_(h arrow.r 0) 1 / h integral_(-pi)^pi f(x-u)g(u)-f(x-u-h)g)u)+f(x-u-h)(g(u)-g(u+h)) d u \
    &= lim_(h arrow.r 0) 1 / h integral_(-pi)^pi (f(x-u)-f(x-u-h))g(u) + f(x-u-h)(g(u)-g(u+h)) d u \
    &= lim_(h arrow.r 0) 1 / h ((f(x-u)-f(x-u-h))*g(u))+ integral_(-pi)^pi f(x-u)g'(u)d u \
    &= lim_(h arrow.r 0) 1 / h ((F(x-u)-F(x-u-h))*g'(u)) + (f*g')(x) \
    &= (f*g')(x)
  $
  (מהמחזוריות, רציפות וגם גזירות של $F$, הפונקציה הקדומה של $f$).\
  עם $(star)$ ו־$(star)(star)$ נובעת הטענה והמסקנה.
]

#question()

#subquestion()
תהיי ${x_n}_(n=1)^infinity subset.eq RR$. נניח שלכל $n$ מתקיים $abs(x_(n+1)-x_n)<=C / n$ ובנוסף הסדרה $y_m = 1 / m sum_(n=1)^m x_n$ מתכנסת לגבול $A in RR$.\
נוכיח שגם הסדרה $x_n$ מתכנסת לאותו הגבול.

#proof[
  נניח בלי הגבלת הכלליות ש־$C=1, A=0$. יהי $epsilon>0$ ונניח בשלילה שהטענה לא נכונה, ולכן $x_n$ לא שואף ל־$0$ כאשר $n arrow.r infinity$, ולכן עבור $delta>0$ תת־סדרה $x_n_k$ המקיימת $forall k in NN, x_n_k > delta$ או $forall k in NN x_n_k < - delta$. בלי הגבלת הכלליות נניח ש־$x_n_k > delta$.\
  עכשיו נשים לב שמתקיים עבור $x_m, x_n$ עם $n<m$ מהנתון
  $
    abs(x_m - x_n)<=abs(x_m - x_(m-1))+abs(x_(m-1) - x_(m-2)) + dots.h.c + abs(x_(n+1) - x_n) <= 1 / (m-1) + 1 / (m-2) + dots.h.c + 1 / n <= log(m / n)
  $
  מתכנסות $y_m$ נובע שלכל $delta>0$ קיים $M$ כך שלכל $m>M$ מתקיים
  $ abs(y_m-0)<delta <==> abs(1 / m sum_(n=1)^m x_n)<delta <==> abs(sum_(n=1)^m x_n)<m delta $
  מההנחה כי $x_n$ לא מתכנסת ל־$0$, נסמן ב־$N_1$ את קבוצת כל האינדקסים כך שמתקיים $abs(x_n)>=epsilon$ וב־$N_2$ את קבוצת כל האינדקסים כך שמתקיים $abs(x_n)<epsilon$.\
  עבור כל $n in N_1$ מתקיים
  $
    sum_(n in N_1) x_n >= sum_(n in N_1) (0+epsilon) = abs(N_1) epsilon \
    sum_(n in N_2) x_n < sum_(n in N_2) (0+epsilon) = abs(N_2) epsilon
  $
  ואז
  $ sum_(n=1)^m x_n = sum_(n in N_1) x_n + sum_(n in N_2) x_n ==> sum_(n=1)^m x_n >= abs(N_1)epsilon - abs(N_2)epsilon $
  אבל כאשר $m arrow.r infinity$, מתקיים ש־$abs(N_1) arrow.r infinity$ מהגדרת חוסר התכנסות ובפרט
  $ 1 / m sum_(n=1)^m x_n >= (abs(N_1)epsilon) / m $
  אבל צד שמאל מתכנס וצד ימין לא וזאת סתירה.
]

#subquestion()
נסיק שאם $f$ אינטגרבילית רימן בקטע $[-pi, pi]$, קיים $C > 0$ כך שלכל $n$ מקדמי פוריה של $f$ מקיימים $abs(a_n), abs(b_n)<=C / n$ ויש $x_0 in [-pi, pi]$ כך שמתקיים $K_m * f(x_0) arrow.r A$ אז גם $D_n * f(x_0)$ כאשר $K_m$ גרעין פייר ו־$D_n$ גרעין דירכלה.

#proof[
  $f$ אינטגרבילית רימן ולכן עבור $x<=pi$ נוכל להגדיר $F(x) = integral_0^x f(t) d t$, $F$ רציפה מהמשפט היסודי ולכן חסומה (על כל $[-pi, pi]$) ולכן קיים $0<M in RR$ חסם.\
  כעת, נוכל להשתמש באינטגרציה בחלקים
  $
    integral_(-pi)^pi f(x) sin(n x) d x = integral_(-pi)^pi F'(x) sin(n x) d x => -F(x)cos(n x)|_(-pi)^pi + 1 / n integral_(-pi)^pi F(x)cos(n x)d x
  $
  נשים לב שמתקיים עבור $n$ זוגי $cos(n pi) = cos(-n pi) = 1$ ועבור $n$ אי־זוגי $cos(n pi)=cos(-n pi) = -1$ ובין כה וכה $cos(-n pi)=cos(n pi)$ ולכן
  $
    -F(x)cos(n x)|_(-pi)^pi = cos(n pi)(F(pi)-F(-pi)) = cos(n pi)(integral_0^pi f(t)d t - integral_0^(-pi)f(t)d t)=cos(n pi)integral_(-pi)^pi f(t) d t
  $
  וזה כמובן ערך מספרי קבוע שתלוי ב־$n$ עבור הסימן שחסום על־ידי $A=2pi norm(f)_infinity$. אז מתקיים
  $
    abs(integral_(-pi)^pi f(x) sin(n x) d x)<=A+ abs(1 / n integral_(-pi)^pi F(x) cos(n x) d x)<= A + 1 / n integral_(-pi)^pi abs(F(x))d x <=_("רציפה" F) A + (2pi M) / n
  $
  נחלק ב־$pi, n$
  $ 1 / pi abs(integral_(-pi)^pi f(x) sin(n x) d x) <= 2norm(f)_infinity + (2M) / n $
  ולכן קיים $C$ כזה המקיים את הנדרש.
  אם יש $x_0$ כזה, מהגדרת $K_m$ ו־$D_n$ עם סעיף א' נקבל את החלק השני.
]

#question()
#subquestion()
נוכיח שאם $V$ מרחב סוף־מימדי, $U subset.eq V$ סגורה ו־$v in V$ אז קיים $u in U$ כך ש־$dist(U, v) = norm(u-v)$.

#proof[
  ראשית, ניזכר
  $ dist(U, v) = inf_(u in U) norm(v-u) $
  ניקח $d = dist(U, v)$ ולכן לכל $epsilon > 0$ קיים $u_epsilon$ כך ש־$norm(u_epsilon- v)<d + epsilon$.\
  נגדיר אם כך סדרה ${u_n}_(n=1)^infinity subset.eq U$ כך שלכל $n in NN$ מתקיים $norm(u_n-v)<d+1 / n$, ובפרט $norm(u_n-v) arrow.r_(n arrow.r infinity) d$.\
  $V$ הוא סוף־מימדי ולכן ${u_n}$ סדרה חסומה וניקח ${u_n_k}_(k=1)^infinity$, תת־סדרה מתכנסת שלה (משפט בולצאנו-ויירשטראס).\
  אבל $U subset.eq V$ סגורה, ולכן $u_n stretch(arrow.r)_(n arrow.r infinity) u in U$, אבל זה בידיוק אומר שמתקיים
  $ lim_(k arrow.r infinity) norm(u_n_k - v) = d = norm(u-v) $
]

#subquestion()
נתבונן במרחב $(RR^2, norm(dot.op)_infinity)$. \
ניתן דוגמה לקבוצה $U subset.eq RR^2$ סגורה וקמורה ו־$v in RR^2$ כך שקיימים אינסוף $u in U$ המקיימים $norm(u-v)_infinity=dist(U, v)$.

#proof[
  נגדיר $U = {(x,y) in RR^2 bar x>=0, y>=0}$ וניקח $v=(-1,1)$.\
  ועבור $u in U$ מתקיים מהגדרה
  $ norm(u-v)_infinity = max(abs(u_1-v_1), abs(u_2-v_2)) $
  ו־$u in U$ שתקיים מרחק מינימלי ל־$v$ היא $(0,1)$ (בגלל שהנקודה $v$ בציר ה־$x$ שלילית אז הנקודה הכי קרובה אליה ברביע החיובי תהיה עם $x=0$).\
  אז נקבל $norm(u-v)_infinity = max(1, 0)=1$ ולכן אנחנו מחפשים $u = (u_1, u_2) in U$ כך שיתקיים $norm(u-v)_infinity=max(abs(u_1+1), abs(u_2-1))=1$.\
  נחלק למקרים
  + $abs(u_1+1)=1, abs(u_2-1)<=1$ \
    אז מהאילוץ הראשון נקבל $u_1=0$ או $u_1=-2$ אבל $u_1 >=0$ ולכן $u_1=0$.\
    עבור $u_1=0$, אז $abs(u_2-1)<=1$ נקבל $0<=u_2<=2$ ולכן $u_2 in [0, 2]$.
  + $abs(u_2-1)=1, abs(u_1+1)<=1$
    מהאילוץ הראשון נקבל $u_2 = 2$ או $u_2=0$.\
    מהאילוץ השני נקבל $-2<=u_1<=0$ אבל $u_1>=0$ ולכן $u_1=0$.
  סך־הכל משני המקרים נקבל שהנקודות האפשריות הן
  $ {(0,0), (2,0)} union {(0,u_2) bar u_2 in [0,2]} $
  וזה מקיים את תנאי השאלה.
]
