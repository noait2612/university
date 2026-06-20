#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 11 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נגדיר $Phi : RR^d without {0} arrow RR$ על־ידי
$ Phi(x)=frac(1, 2pi) ln(norm(x)) $
נראה כי בהינתן $f in C_C^2 (RR)$ הפונקציה
$ u(x)=frac(1, 2pi) integral_(RR^2) Phi(y)f(x-y)dif y $
היא פיתרון למשוואה $Delta u = f$.

#proof[
  כמו בתרגול, נגדיר
  $ u(x)=frac(1, 2pi) integral_(RR^2) Phi(y)f(x-y) dif y $
  מכך ש־$f in C_C^2 (RR^2)$ ובעלת תומך קומפקטי אפשר להחליף סדר אינטגרציה וגזירה ולכן $u$ גזירה פעמיים ומקיימת
  $ Delta u(x)=integral_(RR^2) Phi(y) Delta_x f(x-y) dif y $
  נקבע $x in RR^2$ יתר על־כן, מכך של־$f$ יש תומך קומפקטי קיים $R>0$ כך שהאינטגרציה שלנו היא רק בכדור $B_R (0)$ ולכן
  $ Delta u(x)=integral_(B_R (0)) Phi(y) Delta_x f(x-y) dif y $
  בשביל לפתור את הסינגולריות בראשית, נגדיר $r>0$ קטן מספיק כך ש־$Omega_r = B_R (0) without B_r (0)$ ומכך שהאינטגרל מתכנס אפשר לעבור לגבול
  $ Delta u(x) =lim_(r arrow 0^plus) integral_(Omega_r) Phi(y) Delta_x f(x-y) dif y $
  מנוסחת גרין הראשונה על $Omega_r$ נקבל
  $
    integral_(Omega_r) Phi(y) Delta_x f(x-y)dif y = lim_(r arrow 0^plus) integral_boundary(B_R (0)) Phi(y)dif_nu f(x-y)dif S(y)- integral_(boundary(B_r (0))) Phi(y) partial_nu f(x-y)dif S(y) - integral_Omega_r chevron.l gradient Phi(y), gradient f(x-y) chevron.r dif y
  $
  אבל הנגזרות של $f$ מתאפסות על $boundary(B_R (0))$ ולכן האינטגרל הראשון הוא אפס.\
  מכך שהנגזרת של $f$ חסומה נקבל ממה שראינו בתרגול
  $
    abs(integral_(boundary(B_r (0))) Phi(y) partial_nu f(x-y)dif S(y))<=sup_(y in RR^2) norm(gradient f(y)) abs(Phi(r)) Vol_1 (boundary(B_r))=sup_(y in RR^2) norm(gradient f(y)) abs(Phi(r)) r abs(ln(r)) stretch(arrow)_(r arrow 0^plus) 0
  $
  שוב מנוסחת גרין
  $
    - integral_Omega_r chevron.l gradient Phi(y), gradient f(x-y) chevron.r dif y = integral_Omega_r Delta Phi(y)f(x-y)dif y + integral_boundary(B_r (0)) partial_nu Phi(y) f(x-y) dif S(y)
  $
  אבל $Phi$ הרמונית בתחום ולכן האיבר הראשון הוא אפס.\
  אם כך, כמו מהתרגול
  $ Delta u(x)=lim_(r arrow 0^plus) integral_boundary(B_r (0)) partial_nu Phi(y)f(x-y)dif S(y) $
  הנגזרת הנורמלית של $Phi(y)$ היא למעשה הנגזרת לפי המשתנה הרדיאלי (כמו בתרגול) ואז
  $ partial_nu Phi(y) = frac(1, 2pi r) $
  ולכן
  $ Delta u(x)=lim_(r arrow 0^plus) frac(1, 2pi r) integral_boundary(B_r (0)) f(x-y)dif S(y) $
  אבל זה בידיוק הממוצע של $f$ על מעגל ברדיוס $r$ סביב $0$ ו־$f$ רציפה ולכן כאשר $r arrow 0^plus$ ממוצע הערכים מתכנס לערך הפונקציה בנקודה.\
  לכן $Delta u(x) = f(x)$ כנדרש.
]

#question()
#subquestion()
תהיי $U subset.eq RR^d$ פתוחה וחסומה עם שפה חלקה. נניח כי $u_2 in C^2 (closure(Omega))$ כך שלכל $x in Omega$ מתקיים
$ Delta u_1 (x)=Delta u_2 (x) $
ונניח בנוסף כי $u_1, u_2$ מתאפסות על השפה של $Omega$.\
נסמן $u=u_1 - u_2$ ונוכיח כי $u_1 = u_2$ באמצעות משפט הדיברגנץ'.

#proof[
  מכך ש־$u = u_1 - u_2$ ונתון כי $Delta u_1 = Delta u_2$ אזי $Delta u = 0$ בתוך $Omega$ ומהנתון ש־$u_1, u_2$ מתאפסות על השפה נובע כי $u|_boundary(Omega) eq.triple 0$.\
  מתקיים מהנתון
  $ divergence(u dot.op Delta u)=norm(gradient u)^2 + u dot.op Delta u =_(Delta u = 0) norm(gradient u)^2 $
  אז ממשפט הדיברגנץ'
  $
    integral_Omega norm(gradient u)^2 dif V = integral_Omega divergence(u dot.op Delta u) dif V = integral_boundary(Omega) u dot.op (gradient u dot.op n) dif S =_(u|boundary(Omega) eq.triple 0) integral_boundary(Omega) 0 dif S = 0
  $
  אבל האינטגרל הוא אפס אם ורק אם הפונקציה זהותית אפס ולכן $gradient u = 0$ כלומר $u$ היא פונקציה קבועה אבל היא מתאפסת על השפה ולכן היא קבועה אפס וקיבלנו $u_1 = u_2$.
]

#subquestion()
נשתכנע כי הסעיף הקודם נכון גם אם היינו מניחים $partial_nu u_1 = partial_nu u_2$ על השפה של $Omega$.

#proof[
  השתכנעתי כי האינטגרל היה עדיין זהותית אפס.
]

#subquestion()
נניח כי $u_1, u_2 in C^2 (RR^d)$ כך שלכל $x in RR^d$ מתקיים $ Delta u_1 (x) = Delta_2 (x) $
ונניח בנוסף כי $display(lim_(x arrow.r infinity) u_1 (x) - u_2 (x) = 0)$. נוכיח כי $u_1 = u_2$.

#proof[
  בהתאם לרמז, אם נגדיר שוב $u=u_1 -u_2$ אז נקבל ש־$u$ הרמונית כצירוף לינארי של פונקציות הרמוניות.\
  מכך ש־$lim_(x arrow.r infinity) u(x) =0$, חייב להתקבל ערך מקסימלי גלובלי חיובי או גלובלי שלילי בנקודה סופית כלשהי ומעיקרון המקסימום החזק פונקציה הרמונית המקבלת מקסימום או מינימום בתוך תחום קשיר ($RR^d$ קשיר) חייבת להיות קבועה, ומהנתון נובע שהיא חייבת להיות זהותית אפס ולכן קיבלנו שוב את היחידות $u_1 = u_2$.
]

#question()
תהיי $u:RR^d arrow RR$ הרמונית. נוכיח כי אם $u$ חסומה אז $u$ קבועה.

#proof[
  אין על משפט ליוביל.\
  מהיות $u$ קבועה קיים $M in RR$ כך שלכל $x in RR^d$ מתקיים $abs(u(x))<=M$.\
  נעזר במשפט הערכת נגזרות לפונקציות הרמוניות מהכיתה (עבור $k=1$) (או כמו במרוכבות עוד משפט קושי) אז לכל כדור $B_r (x)$ מתקיים
  $
    abs(gradient u(x))<=frac(C(d), r^(d+1)) integral_(B_r (x)) abs(u(y)) dif y <= frac(C(d), r^(d+1)) integral_(B_r (x)) M dif y = frac(C(d), r^(d+1)) dot.op M dot.op Vol(B_r (x))
  $
  מהיות $u$ הרמונית ניתן להשאיף את $r$ לאינסוף והביטוי לעיל ישאף לאפס (שכן, $Vol(B_r (x)) = omega_d dot.op r^d$ הנפח של כדור היחידה כפול הרדיוס בחזקת המימד).\
  מכך שלכל $x in RR^d$ מתקיים $abs(gradient u(x))=0$ זו פונקציה שכל הנגזרות הכיווניות שלה מתאפסות ולכן היא בהכרח קבועה.
]

#question()
יהי $d>=3$ ונגדיר $K : B_1 (0) times boundary(B_1 (0)) arrow RR$ על־ידי
$ K(x,y)=frac(1, Vol_(d-1) (boundary(B_1 (0)))) frac(1-norm(x)^2, norm(x-y)^d) $
ותהיי $g: boundary(B_1 (0)) arrow RR$ רציפה.\

#subquestion()
נוכיח כי
$ u(x)=integral_boundary(B_1 (0)) K(x,y)g(y) dif S(y) $
היא פונקציה הרמונית.

#proof[
  לפי ההנחה הנתונה בשאלה, $K(x,y)$ פונקציה הרמונית לפי $x$ כלומר $Delta_x K(x,y) = 0$ לכל $y$.\
  $g$ רציפה מהנתון וגרעין פואסון הוא פונקציה חלקה לכל $x in B_1 (0)$ ולכן אפשר להחליף סדר של גזירה ואינטגרציה על השפה
  $
    Delta u(x)= Delta_x integral_boundary(B_1 (0)) K(x,y)g(y) dif S(y) = integral_boundary(B_1 (0)) Delta_x K(x,y) g(y) dif S(y)
  $
  אבל הגרעין הרמוני ולכן $Delta_x K(x,y)=0$ ומכאן ש־$Delta u(x) =0$ כלומר הרמונית, כנדרש.
]

#subquestion()
נוכיח כי לכל $y_0 in B_1 (0)$ מתקיים $lim_(x arrow.r y_0) u(x)=g(y_0)$.

#proof[
  נתון שלכל $x in boundary(B_1 (0))$ מתקיים
  $ integral_boundary(B_1 (0)) K(x,y) dif y = 1 $
  ונכתוב
  $ u(x)-g(y_0)=integral_boundary(B_1 (0)) K(x,y)(g(y)-g(y_0)) dif S(y) $
  בהתאם להכוונה, אנחנו מבודדים את $y_0$
  + בסביבת הנקודה $y_0$, מרציפות $g$ על השפה הקומפקטית עבור כל $epsilon > 0$ ניתן לבחור סביבה $delta$ קטנה מספיק שבה הפרש הערכים $abs(g(y)-g(y_0))<epsilon/2$ ובתחום זה ההפרש כולו ייחסם על־ידי $epsilon/2$ כי הגרעין אי־שלילי ומנורמל $1$
  + על שאר השפה כלומר מחוץ לסביבת $delta$ לעיל, המרחק $norm(x-y)$ חסום מלמטה על־ידי ערך קבוע חיובי אבל הביטוי של גרעין פואסון במונה יישאף ל־$1$ כאשר נשאף ל־$y_0$ בעוד המכנה חסום כלומר הגרעין מתאפס באופן אחיד בחלק הזה
  שילוב שני החלקים מבטיח שהאינטגרל כולו יכול להיות קטן כרצוננו, מה שמוכיח את התכנסות הגבול הנדרש.
]
