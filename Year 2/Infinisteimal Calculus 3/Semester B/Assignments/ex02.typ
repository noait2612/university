#import "../../../../src/article.typ": *
#show: article.with(
	title: [ פתרון מטלה 02 --- חשבון אינפיניטסימלי 3, 80415 ],
	author: [ ],
	signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]]
)

#show regex("\p{Hebrew}.+"): it => text(dir: rtl, font: "Libertinus Serif", lang: "he")[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
יהי $(X, norm(dot.op))$ מרחב נורמי.

#subquestion()
נוכיח כי לכל $x in X$ ו־$r>0$ מתקיים $(hat(B)_ r(x))^circle.stroked.small = B_r(x)$.
#proof[
ראשית ראינו בהרצאה שבמרחב נורמי מתקיים $overline(B_r (x)) = hat(B)_r (x)$. נוכיח באמצעות הכלה דו כיוונית. \
$B_r (x) subset.eq (hat(B)_r (x))^circle.stroked.small$: מהגדרה, $B_r (x)$ הוא קבוצה פתוחה המוכלת ב־$hat(B)_r (x)$ ולכן הוא מוכל ב־$(hat(B)_r (x))^circle.stroked.small$. \
$(hat(B)_r (x))^circle.stroked.small subset.eq B_r (x)$: לכל נקודה $x' in (hat(B)_r (x))^circle.stroked.small$ יש סביבה $U_x' subset.eq hat(B)_r (x)$. \ 
נסמן $v = x' - x$ ולכן מהגדרה יש $c > 0$ כך שיתקיים $x' + c v = x + (1+c)v in hat(B)$. \
אבל $norm(v)<r$ וגם $norm((1+c)v)<=r$ משמע קיבלנו $x' in B_r (x)$.
]

#subquestion()
נוכיח כי לכל $x in X$ ו־$r>0$ מתקיים $partial B_r (x) = S_r (x)$.
#proof[
ראינו כי $overline(B_r (x)) = hat(B)_r (x)$ (כי המרחב נורמי) ובשילוב עם סעיף א' נקבל:
$ partial B_r (x) = hat(B)_r (x) without B_r (x) = { x in X bar d(x, x')<=r and d(x, x') lt.not r} = { x in X bar d(x, x')=r} = S_r (x) $
]

#question()
#subquestion()
נמצא את הפנים, הסגור והשפה של הקבוצה $A = {(x,y,z) in RR^3 bar x+y+z<=1} subset.eq (RR^3, norm(dot.op)_2)$.
#proof[
נראה כי $A$ סגורה ואז $overline(A) =A$:
בהינתן סדרת הנקודות $(x_n, y_n, z_n) in A$ כך שמתקיים $(x_n, y_n, z_n) stretch(arrow.r)_(n arrow.r infinity) (x,y,z)$, לכל $n$ מתקיים $ x_n + y_n + z_n <=1 stretch(arrow.r)_(n arrow.r infinity) x+y+z<=1 $ משמע $(x,y,z) in A$ ולכן $A$ סגורה ונקבל $overline(A)=A$ (ראינו במטלה הקודמת). \
נעבור למצוא את הפנים של $A$ ונטען כי $(A)^circle.stroked.small = {(x,y,z) in RR^3 bar x+y+z<1}$: \
נגדיר $s = 1 - (x+y+z) > 0$ ונבחר $epsilon = s/2 > 0$. כעת, לכל $(x', y',z') in B_epsilon ((x,y,z))$ מתקיים:
$ x' + y' + z' < x + y + z + norm((x,y,z)-(x',y'z'))_2 < x+y+z+epsilon = x + y +z + s/2 = 1-s/2 < 1  $
ולכן $x' + y' + z' < 1$ ולכן $(A)^circle.stroked.small = {(x,y,z) in RR^3 bar x+y+z<1}$. \
נקבל בהגדרה אם כך כי $partial A = overline(A) without (A)^circle.stroked.small = {(x,y,z) in RR^3 bar x+y+z = 1}$.
]

#subquestion()
נמצא את הפנים, הסגור והשפה של הקבוצה $B = {f in C([0,1]) bar f "מונוטונית יורדת ממש"} subset.eq(C[0,1], norm(dot)_infinity)$.
#proof[
נתחיל מ־$overline(B)$: נגיד כי $f in overline(B)$ אם קיימת סדרת פונקציות מונוטוניות יורדות ממש $f_n in B$ כך ש־$f_n stretch(arrow.r)_(n arrow.r infinity) f$ במידה שווה (ולכן $f$ רציפה). \
$f_n$ מונוטונית יורדת ממש, משמע אם $x > y$ אזי $f_n (x) > f_n (y)$
ניזכר כי אי־שיוויון חזק הופך בלקיחת גבול לאי־שיוויון חלש ולכן $ x < y ==> f(x) >= f(y) $ ולכן $f$ פונקציה מונוטונית יורדת (אך לא בהכרח ממש) ונקבל $overline(B) = {f in C([0,1]) bar f "מונוטונית יורדת"} $. \
נעבור ל־$B^circle.stroked.small$: יהיו $f in B$ ונרצה למצוא $r > 0$ כש־$B_r (f) subset.eq B$. מהגדרת נורמת הסופרימום:
$ B_r (f) = {g in C([0,1]) mid(bar) sup_(x in [0,1]) { abs(f(x)-g(x)) } < r} subset.eq {g in C([0,1]) bar f-r < g < f + r} $
בתרגול ראינו שזו בעצם נורמת מקסימום (בגלל הרציפות). \
יהי $r > 0$. $f$ רציפה ולכן קיימת $delta > 0$ כך שמתקיים $abs(f(x) - f(0)) < r$.
לכן נוכל להגדיר את $g in C([0,1])$ על־ידי:
$ g(x) = cases(f(delta) wide x<delta, f(x) wide x>=delta) $
$g$ רציפה מהיות $f$ רציפה אבל היא בבירור לא מונוטונית יורדת ממש (היא קבועה לכל $x < delta$). \
נחלק את הבדיקה שלנו לשני קטעים: $[0, delta]$ ו־$[delta, 1]$, נקבל שמתקיים:
$ sup_(x in [0,delta]) { abs(f(x)-g(x)) < infinity} = sup_(x in [0,delta]) { abs(f(x)-f(delta)) < infinity} =_((1)) abs(f(0)-f(delta)) < r  $
כאשר $(1)$ נובע מהיות $f$ מונוטונית יורדת ממש. באותו אופן:
$ sup_(x in [delta,1]) { abs(f(x)-g(x)) < infinity} = sup_(x in [delta,1]) { abs(f(x)-f(x)) < infinity} = 0 < r  $
ולכן $g$ נמצאת בכדור סביב $f$ ברדיוס $r$ אבל היא איננה מונוטונית יורדת ממש, ומהיות $f$ פונקציה שרירותית נקבל כי $B^circle.stroked.small = emptyset$. \
נקבל מהגדרה אם כך כי $partial B = overline(B) without B^circle.stroked.small = {f in C([0,1]) bar f "מונוטונית יורדת"}$.
]

#subquestion()
נמצא את הפנים, הסגור והשפה של הקבוצה $C = {x in ell^infinity bar L in (-1,1] "וגם" L = display(lim_(n arrow.r infinity) x_n)"קיים הגבול" } subset.eq (ell^infinity, norm(dot.op)_infinity)$
#proof[
ניזכר שהגדרנו במרחב $ell^infinity$  את נורמת הסופרמום על־ידי $display(norm(x)_infinity = sup_(n in NN) abs(x_n)) < infinity$, משמע $(ell^infinity, norm(dot.op))_infinity$ הוא מרחב הסדרות החסומות תחת הנורמה לעיל. \
לכן $C$ היא קבוצת כל הסדרות המתכנסות ב־$ell^infinity$ לגבול $L in (-1, 1]$. \
נתחיל הפעם מ־$C^circle.stroked.small$: תהיי $(a_n)_(n=1)^infinity in C$ ונרצה למצוא $r > 0$ כך ש־$B_r (a_n) subset.eq C$. \
יהי $r>0$, $(a_n)$ מתכנסת אל $L in (-1, 1]$ ולכן קיים $N in NN$ כך שלכל $n > N$ מתקיים $abs(a_n-L) <r $.\
נבחר $delta in (r/2, r)$ כך שיתקיים $L + delta in.not (-1, 1]$. נגדיר סדרה חדשה:
$ b_n = cases(a_n wide n <= N, L+delta wide n>N) $
ואז נקבל $norm(a_n-b_n)_infinity < r $
אבל $b_n in.not C$ שכן $b_n stretch(arrow.r)_(n arrow.r infinity) L + delta in.not (-1, 1]$. \ 
בחרנו סדרה שרירותית ב־$C$ וראינו שסביבה שלה קיימת סדרה שאינה ב־$C$ ולכן $C^circle.stroked.small = emptyset$. \
נעבור למציאת $overline(C)$: יהיו $x in ell^infinity, x^((k)) in C$ כך שמתקיים $x^((k)) stretch(arrow.r)_(k arrow.r infinity) x$ ב־$norm(dot.op)_infinity$, משמע $norm(x^((k))-x)_infinity stretch(arrow.r)_(k arrow.r infinity) 0$. \
לכן לכל $epsilon > 0$ קיים $k$ כך שמתקיים 
$ norm(x^((k))-x)_infinity < epsilon ==> forall n in NN, abs(x_n^((k))-x_n) < epsilon $
היות ו־$x^((k)) in C$ נובע כי $display(lim_(n arrow.r infinity) x_n^k = L_k in (-1,1])$. נשאר להראות כי הגבול של $x_n$ קיים ומהו. \
יהי $epsilon > 0$  ואנחנו יודעים כי 
$ norm(x^((k))-x)_infinity < epsilon/3 ==> forall n in NN, abs(x_n^((k))-x_n) < epsilon/3 $
היות והגבול $x_n^(k) arrow.r L_k$ קיים, יש $N in NN$ כך שלכל $n > N$ מתקיים
$ abs(x_n^(k) - L_k ) < epsilon/3 $
ועבור $n > N$ מתקיים
$ abs(x_n-L_k)<=abs(x_n - x_n^((k))) + abs(x_n^((k))-L_k) < epsilon/3 + epsilon/3 = (2epsilon)/3 $
וכאשר $k arrow.r infinity$ ומכך ש־$L_k arrow.r L$ (מהתכנסות במידה שווה) נקבל
$ abs(x_n - L)<= abs(x_n - L_k) + abs(L_k - L) < (2epsilon)/3 + epsilon/3 = epsilon $
ולכן $lim x_n = lim L_k$ ומכך ש־$L_k in (-1, 1]$ נקבל כי $lim L_k in [-1, 1]$ שכן $(-1, 1]$ לא סגורה, ולכן גבול של סדרה לא חייב להישאר בקטע הנתון ואנחנו יודעים כי $overline((-1, 1]) = [-1, 1]$. \
הערה: מספיק שנסתכל בתור דוגמה על $L_k = -1 + 1/k in (-1, 1]$ אבל $L_k arrow.r -1$ (בפרט מצאנו עד כה הכלה בכיוון $overline(C) subset.eq $ והדוגמה הזאת מביאה הכלה בכיוון $subset.eq overline(C)$). \
 נקבל בסך־הכל $overline(C) = {x in ell^infinity bar L in [-1,1] "וגם" L = display(lim_(n arrow.r infinity) x_n)"קיים הגבול" } $. \
 נקבל מהגדרה אם כך כי
 $partial C = overline(C) without C^circle.stroked.small = {x in ell^infinity bar L in [-1,1] "וגם" L = display(lim_(n arrow.r infinity) x_n)"קיים הגבול" } $.
]

#question()
יהי $p in NN$ מספר ראשוני.

#subquestion()
נתאר את כדור היחידה הסגור $ZZ_(p) colon.eq hat(B)_1(0) subset.eq (QQ, d_p)$.
#proof[
ראשית ניזכר כי $d_p (x,y) = abs(x-y)_p$. \
נגדיר: 
$ hat(B)_1 (0) = {x in QQ mid(bar) abs(x)_p <= 1, quad x = a/b in ZZ space s.t. space b!=0 and gcd(a,b)=1} $
ובתרגול ראינו שמתקיים עבור $display(x = a/b in QQ)$:
$ abs(x)_p = p^(-v_p (x)) = p^(v_p (b)- v_p (a)) $
ולכן $abs(x)_p <=1$ אם ורק אם $v_p (x) >= 0$ וזה קורה אם ורק אם ל־$x$ אין אף חזקה שלילית של $p$ משמע מתי המכנה לא מתחלק ב־$p$.
\
לכן כל ה־$x in QQ$ כך שמתקיים $v_p (x) >= 0$ נתונים על־ידי: 
$ ZZ_p = { x in QQ bar abs(x)_p <=1 } $
כאשר כל $x in ZZ_p$ הוא בעצם:
$ x = a_0 + a_1 p + a_2 p^2 + ... a_(p-1) p^(p-1) $
וזה מתחבר בצורה מאוד נחמדה לחוגים!
]

#subquestion()
נוכיח כי $overline(ZZ) = ZZ_p$ ונקבע מהו $ZZ^circle.stroked.small$.
#proof[
נראה באמצעות הכלה דו־כיוונית. \
$ZZ_p subset.eq overline(ZZ)$: יהי $x in ZZ_p$.
מהגדרה:
$ x = a_0 + a_1p + a_2p^2 + ... (a_i in {0, 1, ..., p-1}) $
נגדיר את הסדרה:
$ x_n = a_0 + a_1p + a_2p^2 + ... + a_n p^n $
ונשים לב שמתקיים עבור $n$ גדול מספיק:
$ abs(x-x_n)_p = abs(a_(n+1)p^(n+1) + a_(n+2)p^(n+2) + ...)_p <= p^(-(n+1)) stretch(arrow.r)_(n arrow.r infinity) 0 $
ולכן $x_n stretch(arrow.r)_(n arrow.r infinity) x$ במטריקה ה־$p$־אדית. \
אבל $x_n$ היא סדרה ב־$ZZ$ שמתכנסת ולכן $x in overline(ZZ)$. \
$overline(ZZ) subset.eq ZZ_p$: יהי $x in overline(A)$ ולכן קיימת סדרה $x_n in ZZ$ כך שמתקיים $x_n stretch(arrow.r)_(n arrow.r infinity) x$.\
מסעיף א' אנחנו יודעים כי לכל $n$ מתקיים $abs(x_n)_p <=1$ משמע $x in ZZ_p$. \

נטען כעת כי $ZZ^circle.stroked.small = emptyset$: נניח בשלילה שלא, ולכן קיים $x in ZZ^circle.stroked.small$ ולכן מהגדרה קיים $r>0$ כך ש־$B_r (x) in ZZ$.\
אבל כל כדור פתוח כזה בהכרח יכיל $q in QQ$, משמע הוא לא מוכל לחלוטין ב־$ZZ$ וזו סתירה ולכן $ZZ^circle.stroked.small = emptyset$.
]

#pagebreak()

#subquestion()
נוכיח כי $ZZ_p$ אינה קומפקטית סדרתית.
#proof[
נניח בשלילה כי $ZZ_p$ קומפקטית סדרתית ולכן $ZZ_p$ סגור וחסום. \
במטלה הקודמת ראינו כי $display(sum_(i=1)^infinity p^i = 1/(1-p))$. \
נשים לב כי כאשר $p > 2$, נקבל כי $1/(1-p) in.not ZZ_p$ (זה שבר!) מההנחה $ZZ_p$ סגורה, אבל מצאנו גבול שלא נמצא ב־$ZZ_p$ וזו סתירה. 
]

#question()
יהיו $(X,d_X), (Y, d_Y)$ מרחבים מטריים ובתרגיל הקודם ראינו כי המכפלה $X times Y$ היא מרחב מטרי ביחס למטריקה: 
$ d((x_0, y_0), (x_1, y_1)) = d_X (x_0, x_1) + d_Y (y_0, y_1) $

#subquestion()
נוכיח כי הסדרה $((x_n, y_n)) subset.eq X times Y$ מתכנסת ל־$(x,y)$ אם ורק אם $(x_n) stretch(arrow.r)_(n arrow.r infinity) x$ ו־$(y_n) stretch(arrow.r)_(n arrow.r infinity) y$.
#proof[ 
נעשה את שני הכיוונים בפעם אחת, נשים לב שמהגדרת ההתכנסות עלינו לקיים את שרשרת הגרירות הבאה:
$ ((x_n, y_n)) subset.eq X times Y stretch(arrow.r)_(n arrow.r infinity) (x,y) <==> lim_(n arrow.r infinity) d((x_n, y_n), (x, y)) = 0 <==>_((1)) lim_(n arrow.r infinity) (d_X (x_n, x) + d_Y (y_n, y) ) = 0 \
 <==> lim_(n arrow.r infinity) d_X (x_n, x) + lim_(n arrow.r infinity) d_Y (y_n, y) = 0 
<==>_((2)) lim_(n arrow.r infinity) d_X (x_n, x) = 0 and lim_(n arrow.r infinity) d_Y (y_n, y) = 0 <==> (x_n) stretch(arrow.r)_(n arrow.r infinity) x and (y_n) stretch(arrow.r)_(n arrow.r infinity) y $
כאשר $(1)$ נובע מהגדרת המטריקה ו־$(2)$ מהיות המטריקה אי־שלילית.
]

#subquestion()
נסמן ב־$p_X : X times Y arrow.r X$ וב־$p_Y : X times Y arrow.r Y$ את ההטלות. נוכיח כי $p_X$ ו־$p_Y$ רציפות.
#proof[
בהרצאה ראינו שנגיד כי $p_X$ רציפה אם ורק אם לכל $U subset.eq X$ פתוחה נובע כי $p_X^(-1)(U) subset.eq X times Y$ פתוחה. \
לכן תהיי $U subset.eq X$, מתקיים $p_X^(-1)(U) = U times Y$ שאכן פתוחה ב־$X times Y$ שכן $U$ פתוחה ב־$X$ וראינו בהרצאה ש־$Y$ פתוחה ב־$Y$. \
באותו באופן, נגיד כי $p_Y$ רציפה אם ורק אם לכל $V subset.eq Y$ פתוחה נובע כי $p_Y^(-1)(V) subset.eq X times Y$ פתוחה. \
לכן תהיי $V subset.eq Y$, מתקיים $p_Y^(-1)(V) = X times V$ שאכן פתוחה ב־$X times Y$ שכן $V$ פתוחה ב־$Y$ וראינו בהרצאה ש־$X$ פתוחה ב־$X$. \
לכן ההטלות הן פונקציות רציפות.
]

#subquestion()
נוכיח כי לכל מרחב מטרי $(Z,d_Z)$ ופונקציה $f : Z arrow.r X times Y$ מתקיים ש־$f$ רציפה אם ורק אם $p_X compose f$ ו־$p_Y compose f$ רציפות.
#proof[ \
$<==$ נניח כי $f$ רציפה, ובסעיף הקודם ראינו כי $p_X$ ו־$p_Y$ רציפות והרכבה של פונקציות רציפות היא רציפה ולכן $p_X compose f$ ו־$p_Y compose f$ רציפות. \
$==>$ בכיוון השני נניח כי $p_X compose f$ ו־$p_Y compose f$ רציפות ונרצה להראות כי $f$ רציפה. \ 
תהיי $(z_n) in Z$ כך שמתקיים $(z_n) stretch(arrow.r)_(n arrow.r infinity) z in Z$. \
מהיות ההרכבות $p_X compose f$ ו־$p_Y compose f$ רציפות, נובע כי מתקיים:
$ (p_X compose f)(z_n) stretch(arrow.r)_(n arrow.r infinity) (p_X compose f)(z) in X, quad (p_Y compose f)(z_n) stretch(arrow.r)_(n arrow.r infinity) (p_Y compose f)(z) in Y $
ולכן אנחנו מקבלים
 $ f(z_n) = (((p_X compose f)(z_n), (p_Y compose f)(z_n))) stretch(arrow.r)_(n arrow.r infinity) ((p_X compose f)(z), (p_Y compose f)(z)) in X times Y $
 דהיינו $f(z_n) stretch(arrow.r)_(n arrow.r infinity) f(z)$ ו־$f$ רציפה.
]

#pagebreak()

#subquestion()
נניח כי $X,Y$ קומפקטיים סדרתית. נוכיח כי גם המכפלה $X times Y$ קומפקטית סדרתית. נסיק כי מכפלה סופית של מרחבים קומפקטיים סדרתית היא קומפקטית סדרתית.
#proof[
תהיי $((x_n, y_n))_n in X times Y$ סדרה ונרצה להראות שיש לה תת־סדרה מתכנסת. \ 
מהיות $X$ מרחב קומפקטי סדרתי, ומכך ש־$(x_n)_n in X$, נובע כי ל־$x_n$ יש תת־סדרה מתכנסת $(x_n_k)_k stretch(arrow.r)_(k arrow.r infinity) x in X$. \
באותו אופן מהיות $Y$ מרחב קומפקטי סדרתי ומהיות $(y_n_k)k in Y$ נובע כי ל־$(y_n_k)_k$ יש תת־סדרה מתכנסת $(y_n_k_l)_l stretch(arrow.r)_(l arrow.r infinity) y in Y$. \
אבל $(x_n_k_l)_l$ היא תת־סדרה של $(x_n_k)_k$ ולכן ממשפט הירושה $(x_n_k_l)_l stretch(arrow.r)_(l arrow.r infinity) x$.
בסעיף א' ראינו שהתכנסות ב־$X times Y$ היא התכנסות רכיב רכיב ולכן הסדרה $((x_n_k_l), (y_n_k_l))_l$ מתכנסת ב־$X times Y$ והיא תת־סדרה של $((x_n, y_n))_n in X times Y$. \
משמע מצאנו לסדרה שרירותית תת־סדרה מתכנסת ולכן $X times Y$ היא קומפקטית סדרתית. \
נסיק כי מכפלה סופית של מרחבים קומפקטיים סדרתית היא קומפקטית סדרתית. באינדוקציה: \
את בסיס האינדוקציה הראנו עבור שתי מכפלות, ונניח כי הטענה עבור $n-1$ מכפלות ונרצה להראות עבור $n$ מכפלות: 
$ times.big_(i=1)^n X_i = (times.big_(i=1)^(n-1) X_i) times X_n $
נשים לב שמהנחת האינדוקציה, $times.big_(i=1)^(n-1) X_i$ קומפקטית סדרתית ומבסיס האינדוקציה ראינו שמכפלה של שני מרחבים מטריים קומפקטיים סדרתיים היא קומפקטית סדרתי ולכן $(times.big_(i=1)^(n-1) X_i) times X_n$ קומפקטית סדרתית. \
ולכן מכפלה סופית של מרחבים קומפקטיים סדרתית היא קומפקטית סדרתית.
]

#question()
יהי $(X,d)$ מרחב מטרי ו־$K subset.eq X$ קומפקטית סדרתית ו־$B subset.eq X$ כלשהי.

#subquestion()
נוכיח כי כל פונקציה רציפה $f: K arrow.r RR$ מקבלת מינימום ומקסימום.
#proof[
בהרצאה ראינו כי $f(K) in RR$ היא קבוצה קומפקטית ועל־כן היא סגורה וחסומה. \
לפי משפטי ויירשטראס קיימים $a, b in RR$ כך שמתקיים $f(K) subset.eq [a,b]$ ובפרט מתקיים $sup {y : y in f(K)} = M < infinity$. \
ולכן קיימת סדרה $(y_n)_(n=1)^infinity subset.eq f(K)$ כך שמתקיים $y_n stretch(arrow.r)_(n arrow.r infinity) M$. \
אבל $f(K)$ סגורה ולכן נובע כי $M in f(K)$ ולכן קיים $x_M in X$ כך שמתקיים $f(x_M) = M$. \
עבור $inf$ נוכיח באופן דומה, או שלחילופין נסתכל $-f$ ונקבל את הנדרש.
]

#subquestion()
נוכיח כי $d(x,B)=0$ אם ורק אם $x in overline(B)$.
#proof[ \
$<==$ נניח כי $d(x,B)=0$ ונרצה להראות ש־$x in overline(B)$. \
מההנחה נובע שלכל $epsilon > 0$ קיים $y_epsilon in B$ כך שמתקיים $d(x,y_epsilon) < epsilon$ ולכן $B_epsilon (x_0) inter B != emptyset$. \
אבל כל כדור פתוח סביב $x$ יכיל סביבה של $B_epsilon (x)$ עבור $epsilon > 0$ משמע החיתוך שלו עם $B$ לא ריק ולכן $x in overline(B)$. \
$==>$ נניח כי $x in overline(B)$ ונרצה להראות כי $d(x,B)=0$.\
מההנחה נובע שלכל $epsilon > 0$ קיים כדור פתוח $B_epsilon (x)$ כך שמתקיים $B_epsilon (x) inter B !=emptyset$. \
יהי $y_epsilon in B_epsilon (x) inter B$ אבל $epsilon > 0$ שרירותי ולכן $d(x,B) <= d(x, y_epsilon)<epsilon$ ולכן $d(x,B)=0$.
]

#subquestion()
נוכיח כי קיים $x in K$ כך ש־$d(K,B)=d(x,B)$ ונסיק כי $d(K,B) > 0$ אם ורק אם $K inter overline(B) = emptyset$.
#proof[
נגדיר $f: K arrow.r RR$ על־ידי $display(f(x) = d(x,B) colon.eq inf_(b in B) d(x,b))$ ונראה תחילה כי זוהי פונקציה רציפה. \
יהיו $k, k' in K$ נשים לב שלכל $b in B$ מאי־שיוויון המשולש מתקיים:
$ abs(d(k, b)-d(k',b))<= d(k, k') $
משמע לכל $b in B$ מתקיים:
$ d(k, b)<= d(k', b) + d(k, k')  $
$ d(k', b)<= d(k, b) + d(k, k') $
ניקח אינפימום על כל $b in B$ ונקבל:
$ f(k') = inf_(b in B) d(k, b) = inf_(b in B) (d(k', b) + d(k, k')) = f(k') + d(k, k') $
$ f(k) = inf_(b in B) d(k', b) = inf_(b in B) (d(k, b) + d(k, k')) = f(k) + d(k, k') $
וקיבלנו $abs(f(k)-f(k'))<= d(k, k')$ ולכן $f$ רציפה.\
כעת, $f$ רציפה על מרחב קומפקטי ולכן היא מקבלת מינימום (וזה גם האיניפימום) ולכן קיים $k_0 in K$ כך שמתקיים $ f(k_0) = min_(k in K) f(k) = min_(k in K) d(k, B) $
משמע:
$ f(k_0) = d(k_0, B) = inf_(k in K, b in B) d(k,b) = d(K,B) $
ולכן $d(K,B) = d(k_0, B)$. 
#colbreak()
נשאר להסיק כי $d(K,B) > 0$ אם ורק אם $K inter overline(B) = emptyset$. \
$<==$ נניח כי $d(K,B) > 0$ ונרצה להראות כי $K inter overline(B) = emptyset$. \
נניח שלא, ולכן קיים $x_n in K inter overline(B)$. מהיות $K$ קומפקטי, נובע של־$x_n$ יש תת־סדרה מתכנסת $x_n_k stretch(arrow.r)_(k arrow.r infinity) x in K$. \
אבל $x_n in overline(B)$ שזוהי קבוצה סגורה ולכן $x in overline(B)$, משמע $d(x_n, x) stretch(arrow.r)_(n arrow.r infinity) 0 $ וזו סתירה להנחה. \
$==>$ נניח כי $K inter overline(B) = emptyset$ ונרצה להראות כי $d(K,B)>0$. \
נשתמש ב־$f$ שהגדרנו לעיל וראינו כי היא מקבלת מינימום ב־$k_0 in K$ ונרצה ונרצה להראות כי תחת תנאים אלו $f(k_0) > 0$. \ 
נניח שלא, ולכן:
$ f(k_0) = 0 <==> d (k_0, B) = 0 $
זאת אומרת, קיים $(b_n) subset.eq B$ כך שמתקיים $d(k_0, b_n) stretch(arrow.r)_(n arrow.r infinity) 0$, ולכן $b_n stretch(arrow.r)_(n arrow.r infinity) k_0$.\
אבל אז מהגדרה ינבע $k_0 in overline(B)$, אבל מההנחה כי $K inter overline(B) = emptyset$ וזאת סתירה.
]

#question()
נוכיח כי $hat(B)_1(0) subset.eq (C([0,1]), norm(dot.op)_infinity)$ היא קבוצה סגורה וחסומה שאינה קומפקטית סדרתית.
#proof[
נסמן $B = hat(B)_1(0) subset.eq (C([0,1]), norm(dot.op)_infinity)$.
ראשית, $B$ חסומה מהגדרתה, נשאר להראות כי היא סגורה: 
יהי $f_n in B$ ונניח כי $f_n stretch(arrow.r)_(n arrow.r infinity) f$ במידה שווה, משמע $norm(f_n - f)_infinity stretch(arrow.r)_(n arrow.r infinity) 0$. \
נשים לב שמתקיים עבור $n$ גדול מספיק: $ norm(f)_infinity <= norm(f_n)_infinity + norm(f_n - f)_infinity <= 1 + epsilon stretch(arrow.r)_(epsilon arrow.r 0) 1 $
ולכן מהגדרה קיבלנו כי $B$ סגורה.\
נראה כעת כי $B$ לא קומפקטית סדרתית:
נגדיר $f_n (x) = x^n$, נשים לב שמתקיימים הבאים:
1. כל $f_n$ רציפה ב־$[0,1]$
2. $x^n stretch(arrow.r)_(n arrow.r infinity) 0$
3. $f_n(1) = 1$
ולכן $f_n (x) stretch(arrow.r)_(n arrow.r infinity) f(x)$ (נקודתית) כאשר
$ f(x) = cases(0 quad x in [0,1], 1 quad x=1) $
אבל $f in.not C[0,1]$ שכן $f$ לא רציפה ב־$0$, ונטען כי היא לא מתכנסת במידה שווה לאף $g in C[0,1]$. נניח בשלילה שהיא כן, ולכן:
$ norm(f_n - g)_infinity stretch(arrow.r)_(n arrow.r infinity) 0 ==> f_n stretch(arrow.r)_(n arrow.r infinity) g $
כמו כן $g$ מתכנסת נקודתית ולאותם ערכים, משמע $g(x) = f(x)$ וזו סתירה מאי־הרציפות של $f(x)$. \
מצאנו סדרת פונקציות המתכנסת נקודתית אך פונקציית הגבול אינה רציפה ולכן אין התכנסות במידה שווה (שכן אם הייתה התכנסות במידה שווה הרי שגם פונקציית הגבול רציפה), שכן תת־סדרה של פונקציות מתכנסת לגבול הנקודתי של הסדרה המקורית. \
אין תת־גבול שהוא כן במידה שווה ולכן אף תת־סדרה לא יכולה להתכנס ולכן $B$ אינה קומפקטית סדרתית. 
]