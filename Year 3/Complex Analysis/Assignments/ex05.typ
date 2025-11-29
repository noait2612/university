#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהי $G subset.eq CC$ תחום ו־$f in C^1(G,CC)$. נראה ש־$f$ הולומורפית אם ורק אם $partial_(overline(z)) f = 0$.

#proof[ \
  $<==$ נניח כי $f$ הולומורפית ונראה כי $partial_overline(z) f = 0$.\
  $f$ הולומורפית ולכן היא מקיימת את משוואות קושי־רימן
  $ (partial u)/(partial x) = (partial v)/(partial y), wide (partial u)/(partial y) = - (partial v)/(partial x) $
  כאשר $f(z)=u(x,y)+ i v(x,y)$ עבור $u,v : RR^2 arrow.r RR$.\
  נציב באופרטור Wirtinger ונקבל
  $
    partial_overline(z) f = 1/2 (partial_x f + i partial_y f) = 1/2 (((partial u)/(partial x) + i (partial v)/(partial x))+ i((partial u)/(partial y)+ i (partial v)/(partial y))) = 1/2 ( ((partial u)/(partial x) - (partial v)/(partial y)) + i ((partial u)/(partial y) + (partial v)/(partial x))) =_"C.R.E" 0
  $
  $==>$ נניח כי $partial_overline(z) f = 0$ ונראה כי $f$ הולומורפית.\
  אם $partial_overline(z) f = 0$ אז גם החלק המדומה וגם החלק הממשי היינם $0$, כלומר
  $
    partial_overline(z) f = 1/2 ( ((partial u)/(partial x) - (partial v)/(partial y)) + i ((partial u)/(partial y) + (partial v)/(partial x)))
  $
  כלומר
  $
    (partial u)/(partial x) - (partial v)/(partial y) = 0 ==> (partial u)/(partial x) = (partial v)/(partial y) \
    (partial u)/(partial y) + (partial v)/(partial x) ==> (partial u)/(partial y) = -(partial v)/(partial x)
  $
  כלומר $f$ מקיימת את משוואות קושי־רימן ולכן הולומורפית.
]

#question()
תהיינה $f(z)=(z-1)^2$ ו־$gamma$ מסילה המתארת מעגל ברדיוס $1$ סביב הראשית.

#subquestion()
נחשב את $L(f compose gamma)$.

#solution[
  נכתוב פרמטריזציה של $gamma$
  $ gamma(t)=cos(t)+ i sin(t) = e^(i t) $
  עבור $t in [0,2pi]$.\
  בהרצאה הגדרנו אורך של מסילה להיות
  $
    L(f compose gamma) = integral_a^b abs(f'(gamma(t))) abs(gamma'(t)) d t
  $
  כאשר $gamma : [a,b] arrow.r CC$
  ולכן
  $
    L(f compose gamma) = integral_a^b abs(f'(gamma(t))) abs(gamma'(t)) d t = integral_0^(2pi) abs((-2(1-z)) compose (cos(t)+ i sin(t)))abs(i cos(t) - sin(t)) d t \
    = integral_0^(2pi) abs(-2(1-cos(t)-i sin(t))) abs(i cos(t)-sin(t)) d t = 2 integral_0^(2pi) abs(1-cos(t)- i sin(t))abs(i cos(t)-sin(t)) d t \
    = 2integral_0^(2pi) sqrt((1-cos(t)- i sin(t))(1-cos(t)+ i sin(t)))sqrt((i cos(t)-sin(t))(-i cos(t)-sin(t))) d t \
    = 2integral_0^(2pi) sqrt(2-2cos(t)) d t = 2 integral_0^(2pi) sqrt(2(1-cos(t))) d t = 2 integral_0^(2pi) sqrt(2(2sin^2(t/2))) d t = 4 integral_0^(2pi) abs(sin(t/2)) d t
  $
  מהיות $t in [0,2pi]$ אז $t/2 in [0,pi]$ ובקטע זה $sin(t/2)>=0$ ולכן
  $
    2 integral_0^(2pi) 2 abs(sin(t/2)) d t = 4 integral_0^(2pi) sin(t/2) d t = [4 dot.op (-2cos(t/2))]_(t=0)^(t=2pi) = -8cos(pi)+8cos(0)=(-8) dot.op (-1) + 8 dot.op 1 = 16
  $
  נשים לב שיותר קצר לפתור את זה עם הביטוי בצורת אקספוננט:
  $
    L(f compose gamma) = integral_a^b abs(f'(gamma(t))) abs(gamma'(t)) d t = integral_0^(2pi) abs((-2(1-z)) compose e^(i t))abs(i e^(i t)) d t = 2 integral_0^(2pi) abs(1-e^(i t)) d t \
    = 2 integral_0^(2pi) sqrt((1-cos(t))^2+sin^2(t)) d t = 2 integral_0^(2pi) sqrt(1-2cos(t)+cos^2(t)+sin^2(t)) = 2 integral_0^(2pi) sqrt(2-2cos(t)) d t
  $
  המשך החישוב זהה.
]

#subquestion()
נראה שלא משנה באיזו פרמטריזציה של $gamma$ נשתמש עבור החישוב בסעיף א'.

#solution[
  בסעיף א' בחרנו פרמטריזציה של $gamma$ המתקדמת נגד כיוון השעון, כאשר הפרמטריזציה עם כיוון השעון נתונה על־ידי $gamma(t)=e^(-i t)$.\
  במקרה שלנו זה לא משנה בגלל שהערך המוחלט במקרה זה נשאר $1$:
  $
    L(f compose gamma^minus) integral_0^(2pi) abs((-2(1-z)) compose e^(-i t))abs(-i e^(-i t)) d t =2integral_0^(2pi) abs(1-e^(-i t)) d t = 2 integral_0^(2pi) sqrt((1-cos^2(t))^2+(-sin(t))^2) \
    = 2 integral_0^(2pi) sqrt(1-2cos(t)+cos^2(t)+sin^2(t)) = 2 integral_0^(2pi) sqrt(2-2cos(t)) d t
  $
]

#subquestion()
נחשב את השטח של $f({z bar abs(z-1)<1})$.

#solution[
  נסמן $u=1-z$ ולכן $D = {z bar abs(z-1)<1} = {u bar abs(u)<1}$ ו־$f(z)=(1-z)^2 ==> w=u^2$ על דיסק היחידה.\
  כדי לפשט את האינטגרל, בדרך־כלל במשפט החלפת משתנה אנחנו עושים קורדינאטות פולאריות סביב הראשית אך הפעם נעשה קורדינאטות מוזזות ונניח ש־$z=1$ היא הראשית שלנו ולכן $z-1=r e^(i theta)$ וכן $0<=r<1$ (בגלל רדיוס הדיסק כמובן) וכן $r^2 = abs(1-z)^2$  ו־$0<=theta<2pi$.\
  נשים לב ש־$D$ קבוצה יפה מספיק (היא פתוחה ולכן מדידה) אז
  $
    Area(D) = integral.double_D abs(f'(w))^2 d D = integral.double_D 4 abs(z-1)^2 d D =_"משפט החלפת משתנה" integral_0^(2pi)integral_0^1 4r^2 dot.op r d r d theta = 4 integral_0^(2pi) d theta integral_0^1 r^3 d r = 4 integral_0^(2pi) 1/4 d theta = 2pi
  $
]

#question()
יהיו $G subset.eq CC$ תחום ותהיינה $f,g : G arrow.r CC$ פונקציות רציפות ו־$gamma in C^1([a,b],G)$ מסילה.

#subquestion()
נוכיח $ integral_gamma (f+g) d gamma = integral_gamma f d gamma + integral_gamma g d gamma $

#proof[
  $
    integral_gamma (f+g) d gamma = integral_a^b (f+g)(gamma(t))gamma'(t) d t = integral_a^b (f(gamma(t))+g(gamma(t)))gamma'(t) d t = integral_a^b f(gamma(t))gamma'(t)+g(gamma(t))gamma'(t) d t \
    =_((star)) integral_a^b f(gamma(t))gamma'(t) d t + integral_a^b g(gamma(t))gamma'(t) d t = integral_gamma f d gamma + integral_gamma g d gamma
  $
  כאשר האדטיביות שהשתמשנו בה ב־$(star)$ זה אדטיביות האינטגרל מאינפי3.
]

#subquestion()
נוכיח שאם $lambda in CC$ אז $ integral_gamma lambda f d gamma = lambda integral_gamma f d gamma $

#proof[
  $
    integral_gamma lambda f d gamma = integral_a^b (lambda f) (gamma(t))gamma'(t) d t = integral_a^b (lambda f(gamma(t)))gamma'(t) d t = integral_a^b lambda (f(gamma(t))gamma'(t)) d t =_((star)) lambda integral_a^b f(gamma(t))gamma'(t) d t \
    = lambda integral_gamma f d gamma
  $
  כאשר האדטיביות שהשתמשנו בה ב־$(star)$ זה לינאריות האינטגרל מאינפי3.
]

#subquestion()
נוכיח שאם $beta$ היא המסילה שמתקדמת בכיוון ההפוך מ־$gamma$ (כלומר, $beta(t)=gamma(a+b-t)$) אז
$ integral_beta f d beta = - integral_gamma f d gamma $

#proof[
  נשים לב
  $ beta(a) = gamma(a+b-a)=gamma(b), space beta(b)=gamma(a+b-b)=gamma(a) $
  אז
  $ integral_beta f d beta = integral_a^b f(beta(t))beta'(t) d t $
  אבל $beta(t) = gamma(a+b-t)$ ולכן מכלל שרשרת $ beta'(t)=d/(d t) (gamma(a+b-t)) =_(u=a+b \
  (d u)/(d t) = -1) gamma'(u) dot.op (d u)/(d t) = gamma'(a+b-t) dot.op (-1) = -gamma'(t)(a+b-t) $
  ולכן
  $
    integral_beta f d beta = integral_a^b f(beta(t))beta'(t) d t = integral_a^b f(gamma(a+b-t)) dot.op (-gamma'(t)(a+b-t)) d t \
    =_"סעיף ב'" - integral_a^b f(gamma(a+b-t)) dot.op (gamma'(t)(a+b-t)) d t \ =_(u = a + b - t \
    (d u)/(d t) = -1) - integral_b^a f(gamma(u))gamma'(u)(-d u) =_"סעיף ב'" integral_b^a f(gamma(u))gamma'(u) d u \
    =_"היפוך תחום אינטגרציה" - integral_a^b f(gamma(u))gamma'(u) d u = - integral_gamma f d gamma
  $
]

#question()
נחשב את $integral_gamma f d gamma$ כאשר $f(z)=log(abs(z))+ i Arg(z)$ ו־$gamma$ מציירת מעגל ברדיוס $2$ סביב הראשית, נגד כיוון השעון וכאשר $Arg$ הוא הענף הראשי של הארגומנט.\
מהיות $Arg$ לא רציפה בקרן $(-infinity,0]$ נגדיר בשביל תרגיל זה $forall x <0, space Arg(x)=pi$.

#solution[
  $gamma$ מסילה ברדיוס $2$ סביב הראשית נגד כיוון השעון ולכן $gamma(t)=2e^(i t)$ עבור $t in [0,2pi]$ ולכן כמובן $gamma'(t) =2 i e^(i t)$.\
  מתקיים
  $ f(gamma(t)) = ln(abs(gamma(t)))+ i Arg(gamma(t)) = ln(abs(2e^(i t))) + i Arg(2 e^(i t))= ln(2) + i Arg(2e^(i t)) $
  כמו־כן, מהגדרת $Arg(z)$ להיות הזווית $theta$ כך שמתקיים $z=abs(z)e^(i theta)$ עבור $theta in (-pi, pi]$, נצטרך להתחשב בנקודות אי־רציפות שקורות כאשר $t in (pi, 2pi]$: בקטע זה אנחנו עוברים מהציר השלילי הממשי תחת חצי המישור התחתון אל הציר הממשי החיובי.\
  אם נבחר $t=pi$ אנחנו נצא מהתחום המוגדר וכדי לחזור לתחום של הארגומנט הראשי עלינו להחסיר $2pi$ (כי זה שקול לסיבוב מלא), כלומר
  $ Arg(2e^(i t))= mycases(t, t in [0, pi], t-2pi, (pi, 2pi]) $
  כי אנחנו צריכים להישאר בתחום $(-pi, pi]$.\
  אז האינטגרל שעלינו לחשב היינו
  $
    integral_gamma f dif gamma = integral_0^(2pi) f(gamma(t))gamma'(t) dif t = integral_0^(2pi) (ln(2)+ i Arg(2e^(i t)))2i e^(i t) dif t =_"אדטיביות"
    integral_0^(2pi) ln(2)2i e^(i t) dif t - integral_0^(2pi) 2e^(i t) Arg(2e^(i t)) dif t \
    = 2i ln(2) integral_0^(2pi) e^(i t) dif t - 2 integral_0^(2pi)e^(i t) Arg(2e^(i t)) dif t \
    =_"לינארית האינטגרל" 2i ln(2) integral_0^(2pi) e^(i t) dif t -2(integral_0^pi e^(i t)Arg(2e^(i t)) dif t + integral_pi^(2pi) e^(i t)Arg(2e^(i t)) dif t) \
    = 2i ln(2) integral_0^(2pi) e^(i t) dif t -2(integral_0^pi e^(i t)t dif t + integral_pi^(2pi) e^(i t)(t-2pi) dif t) \
    = [2 ln(2) e^(i t)]_(t=0)^(t=2pi) - [2(1-i t)e^(i t)]_(t=0)^(t=pi) -[2e^(i k)(1-i k)]_(k=-pi)^(k=0) = 0-2((-2 + i p)+(2 + i p)) = -4 i pi
  $
]

#question()
נמצא בשיטה שראינו בהרצאה צמודה הרמונית לפונקציה $f(x,y)=x/(x^2+y^2)$ בדיסק $B_1 (0)$.

#solution[
  ראשית נציין שהסיבה שאנחנו צריכים את הדיסק זה בשביל שהמכנה לא יתתאפס.\
  ראינו שפונקציה היא הרמונית אם היא גזירה פעמיים והלפסליאן שלה הוא $0$.\
  נכתוב $z=x + i y$ ולכן מהנתון נקבל
  $ 1/z = 1/(x + i y) = (x-i y)/(x^2+y^2) $
  וכן
  $ u(x,y) = re(1/z) = x/(x^2+y^2) wide v(x,Y) = im(1/z)=-y/(x^2+y^2) $
  נחשב נגזרות שניות של החלק הממשי
  $
    u_x = (-x^2+y^2)/(x^2+y^2)^2 wide u_y = -(2x y)/(x^2+y^2)^2 \
    u_(x x) = (2x(x^2-3y^2))/(x^2+y^2)^3 wide u_(y y) = (2x(-x^2+3y^2))/(x^2+y^2)^3
  $
  ואכן
  $ Delta u =u_(x x) + u_(y y) = 0 $
  ובאותו אופן
  $
    v_x = (2y x)/(x^2+y^2)^2 wide v_y -(x^2-y^2)/(x^2+y^2)^2 \
    v_(x x) = (2y(y^2-3x^2))/(x^2+y^2)^3 wide v_(y y) = (2y(3x^2-y^2))/(x^2+y^2)^3
  $
  ואכן
  $ Delta v = v_(x x) + v_(y y) = 0 $
  ולכן $u, v in Harm(G)$.\
  כאשר הנגזרות השניות של החלק הממשי והמדומה קיימות כי זו מנה של פונקציות גזירות (מנת פולינומים).\
  נשאר להראות ש־$f = u + i v in Hol(G)$ ולכן נקבל מטענה שראינו בהרצאה שהם צמודות הרמונית.\
  מספיק שנראה שמשוואות קושי־רימן מתקיימות:\
  ואכן מהחישובים לעיל
  $ u_x = v_y = (-x^2+y^2)/(x^2+y^2)^2 wide u_y = -(2x y)/(x^2+y^2)^2 = - ((2y x)/(x^2+y^2)^2) = - v_x $
  אז משוואות קושי־רימן מתקיימות ואלו פונקציות הרמוניות ולכן $f in Hol(G)$ ומתקיים $v=accent(u, tilde)$ צמודה הרמונית.
]
