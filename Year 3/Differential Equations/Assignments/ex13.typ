#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 13 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $Omega subset.eq RR^d$ פתוחה וחסומה ותהיי $u in C^2(Omega) inter C(closure(Omega))$ המקיימת $Delta u>=0$.

#subquestion()
יהי $x in Omega$ ו־$r_0 > 0$ כך ש־$closure(B_r_0 (x)) subset.eq Omega$ עבור $r in (0, r_0)$ נגדיר
$ M(r) = frac(1, Vol_(d-1)(boundary(B_r))) integral_boundary(B_r (x)) u dif S $
נוכיח ש־$M$ פונקציה מונוטונית עולה.

#proof[
  נשתמש במשפט החלפת משתנה כדי לעבור לכדור היחידה $y=x+r z$ כאשר $z in boundary(B_1 (0))$ ואז
  $ M(r) = frac(1, Vol_(d-1) (boundary(B_1 (0)))) integral_boundary(B_1 (0)) u(x+r z) dif S(z) $
  $u$ גזירה פעמיים ולכן
  $
    M^prime (r) &= frac(1, Vol_(d-1) (boundary(B_1 (0)))) integral_boundary(B_1 (0)) gradient u(x+ r z) z dif S \
    &=_((star)) frac(1, Vol_(d-1)(boundary(B_r (x)))) integral_boundary(B_r (x)) gradient u(y) dot.op n(y) dif S(y) \
    &= frac(1, Vol_(d-1)(boundary(B_r (x)))) integral_boundary(B_r (x)) frac(partial u, partial nu) dif S \
    &=_((star star)) frac(1, Vol_(d-1)(boundary(B_r (x)))) integral_(B_r (x)) Delta u dif V
  $
  כאשר $(star)$ זה עם הנורמל $ n(y) = frac(y-x, r) = z $
  כי חזרנו למשתנים המקוריים על השפה והנורמל שם מצביע החוצה ו־$(star star)$ זה משפט הדיברגנץ.\
  נתון $Delta u >=0$ והאינטגרל הוא על פונקציה אי־שלילית ולכן הוא חיובי או אפס ומכאן $M^prime (r) >=0$ והפונקציה מונוטונית עולה.
]

#subquestion()
נוכיח כי
$ max_(x in boundary(Omega)) u(x) = max_(x in closure(Omega)) u(x) $

#proof[
  לכל $epsilon > 0$ נגדיר
  $
    v_epsilon (x) = u(x) + epsilon norm(x)^2 \
    Delta v_epsilon (x) = Delta u(x) + epsilon Delta(norm(x)^2) =_"תרגיל קודם" Delta u(x) + 2 d epsilon
  $
  נתון $Delta u>=0$ ו־$epsilon > 0$ ולכן $Delta v_epsilon (x) > 0$ לכל $x in Omega$.\
  מכך ש־$Delta v_epsilon > 0$ בכל נקודה פנימית נובע שלא יכולה להיות נקודת מקסימום פנימית בתחום $Omega$ (שכן במקסימום פנימי הלפלסיאן חייב להיות קטן או שווה לאפס) אבל $v_epsilon$ היא פונקציה רציפה על תחום סגור וחסום ולכן לפי משפט ויירשטראס היא חייבת לקבל מקסימום ולכן בפרט הוא על השפה, כלומר
  $ max_(x in closure(Omega)) v_epsilon (x)=max_(x in boundary(Omega)) v_epsilon (x) $
  עבור $x in Omega$ מתקיים
  $
    u(x) <= v_epsilon (x) <= max_(y in boundary(Omega)) v_epsilon (y) = max_(y in boundary(Omega))(u(y) + epsilon norm(y)^2)) ==> u(x) <= max_(y in boundary(Omega)) u(y) + epsilon max_(y in boundary(Omega)) norm(y)^2
  $
  וזה נכון לכל $epsilon > 0$ אז כאשר נשאיף את $epsilon$ ל־$0^plus$ נקבל
  $ u(x) <= max_(y in boundary(Omega)) u(y) $
  הראינו שלכל נקודה בתוך התחום, ערך הפונקציה $u$ קטן או שווה למקסימום שלה על השפה. לכן, המקסימום הגלובלי של הפונקציה בכל התחום הסגור בהכרח מתקבל על השפה.
]

#subquestion()
ננסח טענות אנלוגיות לשני הסעיפים הקודמים אם היה בנתון במקום ש־$Delta u<=0$.

#proof[
  עבור סעיף 1 הטענה האנלוגית היא ש־$M(r)$ היא פונקציה מונוטונית יורדת ולסעיף ב' זה עיקרון המינימום, כלומר
  $ min_(x in boundary(Omega)) u(x) = min_(x in closure(Omega)) u(x) $
]

#question()
תהיי $Omega subset.eq RR^d$ קבוצה פתוחה ותהיי $u in C^2 (Omega)$.

#subquestion()
נוכיח כי $u$ תת־הרמונית אם ורק אם $Delta u>=0$.

#proof[
  \
  $<==$ נניח ש־$u$ תת־הרמונית ונניח בשלילה שקיימת $x_0 in Omega$ כך ש־$Delta u(x_0) < 0$.\
  מרציפות הנגזרות השניות קיים כדור קטן $B=B_R (x_0)$ שבו $Delta u < 0$ בכל $B$ ועם סעיף ג' בשאלה 1 הפונקציה $M(r)$ עבור $u$ יורדת ממש בכדור הזה ואז $u(x_0) > M(r)$.\
  מכך ש־$u$ תת־הרמונית יש פונקציה הרמונית $h$ כך ש־$u|_boundary(B)<=h|_boundary(B)$ ופונקציה הרמונית מקיימת את תכונת ערך הממוצע ולכן $h(x_0) = M(r)$ אבל אז
  $ M(r) > u(x_0) <= h(x_0) = M(r) $
  וזאת כמובן סתירה ולכן $Delta u >=0$.\
  $==>$ נניח ש־$Delta u>=0$ ולכן משאלה 1 $u$ מקיימת את עקרון המקסימום ולכן בכל כדור $B subset.eq Omega$ ולכל פונקציה הרמונית $h$ המקיימת $u|_boundary(B) <= h|_boundary(B)$.\
  הפונקציה $w=u-h$ מקיימת $Delta w = Delta u - 0 >=0$ ולפי עיקרון המקסימום $max_B w = max_boundary(B) w <=0$ ולכן $w|_B <= 0$ כלומר $u|_B <= h|_B$ וזו בידיוק ההגדרה של פונקציה תת־הרמונית.
]

#subquestion()
נוכיח כי אם $u$ הרמונית אז לכל $n in NN$ הפונקציה $Delta^n abs(u)^2$ היא תת־הרמונית.

#proof[
  לפי הסעיף הקודם מספיק להראות כי הלפלסיאן של הפונקציה הזו הוא חיובי או אפס, כלומר $Delta (Delta^n |u|^2) = Delta^(n+1) |u|^2 >= 0$, אז
  $ Delta (u^2) = divergence(gradient (u^2)) = divergence(2 u gradient u) = 2 norm(gradient u)^2 + 2 u Delta u $
  $u$ הרמונית ולכן $Delta u =0$ ולכן $Delta(u^2) = 2 norm(gradient u)^2 >= 0$.\
  כעת, נחשב את הלפלסיאן של $norm(gradient u)^2$
  $ Delta (sum_i (partial_i u)^2) = 2 sum_i partial_i u Delta(partial_i u) + 2 sum_(i, j) (partial_i partial_j u)^2 $
  $u$ הרמונית ולכן מטענה שראינו/הוכחנו כבר גם הנגזרות החלקיות שלהן הן הרמוניות אז האיבר הראשון בסכום מתאפס ונקבל
  $ Delta (norm(gradient u)^2) = 2 sum_(i,j) (partial_i partial_j u)^2 >= 0 $
  נמשיך באינדוקציה ונקבל שהלפלסיאן מסדר $n$ של $|u|^2$ הוא סכום (עם מקדמים חיוביים) של ריבועי הנגזרות מסדר $n$ של $u$ וסכום של ריבועים ממשיים הוא אי־שלילי ולכן $Delta^n |u|^2 >= 0$ לכל $n$.\
  מכיוון שהלפלסיאן של $Delta^n |u|^2$ הוא $Delta^(n+1) |u|^2 >= 0$ מהסעיף הקודם נובע שהיא אכן תת־הרמונית.
]

#question()
תהיי $Omega subset.eq RR^d$ פתוחה וקשירה ותהיי $(u_n)_(n=1)^infinity$ סדרה של פונקציות הרמוניות חיוביות המוגדרות על $Omega$.\
נניח כי קיימת $x_0 in Omega$ כך שלכל $n in NN$ מתקיים $u_n (x_0) = 1$.\
נוכיח כי ל־$(u_n)_(n=1)^infinity$ תת־סדרה שמתכנסת במידה שווה בכל תחום קומפקטי המוכל ב־$Omega$.

#proof[
  תהיי $K subset.eq Omega$ קומפקטית. $Omega$ קשירה ולכן נוכל למצוא קבוצה קומפקטית וקשירה $K^prime$ כך ש־$K subset.eq K^prime$ וגם $x_0 in K^prime$.\
  מאי־שיוויון הרנאק (כי הפונקציות חיוביות) קיים קבוע $C_(K^prime)$ התלוי רק ב־$Omega$ וב־$K^prime$ כך שלכל פונקציה הרמונית חיובית מתקיים
  $ max_(K^prime) u_n <= C_(K^prime) min_(K^prime) u_n $
  אי־שיוויון הרנאק המקורי הוא עם סופרמום ואינפימום אבל יש לנו פונקציות רציפות ואף חלקות על תחום קומפקטי ולכן משפט ויירשטראס מאפשר לעשות את ההחלפה.\
  מכיוון ש־$x_0 in K^prime$, מתקיים
  $ min_(K^prime) u_n <= u_n(x_0) <= max_(K^prime) u_n $
  אבל $u_n (x_0) = 1$ ונקבל
  $ max_K u_n <= max_(K') u_n <= C_(K') dot u_n(x_0) = C_(K') $
  ולכן קיבלנו את החסימות במידה אחידה על כל קבוצה קומפקטית.\
  יתרה מזאת, ממשפט הערכת הנגזרות על פונקציות הרמוניות נקבל שהחסם האחיד על הפונקציות גורר חסם אחיד על ה־$gradient$ בקבוצות קומפקטיות ולכן מתקיים
  $ max_K norm(gradient u_n) <= c max_(K^prime) |u_n| <= c dot C_(K^prime) $
  כל תנאי משפט ארצלה־אסקולי מתקיימים ולכן יש לה תת־סדרה מתכנסת במידה שווה על $K$.\
  כדי למצוא תת־סדרה אחת שמתכנסת במידה שווה על כל קבוצה קומפקטית  ב־$Omega$ נבנה עם טיעון אלכסון סדרה ממצה של קבוצות קומפקטיות $K_1 subset.eq K_2 subset.eq dots.h.c subset.eq Omega$ שאיחודן הוא $Omega$ ומשיטת האלכסון של קנטור נוכל להוציא תת־סדרה שמתכנסת במידה שווה על $K_1$, מתוכה תת־סדרה שמתכנסת על $K_2$ וכן הלאה ונקבל תת־סדרה אלכסונית המתכנסת במידה שווה על כל קבוצה קומפקטית המוכלת ב־$Omega$.
]
