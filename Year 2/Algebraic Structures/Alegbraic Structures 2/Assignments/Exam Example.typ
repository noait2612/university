#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- פתרון מבחן לדוגמה ], signature: [#align(center)[#image(
      "../../../../src/duck.png",
      width: 30%,
      fit: "contain",
    )]])

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("ker")
#let Perm = math.op("Perm")
#let deg = math.op("deg")
#let Span = math.op("Span")
#let Hom = math.op("Hom")
#let End = math.op("End")
#let cont = math.op("cont")
#let Frac = math.op("Frac")
#let Aut = math.op("Aut")
#let Id = math.op("Id")
#let Fr = math.op("Fr")
#let Gal = math.op("Gal")
#let gal = math.op("gal")
#let Tr = math.op("Tr")
#let Res = math.op("Res")
#let scr(it) = text(features: ("ss01",), box($cal(it)$))

#question()
יהי $n in K^times, mu_n subset K$ ו־$L slash K$ הרחבה ציקלית, אז קיים $alpha in L$ כך שמתקיים $L = K(alpha)$ ו־$alpha^n in K$.

#proof[
  ניזכר בהגדרה
  #definition(
    $n"חבורת שורשי היחידה מסדר ",mu_n"חבורת"$,
  )[עבור $K$ שדה ו־$1<=n in NN$ נגדיר $ mu_n (K) = { xi in K bar xi^n = 1} $
    $ mu_infinity (K) = union.big_n mu_n (K) $
    נשים לב ש־$mu_n (K)$ היא תת־חבורה של $K^times$ מסדר המחלק את $n$ (זוהי כמובן חבורה אבלית עם כפל).\
    עבור $K$ שדה ו־$1<=n in NN$, אם $x^n-1$ מתפצל לחלוטין ב־$K$ נסמן $mu_n (K) = mu_n$ (שכן היא לא תשתנה תחת הרחבה של $K$) ונגיד במקרה זה ש־$mu_n$ מתפצל ב־$K$.]
  _נעבור להוכחה:_\
  מכך שההרחבה ציקלית אנחנו יודעים שההרחבה וסופית ושמתקיים $G=Gal(L slash K) tilde.eq (ZZ slash n ZZ)$ ולכן יש $sigma$ שיוצרת את ההרחבה.\
  נזכר שמהגדרה $ G=Gal(L slash K) = Aut(L slash K) = { sigma in Aut(L) bar forall x in K space sigma(x)=x} $
  נסתכל על ה־$sigma : L arrow.r L$ הזאת כאופרטור $K$־לינארי (כלומר, מכבד את המבנה של $K$, משמע לכל $a, b in K$ ולכל $x,y in L$ מתקיים \
  $sigma(a x + b y) = a sigma(x) + b sigma(y)$).\
  ניקח את $f_sigma (t)$ הפולינום המינימלי של $sigma$.
  היות וההרחבה סופית מדרגה $n$ אז אנחנו יודעים מטעמי סדר שיתקיים $sigma^n = 1$ ומכך ש־$mu_n subset K$, אנחנו מקבלים שהפולינום $t^n-1$ מתפצל לחלוטין ב־$K$.\
  מכך ש־$sigma$ הוא אופרטור $K$־לינארי, מתקיים $sigma^n-1 = 0$ ולכן לפולינום $t^n-1$ יש שורש שהוא $sigma$.\
  מהגדרת הפולינום המינימלי הוא מחלק גם את $t^n-1$ (כי $sigma$ שורש שלו).\
  מכך ש־$t^n-1$ מתפצל לחלוטין ב־$K$ אז הוא מהצורה
  $ t^n-1 = (t-xi_0) (t-xi_1) dot.op dots.h.c dot.op (t-xi_(n-1)) $
  ובהכרח השורשים שלו (שורשי היחידה) הם שונים זה מזה, כי $(t^n-1)' = n t^(n-1)$, אבל השורש היחידי של $n t^(n-1)$ הוא רק עבור $t=0 space (n!=0)$, אז לפי טענה שראינו נובע שאין לו שורשים מרובים ולכן כל השורשים שלו שונים זה מזה, אז כל השורשים שונים זה מזה והפיצול שראינו לעיל הוא פיצול לינארי.\
  ניזכר שבלינארית ראינו שאופרטור הוא אלכסוני מעל שדה אם קיים בסיס של המרחב הוקטורי שמכיל את כל הוקטורים העצמיים של האופרטור, ובמקרה שלנו זה שקול ללהגיד שהפולינום המינימלי של האופרטור מתפצל לחלוטין מעל השדה – כפי שמצאנו.\
  לכן יש לנו בסיס של וקטורים עצמיים $alpha_1, dots.h.c, alpha_n$ עבור הערכים העצמיים $xi_1, dots.h.c, xi_n in mu_n$ בהתאמה כך שמתקיים $sigma(alpha_i) = xi_i alpha_i$.\
  נראה כי ה־$xi_i$ יוצרים את $mu_n$:  $mu_n$ ציקלית, ולכן גם כל תת־חבורה שלה ציקלית אז $angle.l xi_i, dots.h.c, xi_n angle.r = mu_m$ עבור $m<=n$ אז $xi_i^m = 1$ אבל נשים לב שמתקיים אם כך לכל $i$
  $ sigma^m (alpha_i) = xi_i^m alpha_i = 1 dot.op alpha_i = alpha_i $
  ולכן בהכרח $m=n$ ובעצם $angle.l xi_1, dots.h.c xi_n angle.r = mu_n$.\
  מכך ש־$xi_1, dots.h.c, xi_n$ יוצרים את $mu_n$ והיא חבורה ציקלית לכן נוצרת על־ידי איבר אחד, $xi$, נובע שהוא צריך להיות צירוף לינארי שלהם, אז לכל $i$ נתאים את $ell_i$ כך שיתקיים $xi = product_(i=1)^n xi_i^(ell_i)$, נגדיר $alpha = product_(i=1)^n alpha_i^(ell_i)$ ונקבל
  $
    sigma(alpha) = sigma(product_(i=1)^n alpha_i^(ell_i)) = product_(i=1)^n sigma(alpha_i^(ell_i)) =_(sigma(alpha_i)=xi_i alpha_i) product_(i=1)^n xi_i^(lambda_i) alpha_i^(ell_i) = product_(i=1)^n xi_i^(ell_i) product_(i=1)^n alpha_i^(ell_i) = xi alpha
  $
  במילים אחרות, $alpha$ הוא וקטור עצמי של הערך עצמי $xi$, אבל $xi$ הוא שורש פרימיטיבי מסדר $n$, אז הקבוצה ${alpha, xi alpha, xi^2 alpha, dots.h.c, xi^(n-1) alpha}$ היא בעלת $n$ איברים שונים – זאת אומרת ל־$alpha$ יש $n$ צמודים מעל $K$ ונטען שזה מסיים: נסמן $L=K(alpha)$, ואם נבחר $a = alpha^n$ אז עבור כל $sigma_i in G$ נקבל
  $ sigma_i (a) = sigma_i (alpha^n) = (sigma_i (alpha))^n = (xi_i alpha)^n = alpha^n = a $
  וזה בידיוק אומר ש־$a in L^G = {x in L bar forall sigma in G, space sigma(x)=x}$, אבל זה בידיוק אומר ש־$a in K$, כי כל איבר ב־$K$ נשמר תחת כל האוטומורפיזמים של $G$ כי $G$ מהגדרתה מכילה את כל האוטומורפיזמים שמשאירים את $K$ במקום.
]

#question()
נוכיח שאם $L$ שדה ו־$G subset.eq Aut(L)$ היא תת־חבורה סופית אז $L$ היא הרחבת גלואה סופית של $K=L^G$ ו־$G=G_(L slash K)$.

#proof[
  אין לי כח.
]

#question()
נקבע לכל סעיף אם הוא נכון או לא נכון וננמק לספורט.

#subquestion()
אם $L slash K$ הרחבה ספרבילית סופית אז יש כמות שדות ביניים סופית בין $K$ ובין $L$.

#proof[
  הטענה *נכונה*.\
  מכך שההרחבה ספרבילית נובע שכל $alpha in L$ ספרבילי מעל $K$, כלומר לפולינום המינימלי מעל $K$ אין שורשים מרובים בשדה ההרחבה בו הוא מתפצל.\
  נזכר במשפט האיבר הפרימיטיבי: נניח כי $L slash K$ הרחבה סופית, אז
  + $L slash K$ פרימיטיבית אם ורק אם קבוצת שדות ביניים היא קבוצה סופית
  + אם בנוסף $L slash K$ פרידה (ספרבילית) אז היא פרימיטיבית (זאת אומרת, כל הרחבה סופית פרידה היא פרימיטיבית)
  $1$ לא מעניין במקרה שלנו, אז נוכיח רק את $2$: ניקח $E = L^(n o r) slash K$ הסגור הנורמלי מעל $K$, שפרידה ונורמלית ולכן גלואה ועל־כן $L^(n o r) slash K = L^(gal)$' סגור גלואה.\
  נראה של־$E slash K$ יש כמות סופית של שדות ביניים: כל שדה ביניים $K subset.eq F subset.eq E$ מקיים $F = E^(Gal(E slash F))$ זאת־אומרת הוא נקבע על־ידי תת־החבורה $H = Gal(E slash F)$ בחבורה סופית $G = Gal(E slash K)$
]

#subquestion()
אם $L, F$ הן הרחבות סופיות של שדה $K$ אז $[L F :F] divides [L:K]$

#proof[
  הטענה *לא נכונה*.\
  ניזכר ש־$L F$ זה *הקומפוזיטום* של $L$ ו־$F$ ומוגדר כתת־השדה הקטן ביותר של $K$ שמכיל את $L$ ואת $F$.\
  אינטואיציה: האיברים של $L$ ושל $F$ יכולים להיות תלויים מעל $K$ או אם יש הכלה בין האיברים ואז הדרגה של הקומפוזיטום יכולה להיות פחות ממכפלת הדרגות של כל הרחבה בפני עצמה.\
  נסמן $omega = xi_3, alpha = root(3, 2)$ וניקח $K = QQ, L = QQ(root(3, 2)), F = QQ(omega root(3, 2))$.\
  כמובן $[L:K] = 3$ כי הפולינום $x^3-2$ הוא הפולינום המינימלי.\
  אנחנו גם יודעים ש־$L F$ הוא השדה המינימלי שמכיל גם את $alpha$ וגם את $alpha omega$ מעל $QQ$, ואנחנו רוצים למצוא פולינום מינימלי של $alpha omega$ מעל $QQ$:
  נסמן $x=alpha omega$ ואז $x^3= alpha^3 omega^3 = 2 dot.op 1 = 2$ אז $x^3-2=0$ וזה אותו פולינום מינימלי כמקודם, והוא גם אי־פריק (קריטריון אייזנשטיין עם $p=2$) אז $[F:QQ] = 3$.\
  אנחנו רוצים לחשב את $[L F : K]$, מהגדרה מתקיים $QQ(alpha, omega) supset.eq L F$ אבל $omega = (alpha omega)/alpha => alpha in L F => QQ(alpha, omega) subset.eq L F$ אז $L F = QQ(alpha, omega)$.\
  נשים לב ש־$L F$ זה בעצם שדה הפיצול של הפולינום $x^3-2$ כי כל שלושת השורשים נמצאים בו – גם $root(3, 2), root(3, 2) omega, root(3, 2) omega^2$ אז הדרגה שלו לפי מגדל הרחבות זה $[L F : QQ] = 2 dot.op 3 = 6$.
  אז
  $ [L F : F ] = [L F : QQ]/[F : QQ] = 6/3 = 2 divides.not 3 = [L:K] $
]
