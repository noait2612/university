#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 12 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $E subset RR$ קבוצה מדידה לבג ו־$t in RR$. נאמר כי $E$ היא $t$־מחזורית אם $E+t=E$.\
נוכיח כי אם $E$ היא $t_n$־מחזורית עבור סדרה $0!=t_n arrow.r 0$ אז האחת מבין $E, E^c$ היא ממידה אפס.

#proof[
  נוכיח תחילה שהפונקציה $x mapsto lambda(E Delta (E+x))=0$ רציפה ב־$0$ (הרציפות באפס תספיק כי הזזה ב־$h$ תתנהג באופן דומה כמו הזזה ב־$h+x$).\
  יהי $I=(a,b)$ קטע סופי ויהי $x$ כך ש־$abs(x)<b-a$ ונסתכל על $I+x$.\
  ההפרש הסימטרי $I Delta(I+x)$ מכיל שני חלקים שאין ביניהם חפיפה:
  + אם $x>0$ אז ההפרש יהיה $(a,a+x] union (b,b+x]$
  + אם $x<0$ אז ההפרש יהיה $(a+x,a] union (b+x, b]$
  וממידת לבג אנחנו יודעים שמתקיים
  $ lambda(I Delta (I+x))=abs(x)+abs(x)=2 abs(x) $
  וכאשר $x arrow.r 0$ אז $lambda(I Delta (I+x)) arrow.r 0$.\
  כעת, יהי $U$ איחוד סופי של קטעים פתוחים זרים בזוגות $U=union.big_(k=1)^n I_k$ ומתת־אדטיביות של המידה נקבל
  $
    lambda(U Delta (U+x))=lambda(union.big_(k=1)^n I_k Delta union.big_(k=1)^n (I_k + x))<=sum_(k=1)^n lambda(I_k Delta (I_k + x)) = sum_(k=1)^n 2 abs(x) = 2n abs(x)
  $
  כעת ניקח את $E$ להיות כל קבוצה מדידה לבג סופית. מהרגולריות של מידת לבג נובע שלכל $epsilon>0$ קיימת $U$ כאיחוד סופי של קטעים פתוחים כך שמתקיים
  $ lambda(E Delta U)<epsilon/3 $
  אזי
  $ lambda(E Delta (E+x))<=lambda(E Delta U)+lambda(U Delta (U+x))+lambda((U + x) Delta (E+x)) $
  נשים לב שמהעובדה שמידת לבג היא אינווריאנטית להזזות נובע כי
  $ lambda((U+x) Delta (E+x))=lambda((U Delta E)+x)=lambda(U Delta E) < epsilon/3 $
  ומהמקרה הקודם קיימת $delta>0$ כך שאם $abs(x)<delta$ אז $lambda(U Delta (U+x))<epsilon/3$, כלומר
  $ lambda(E Delta (U+x))< epsilon/3 + epsilon/3 + epsilon/3 = epsilon $
  כלומר
  $ lim_(x arrow.r 0) lambda(E Delta (E+x))=0 $
  אז במקרה שלנו אם נסתכל על
  $ bb(1)_(E) (x) = mycases(1, x in E, 0, x in.not E) $
  מהנתון $E + t_n = E$ נקבל כי לכל $x in RR, n in NN$ עם מה שהוכחנו לעיל על הרציפות
  $ bb(1)_(E) (x+t_n)=bb(1)_(E)(x) $
  היות $t_n arrow.r 0$ מתקיים
  $ bb(1)_(E)(x+t_n) arrow.r bb(1)_(E)(x) $
  אבל אמרנו שאגף שמאל הוא בידיוק $bb(1)_(E)(x)$ לכל $n$ ולכן $bb(1)_(E)(x)$ קבועה כמעט־תמיד.\
  אם $bb(1)_(E)(x)$ קבועה כמעט־תמיד אז או ש־$bb(1)_(E)(x)=0$ כמעט־תמיד ואז $m(E)=0$ או ש־$bb(1)_(E)(x)=1$ כמעט־תמיד ואז $m(E^c)=0$.
]

#question()
תהיי $K subset RR^2$ קבוצה קומפקטית. נסמן ב־$d: RR^2 times RR^2 arrow.r [0,infinity)$ את המטריקה האוקלידית ונזכיר את הגדרת פונקציית המרחק מקבוצה
$ x mapsto d(x,K) = inf_(a in K) d(x,a) $
וכי מהיותה של $K$ קומפקטית האינפימום הנ"ל מתקבל באיזשוהי $a_0 in K$.\
נגדיר את הקבוצה
$ A colon.eq {x bar d(x,K)=1} $
ונזכיר כי שנאמר כי $x$ היא נקודת לבג של הפונקציה $bb(1)_(A)$ אם
$ lim_( r arrow.r 0) 1/lambda(B_r (x)) integral_(B_r (x)) bb(1)_(A)(y) dif lambda(y) = bb(1)_(A)(x) $

#subquestion()
יהי $x in A$ ונראה כי $x$ איננה נקודת לבג של $bb(1)_(A)$.

#proof[
  מהיות $x in A$ נובע כי $d(x, K)=1$ כלומר יש $a_0 in K$ כך שמתקיים $d(x,a_0)=1$.\
  נסתכל על הכדור הפתוח $B_1 (a_0)$ ותהיי $y in B_1 (a_0)$ ולכן $d(a_0, y)<1$.\
  אבל $a_0 in K$ ולכן
  $ d(y,K)<=d(y, a_0)<1 $
  אבל מכך ש־$d(y,K)<1$ נובע כי $A inter B_1 (a_0)=emptyset$ בהכרח, ולכן עבור כדור קטן דיו $B_r (x)$ הקבוצה $A$ מוגבלת לחלק שמחוץ ל־$B_1 (a_0)$, כלומר
  $ A inter B_r (x) subset.eq B_r (x) without B_1 (a_0) $
  כלומר
  $
    lambda(A inter B_r (x))<=lambda(B_r (x))-lambda(B_r (x) inter B_1 (a_0)) ==> lambda(A inter B_r (x))/lambda(B_r (x))<= 1- lambda(B_r (x) inter B_1 (a_0))/lambda(B_r (x))
  $
  אבל מהיות $d(x, a_0)=1$ נובע כי $x$ נמצאת על השפה של $B_1 (a_0)$.\
  כלומר כאשר $r arrow.r 0$ אנחנו מקבלים שני כדורים – אחד בתוך $B_1 (a_0)$ ואחד מחוץ ל־$B_1 (a_0)$ והשפה של $B_1 (a_0)$ זה בעצם עיגול אז כאשר $r arrow.r 0$ זה מתנהג כמו משיק שעובר בראשית של המעגל השני – כלומר מחלק את המעגל לשניים כלומר הביטוי בצד ימין שואף ל־$1/2$ כאשר $r arrow.r 0$ ובסך־הכל
  $
    lim_(r arrow.r infinity)lambda(A inter B_r (x))/lambda(B_r (x))<= lim_(r arrow.r 0) 1- lambda(B_r (x) inter B_1 (a_0))/lambda(B_r (x)) = 1-1/2 = 1/2 in.not {1,0}
  $
  כלומר $x$ איננה נקודת לבג של $bb(1)_(A)$.
]

#subquestion()
נסיק כי $lambda(A)=0$.

#proof[
  בסעיף הקודם הוכחנו שלכל $x in A$ מתקיים $lim_(r arrow.r infinity)lambda(A inter B_r (x))/lambda(B_r (x))<=1/2$.\
  אם $lambda(A)>0$ אז היה נובע שכמעט לכל $x in A$ היה מתקיים
  $ lim_(r arrow.r infinity) lambda(A inter B_r (x))/lambda(B_r (x))=1 != 1/2 $
  ולכן זו סתירה ו־$lambda(A)=0$.
]

#question()
יהי $X$ מרחב מידה כלשהו ויהי $Y$ מרחב טופולוגי האוסדרוף מנייה שנייה. נניח כי $f:X arrow.r Y$ פונקציה מדידה.\
נזכיר את ההגדרה של הגרף של $f$
$ G_f colon.eq {(x, f(x)) bar x in X} subset X times Y $

#subquestion()
נשתכנע כי קבוצת האלכסון $Delta_Y subset Y times Y$ סגורה בטופולוגיית המכפלה ונראה כי היא ב־$cal(B)_Y times cal(B)_Y$.

#proof[
  תהיינה $x,y in Y$ ומהיות המרחב האוסדרוף מנייה שנייה נובע שקיימות $U_x, U_y subset cal(T)_Y$ זרות המקיימות $x in U_x, y in U_y$ ובהתאם $(x,y) in U_x times U_Y$.\
  כעת, מכך ש־$(x,x) in.not U_X times U_Y$ נובע כי $(x,x) in Delta_Y^c$ ואז בהתאם $U_x times U_Y subset Delta_Y^c$ שהאחרונה היא איחוד של קבוצות פתוחות כי $ Delta_Y^c = union.big.dot_(x != y in Y) U_X times U_y $
  נסיק אז ש־$Delta_Y$ סגורה ובהתאם מהגדרת $cal(B)_Y times cal(B)_Y$ נובע כי $Delta_Y$ מדידה ב־$sigma$ אלגברה של המכפלה.
]

#subquestion()
נסיק כי במצב הזה $G_f subset X times Y$ מדידה.

#proof[
  נעזר ברמז ונגדיר $H : X times Y arrow.r Y times Y$ על־ידי
  $ H(x,y)=(f(x), y) $
  ונראה ש־$G_f = H^(-1)(Delta_Y)$:\
  אם $(x,y) in G_f$ אז $y=f(x)$ ואז $H(x,y)=(f(x), f(x)) in Delta_Y$.\
  אם $H(x,y) in Delta_Y$ אז $(f(x), y)$ הוא על האלכסון כלומר $f(x)=y$ ולכן $(x,y) in G_f$.\
  כעת, $H$ היא פשוט פונקציית ההטלה בכל קורדינאטה: ההעתקה $(x,y) mapsto f(x)$ זו ההרכבה של $f compose pi_X$ ופונקציית ההטלה היא מדידה וכן $f$ מדידה ולכן ההרכבה מדידה וכן $(x,y) mapsto y$ זו פשוט פונקציית ההטלה $pi_Y$ שמדידה.\
  ראינו בהרצאה שמרחב מכפלה מדיד מגיע מצוייד באופן טבעי עם ההטלות והן מדידות.\
  יחד עם הסעיף הקודם נובע ש־$Delta_Y$ מדידה.\
  היות ו־$H$ פונקציה מדידה ו־$Delta_Y$ קבוצה מדידה, המקור של קבוצה מדידה הוא קבוצה מדידה ולכן מכך ש־$G_f = H^(-1)(Delta_Y)$ נובע כי $G_f$ מדידה.
]

#question()
נסמן ב־$s:RR^n times RR^n arrow.r RR^n$ את העתקת הסכום, כלומר את ההעתקה שלוקחת את זוג הוקטורים $(x,y)$ ל־$x+y$.\
יהיו $mu, nu$ מידות בורל סופיות על $RR^n$, נגדיר את הקונבולוציה של $mu$ ו־$nu$ להיות
$ mu * nu colon.eq s_*(mu times nu) $

#subquestion()
נראה כי לכל $E subset.eq RR^n$ מתקיים
$ (mu*nu)(E)=integral_(RR^n) mu(E-x) dif nu(x) $
וכי אם $mu$ רציפה בהחלט ביחס למידת לבג אז כך גם $mu * nu$.

#proof[
  נרשום
  $ s^(-1)(E)= { (y,x) in RR^n times RR^n bar y+x in E} $
  כאשר החלפנו את הסדר בשביל להתאים למידות.\
  ממשפט פוביני נובע כי
  $ (mu times nu)(A) = integral_(RR^n) mu(A_x) dif nu(x) $
  נסתכל על הסיב
  $ A_x colon.eq {y in RR^n bar (y,x) in A} $
  נבחר $A=s^(-1)(E)$ ונקבע $x$, כלומר
  $ (s^(-1)(E))_x = {y in RR^n bar (y,x) in s^(-1)(E)} $
  אבל
  $ (y,x) in s^(-1)(E) <==> s(y,x) in E <==> y+x in E ==> y in E-x $
  אז
  $ (s^(-1)(E))_x = E-x ==> mu((s^(-1)(E))_x) = mu(E-x) $
  ולכן
  $ (mu times nu)(s^(-1)(E)) = integral_(RR^n) mu(E-x)dif nu(x) $
  ולכן קיבלנו בידיוק את הנדרש.\
  עבור החלק השני, נניח כי $mu lt.double lambda$ כאשר $lambda$ מידת לבג אז $mu*nu lt.double lambda$: נראה שאם $lambda(E)=0$ אז $(mu*nu)(E)=0$.\
  אז תהיי $E$ כך ש־$lambda(E)=0$ ראינו שמידת לבג היא אינווריאנטית ביחס להזזה, כלומר לכל $x in RR^n$ מתקיים $ lambda(E-x)=lambda(E)=0 $
  מהיות $mu lt.double lambda$ נובע כי בהכרח מתקיים
  $
    mu(E-x) = 0 ==>_"הקונבולוציה שהוכחנו לעיל" (mu*nu)(E) = integral_(RR^n) mu(E-x) dif nu(x) = integral_(RR^n) 0 dif nu(x) = 0
  $
  אז $(mu*nu)(E)=0$ ולכן $mu*nu lt.double lambda$, כנדרש.

]

#subquestion()
נסיק שלכל $f, g in L^1 (lambda)$ אי־שליליות, המידה $mu_f * mu_g$ רציפה בהחלט ביחס למידת לבג וש־$ dif(mu_f * mu_g)/(dif lambda) = f*g $
כאשר
$ (f*g)(y) = integral_(RR^n) f(x)g(y-x) dif lambda(x) $
כלומר הקונבולוציה של המידות מתלכדת עם הקונבולוציה של פונקציות.

#proof[
  בסעיף הקודם ראינו שאם $mu lt.double lambda$ עבור מידה סופית $nu$ מתקיים $mu*nu lt.double lambda$.\
  בגלל ש־$f in L^1(lambda)$ נובע כי $mu_f lt.double lambda$ ולכן $mu_f * mu_g lt.double lambda$ (כי $mu_f (E) = integral_E f dif lambda$ ואם $lambda(E)=0$ אז ובגלל ש־$f in L^1$ אז $mu_f (E) = integral_E f(x) dif lambda(x) =0$ כי אינטגרל על קבוצה ממידה אפס הוא תמיד אפס ללא קשר לפונקציה) ולכן נגזרת רדון־ניקודים $dif(mu_f*mu_g)/(dif lambda)$ קיימת.\
  תהיי $E$ מדידה בורל, מהסעיף הקודם
  $
    (mu_f * mu_g)(E) = integral_(RR^n) mu_f (E-y) dif mu_g (y) = integral_(RR^n) integral_(E-y) f(x) dif lambda(x) g(y) dif lambda(y)
  $
  כאשר המעבר נובע מהצבת $dif mu_g (y) = g(y) dif lambda(y)$ ו־$mu_f (E-y)$ כאינטגרל של $f$.\
  נשתמש במשפט החלפת משתנה על האינטגרל הפנימי: $z=x+y$ כלומר $x=z-y$ ולכן תחום האינטגרציה שלנו השתנה כי אם $x in E-y$ אז $z in E$ ומהאינווראינטיות להזזות של מידת לבג נקבל
  $ integral_(E-y) f(x) dif lambda(x) = integral_E f(z-y) dif lambda(z) $
  כלומר
  $ (mu_f*mu_g)(E) = integral_(RR^n) integral_E f(z-y) dif lambda(z) g(y) dif lambda(y) $
  היות והפונקציות אי־שליליות ניתן להשתמש במשפט פוביני
  $ (mu_f * mu_g)(E) = integral_E integral_(RR^n) f(z-y) g(y) dif lambda(y) dif lambda(z) $
  אבל האינטגרל הפנימי זו בידיוק הקונבולוציה
  $ integral_(RR^n) f(z-y) g(y) dif lambda(y) = (g*f)(z) = (f*g)(z) $
  כלומר
  $ (mu_f*mu_g) (E) = integral_E (f*g)(z) dif lambda(z) $
  ומיחידות נגזרת רדון־ניקודים נוביע כי
  $ dif(mu_f*mu_g)/(dif lambda) = f*g $
]

#subquestion()
יהי $y in RR^n$ ונמצא מידה סופית $nu$ כך שלכל $mu$ סופית ולכל $E$ מדידה בורל מתקיים $(mu*nu)(E)=mu(E-y)$.

#solution[
  נגדיר $nu=delta_y$מידת דיראק ותהיי $mu$ מידה סופית ו־$E$ מדידה, אז
  $ (mu*nu)(E)=integral mu(E-x) dif nu(x) = integral mu(E-x) dif d_y = mu(E-y) $
]
