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
    L(f compose gamma) = integral_a^b abs(f'(gamma(t))) abs(dot(gamma)(t)) d t
  $
  כאשר $gamma : [a,b] arrow.r CC$
  ולכן
  $
    L(f compose gamma) = integral_a^b abs(f'(gamma(t))) abs(dot(gamma)(t)) d t = integral_0^(2pi) abs((-2(1-z)) compose (cos(t)+ i sin(t)))abs(i cos(t) - sin(t)) d t \
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
    L(f compose gamma) = integral_a^b abs(f'(gamma(t))) abs(dot(gamma)(t)) d t = integral_0^(2pi) abs((-2(1-z)) compose e^(i t))abs(i e^(i t)) d t = 2 integral_0^(2pi) abs(1-e^(i t)) d t \
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
