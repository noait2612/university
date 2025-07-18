#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- פתרון מבחן מועד א' 2021 ], signature: [#align(center)[#image(
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
בכל הרחבת שדות סופית וספרבילית $L slash K$ קיים איבר פרימיטיבי.
#proof[
  תחילה נוכיח למה:
  #lemma(
    "משפט האיבר הפרימיטיבי חלק 1",
  )[תהיי $L slash K$ הרחבה סופית. אז $L slash K$ היא הרחבה פרימיטיבית אם ורק אם יש כמות סופית של שדות ביניים.]
  #proof[
    $<==$ תהיי $L slash K$ פרימיטיבית, כלומר $K = L(alpha)$ ויהי $F$ שדה ביניים. אז $f_(alpha slash F) = sum_(i=1)^n a_i t^i$.\
    יהי $K(a_0, dots.h.c, a_n) = E subset F subset L$ אז $f_(alpha slash F) in E[t]$ ולכן $f_(alpha slash E) divides f_(alpha slash F)$ ובפרט הם שווים.\
    לכן $[L:E] = deg(f_(alpha slash E)) = deg(f_(alpha slash F)) = [L:F]$ ולכן $E=F$ (כי $[F:E] = [L : E]/[L:F] = 1$).\
    אז $F = K(a_1, dots.h.c, a_n)$ נקבע ביחידות על־ידי $f_(alpha slash F)$ ואנחנו יודעים ש־$f_(alpha slash F) divides f_(alpha slash K)$ ולכן יש רק כמות סופית של אפשרויות ל־$f_(alpha slash F)$ (מקסימום $2^([L:K]) = 2^(deg(f_(alpha slash K)))$ כי $f_(alpha slash K) = product_(i=1)^n (t-alpha_i) in overline(K)[t]$ ואם אני רוצה פולינום שיחלק, צריך לבחור קבוצה כלשהי של שורשים ויש $2^n$ אפשרויות לכל היותר).\
    $==>$ נניח שיש כמות סופית של שדות ביניים, $K subset F_i subset L$ עבור $1<=i<=m$.\
    אם $K$ סופי, אז אנחנו יודעים ש־$L slash K$ פרימיטיבית , אז נניח ש־$K$ אינסופי ונוכיח באינדוקציה על $[L:K]$:\
    הבסיס של דרגה $1$ הוא טריוויאלי ולכן ניח שהטענה מתקיימת לכל הרחבה מדרגה הקטנה ל־$[L:K]$.\
    נכתוב $L = K(alpha_1, dots.h.c, alpha_r)$ הרחבה סופית וכן $E = K(alpha_1, dots.h.c, alpha_(r-1))$ (ואז $L=E(alpha_r), alpha = alpha_r$).\
    נניח בלי הגבלת הכלליות ש־$L!=E$ (אחרת נזרוק את $alpha_r$ כי הוא מיותר).\
    מהנחת האינדוקציה, $E = K(beta)$ כי ל־$K$ יש רק מספר סופי של תתי־שדות.\
    ניקח סדרה אינסופית (מההנחה ש־$K$ אינסופי) $c_1, c_2, dots.h.c in K$ וניקח $gamma_i = alpha + beta c_i$ (צירופים לינאריים שונים של $alpha, beta$).\
    נגדיר $F_j = K(gamma_j)$ וקיימים $j!=ell$ כך ש־$F_j = F_ell$ (כי יש כמות סופית של שדות ביניים וכמות אינסופית של איברים).\
    מתקיים $beta = ((alpha+beta c_ell)-(alpha + beta c_j))/(c_ell - c_j) = (gamma_ell - gamma_j)/(c_ell - c_j) in F_j = F_ell$ ולכן $alpha = gamma_ell - c_ell beta in F_ell$ ואז $alpha, beta in F_j$, כלומר $ L = K(alpha,beta) subset F_j = K(alpha+c_j beta) = K(gamma_j) $
    וזה בידיוק אומר ש־$L slash K$ פרימיטיבית.
  ]
  אם כך, מספיק להוכיח שיש כמות סופית של שדות בינייםL נסתכל על סגור גלואה $L^(n o r) = L^(gal) slash K$ (הסגור הנורמלי הוא סגור גלואה כי $L slash K$ פרידה) ומספיק להוכיח של־$L^(gal) slash K$ יש כמות סופית של שדות ביניים (כי $L subset L^(gal)$).\
  מהתאמת גלואה לכל $K subset F subset L^(gal)$ מתקיים $F=L^(Gal(L slash F))$ ולכן $F$ נקבע ביחידות על־ידי $Gal(L slash F)<=Gal(L slash K)$ ויש כמות סופית כזאת כי $Gal(L slash K)$ היא חבורה סופית.
]

#question()
אם $n in K^times$ אז קיים שורש פרימיטיבי $xi_n in overline(K)$ מסדר $n$, ההרחבה $K(xi_n) slash K$ היא גלואה וישנו שיכון $Gal(K(xi_n) slash K) arrow.r.hook (ZZ slash n ZZ)^times$.

#proof[
  נניח ש־$n in K^times$, הפולינום $x^n-1$ הוא ספרבילי ולכן ל־$overline(K)$ יש $n$ שורשי יחידה שונים.\
  ראינו שאם ל־$overline(K)$ יש $n$ שורשי יחידה שונים זה מזה, אז $mu_n tilde.equiv (ZZ slash n ZZ)$, זו חבורה ציקלית ולכן יש לנו שורש יחידה פרימיטיבי $xi_n$ שיוצר אותה.\
  $K(xi_n) slash K$ הוא שדה הפיצול של הפולינום שלנו ולכן ההרחבה נורמלית וספרבילית ולכן זו הרחבת גלואה.\
  כל $sigma in G(L slash K)$ נקבע ביחידות על־ידי $sigma(xi)$ ולכן אנחנו מקבלים שיכון $Gal(L slash K) arrow.r.hook Aut(mu_n)$ על־ידי $sigma mapsto sigma|_(mu_n)$.\
  נגדיר $lambda : (ZZ slash n ZZ) arrow.r Aut(mu_n)$ על־ידי $a mapsto sigma_a$ כאשר $sigma_a (xi)=xi^a$ לכל $a in (ZZ slash n ZZ)^times$ והעתקה הזאת מגדירה את השיכון $Gal(L slash K) arrow.r.hook (ZZ slash n ZZ)^times$.
]

#question()
בכל סעיף נקבע האם הטענה נכונה או לא נכונה וננמק לספורט.

#subquestion()
בחבורה $Aut(FF_9)$ יש יותר איברים מאשר ב־$Aut(FF_8)$.

#proof[
  הטענה *לא נכונה*.\
  נשים לב
  $ FF_8 = FF_(2^3), FF_9 = FF_(3^2) $
  ראינו שהשדות הסופייים $FF_q = FF_(p^n)$ עבור $p$ ראשוני ו־$n in NN$ הם יחידים עד־כדי איזומורפיזם, והאיברים בשדה $FF_(p^n)$ הם השורשים של הפולינום $x^p^n-x$.\
  ניזכר ש־$Aut(FF_(p^n))$ נוצרת על־ידי אוטומורפיזם הפרובניוס ולכן $Aut(FF_(p^n)) tilde.equiv ZZ slash n ZZ$, ולכן ב־$Aut(FF_8)$ יש יותר איברים.
]

#subquestion()
תהיי $L slash K$ הרחבת שדות סופית ו־$overline(L)$ סגור אלגברי של $L$. אם שני איברים $alpha, beta in overline(L)$ צמודים מעל $L$ אז הם צמודים גם מעל $K$.

#proof[
  הטענה *נכונה*.\
  ניזכר $overline(L)$ הוא סגור אלגברית, כלומר לכל פולינום ממעלה גדולה מ־$1$ יש שורש ב־$overline(L)$.
  אם $alpha, beta in overline(K)$ צמודים, זה אומר שהם שורש של אותו פולינום (כי $alpha in overline(K)$ אז הצמודים שלו מעל $L$ הם השורשים של הפולינום המינימלי $f_(alpha slash L)$ ובאותו אופן גם על $beta$).\
  אז $f_(alpha slash L) = f_(beta slash L)$, אבל $f_(alpha slash L) divides f_(alpha slash K)$, ו־$f_(alpha slash K)$ הוא פולינום אי־פריק ומתוקן שגם $beta$ מאפס (כי אם $beta$ שורש של $f_(alpha slash L)$ הוא גם שורש של $f_(alpha slash K)$) וזה בידיוק אומר ש־$f_(alpha slash K) = f_(beta slash K)$ ולכן $alpha, beta$ צמודים מעל $K$.
]

#subquestion()
תהיי $E slash K$ הרחבת שדות ויהיו $L, F$ תתי־הרחבות כך ש־$E = L F$. אם $E slash F$ סופית אז $L slash K$ סופית.

#proof[
  הטענה *לא נכונה*.\
  גבע הראה את הטענה הזאת $plus.minus$ באחד התרגולים אבל הוא דיבר על איזומורפיזם כלשהו אבל הרעיון דומה:
  ניקח $K = FF_5, L = K(t), F = K(t^2)$, מתקיים $F subset.eq L$ ולכן מהגדרת הקומפוזיטום, $E = L F = L$ ומתקיים $[L:F]=2$ בגלל הפולינום $x^2-t^2$ שהוא פולינום אי־פריק אבל כמובן שמתקיים $[L:K] = infinity$ כי זה שדה הפונקציונליות הרציונליות עם $t$.
]

#subquestion()
לכל חבורה סופית $G$ יש הרחבת גלואה $L slash K$ כך שמתקיים $G tilde.eq Gal(L slash K)$.

#proof[
  הטענה *נכונה*.\
  #theorem(
    "תזכורת: משפט קיילי",
  )[תהיי $G$ חבורה סופית מסדר $n$. אז קיים שיכון (הומומורפיזם חד־חד ערכי) $phi.alt: G arrow.r S_n$.]
  אז קיימת $H<=S_n$ כך ש־$G tilde.eq H$.\
  נגדיר $L = QQ(t_1, dots.h.c, t_n)$ ו־$F = QQ(s_1, dots.h.c, s_n)$ כאשר $s_1, dots.h.c, s_n$ הם פולינומים סימטריים.\
  ההרחבה $L slash F$ היא הרחבת גלואה כי אנחנו בשדה ממציין $0$ ולכן כל פולינום אי־פריק הוא ספרבילי ואם $t_i$ הוא שורש ב־$L$ אז מהגדרת הפולינום הסימטריים אפשר לבטא אותו באמצעות פולינום סימטריים ולכן הוא מתפצל לחלוטין ב־$L$. אז מצאנו נורמליות + ספרבליות $<==$ גלואה.\
  בפרט מתקיים $Gal(L slash F) = S_n$ ו־$H$ שדה שבת ולכן ממשפט ארטין $K^H = { x in K bar forall sigma in H space sigma(x)=x}$ ולכן $Gal(L slash K) tilde.eq H tilde.eq G$.
]

#subquestion()
אם להרחבה סופית $L slash K$ אין תתי־הרחבות $K subset.neq F subset.neq L$ אז $[L:K]$ ראשוני.

#proof[
  לא יודעת, אבל התשובה *לא נכונה*.\
  הנימוק של מיכאל: $F = QQ(x_1, x_2, x_3, x_4), K=QQ(s_1, s_2, s_3, s_4)$ כאשר $s_1, s_2, s_3, s_4$ הפולינומים הסימטריים עם $4$ משנים וראינו ש־$L slash F$ גלואה.\
  נסתכל על $H = S_3 <= S_4$ ונסתכל על שדה השבת של $H$, $L=F^H$.\
  ממשפט ההתאמה, $[L:K]=abs(S_4)/abs(S_3) = 4$ ומצד שני אם הייתה תת־הרחבה $K subset.neq F subset.neq L$ כזאת אז מהמשפט היסודי של התאמת גלואה היה צריך להתקיים שיש התאמה ל־$S_3 <= scr(F)(F)<=S_4$, אבל אין כזאת תת־חבורה ולכן אין כזה שדה.
]
