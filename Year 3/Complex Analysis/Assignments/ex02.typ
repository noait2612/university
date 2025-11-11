#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 02 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#let Arg = math.italic(math.op("Arg"))
#let atan2 = math.op("atan2")
#let Hol = math.op("Hol")
#let im = math.italic(math.op("Im"))
#let re = math.italic(math.op("Re"))


#question()
לכל פונקציה נמצא איפה היא $CC$־דיפרנציאבילית ואיפה היא אנליטית.\
_תזכורת_: נגיד שפונקציה $f:U_(z_0) arrow.r CC$ היא *$CC$־דיפרנציאבילית *ב־$z_0$ אם הגבול $lim_(z arrow.r z_0) (f(z)-f(z_0))/(z - z_0)$ קיים.\
נגיד ש־$f$ היא *אנליטית* ב־$z_0$ אם קיים $r_(z_0)$ כך ש־$f$ היא $CC$־דיפרנציאבילית לכל $z in B_(r_(z_0)) (z_0)$.

#subquestion()
$z mapsto abs(z)^2$.

#proof[
  יהי $CC in.rev z = x + i y$, מתקיים
  $ abs(z)^2 = abs(x+i y)^2 = sqrt(x^2+y^2)^2 = x^2+y^2 = z overline(z) $
  נבחרת את הגדרת $CC$־דיפרנציאבילית
  $
    lim_(z arrow.r z_0) (abs(z)^2-abs(z_0)^2)/(z-z_0) = lim_(z arrow.r z_0) (z overline(z)-z_0 overline(z_0))/(z-z_0) = lim_(h arrow.r 0) ((z_0 + h)(overline(z_0+h))-z_0 overline(z_0))/(z_0+h-z_0) = lim_(h arrow.r 0) (z_0 overline(z_0)+z_0 overline(h)+h overline(z_0)+ h overline(h)-z_0 overline(z_0))/h \
    = lim_(h arrow.r 0) (h overline(h)+ h overline(z_0)+ z_0 overline(h))/h = lim_(h arrow.r 0) overline(h) + overline(z_0) + z_0 overline(h)/h
  $
  נבחין שכאשר $h arrow.r 0$, גם $overline(h) arrow.r 0$ ולכן הגורם הראשון מתבטל ונשארנו עם $overline(z_0) + z_0 overline(h)/h$ אבל הביטוי האחרון תלוי בכיוון השאיפה האם אנחנו שואפים מכיוון $0^plus$ או מכיוון $0^minus$ שכן מתקיים
  $
    lim_(h arrow.r 0^plus) overline(h) + overline(z_0) + z_0 overline(h)/h = overline(z_0) + z_0 \
    lim_(h arrow.r 0^minus) overline(h) + overline(z_0) + z_0 overline(h)/h = overline(z_0) - z_0
  $
  כלומר, הגבול קיים אם ורק אם $z_0 = 0$ ואז גם ערך הנגזרת בנקודה יהיה אפס.\
  נובע מכך ש־$f$ לא אנליטית בכלל שכן גם סביב הראשית אין סביבה קטנה דיו בה הפונקציה היא $CC$־דיפרנציאבילית.
]

#subquestion()
$z mapsto e^z$.

#proof[
  ניעזר ברמז ונרצה להראות $abs(e^z-1-z)<=e^abs(z)-1-abs(z)$.\
  ראשית נזכר שבהרצאה ראינו שטור טיילור של $e^z$ הוא $ e^z = 1 + z + z^2/2! + z^3/3! + dots.h = sum_(n=0)^infinity z^n/n! $
  באגף שמאל יש לנו $ abs(e^z-1-z) = abs(sum_(n=2)^infinity z^n/n!) = sum_(n=2)^infinity abs(z^n)/n! $
  מצד ימין
  $ e^abs(z) - 1 - abs(z) = sum_(n=0)^infinity abs(z)^n/n! - 1 - abs(z) = sum_(n=2)^infinity abs(z)^n/n! $
  ומאי־שיוויון המשולש מתקיים $abs(sum_(n=2)^infinity z^n/n!)<=sum_(n=2)^infinity abs(z)^n/n!$.\
  יהי $z in CC$, נבחן את הגדרת ה־$CC$־דיפרנציאביליות
  $
    lim_(z arrow.r z_0) (e^z-e^(z_0))/(z-z_0) =_(w = z-z_0) lim_(z arrow.r z_0) (e^(z_0) e^(z-z_0) - e^(z_0))/(z-z_0) = lim_(z arrow.r z_0) e^(z_0) dot.op (e^(z-z_0)-1)/(z-z_0)
  $
  נגדיר $w = z-z_0$ (אפשר כי זו החלפת משתנה רציפה כפי שראינו בתרגול) ומספיק שנראה $lim_(w arrow.r 0) (e^w-1)/w = 1$, מאי־השיוויון שהראינו מתקיים
  $ abs((e^w-1)/w - 1) = abs((e^w-1-w)/w) = abs(e^w-1-w)/abs(w) <= (e^(abs(w))-1-abs(w))/abs(w) $
  כאשר $$
  עלינו לבחון $w arrow.r 0$ ולכן $abs(w) arrow.r 0$ ולכן מספיק שנראה למקרה השני (כי $w arrow.r 0$ אממ $abs(w) arrow.r 0$) והגבול לעיל הוא גבול ממשי ולכן אפשר להשתמש בכלל לופיטל ולקבל שהגבול הוא אכן $1$.\
  לכן
  $
    lim_(z arrow.r z_0) (e^z-e^(z_0))/(z-z_0) = lim_(z arrow.r z_0) e^(z_0) dot.op lim_(z arrow.r z_0) (e^(z-z_0)-1)/(z-z_0) = e^(z_0)
  $
  כלומר, לכל $z in CC$ הפונקציה היא $CC$־דיפרנציאבילית ולכן בפרט אנליטית לכל $z in CC$.
]

#subquestion()
$f(x+ i y)=(x^2+y^2) + i(-x^2+y^2)$.

#proof[
  יהיו $z=x+i y$ ו־$z_0 = x_0 + i y_0$.\
  נצטרך לבחון גם את קו האופק וגם את קו הרוחב.
  בקו האופקי, ניקח $z=x+i y_0$ אז $z arrow.r z_0$ אומר ש־$x arrow.r x_0$ כלומר $z-z_0 = x-x_0$ ואז
  $
    f(z)-f(z_0) & = x^2+y_0^2+i(-x^2+y_0^2)-x_0^2-y_0^2-i(-x_0^2+y_0^2) \
                & = x^2-x_0^2-i x^2+ i x_0^2 \
                & = (x-x_0)(x+x_0)-i((x-x_0)(x+x_0)) \
                & = (x-x_0)(x+x_0)(1-i) =
  $
  כלומר
  $
    f'(z_0)_"אופקית" lim_(x arrow.r x_0) lim_(x arrow.r x_0) ((x-x_0)(x+x_0)(1-i))/(x-x_0) \
    = lim_(x arrow.r x_0) (x+x_0)(1-i) = 2x_0 - 2i x_0 = 2x_0 (1-i)
  $
  באותו אופן אם נלך בקו האנכי אז $z-z_0 = i(y-y_0)$ ואז
  נחשב נגזרת חלקית לפי $x$:
  $
    f'(z_0)_"אנכית" = lim_(y arrow.r y_0) (f(x_0 + i y)- f(x_0 + i y_0))/(i(y-y_0)) = lim_(y arrow.r y_0) (x_0^2+y^2+i(-x_0^2+y^2)-x_0^2-y_0^2-i(-x_0^2+y_0^2))/(i(y-y_0)) \
    = lim_(y arrow.r y_0) ((y+y_0)(y-y_0)(1+i))/(i(y-y_0)) =_((star)) lim_(y arrow.r y_0) (y+y_0)(1-i) = 2y_0 - 2i y_0 = 2y_0 (1-i)
  $
  כאשר $(star)$ נובע מכך שמתקיים $ (1+i)/i = (1 + i)/i dot.op (-i)/(-i) = (-i +1)/((-i) dot.op i) = (-i + 1)/1 = 1-i $
  כלומר צריך להתקיים בשביל שיהיה גבול
  $ 2x_0 (1-i) = 2y_0 (1-i) <==> x_0 = y_0 $
  כלומר $f$ גזירה על הישר $y=x$ בלבד ולכן כמובן היא בהכרח לא אנליטית כי אין סביבה פתוחה סביב כל נקודה שבה הפונקציה היא $CC$־דיפרנציאבילית.\
  מספיק להסתכל על $z_0 = 1+i$, כל דיסק פתוח סביב $z_0$ יכיל נקודות שאינן על הישר $x=y$ וסיימנו.
]

#pagebreak()

#subquestion()
$f(x+ i y)=x^3+3i y$.

#proof[
  נפעל באופן דומה לסעיף הקודם, נכתוב $z = x+i y, z_0 = x_0 + y_0$.\
  עבור המקרה האופקי ניקח $z=x+i y_0$ אז $z arrow.r z_0$ אומר ש־$x arrow.r x_0$ כלומר $z-z_0 = x-x_0$ ואז
  $
    f'(z_0)_"אופקית" = lim_(x arrow.r x_0) (f(x + i y_0)- f(x_0 + i y_0))/(y-y_0) = lim_(x arrow.r x_0) (x^3 + 3i y_0^3 - x_0^3 - 3i y_0^3)/(x-x_0) = lim_(x arrow.r x_0) (x^3-x_0^3)/(x-x_0) \
    = lim_(x arrow.r x_0) ((x-x_0)(x^2+x x_0 + x_0^2))/(x-x_0) = lim_(x arrow.r x_0) x^2 + x x_0 + x_0^2 = 3x_0^2
  $
  באותו אופן אם נלך בקו האנכי אז $z-z_0 = i(y-y_0)$ ואז
  $
    f'(z_0)_"אנכית" = lim_(y arrow.r y_0) (f(x_0 + i y)- f(x_0 + i y_0))/(i(y-y_0)) = lim_(y arrow.r y_0) ((3i)(y-y_0))/(i(y-y_0)) = 3
  $
  אז בשביל קיום הגבול נצטרך $3x_0^2 = 3 <==> x_0^2 = 1 <==> x_0 plus.minus 1$
  אז הפונקציה גזירה רק במקומות בהם החלק הממשי הוא $plus.minus 1$, כלומר
  $ {z in CC bar re(z)=1} union {z in CC bar re(z)=-1} $
  בפרט זה אומר שהפונקציה איננה אנליטית.
]

#question()
תהיינה $f,g in Hol(G)$ עבור תחום $G subset CC$.\
_תזכורת_: בהינתן $G$ תחום, נסמן ב־$Hol(G)$ את קבוצת כל הפונקציות שאנליטיות על $G$.

#subquestion()
נראה כי $(f plus.minus g)$ אנליטית ושמתקיים $(f plus.minus g)' = f' plus.minus g'$.

#proof[
  מהגדרת ה־$CC$־דיפרנציאביליות מתקיים
  $
    (f plus.minus g)'(z_0) = lim_(z arrow.r z_0) ((f plus.minus g)(z)-(f plus.minus g)(z_0))/(z-z_0) = lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) plus.minus (g(z)-g(z_0))/(z-z_0) \
    = lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) plus.minus lim_(z arrow.r z_0) (g(z)-g(z_0))/(z-z_0)
  $
  אבל $f,g in Hol(G)$ ולכן הגבולות לעיל מוגדרים היטב וקיימים.\
  בפרט, לכל $z in G$, הן $f$ והן $g$ אנליטיות ב־$z$, כלומר קיימת סביבה $U_z$ כך ש־$f$ ו־$g$ הן $CC$־דיפרנציאביליות בכל $z' in U_z$.\
  מאריתמטיקה של גבולות מתקיים
  $
    (f plus.minus g)'(z_0) = lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) plus.minus lim_(z arrow.r z_0) (g(z)-g(z_0))/(z-z_0) = f'(z_0) plus.minus g'(z_0)
  $
  היות וזה נכון לכל $z in G$ אז $f plus.minus g in Hol(G)$ ומתקיים $(f plus.minus g)' = f' plus.minus g'$.
]

#subquestion()
נראה כי $f dot.op g$ אנליטית ושמתקיים $(f dot.op g)' = f' dot.op g + f dot.op g'$.

#proof[
  בדומה לסעיף הקודם,   מהגדרת $CC$־דיפרנציאביליות ומהיות $f,g in Hol(G)$ מתקיים
  $
    (f dot.op g)' (z_0) = lim_(z arrow.r z_0) ((f dot.op g)(z) - (f dot.op g)(z_0))/(z-z_0) = lim_(z arrow.r z_0) (f(z) dot.op g(z) - f(z_0) dot.op g(z_0))/(z-z_0) \
    = lim_(z arrow.r z_0) ((f(z)-f(z_0)) dot.op g(z) + f(z_0) dot.op g(z)- f(z_0) dot.op g(z_0))/(z-z_0) = lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) dot.op g(z) + (f(z_0) dot.op g(z)- f(z_0) dot.op g(z_0))/(z-z_0) \
    = lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) dot.op g(z) + lim_(z arrow.r z_0) (f(z_0) dot.op g(z)- f(z_0) dot.op g(z_0))/(z-z_0)
    = f'(z_0)g(z_0)+f(z_0) lim_(z arrow.r z_0) (g(z)-g(z_0))/(z-z_0) \
    = f'(z_0) dot.op g(z_0) + f(z_0) dot.op g'(z_0)
  $
  היות וזה נכון לכל $z in G$ אז $f dot.op g in Hol(G)$ ומתקיים $(f dot.op g)' = f' dot.op g + f dot.op g'$.
]

#subquestion()
נראה כי $f compose g$ אנליטית ושמתקיים $(f compose g)'(z) = f'(g(z)) dot.op g'(z)$.

#proof[
  מהגדרת $f,g in Hol(G)$ ומהגדרת ה־$CC$־דיפרנציאביליות מתקיים
  $
    (f compose g)'(z_0) = lim_(z arrow.r z_0) ((f compose g)(z)-(f compose g)(z_0))/(z-z_0) = lim_(z arrow.r z_0) (f(g(z))-f(g(z_0)))/(g(z)-g(z_0)) dot.op (g(z)-g(z_0))/(z-z_0) = f'(g(z_0)) dot.op g'(z_0)
  $
  אז אם $g$ אנליטית ב־$z$ ו־$f$ אנליטית ב־$g(z)$ אז $f compose g$ אנליטית ב־$z$, לכל $z in G$ (שכן $f,g in Hol(G)$).
]

#pagebreak()

#subquestion()
נניח כי $g(z)!=0$ לכל $z in G$ ונראה $(f/g)' = (f' dot.op g - f dot.op g')/g^2$.

#proof[
  מספיק שנראה שמתקיים $(1/g)' = (-g')/g^2$  ומהסעיף אודות מכפלה של פונקציות אנליטיות נקבל את הנדרש.\
  מהגדרת ה־$CC$־דיפרנציאביליות מתקיים
  $
    (1/g)'(z_0) = lim_(z arrow.r z_0) (1/g(z) - 1/g(z_0))/(z-z_0) = lim_(z arrow.r z_0) (g(z_0)-g(z))/(g(z)(g(z_0)))/(z-z_0) = lim_(z arrow.r z_0) (g(z_0)-g(z))/(z-z_0) dot.op 1/(g(z)g(z_0)) = (-g'(z))/(g^2(z))
  $
  כמובן שהכל תחת ההנחה שלכל $z in G$ מתקיים $g(z)!=0$ והיות וזה נכון לכל $z in G$ אז $1/g$ היא אנליטית מכך ש־$g in Hol(G)$.\
  נשים לב שמתקיים $(f/g)' = (f dot.op 1/g)'$ ומהסעיף אודות נגזרת מכפלה של פונקציות אנליטיות מתקיים $ (f dot.op 1/g)' = f' dot.op 1/g + f dot.op g' = f'/g + f dot.op (-g')/g^2 = (f' dot.op g -f dot.op g')/g^2 $
  מהסעיף הקודם והטענה לעיל אנחנו מקבלים את הנדרש.
]

#subquestion()
נוכיח שאם לכל $z in G$ מתקיים $f'(z)=0$ אז $f$ קבועה.

#proof[
  $G$ תחום ולכן קבוצה פתוחה וקשירה ולכן קשירה מסילתית.\
  ניקח $z_0, z_1$ ומהקשירות יש מסילה $gamma : [a,b] arrow.r G$ כך ש־$gamma(a)=z_0, gamma(b)=z_1$ ונסתכל על ההרכבה $h(t) colon.eq f(gamma(t))$ כך ש־$t in [a,b]$.\
  נשים לב שמתקיים
  $
    h'(t) = lim_(h arrow.r 0) (f(gamma(t+h))-f(gamma(t)))/h = lim_(h arrow.r 0) (f(gamma(t+h))-f(gamma(t)))/(gamma(t+h)-gamma(t)) dot.op (gamma(t+h)-gamma(t))/h
  $
  מתקיים $gamma(t+h)-gamma(t) arrow.r_(h arrow.r 0) 0$ ו־$gamma$ היא מסילה ולכן גזירה והגורם השני שואף לנגזרתה.\
  אז
  $ h'(t) = f'(gamma(t)) dot.op gamma'(t) $
  אבל מהנתון, $f'(z)=0$ לכל $z in G$ ובפרט נקבל $h'(t)=0$ לכל $t in [a,b]$ אבל זה בידיוק גורר ש־$h$ היא קבועה, זו פונקציה ממשית ולכן אפשר לראות זאת מהמשפט היסודי של החשבון האינפיניסטמלי
  $ h(t_2)-h(t_1) = integral_(t_1)^(t_2) h'(t) d t = integral_(t_1)^(t_2) 0 d t = 0 $
  אזי $h$ היא קבועה על $[a,b]$, כלומר
  $ f(z_0) = h(gamma(a)) = h(gamma(b)) = f(z_1) $
]

#subquestion()
נוכיח כי $f(overline(z))$ היא לא פונקציה אנליטית אם $f eq.triple.not C$ עבור $C$ קבוע.

#proof[
  נגדיר $g(z) = f(overline(z))$ ונקבע $z_0$ כך ש־$w_0 colon.eq overline(z_0)$.\
  נניח כי $g$ היא אנליטית, בפרט היא $CC$־דיפרנציאבילית ב־$z_0$, אז
  $
    g'(z_0) = lim_(h arrow.r 0) (g(z_0+h)-g(z_0))/h = lim_(h arrow.r 0) (f(overline(z_0+h))-f(z_0))/h = lim_(h arrow.r 0) (f(w_0 + overline(h))-f(w_0))/h
  $
  $f$ היא אנליטית ולכן כאשר $h arrow.r 0$
  $ f(w_0 +overline(h))-f(w_0) = f'(w_0) overline(h) + o(abs(overline(h))) $
  כלומר
  $ ( f(w_0 + overline(h))- f(w_0))/h = f'(w_0) overline(h)/h + o(abs(overline(h)))/h $
  כלומר אם הגבול של $g'(z_0)$ קיים אז גם הגבול $f'(w_0) overline(h)/h$ כאשר $h arrow.r 0$ קיים ושווה לו.\
  אם $h$ ממשי אז $overline(h)/h=1$ ואז הביטוי שואף ל־$f'(w_0)$
  אם $h$ הוא מדומה אזי $h = i t$ עם $t$ ממשי כך ש־$t arrow.r 0$ נקבל $overline(h)/h = -1$ כלומר הביטוי שואף ל־$-f'(w_0)$.\
  אבל אם הגבול קיים, אז הנגזרות הכיווניות הללו חייבות להסכים על הערך, אז $ f'(w_0) = -f'(w_0) ==> f'(w_0) = 0 $
  אבל מהסעיף הקודם נובע כי $f$ קבועה. אז אם $f$ קבועה, באמת $g$ אנליטית.\
  אם $f$ איננה קבועה, קיבלנו סתירה מההנחה ש־$g$ היא $CC$־דיפרנציאבילית ולכן היא איננה $CC$־דיפרנציאבילית.
]


#question()
ניזכר שהעתקה לינארית $L : RR^2 arrow.r RR^2$ יכולה להיות מתוארת על־ידי כפל מטריצות
$ L(x,y) = mat(alpha, beta; gamma, delta) vec(x, y) = (alpha x + beta y, gamma x + delta y) $

#subquestion()
נראה כי ההעתקה לעיל יכולה להיכתב בצורה
$ z mapsto z dot.op ((alpha+delta)/2+ i (gamma-beta)/2) + overline(z) dot.op ((alpha-delta)/2 + i (gamma + beta)/2) $

#solution[
  נכתוב $omega = (alpha x + beta y) + i (gamma x + delta y)$.\
  יהי $CC in.rev z = a + i b$, נשים לב לזהות הבאה
  $
    z = a + i b ==> a = (z+overline(z))/2 = (a+i b + a - i b)/2 = (2a)/2 = a \
    z = a + i b ==> b = (z + overline(z))/(2 i) = (a + i b - a + i b)/ (2 i) = (2 i b)/(2 i) = b
  $
  ולכן במקרה שלנו מתקיים עבור $CC in.rev z = x + i y$
  $
    omega = alpha((z + overline(z))/2) + beta((z-overline(z))/2) + i gamma((z + overline(z))/2) + i delta((z-overline(z))/2)
  $
  ניזכר שמתקיים $ 1/i= -i $ שכן מתקיים $1/i dot.op (-i)/(-i) = -i/(-i)^2 = -i/1 = - i$ ולכן אם נסתכל על המקדמים לעיל של $z$ נקבל
  $
    alpha/2 - (i beta)/2 + (i gamma)/2 + delta/2 = 1/2(alpha + delta) + i/2 (gamma-beta) = (alpha+delta)/2 + i (gamma-beta)/2
  $
  באותו אופן עבור $overline(z)$ מתקיים
  $
    alpha/2 - beta/(2i) + (i gamma)/2 - (i delta)/(2i) = alpha/2 -(-i beta)/2 + (i gamma)/2 - delta/2 = 1/2(alpha-delta)+i/2(beta+gamma)/2 = (alpha-beta)/2 + i (beta+gamma)/2
  $
  כלומר
  $ omega = z dot.op ((alpha+delta)/2 + i (gamma-beta)/2) + overline(z) dot.op ((alpha-delta)/2 + i (beta+gamma)/2) $
]

#subquestion()
נראה כי העתקה לינארית $f(z)= a dot.op z + b dot.op overline(z)$ היא הולומורפית אם ורק אם $b=0$.\
_תזכורת_: נגיד שהעתקה היא הולומורפית אם היא אנליטית בכל $CC$ (כלומר, לכל $z in CC$, ההעתקה אנליטית ב־$z$).

#proof[
  $==>$ נניח כי $b=0$ ונראה כי $f$ היא הולומורפית.\
  אז $f(z) = a dot.op z$, ומהגדרת ה־$CC$־דיפרנציאביליות מתקיים
  $ lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) = lim_(z arrow.r z_0) (a(z-z_0))/(z-z_0) = a $
  מהיות $z_0 in CC$ שרירותי נובע כי הטענה נכונה לכל $z_0 in CC$ ולכן $f$ הולומורפית, כי היא אנליטית בכל $z_0 in CC$.\
  #colbreak()
  $<==$ נניח כי $f$ הולומורפית ונראה כי $b=0$.\
  $f$ הולומורפית ולכן לכל $z_0 in CC$, $f$ אנליטית ב־$z_0$, כלומר יש סביבה $U_(z_0)$ כך ש־$f$ $CC$־דיפרנציאבילית בכל $z in U_(z_0)$.\
  יהי $z_0 in CC$, מתקיים מהגדרת ה־$CC$־דיפרנציאביליות
  $
    lim_(z arrow.r z_0) (f(z)-f(z_0))/(z-z_0) = lim_(z arrow.r z_0) ((a dot.op z + b dot.op overline(z))-(a dot.op z_0 + b dot.op overline(z_0)))/(z-z_0) = lim_(z arrow.r z_0) (a(z-z_0)+b(overline(z)-overline(z_0)))/(z-z_0) \
    = lim_(z arrow.r z_0) a dot.op (z-z_0)/(z-z_0) - b dot.op (overline(z)-overline(z_0))/(z-z_0) = lim_(z arrow.r z_0) a + b overline(z-z_0)/(z-z_0) = a dot.op lim_(z arrow.r z_0) b dot.op overline(z-z_0)/(z-z_0)
  $
  מהיות $f$ הולומורפית, נובע כי הגבול לעיל צריך להיות קיים ומוגדר היטב.\
  אם כך, אם אנחנו נעים על הציר הממשי, הביטוי לעיל יישאף ל־$1$. אם אנחנו נעים על הציר המדומה, הביטוי לעיל יישאף ל־$-1$, כלומר הגבול הזה לא קיים אלא אם כן $b=0$ ואז כל הביטוי הזה לא חלק מהגבול, ולכן $b=0$ בהכרח.\
]

#subquestion()
נסיק שכדי שהעתקה לינארית תהיה הולומורפית חייב להתקיים $alpha=delta, beta = - gamma$.

#solution[
  בעצם עלינו להראות שמתקיים $(alpha-delta)/2 + i (gamma+beta)/2 = 0$\
  ניזכר ש־$CC in.rev z = a + i b = 0$ אם ורק אם $re(z) = 0$ וגם $im(z)=0$.\
  במקרה שלנו מתקיים
  $
    cases(
      (alpha-delta)/2 = 0 <==> alpha - delta = 0 <==> alpha = delta,
      (gamma+beta)/2 = 0 <==> gamma+beta=0 <==>beta=-gamma
    )
  $
  אז ההעתקה הלינארית יכולה להיות מיוצגת על־ידי מטריצה מהצורה $display(M = mat(alpha, -gamma; gamma, alpha))$.\
  תחת מקרה זה מסעיף א' מתקיים
  $
    (alpha+delta)/2 + i (gamma-beta)/2 = (alpha+alpha)/2 + i (gamma-(-gamma))/2 = (2alpha)/2 + i (2gamma)/2 = alpha + i gamma
  $
  כלומר $L(z) = (alpha + i gamma)z$ שבסעיף הקודם ראינו שהיא הולומורפית.
]

#question()
בהינתן מטריצה $A$ הגדרנו את העתקת מוביוס המתאימה להיות $h_A$.\
_תזכורת_:  אמרנו שהעתקה מהצורה
$ h(z)=(a dot.op z + b)/(c dot.op z + d) $
כאשר $a,b,c,d in CC$ היא *העתקת מוביוס* והמטריצה המתאימה לייצוג ההעתקה היינה
$ A_h = mat(a, b; c, d) $

#subquestion()
תהיינה $A,B$ מטריצות ונראה כי $h_A compose h_B = h_(A B)$.

#solution[
  תהיינה $display(A = mat(a, b; c, d) "," space B = mat(e, f; g, h))$.\
  מצד אחד מתקיים
  $
    h_A compose h_B (z) = h_A ((e z + f)/(g z + h)) = (a (e z + f)/(g z + h) + b)/(c ((e z + f)/(g z + h)) + d) = ((a(e z + f) + b(g z + h))/(g z + h))/((c(e z + f) + d(g z + h))/(g z + h)) = (a(e z + f) + b(g z + h))/(c (e z + f) + d(g z + h)) \
    = (a e z + a f + b g z + h b)/(c e z + c f + d g z + d h) = ((a e + b g)z + (a f + b h))/((c e + d g)z + (c f + d h))
  $
  מצד שני מתקיים
  $ A B = mat(a e + b g, a f + b h; c e + d g, c f + d h) $
  נסמן $a' = a e + b g, b'=a f + b h, c'= c e + d g, d'=c f + d h$ ולכן $display(A B = mat(a', b'; c', d'))$ ונחשב
  $ h_(A B)(z) = (a'z + b')/(c' z + d')= ((a e + b g)z + ( a f + b h))/((c e + d g)z + (c f + d h)) $
  וקיבלנו שיוויון.
]

#subquestion()
נניח כי $det(A) !=0$ ונראה כי $h_A^(-1) = h_(A^(-1))$.

#solution[
  מהיות $det(A) !=0$ נובע כי $A^(-1)$ קיימת ומתקיים $A^(-1) A = I$ ומהסעיף הקודם מתקיים
  $ h_(A^(-1)) compose h_A = h_(A^(-1) A) = h_I $
  אבל $ h_I (z) = (z +0)/(0 z + 1) = z $
  אזי $h_(A^(-1)) compose h_A = id$ ובאותו אופן נקבל גם $h_A compose h_(A^(-1)) = id$, כלומר $h_(A^(-1))$ היא ההופכית של $h_A$, כלומר $h_(A^(-1)) = (h_A)^(-1)$.
]

#subquestion()
נראה כי כל העתקת מוביוס יכולה להתקבל מהרכבה של העתקות מוביוס אלמנטריות.

#proof[
  בתרגול ראינו שארבעת העתקות מוביוס האלמנטריות הן סקלר, סיבוב, הזזה והופכי.\
  נסמן $ A = mat(a, b; c, d), h_A (z) = (a z + b)/(c z + d) $
  אם $c=0$ אז $h_A (z) = (a z + b)/d = a/d z + b/d$ שזה בידיוק הרכבה של הזזה וכיווץ בסקלר.\
  בתרגול טענו את הטענה הנדרשת יחד עם ההנחה $det(A)!=0$ ולכן נמשיך תחת מקרה זה.\
  נשים לב
  $ a z + b = a/c (c z) + b = a/c (c z + d - d) + b = a/c (c z + d) - (a d)/c + b $
  ולכן
  $ (a z + b)/(c z + d) = ( a/c (c z + d) + (b- (a d)/c))/(c z + d) = a/c + (b-(a d)/c)/(c z + d) $
  כעת ניזכר ש־$det(A)!=0$ ולכן
  $ b-(a d)/c = (b c - a d)/c = - (a d - b c)/c = - det(A)/c $
  אז
  $
    a/c + (b-(a d)/c)/(c z + d) = a/c + ((-det(A))/c)/(c z + d) = a/c - det(A)/c dot.op 1/(c z + d) = a/c - det(A)/c^2 dot.op 1/(z + d/c)
  $
  נסמן ב־$T_1$ את ההזזה $z_1 = z + d/c$, ב־$I$ את ההופכי $z_2 = 1/z_1 = 1/(z + d/c)$, ב־$D$ את הסקלריות $z_3 = (-det(A))/c^2 dot.op z_2 = - det(A)/(c(c z + d))$ וב־$T_2$ את ההזזה $h(z)=a/c+z_3$
  ואכן מתקיים
  $
    (T_2 compose D compose I compose T_1)(z) = (T_2 compose D compose I)(z + d/c) = (T_2 compose D)(c/(c z + d)) = T_2 (-det(A)/(c(c z + d))) = a/c + -det(A)/(c(c z + d)) \
    = a/c + (b c - a d)/(c(c z + d)) = (a(c z + d) - a d + b c)/(c(c z + d)) = (a c z + a d - a d + b c)/(c(c z + d)) = (c( a z + b))/(c(c z + d)) = (a z + b)/(c z + d)
  $
  כלומר, כל העתקת מוביוס יכולה להתקבל מהרכבה של העתקות מוביוס אלמנטריות.
]

#question()
#subquestion()
בכל סעיף נחשב את רדיוס ההתכנסות, נכתוב את תחום ההתכנסות ונקבע האם הוא מתכנס במידה שווה או לא.

#sub_subquestion()
$sum_(n=1)^infinity z^n/n!$.

#solution[
  ראשית בהרצאה ראינו ש־$e^z = sum_(n=0)^infinity z^n/n!$ ולכן הטור שקיבלנו הוא בעצם הטור של $e^z-1$.\
  נשים לב שמתקיים
  $
    L = lim_(n arrow.r infinity) abs(a_(n+1)/a_n) = lim_(n arrow.r infinity) abs((1/(n+1)!)/(1/(n)!)) = lim_(n arrow.r infinity) abs(1/(n+1)) = infinity
  $
  אז רדיוס ההתכנסות הוא $infinity$, ולכן הטור מתכנס לכל $z in CC$.\
  כדי להראות שהטור לא מתכנס במידה שווה על $CC$, יהי $epsilon = 1$, לו היה מתכנס במידה שווה, היה קיים $N$ כך שלכל $n>=N$ ולכל $z in CC$ היה מתקיים $abs(sum_(k=(n+1))^infinity z^k/k!)< epsilon$.\
  נסתכל על $z^(N+1)/(N+1)!$, אם נניח בשלילה שהטור מתכנס במידה שווה, היה מתקיים שכאשר $n arrow.r infinity$ אז הביטוי הזה היה שואף ל־$0$.\
  אבל לכל $N$, נשים לב שבבחירה של $z$ גדול מספיק, כלומר $abs(z)=(N+1)!$ היה מתקיים שהביטוי לעיל הוא $1$, כלומר לא ניתן לקבל את ההגדרה להתכנסות במידה שווה.
]

#sub_subquestion()
$sum_(n=1)^infinity z^n$.

#solution[
  ראשית זה טור סביב $z_0 = 0$ ולכל $n in NN$ מתקיים $a_n = 1$, כלומר $sum_(n=1)^infinity a_n (z-z_0) = sum_(n=1)^infinity z_n$.\
  מנוסחת הדמארד מתקיים
  $ 1/R = lim_(n arrow.r infinity) sup root(n, abs(a_n)) = lim_(n arrow.r infinity) sup 1 = 1 $
  ולכן רדיוס ההתכנסות הוא $1$.\
  נבחן מקרים שונים של $z$:
  + אם $abs(z)<1$ אז זה טור גיאומטרי ומתכנס בהחלט
  + אם $abs(z)=1$ או $abs(z)>1$ אז הטור מתבדר (כי אפילו $lim_(n arrow.r infinity) z_n !=0$ וזה תנאי הכרחי)
  אז תחום ההתכנסות הוא $ {z in CC bar abs(z)<1} $
  נשים לב שיש תחום בו הטור מתכנס במידה שווה ויש תחום שלא: אם ניקח דיסק ברדיוס $0<r<1$ ונסתכל על $overline(D_r) = {z in CC bar abs(z)<=r}$ אז לכל $z in overline(D_r)$ מתקיים $abs(z^n)=abs(z)^n<=r^n$ אז ממבחן ה־$M$ של ויירשטראס אם נבחר $M_n =r^n$ אז זה טור גיאומטרי מתכנס ולכן הטור מתכנס בדיסקים הללו.\
  מצד שני, אנחנו יודעים ש־$S_N (z) = sum_(n=1)^N z^n = z/(1-z)$ ולו הוא היה מתכנס במידה שווה על הדיסק אזי היה מתקיים $ lim_(N arrow.r infinity) sup_(abs(z)<1) abs(S(z)-S_N (z)) = 0 $
  אזי $S(z) = S_N (z) = z^(N+1)/(1-z)$, עבור בחירה של $z= 1-delta$ כאשר $delta>0$ קטן כרצוננו, היה מתקיים
  $ lim_(N arrow.r infinity) sup_(abs(z)<1) abs(S(z)-S_N (z)) = (abs(1-delta)^(N+1))/delta arrow.r infinity $
  כלומר אין התכנסות במידה שווה בדיסק הפתוח.
]

#pagebreak()
#sub_subquestion()
$sum_(n=1)^infinity z^n/n^2$.

#solution[
  נסמן $z_0 = 0$ ו־$a_n = 1/n^2$, אז לפי נוסחת הדמארד מתקיים
  $
    1/R = lim_(n arrow.r infinity) sup root(n, abs(a_n))= lim_(n arrow.r infinity) sup abs(1/n^2)^(1/n)= lim_(n arrow.r infinity) sup e^((1/n) ln(1/n^2)) = 1
  $
  אז לכל $abs(z)<1$ מתקיים שהטור מתכנס ואחרת הוא מתבדר, עבור $abs(z)=0$ מתקיים
  $ sum_(n=1)^infinity abs(z^n/n^2) = sum_(n=1)^infinity 1^n/n^2 < infinity $
  ולכן הטור מתכנס גם עבור $abs(z)=1$ ובעצם תחום ההתכנסות הוא דיסק היחידה הסגור
  $ overline(DD) = {z in CC bar abs(z)<=1} $
  בשביל להראות התכנסות במידה שווה מספיק שניקח $M_n = 1/n^2$ וזה טור שמתכנס ולכן לפי מבחן ה־$M$ של ויירשטראס מתקיים שהטור מתכנס במידה שווה על דיסק היחידה.
]

#subquestion()
נביא דוגמה נגדית שהתכנסות במידה שווה על דיסק פתוח לא גוררת התכנסות במידה שווה על הדיסק הסגור.

#proof[
  ניקח את הטור $sum_(n=0)^infinity z^n/(n+1)$, זה טור סביב $0$ ו־$a_n = n+1$.\
  מנוסחת הדמארד מתקיים
  $
    1/R = lim_(n arrow.r infinity) sup root(n, abs(a_n)) = lim_(n arrow.r infinity) sup 1/root(n, n+1) ==> R = 1/(lim_(n arrow.r infinity) sup 1/(root(n, n+1))) = 1/(lim_(n arrow.r infinity) sup 1/e^(1/n ln(n+1)))=_"לופיטל"1
  $
  אז הוא מתכנס בדיסק הפתוח ${z in CC bar abs(z)<1}$, כאשר $abs(z)=1$.\
  ממבחן אבל אם ניקח $a_n = 1/(n+1), b_n = z^n$ אז הטור שלנו מתכנס (כמכפלה של שני אלו), אבל אם $abs(z)=1$ נקבל וריאציה של הטור ההרמוני שמתבדר.\
  מתקיים
  $ sum_(n=0)^infinity z^n/(n+1) = 1/z sum_(n=0)^infinity z^(n+1)/(n+1) = 1/z sum_(k=1)^infinity z^k/k = -1/z ln(1-z) $
  אבל כאשר $z arrow.r 1^minus$ הביטוי שלנו לעיל שואף ל־$minus infinity$ ובפרט זה אומר שגם שסדרת הסכומים החלקיים לא יכולה להתכנס במידה שווה (כי הסכום החלקי אפילו לא חסום).
]
