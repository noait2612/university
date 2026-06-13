#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 10 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי מערכת שטורם ליוביל רגולרית
$
  (star) space cases(
    dif/(dif t)(p(t) dif/(dif t) u(t))+(q(t)+lambda rho(t))u(t) = 0,
    u(a)=u(b)=0
  )
$
כאשר $p, rho >0$. נסמן ב־$lambda_n$ את הערך העצמי ה־$n$־י של $(star)$, נשתמש במשפט מהתרגול כדי להראות
$ lambda_n = (pi^2 n^2)/T^2 + O(1) $
כאשר
$ T = integral_a^b sqrt(rho(t)/p(t)) dif t $

#proof[
  נגדיר $x(t) = integral_a^t sqrt(rho(s)/p(s) dif s)$ ולכן הקטע $[a,b]$ יועבר לקטע $[0,T]$.\
  מהחלפת משתנה נקבל
  $ cases(w^prime.double (x) + tilde(q)(x)w(x) = lambda w(x), w(0)=w(T)=0) $
  ממשפט שהוכח בתרגול עבור משוואות בצורה זו ידוע כי האסימפטוטיקה של הערכים העצמיים מושפעת אסימפטוטית רק מאורך הקטע. לכן, הערך העצמי ה־$n$ מקיים
  $ lambda_n = (pi^2 n^2)/T^2 + O(1) $
  כנדרש.
]

#question()
תהיינה $f,g : RR^n arrow RR$ פונקציות רציפות כך שהתומך של אחת מהן הוא קומפקטי. נגדיר $f * g : RR^n arrow RR$ על־ידי
$ f*g = integral_(RR^n) f(y) g(x-y) dif y $

#subquestion()
נוכיח כי $f*g=g*f$.

#proof[
  נבצע החלפת משתנה $z=x-y$ ולכן $y=x-z$ ודיפרנציאל הנפח $dif y$ מוחלף ב־$(-1)^n dif z$ אבל האינטגרציה היא על כל $RR^n$ ולכן החלפת גבולות האינטגרציה מבטלת את סימן המינוס ולכן $f*g=g*f$.
]

#subquestion()
נניח כי $h$ פונקציה נוספת בעלת תומך קומפקטי. נוכיח כי
$ f*(g*h) = (f*g)*h $

#proof[
  מתקיים
  $
    (f*(g*h))(x) = integral_(RR^n) f(y)(g*h)(x-y) dif y = integral_(RR^n) f(y) (integral_(RR^n) g(z)h(x-y-z) dif z) dif y
  $
  היות שהפונקציות רציפות ובעלות תומך קומפקטי ניתן להשתמש במשפט פוביני ולהחליף סדר אינטגרציה, נגדיר $w=y+z$ ואז $z=w-y$ ו־$dif z = dif w$, אז
  $
    integral_(RR^n) integral_(RR^n) f(y)g(w-y)h(x-w)dif w dif y = integral_(RR^n) (integral_(RR^n) f(y)g(w-y) dif y)h(x-w) dif w
  $
  האינטגרל הפנימי הוא בידיוק $(f*g)(w)$ ולכן נקבל $(f*g)*h$, כנדרש.
]

#subquestion()
נניח כי שתי הפונקציות בעלות תומכיים קומפקטיים וכי $g in C^1 (RR^n)$, נוכיח
$ partial_(x_i) (f*g) = f*partial_(x_i) g $

#proof[
  נגזור את פונקציית הקונבולוציה לפי $x_i$
  $ partial_(x_i) (f*g)(x) = partial/(partial x_i) integral_(RR^n) f(y)g(x-y) dif y $
  מהיות $g$ גזירה ברציפות ו־$f$ בעלת תומך קומפקטי אפשר להכניס את הנגזרת לתוך האינטגרל מכלל ליבנייץ (או ממשפט ההתכנסות הנשלטת כי הכל מדיד) ונקבל
  $ partial_(x_i) (f*g)(x) = integral_(RR^n) f(y) partial/(partial x_i) g(x-y) dif y = (f*partial_(x_i) g)(x) $
]

#subquestion()
נראה כי אם התומכים של שתי הפונקציות $f,g$ קומפקטיים אז $f*g$ בעלת תומך קומפקטי.

#proof[
  נשים לב ש־$(f*g)(x)$ יוכל להיות שונה מאפס רק אם קיים $y$ במרחב כך ש־$g(x-y)!=0$ וגם $f(y)!=0$, כלומר $y in supp(f)$ ו־$x-y in supp(g)$.\
  מכאן נובע כי $x = y+(x-y)$ והיא חייבת להיות איבר ב־$supp(f)+supp(g)$\
  סכום של שתי קבוצות קומפקטיות ב־$RR^n$ הוא בהכרח קבוצה קומפקטית. מכאן שהתומך של $f∗g$ (שהוא הסגור של קבוצת הנקודות הללו) מוכל בקבוצה קומפקטית ולכן הוא קומפקטי בעצמו.
]

#question()
נגדיר $v:RR_(>0) arrow RR$ גזירה פעמיים ונגדיר $u : RR^d without {0} arrow RR$ על־ידי $u(x)=v(norm(x))$.

#subquestion()
נוכיח כי לכל $x!=0$ מתקיים
$ Delta u(x) = v^prime.double (norm(x))+(d-1)/norm(x) v^prime (norm(x)) $
ונסיק כי $u$ הרמונית אם ורק אם לכל $r>0$ מתקיים
$ v^prime (r)+(d-1)/r v^prime (r) =0 $

#proof[
  נסמן $r=norm(x)=sqrt(sum_(i=1)^d x_i^2)$.\
  הנגזרת של $r$ לפי $x_i$ היא $partial_(x_i) r = x_i / r$.\
  מכלל השרשרת, $partial_(x_i) u = v^prime (r) x_i/r$ ונחשב את הנגזרת השנייה לפי כלל המכפלה וכלל המנה
  $
    partial_(x_i)^2 u = partial_(x_i)(v^prime (r) x_i/r) = v^prime.double (r) (x_i/r)^2 + v^prime (r) ((r-x_i dot.op x_i/r)/r^2) = v^prime.double (r) x_i^2/r^2 + v^prime (r) (1/r-x_i^2/r^3)
  $
  ולכן
  $
    Delta u(x) = sum_(i=1)^d partial_(x_i)^2 u = v^prime.double (r) (sum_(i=1)^d x_i^2) / r^2 + v^prime (r) (d/r - (sum_(i=1)^d x_i^2)/r^3) =_(sum_(i=1)^d x_i^2 = r^2) v^prime.double (r) + v^prime (r)(d/r -1/r) = v^prime.double (norm(x)) + (d-1)/norm(x) v^prime (norm(x))
  $
  $u$ הרמונית אם ורק אם $Delta u = 0$ ולכן $u$ הרמונית לכל $x!=0$ אם ורק אם מתקיים $v^prime (r) + (d-1)/r v^prime (r) =0$ לכל $r>0$.
]

#subquestion()
נניח כי $u$ הרמונית ונמצא את הצורה הכללית של $u$.

#proof[
  כלומר עלינו לפתור את המשוואה הדיפרנציאלית שלכל $r>0$ מקיימת $v^prime (r)+(d-1)/r v^prime (r) = 0$.\
  נציב משתנה חדש $w(r)=v^prime (r)$ והמשוואה הופכת למשוואה מסדר ראשון $w^prime = -(d-1)/r w$ וזו משוואה פרידה שהפיתרון שלה הוא $ln abs(w) = -(d-1) ln r + C$ ועל־ידי הוצאת אקספוננט הפיתרון עבור $v^prime (r)$ הוא מהצורה $v^prime (r) = C_1/r^(d-1)$.\
  נשים לב שעבור $d=2$ הפתרון הכללי הוא פונקציה לוגריתמית $v(r)=C_1 ln(r) + C_2$.\
  עבור $d>=3$ הפיתרון הכללי הוא פונקציית חזקה $v(r)=C_1 r^(2-d) + C_2$ וזה אכן פותר את המשוואה.
]

#question()
תהיי $Omega subset.eq RR^d$ פתוחה ותהיי $u:Omega arrow RR$ חלוקה והרמונית.

#subquestion()
נוכיח כי לכל $i in [d]$ הפונקציה $partial_(x_i) u$ הרמונית גם כן.

#proof[
  $u$ הרמונית ולכן $Delta u = sum_(i=1)^d partial_(x_i)^2 u = 0$.\
  מהגדרת הלפלסיאן, $Delta (partial_(x_i) u) = sum_(j=1)^d partial_(x_j)^2 (partial_(x_i u))$, אבל $u$ חלקה ולכן לפי משפט קלרו ניתן להחליף נגזרות חלקיות ולכן
  $
    sum_(j=1)^d partial_(x_j)^2 (partial_(x_i) u) = partial_(x_i) (sum_(j=1)^d partial_(x_j)^2 u) = partial_(x_i) (Delta u) = partial_(x_i) (0) = 0
  $
  אז גם $partial_(x_i) u$ הרמונית.
]

#subquestion()
נוכיח כי $ Delta(u^2) = 2 norm(gradient u)^2 $

#proof[
  מתקיים
  $
    partial_(x_i) (u^2) = 2 u partial_(x_i) u \
    partial_(x_i)^2 (u^2) = partial_(x_i)(2 u partial_(x_i) u) = 2(partial_(x_i) u)(partial_(x_i) u) + 2 u partial_(x_i)^2 u = 2(partial_(x_i) u)^2 + 2u partial_(x_i)^2 u
  $
  ולכן
  $
    Delta (u^2) = sum_(i=1)^d (2(partial_(x_i) u)^2 + 2u partial_(x_i)^2 u) = 2 sum_(i=1)^d (partial_(x_i) u)^2 + 2u sum_(i=1)^d partial_(x_i)^2 u =_"def" 2 norm(gradient u)^2 + 2u Delta u =_(Delta u = 0) 2 norm(gradient u)^2
  $
]

#subquestion()
נוכיח כי לכל $n in NN$ מתקיים
$ Delta^n u^2 >= 0 $

#proof[
  באינדוקציה על $n$, מקרה הבסיס הוא השאלה הקודמת שכמובן שאי־שלילית כי נורמה היא אי־שלילית.\
  נניח שהטענה נכונה עבור $n-1$, כלומר $Delta^(n-1) w^2 >=0$ לכל פונקציה הרמונית $w$, אז
  $
    Delta^n (u^2) = Delta^(n-1)(Delta(u^2))=Delta^(n-1)(2 norm(gradient u)^2) = 2 Delta^(n-1) (sum_(i=1)^d (partial_(x_i) u)^2) =_"לינאריות" 2 sum_(i=1)^d Delta^(n-1)((partial_(x_i) u)^2)
  $
  אבל בסעיף הראשון הוכחנו שכל נגזרת $partial_(x_i) u$ כאשר $u$ הרמונית היא הרמונית בעצמה ולכן לפי הנחת האינדוקציה על פונקציות הרמוניות מהצורה $w=partial_(x_i) u$ אם נפעיל את האופרטור $Delta^(n-1)$ על הריבוע שלהן נקבל תוצאה אי־שלילית לכל איבר בסכום וסכום של אי־שליליים הוא בהכרח אי־שלילי ולכן $Delta^n (u^2) >=0$, כנדרש.
]
