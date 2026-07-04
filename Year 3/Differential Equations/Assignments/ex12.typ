#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 12 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $Omega subset.eq RR^d$ פתוחה, עבור $K subset.eq Omega$ קומפקטית ו־$f:Omega arrow RR$ רציפה נגדיר
$ norm(f)_(infinity, k) = sup_(x in K) abs(f(x)) $
נניח כי $(u_n)_(n=1)^infinity subset.eq C^2 (Omega)$ סדרה של פונקציות הרמוניות ונניח כי קיימת $u:Omega arrow RR^d$ כך שלכל $K subset.eq Omega$ קומפקטית מתקיים
$ lim_(n arrow.r infinity) norm(u_n - u)_(infinity, K) = 0 $
כלומר $u_n arrow u$ במידה שווה בכל תת־קבוצה קומפקטית של $Omega$.

#subquestion()
נוכיח כי $u$ הרמונית.

#proof[
  ראינו שפונקציה רציפה היא הרמונית אם ורק אם היא מקיימת את תכונת הממוצע על כל כדור המוכל בתחום.\
  $u_n$ רציפה והסדרה מתכנסת אליה במידה שווה על קבוצות קומפקטיות ולכן גם $u$ רציפה ב־$Omega$.\
  יהי $x in Omega$ ויהי $closure(B_R (x)) subset.eq Omega$ כדור סגור שכמובן קומפקטי.\
  מכך ש־$u_n$ הרמונית היא מקיימת את תכונת ערך הממוצע ועל־כן
  $ u_n (x) = frac(1, Vol(B_R (x))) integral_(B_R (x)) u_n (y) dif y $
  אבל ההתכנסות נתונה במידה שווה על קומפקטיות ולכן ניתן להחחליף סדר אינטגרציה וגבול ולקבל
  $
    u(x) = lim_(n arrow infinity) u_n (x) = lim_(n arrow.r infinity) frac(1, Vol(B_R (x))) integral_(B_R (x)) u_n (y) dif y = frac(1, B_R (x)) integral_(B_R (x)) lim_(n arrow.r infinity) u_n (y) dif y = frac(1, B_R (x)) integral_(B_R (x)) u(y) dif y
  $
  ונובע אם כך ש־$u$ הרמונית.
]

#subquestion()
תהיי $C subset.eq Omega$ קומפקטית ונוכיח כי לכל סדרה של אינדקסים $i_1, dots.h, i_k$ מתקיים
$ lim_(n arrow.r infinity) norm(partial_x_i_1 partial_x_i_2 dots.h partial_x_i_k (u_n - u))_(infinity, C) = 0 $

#proof[
  עלינו להראות התכנסות במידה שווה של הנגזרות.\
  נבחר $r>0$ קטן מספיק כך ש־$C_r = {x in Omega bar dist(x, C)<=r}$ היא קבוצה קומפקטית המוכלת ב־$Omega$.\
  הפרש של הרמוניות הוא הרמוני ולכן $u_n - u$ הרמונית אז ממשפט הערכת הנגזרות של פונקציה הרמונית, לכל מולטי־אינדקס $alpha$ קיים קבוע $M$ כך שלכל $x in C$ מתקיים
  $ abs(partial^alpha (u_n -u)(x))<=frac(M, r^k) sup_(y in B_r (x)) abs((u_n -u)y) $
  מכך שלכל $x in C$ מתקיים $B_r (x) subset.eq C_r$ נקבל
  $ abs(partial^alpha (u_n -u)(x))<=frac(M, r^k) norm((u_n -u)y)_(infinity, C_r) $
  ובלקיחת סופרמום על כל $x in C$ נקבל
  $ norm(partial^alpha (u_n -u))_(infinity, C) <= frac(M, r^k)norm(u_n -u)_(infinity, C_r) $
  אבל $C_r$ קומפקטית ולכן $lim_(n arrow.r infinity) norm(u_n -u)_(infinity, C_r) = 0$ ולכן אגיף ימין שואף לאפס ולכן גם אגף שמאל שואף לאפס.
]

#question()
תהיי $U subset.eq RR^d$ פתוחה וחסומה ונניח כי $u in C^2 (Omega) inter (closure(Omega))$ הרמונית ב־$Omega$. נוכיח ללא שימוש בתכונת הממוצע כי $max_closure(Omega) u = max_boundary(Omega) u$.

#proof[
  בהתאם להנחייה, עבור $t>0$ נגדיר
  $
    u_t (x) = u(x) + t norm(x)^2 \
    Delta u_t (x) = Delta u(x) + t Delta(norm(x)^2)
  $
  $u$ הרמונית ולכן $Delta u(x) = 0$והלפסליאן של ריבוע הנורמה הוא
  $ Delta (x_1^2 + x_2^2 + dots.h.c + x_d^2) = 2 + 2 + dots.h.c + 2 = 2d $
  ועל־כן מתקיים $Delta u_t (x) = 2d t$ וכמובן בפרט $Delta u_t (x) > 0$ לכל $x in Omega$ שכן $d>=1$ ו־$t > 0$.\
  נניח בשלילה של־$u_t$ יש נקודת מקסימום מקומית $x_0 in Omega$ ולכן מטריצת ההסיאן שלילית חצי־מוגדרת ובנוסף העקבה שלה שלילית בסתירה לכך ש־$Delta u_t > 0$ ולכן אין נקודת מקסימום פנימית.\
  מכך ש־$u_t$ רציפה על התחום הסגור והחסום $closure(Omega)$ נובע שהמקסימום חייב להתקבל על השפה ולכן $max_closure(Omega) u_t = max_boundary(Omega) u_t$.\
  לכל $x in U$ מתקיים
  $
    u(x) <= u_t (x) <= max_boundary(Omega) u_t <= max_boundary(Omega)(u(y) + t norm(y)^2) <= max_boundary(Omega) u + t max_boundary(Omega) norm(y)^2 stretch(arrow)_(t arrow 0^plus) max_boundary(Omega) u
  $
  זה נכון לכל נקודה פנימית ולכן $max_closure(Omega) u = max_boundary(Omega) u$, כנדרש.
]

#question()
תהיי $U subset.eq RR^d$ פתוחה וחסומה. עבור $g in C(boundary(Omega))$ נגדיר את $T g: closure(Omega) arrow RR$ להיות הפונקציה היחידה ב־$C^2 (Omega) inter C(closure(Omega))$ שפותרת את הבעיה
$ mycases(Delta u = 0, "in" Omega, u=g, "on" boundary(Omega)) $
נראה כי $T: C(boundary(Omega)) arrow C^2 (Omega) inter C(closure(Omega))$ אופרטור לינארי חסום וכי $normop(T) <= 1$.

#proof[
  יהיו $g_1, g_2 in C(partial Omega)$ וסקלר $alpha in RR$.נסמן
  $ u_1 = T g_1, quad u_2 = T g_2 $
  לכן $Delta u_1 = 0, Delta u_2 = 0$, ו-$u_1 = g_1, u_2 = g_2$ על $partial Omega$.\
  נתבונן ב־$v = alpha u_1 + u_2$. מלינאריות הלפלס נקבל ש־$v$ הרמונית שכן
  $ Delta v = alpha Delta u_1 + Delta u_2 = 0 $
  על השפה $partial Omega$ מתקיים
  $ v(x) = alpha u_1(x) + u_2(x) = alpha g_1(x) + g_2(x) $
  כלומר, $v$ הפתרון לבעיית דיריכלה עם תנאי שפה $alpha g_1 + g_2$. ממשפט היחידות $v$ הוא הפתרון היחיד, כלומר $T(alpha g_1 + g_2) = v = alpha T g_1 + T g_2$. לכן האופרטור לינארי.\
  נשאר להראות חסימה, נורמת הסופרמום של $g$ על השפה היא
  $ norm(g)_(oo, partial Omega) = max_(x in partial Omega) abs(g(x)) $
  יהי $u=T g$ ו־$u$ הרמונית בתחום ולכן לפי עיקרון המקסימום / מינימום היא מקבלת את ערכי הקיצון שלה על השפה, אז לכל $x in closure(Omega)$,מתקיים
  $ min_(partial Omega) u <= u(x) <= max_(partial Omega) u $
  על השפה מתקיים $u=g$ ולכן
  $ min_(partial Omega) g <= u(x) <= max_(partial Omega) g $
  מתקיים $max_(partial Omega) g <= norm(g)_infinity$ ו-$min_(partial Omega) g >= -norm(g)_infinity$ ולכן
  $ -norm(g)_infinity <= u(x) <= norm(g)_infinity => |u(x)| <= norm(g)_infinity $
  ניקח סופרמום על $overline(Omega)$ ונקבל
  $ norm(T g)_infinity = norm(u)_infinity <= norm(g)_infinity $
  מהגדרת נורמת האופרטור
  $ normop(T) = sup_(g!=0) frac(norm(T g)_infinity, norm(g)_infinity) $
  אז מכך שמתקיים
  $ norm(T g)_infinity <= 1 dot.op norm(g)_infinity $
  הרי ש־$T$ חסום ומתקיים
  $ normop(T) <= 1 $
]
