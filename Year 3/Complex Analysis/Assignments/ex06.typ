#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 06 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נוכיח את הגרסה הבאה של משפט קושי למשולש ללא שימוש במה שראינו בהרצאה לגבי סינגולריות אינטגרבילית: יהי $T$ משולש סגור ו־$G$ סביבה שלו. יהיו $z_0 in T^(circle.small)$ (באופן פורמלי, אם ${x_i}_(i=1)^3$ הם קודקודי המשולש, אז קיימים $0<alpha_i <1$ עבור $i in{1,2,3}$ כך ש־$z_0 = sum_(i=1)^3 alpha_i x_i$)\
ו־$f : G arrow.r CC$ הולומורפית על $G without {z_0}$. \
אם בנוסף $f$ חסומה בסביבה של $z_0$ אזי $integral_(partial T) f dif gamma=0$.

#proof[
  מהיות $f$ הולומורפית וחסומה בסביבה של $z_0$ יש $r_0>0$ ו־$M>0$ כך שלכל $0 < abs(z-z_0) < r_0 ==> abs(f(z))<=M$.\
  $z_0 in T^circle.small$  שפתוחה (כי $T, partial T$ סגורים).\
  לא הצלחתי לפרמל את התשובה שרציתי לכתוב כמו שצריך, אז אני כותבת רק את הרעיון הכללי שלי: מהפתיחות נוכל לקחת $delta' > 0$ ודיסק $D(delta', z_0) subset.eq T^(circle.small)$ ובפרט נוכל להסתכל על דיסק סגור $overline(D(z_0, delta'/2)) subset.eq T^(circle.small)$ וניקח משולש שמוכל בו ושמכיל את $z_0$ ונסתכל על הקירוב
  $ phi_n (z) colon.eq z_0 + 1/n (z-z_0) $
  ונסתכל על התמונה של הפונקציה על המשולש שבחרנו, כלומר כיווצנו אותו סביב הנקודה.\
  נוכל להגדיר אז את ההפרש בין המשולש $T$ הנתון למשולש הסגור שלנו, והוא זר פוליגונלית ו־$z_0$ לא נמצא בו, אבל $f$ הולומורפית בו ולכן ממשפט קושי למשולשים, על הפרש המשולשים הזה האינטגרל הוא $0$.\
  לבסוף נשתמש מהמשפט מההרצאה שחוסם את האינטגרל על־ידי מקסימום/סופרמום ולכן אנחנו תלויים רק באורך של השפה של המשולש הפנימי שלנו, אבל אנחנו הולכים ומקטינים אותו ובשאיפה לאינסוף הוא מתאפס (ומצד שני, המשולש לא מנוון ולכן אי־שלילי, אז בסך־הכל יצא שוב שהאינטגרל הוא אפס).
]
#question()
תהיי $Gamma_R$ מסילה המתקבלת משרשור (חיבור) הקו הישר המחבר בין הנקודות $R$ ו־$-R$ עם חצי מעגל ברדיוס $R$ ממורכב סביב הראשית, העובר בין הנקודות $R$ ו־$-R$.\
נמצא באיזה חצי מישור צריך לעבור חצי המעגל כדי שיתקיים
$ integral_RR cos(a x)/(x^2+1) dif x = lim_(R arrow.r infinity) integral_(Gamma_R) e^(a i z)/(z^2+1) dif gamma $

#solution[
  יהי $a in RR$ ונגדיר $ f(z) = e^(i a z)/(z^2+1) $
  ניקח $Gamma_R = [-R, R] union gamma_R$ כאשר $gamma_R$ זו המסילה של חצי המעגל ברדיוס $R$ הממורכז סביב הראשית ועובר בין הנקודות $R,-R$.\
  אם $a>0$ נבחר את חצי המעגל העליון ואם $a<0$ נבחר את החצי מעגל התחתון.\
  מלינאריות האינטגרל נקבל
  $ integral_(Gamma_R) f(z) dif z = integral_(-R)^R f(x) dif x + integral_(gamma_R) f(z) dif z $
  נשים לב שמתקיים עבור $a in RR$
  $ abs(f(x))=abs(e^(i a x))/(x^2+1) = 1/(x^2+1) $
  אבל אנחנו יודעים
  $ integral_(-infinity)^infinity 1/(x^2+1) dif x = pi $
  כלומר שהאינטגרל הזה מתכנס בהחלט, אז
  $ lim_(R arrow.r infinity) integral_(-R)^R f(x) dif x = integral_(-infinity)^infinity f(x) dif x $
  נכתוב פרמטריזציה לחצי המעגל על־ידי $z = R e^(i theta)$ עבור $theta in [0,pi]$, אז
  $
    abs(integral_(gamma_R) f(z) dif x)<= integral_0^pi abs(e^(i a R e^(i theta)))/abs(R^2 e^(2 i theta) +1) R dif theta = integral_0^pi e^(-a R sin(theta))/abs(R^2 e^(2 i theta)+1) R dif theta
  $
  נשים לב שמאי־שיוויון המשולש ההפוך, עבור $R>1$
  $ abs(R^2 e^(2 i theta)+1)>=abs(abs(R^2e^(2 i theta))-1)=abs(R^2-1)=R^2-1 $
  אז
  $
    integral_0^pi e^(-a R sin(theta))/abs(R^2 e^(2 i theta)+1) R dif theta <= integral_0^pi (R e^(-a R sin(theta)))/(R^2-1) dif theta = R/(R^2-1) integral_0^pi e^(-a R sin(theta)) dif theta
  $
  נזכר כי $sin(theta)$ היא סימטרית עבור $theta = pi/2$, כלומר $sin(theta)=sin(pi-theta)$ ולכן
  $ integral_0^pi e^(-a R sin(theta)) dif theta = 2 integral_0^(pi/2) e^(-a R sin(theta)) dif theta $
  אבל בקטע זה גם מתקיים $sin(theta)>=(2theta)/pi$ ולכן
  $
    2 integral_0^(pi/2) e^(-a R sin(theta)) dif theta <= 2 integral_0^(pi/2) e^(-a R (2theta)/pi) dif theta =_(u = (2a R theta)/pi, dif pi = pi/(2a R)) pi/(2 a R) integral_0^(a R) e^(-u) d u = [(-pi e^(-u))/(2 a R)]_(u=0)^(u=a R) = pi/(2 a R)(1-e^(-a R))<=pi/(2a R)
  $
  כלומר
  $ integral_0^pi e^(-a R sin(theta)) dif theta <= 2 dot.op pi/(2a R) = pi/(a R) $
  אז בסך־הכל קיבלנו
  $
    abs(integral_(gamma_R) f(z) dif z) <= R/(R^2-1) dot.op pi/(a R) = pi/(a(R^2-1)) stretch(arrow.r)_(r arrow.r infinity) 0
  $
  ולבסוף מאריתמטיקה של גבולות
  $ lim_(R arrow.r infinity) integral_(Gamma_R) f(z) dif z = integral_(-infinity)^infinity f(x) dif x $
  ואם ניקח את החלק הממשי נקבל בידיוק
  $ integral_RR cos(a x)/(x^2+1) dif x = lim_(R arrow.r infinity) integral_(Gamma_R) e^(a i z)/(z^2+1) dif gamma $
  כלומר, אם $a>0$ לוקחים את החצי מעגל העליון ואם $a<0$ לוקחים את חצי המעגל התחתון (ומחשבים עם $abs(a)$ את אותו תהליך לעיל).
]

#question()
#subquestion()
נמצא ענף של הלוגריתם בתחום $W = CC without {r e^(-(pi i)/2 bar r >=0)}$ ונוכיח שהוא אכן ענף של הלגוריתם.

#solution[
  נגדיר את הפונקציה $L: CC without W arrow.r (-pi/2, (3pi)/2)$ על־ידי
  $ L(z) = Arg(z dot.op e^((-pi i)/2))+pi/2 $
  ונוכיח שהיא ענף של הארגומנט: נבחין כי היא סיבוב על הענף הראשי של הארגומנט ולכן רציפה תחת ההזזה בכל תחומה.\
  אם $z in CC without i[0,infinity)$ אז
  $
    L(z) = Arg(z dot.op e^((-pi i)/2)) + pi/2 = Arg(z) - cancel(pi/2) + 2pi k + cancel(pi/2) in {Arg(z) + 2pi k bar k in ZZ}
  $
  נגדיר כעת $ell : W arrow.r CC$ על־ידי
  $ ell(z) = log abs(z) + L(z) i $
  ונראה שזה ענף של הלגוריתם בתחום $W$: לכל $z in W$ מתקיים לפי מה שמצאנו
  $ exp(ell(z)) = exp(log abs(z)) dot.op exp(i L(z)) = abs(z) dot.op e^(i Arg(z)) = z $
  כמו־כן, $ell$ רציפה ב־$W$ כי $L$ רציפה ב־$W$ ו־$ell$ היא הרכבת פונקציה רציפה ב־$CC$ ו־$L$ ולכן $ell$ ענף של הלגוריתם ב־$W$.\
  כלומר הענף של הלוגריתם שלנו כפי שכתבנו בתרגול הוא
  $
    log(r e^(i theta))=mycases(log(r) + i(theta+2pi(k+1)), theta in (-pi, -pi/2), log(r) + i(theta + 2pi k), theta in (-pi/2, pi])
  $
]

#subquestion()
נכתוב פרמטריזציה ונצייר את כיוון העקומה $Gamma_(epsilon, R)$ הנוצרת מסכימת העקומות הבאות:
+ מעגל ממורכז סביב הראשית ברדיוס $R$ עם פתח בזווית $2 epsilon$ סביב הנקודה $R e^(-(pi i)/2)$
+ מעגל ממורכב סביב הראשית ברדיוס $1/R$ עם פתח בזווית $2epsilon$ סביב הנקודה $1/R e^(-(pi i)/2)$
+ ישר המחבר בין הנקודות $R e^(-(pi i)/2 - epsilon i)$ ו־$1/R e^(-(pi i)/2-epsilon i)$
+ ישר המחבר בין הנקודות $R e^(-(pi i)/2 + epsilon i)$ ו־$1/R e^(-(pi i)/2 +epsilon i)$

#solution[
  נגדיר את העקומות הבאות
  $
    mycases(
      gamma_1 (t) = exp((-pi i)/2 + i epsilon)t, t in [1/R, R],
      gamma_2 (t) = R exp(i t), t in [-pi/2 + epsilon, (3pi)/2-epsilon],
      gamma_3 (t) = exp((-pi i)/2 - i epsilon)t, t in [1/R, R],
      gamma_4 (t) = 1/R exp(i t), t in [-pi/2 + epsilon, (3pi)/2-epsilon ]
    )
  $
  ולבסוף נגדיר
  $ Gamma_(epsilon, R) = gamma_1 + gamma_2 - gamma_3 - gamma_4 $
  #figure(
    image("../../../src/images/complex analysis ex06 question 3b.jpg", width: 60%, fit: "contain"),
    caption: "כיוון העקומה הנוצרת מסכימת העקומות",
  )

]

#subquestion()
נוכיח שקיים $k in ZZ$ שעבורו מתקיים
$
  lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(Gamma_(epsilon, R)) z^(1/pi)/(1-z^2) dif gamma = -i e^(-i/2)e^(2i k) (1-e^(2i)) integral_0^infinity x^(1/pi)/(1+x^2) dif x
$
כאשר פונקציה החזקה מושרית מהענף של הלוגריתם מסעיף א'.

#solution[
  האינטגרל הממשי באגף ימין מתכנס בהחלט ולכן
  $ integral_0^infinity x^(1/pi)/(1+x^2) dif x = lim_(R arrow.r infinity) integral_(R^(-1))^R x^(1/pi)/(1+x^2) dif x $
  עלינו להראת שהאינטגרל על המעגל החיצוני שואף ל־$0$:
  $
    lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) abs(integral_(gamma_1) z^(1/pi)/(1-z^2) dif z) = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) abs(integral_(gamma_1) e^(1/pi log(z))/(1+z^2) dif z) = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) abs(integral_epsilon^(2pi - epsilon) e^(1/pi log(R e^(i t - (pi i)/2)))/(1-R^2e^(2i t- i pi)) dot.op i R e^(i t - (i pi)/2)) dif t \
    <=_(triangle) lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_epsilon^(2pi - epsilon) abs(e^(1/pi log(R e^(i t - (pi i)/2)))/(1-R^2e^(2i t- i pi)) dot.op i R e^(i t - (i pi)/2)) dif t<=_(R>1) lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_epsilon^(2pi - epsilon) e^(1/pi log(R))/(R^2-1) R d t = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) (2pi-2epsilon) R^(1+1/pi)/(R^2-1) = 0
  $
  שכן
  $ abs(i R e^(i t - (pi i)/2))=R $
  וכן מאי־שיוויון המשולש ההפוך
  $ 1-R^2 e^(2 i t - pi i) >= abs(abs(1)-abs(R^2e^(2i t - i pi))) = abs(1-R^2) $
  נעבור לאינטגרל על המעגל הפנימי: אותו חישוב רק שבמקום $R$ יש לנו $1/R$ ולכן
  $
    lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) abs(integral_(gamma_3) e^(1/pi log(z))/(1-z^2) dif z) = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) abs(integral_epsilon^(2pi - epsilon) e^(1/pi log(1/R e^(- i t - (pi i)/2)))/(1-R^-2 e^(-2 i t - i pi)) dot.op i 1/R e^(-i t - (i pi)/2) dif t) \
    <=_(triangle) lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_epsilon^(2pi - epsilon) abs(e^(1/pi log(1/R e^(- i t - (pi i)/2)))/(1-R^-2 e^(-2 i t - i pi)) dot.op i 1/R e^(-i t - (i pi)/2)) dif t <= lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_epsilon^(2pi - epsilon) e^(1/pi log(1/R))/(1-R^2) dif t = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) (2pi-2epsilon) R^(-1-1/pi)/(1-R^-2) = 0
  $
  נשאר לחשב את האינטגרלים על הישרים $gamma_2, gamma_4$.\
  על המסילה $gamma_2$ מתקיים $log(r e^(i theta))=log(r)+(theta+2pi(k+1))i$, אז
  $
    lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(gamma_2) e^(1/pi log(z))/(1-z^2) dif z = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(-R)^(-1/R) e^(1/pi log(-t e^(-(pi i)/2 - epsilon i)))/(1-t^2e^(-pi i - 2epsilon i)) dot.op e^((-pi i)/2-epsilon i) =_("רציפות" epsilon) = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(-R)^(-1/R) e^(1/pi (log(-t)+(-pi/2+2pi(k+1)i)))/(1-t^2e^(-pi i)) dot.op e^(-(pi i)/2) dif t \
    = lim_(R arrow.r infinity) (t^(1/pi)+e^(1/pi (-pi/2+2pi(k+1)i)))/(1+t^2) dot.op (-i) dif = - lim_(R arrow.r infinity) (-i dot.op e^(1/pi (-pi/2+2pi(k+1))i)) integral_(-R)^(-1/R) t^(1/pi)/(1+t^2) dif t = i e^(-i/2+2k i+2i) integral_(-R)^(-1/R) t^(1/pi)/(1+t^2) dif t \
    stretch(arrow.r)_(R arrow.r infinity) i e^(-i/2+2k i+2i) integral_0^infinity t^(1/pi)/(1+t^2) dif t
  $
  באופן דומה, על $gamma_4$ מתקיים $log(r e^(i theta))=log(r))+(theta+2pi k)i$:
  $
    lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(gamma_2) e^(1/pi log(z))/(1-z^2) dif z = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(1/R)^R e^(1/pi log(t e^(-(pi i)/2 + epsilon i)))/(1-t^2e^(-pi i + 2epsilon i)) dot.op e^(-(pi i)/2 + epsilon i) dif t = lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(1/R)^R e^(1/pi (log(abs(-t)+(-pi/2-epsilon + 2pi k)i)))/(1-t^2e^(-pi i + epsilon i)) dot.op e^(-(pi i)/2 + epsilon i) dif t \
    =_("רציפות" epsilon) lim_(R arrow.r infinity) integral_(1/R)^R e^(1/pi (log(abs(-t)) + (-pi/2+2pi k)i))/(1-t^2e^(-pi i)) dot.op e^(-(pi i)/2) dif t = lim_(R arrow.r infinity) (-i e^((-pi/2+2pi k)i)/pi) integral_(1/R)^R t^(1/pi)/(1+t^2) dif t \
    stretch(arrow.r)_(R arrow.r infinity) -i e^(-i/2+2k i) integral_0^infinity t^(1/pi)/(1+t^2) dif t
  $
  ובסך־הכל
  $
    lim_(R arrow.r infinity) lim_(epsilon arrow.r 0) integral_(Gamma_(epsilon, R)) z^(1/pi)/(1-z^2) dif z = 0 +0 + i e^(-i/2+2k i+2i) integral_0^infinity t^(1/pi)/(1+t^2) dif t - i e^(-i/2+2k i) integral_0^infinity t^(1/pi)/(1+t^2) dif t
  $
]
