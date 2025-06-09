#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 08 --- מבנים אלגבריים 2, 80446 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("ker")
#let deg = math.op("deg")
#let Fr = math.op("Fr")
#let Aut = math.op("Aut")
#let Gal = math.op("Gal")

#question()
יהי $K$ שדה עם rank-$p$ של $1$ (כלומר, $[K:K^p]=p^1$).

#subquestion()
נוכיח שלכל $n in NN$, ל-$K$ יש בידיוק הרחבה אחת $L slash K$ שהיא בלתי־ספרבילית לחלוטין (אי־פרידה בטהורה) מדרגה $p^n$ וש־$L = K(a^(1 / p^n))$ עבור כל $a in K slash K^p$.

#proof[

]

#subquestion()
נוכיח שלכל הרחבה סופית $L slash K$ יש שדה ביניים $L slash L_i slash K$ כך ש־$L_i slash K$ היא בלתי־ספרבילית לחלוטין (אי־פרידה בטהורה) ו־$L slash L_i$ ספרבילית.

#proof[

]

#question()
#subquestion()
נמצא תת־חבורה $H$ מאינדקס $2$ של $Gal(QQ(xi_7) slash QQ) tilde.eq ZZ slash 6 ZZ$ ונמצא במפורש אוטומורפיזם $sigma$ שיוצר אותה.

#proof[
  ראשית, מתקיים
  $ 2ZZ slash 6ZZ = {0+6ZZ, 2+6ZZ, 4+6ZZ} $
  שנית, $ [QQ(xi_7) : QQ] = phi_"אויילר" (7) = 6 $
  וממה שראינו מתקיים
  $
    Gal(QQ(xi_7) slash QQ) tilde.eq (ZZ slash 7 ZZ)^times = {1,2,34,5,6} => Gal(QQ(xi_7) slash QQ) tilde.eq ZZ slash 6ZZ
  $
  אנחנו צריכים $sigma$ אוטומורפיזם בגלואה משמר את $QQ$ ועושה תמורה על שורשי היחידה הפרימיטיביים
  $ {xi_7^1, xi_7^2, xi_7^3, xi_7^4, xi_7^5, xi_7^6} $
  אבל $xi_7$ יוצר את כולם ולכן $sigma$ נקבע ביחידות לפי לאן הוא שולח את $xi_7$ והוא כמובן נשלח לשורש יחידה אחר $xi_7^k$ עבור $k in [6]$ ועליו לכבד כפליות
  $ sigma(xi_7^m) = (sigma(xi_7))^m = xi_7^(k m) $
  אז $m mapsto k m mod 7 in Aut((ZZ slash 7ZZ)^times)$, וכפי שראינו זה בעצם $Aut(ZZ_6)$.
  עכשיו נגדיר $sigma : xi_7 mapsto xi_7^3$ ו־$3$ כי זה יוצר של $(ZZ slash 7ZZ)^times$ $ 3^1=_(mod 7)3, 3^2=9=_(mod 7)2, 3^3=27=_(mod 7)6, 3^4=81=_(mod 7)4, 3^5=243=_(mod 7)5, 3^6=729=_(mod 7)1 $
  ואז זה יוצר את כל החבורת גלואה. נשים לב שקיבלנו
  $ Gal(QQ(xi_7) slash QQ) = angle.l sigma angle.r tilde.eq ZZ_6 $
  אנחנו יודעים שתת־חבורה מאינדקס $2$ היא חבורה מסדר $3$, אז
  $ H = angle.l sigma^2 angle.r = {id, sigma^2, sigma^4} $
  ו־$H$ מכילה את האוטומורפיזמים
  $ xi_7 mapsto xi_7^(3^0)=xi_7, space xi_7^(3^2) mapsto xi_7^2, space xi_7^(3^4) mapsto xi_7^4 $

]

#subquestion()
נחשב את $z=sum_(h in H) h(xi_7)$ ונראה ש־$h(z)=z$ לכל $h in H$.

#proof[
  ראשית, מתקיים מסעיף א'
  $ z = xi_7 + xi_7^2 + xi_7^4 $
  ניקח $h in H$, אז מתקיים
  $ h(z) = h(xi_7) + h(xi_7^2) + h(xi_7^4) $
  אבל ראינו שמתקיים בסעיף א' $h=sigma_a in H$ הנתונה על־ידי $h(xi_7^k) = xi_7^(a k) mod 7$ עבור $a in {1,2,4}$.\
  עבור $a=1$ ראינו, נשאר להראות עבור $a=2, a=4$:
  $
    sigma_2 (z) = xi_7^2 + xi_7^4 + xi_7 = z \
    sigma_3 (z) = xi_7^4 + xi_7 + xi_7^2 = z
  $
  ולכן לכל $h in H$ מתקיים $h(z)=z$.
]

#subquestion()
נסיק שמתקיים $z in QQ(xi_7)^H$ וש־$[QQ(z) : QQ]<=2$.

#proof[

]

#subquestion()
נמצא $d in ZZ$ כך שמתקיים $QQ(z)=QQ(sqrt(d))$.

#proof[

]

#question()
יהי $K$ שדה, יהי $f in K[x]$ פולינום אי־פריק וספרבילי ויהי $L$ שדה פיצול של $f$ מעל $K$.

#subquestion()
נוכיח שאם כל שדה ביניים $L slash E slash K$ הוא נורמלי אז כל שורש של $f$ של $f$ יוצר את $L$ מעל $K$.

#proof[
  ראשית, $f in K[x]$ פולינום אי־פריק וספרבילי ולכן בשדה פיצול יש $alpha_1, ..., alpha_n in L$ שורשים שונים זה מזה ו־$L = K(alpha_1, ..., alpha_n)$ הרחבה סופית, ספרבילית ונורמלית ולכן הרחבת גלואה.\
  עלינו להראות שלכל שורש $alpha$ מתקיים $L = K(alpha)$.\
  היות ו־$f$ אי־פריק וספרבילי מעל $K$ ו־$alpha$ הוא שורש של $f$, ההרחבה $E=K(alpha) subset.eq L slash K$ היא הרחבה ספרבילית עם דרגה $r$ המקיימת $1<=r<=deg(f)$ ומההנחה גם נובע ש־$K subset.eq E subset.eq L slash K$ היא נורמלית מעל $K$.\
  היות וההרחבה נורמלית, נובע שהפולינום מתפצל לחלוטין ב־$K(alpha)$ ומכך ש־$f$ אי־פריק מעל $K$ ומתקיים $alpha in K(alpha)$ ולכן כל שאר הצמודים נמצאים ב־$K(alpha)$.\
  אבל $f$ מתפצל לחלוטין ב־$L$ (כי שדה פיצול) ואם $f$ מתפצל ב־$K(alpha)$ אז $K(alpha)$ חייב להכיל את כל שאר השורשים של $f$, משמע
  $K(alpha) = L$.
]

#subquestion()
נסיק שאם $Gal(L slash K)$ אבלית אז כל שורש של $f$ יוצר את $L$ מעל $K$.

#proof[
  נניח כי $Gal(L slash K)$ אבלית ולכן כל $H<=Gal(L slash K)$ היא נורמלית ב־$Gal(L slash K)$.\
  נסתכל על $L slash E slash K$, החבורה $Gal(L slash E) <= Gal(L slash K)$ ולכן $Gal(L slash E)$ נורמלית ב־$Gal(L slash K)$.\
  לכן מתקיים ש־$E = L^(Gal(L slash K))$ היא הרחבה נורמלית מעל $K$ ולכן מסעיף א' נקבל שכל שורש של $f$ יוצר את $L$ מעל $K$.
]

#question()
נסמן $f(x)=x^4-7x^2+7 in QQ[x]$ ויהי $L$ שדה פיצול של $f$.\
נסמן $beta_1, beta_2$ שני השורשים של המשוואה $y^2-7y+7=0$.

#subquestion()
נוכיח ש־$QQ(beta_1, beta_2) = QQ(beta_1)$ ושמתקיים $[QQ(sqrt(beta_1), sqrt(beta_2)) : QQ(beta_1)]=4$.

#proof[
  השורשים של $y^2-7y+7$ הם
  $ y = (7 plus.minus sqrt(49-28)) / 2=(7 plus.minus sqrt(21)) / 2 $
  נסמן בלי הגבלת הכלליות
  $ beta_1 = (7+sqrt(21)) / 2,space beta_2 = (7-sqrt(21)) / 2 $
  נשים לב שמתקיים $beta_2 = 7-beta_1$ כי
  $ beta_2 = (7-sqrt(21)) / 2 = 7-(7+sqrt(21)) / 2=(14-7-sqrt(21)) / 2=(7-sqrt(21)) / 2 $
  ולכן בהכרח מתקיים $QQ(beta_1, beta_2) = QQ(beta_1)$.\
  נשאר לחשב את $[QQ(sqrt(beta_1), sqrt(beta_2)) : QQ(beta_1)]$.\
  במטלה $5$ שאלה $3$ סעיף ב' ראינו שמתקיים $sqrt(beta_2) in.not QQ(sqrt(beta_1))$, ולכן בהכרח $[QQ(sqrt(beta_1), sqrt(beta_2)) : QQ(sqrt(beta_1))]=2$ כי הוספנו עוד איבר להרחבה.\
  מכפליות הדרגה נקבל
  $
    [QQ(sqrt(beta_1), sqrt(beta_2)) : QQ(beta_1)] = [QQ(sqrt(beta_1)) : QQ(beta_1)] dot.op [QQ(sqrt(beta_2)) : QQ(sqrt(beta_1))] = 2 dot.op 2 = 4
  $
]

#subquestion()
נסיק ש־$L = QQ(sqrt(beta_1), sqrt(beta_2))$ מדרגה $8$ מעל $QQ$.

#proof[
  נשים לב ש־$L$ היא הרחבה רדיקלית (נוצרת על ידי סיפוח של ביטוי שורשי לשדה הבסיס).\
  כמו־כן, במטלה $5$ שאלה $3$ סעיף ב' ראינו שההרחבה $QQ(sqrt(beta_1))$ היא הרחבה מדרגה $4$.
  מכפליות הדרגה וגם ממה שמצאנו בסעיף הקודם מתקיים
  $
    [QQ(sqrt(beta_1), sqrt(beta_2)) : QQ ] = [QQ(sqrt(beta_1), sqrt(beta_2)) : QQ(sqrt(beta_1))] dot.op [QQ(
        sqrt(beta_1)
      ) : QQ] = 2 dot.op 4 = 8
  $
]

#subquestion()
נמצא את טיפוס האיזומורפיזם של $Gal(L slash QQ)$.

#proof[
  תהיי $sigma in Gal(L slash QQ)$, מהגדרה אנחנו יודעים שמתקיים
  $
    sigma(sqrt(beta_1)) mapsto plus.minus sqrt(beta_1) \
    sigma(sqrt(beta_2)) mapsto plus.minus sqrt(beta_2)
  $
  בעצם יש לנו 8 אפשרויות שונות: זהות, שינוי סימן של אחד מהשורשים או שינוי סימן של שני השורשים (וכמובן יש גם שורש חיובי וגם שורש שלילי).\
  אז עלינו לחפש תתי־חבורות של $S_4$ (4 שורשים) מסדר $8$.\
  חבורות מסדר $8$ הן תת־חבורות $2$־סילו של $S_4$, ממשפט סילו השלישי יש או $1$ כזאת או $3$ כאלו, אבל $1$ לא אפשרית כי אז ממסקנה ממשפטי סילו היא תהיה תת־חבורה נורמלית של $S_4$ ואין ל־$S_4$ תת־חבורה נורמלית, ולכן יש $3$ חבורות $2$־סילו שהן צמודות זו לזו (ועל־כן איזומורפיות).\
  אפשר לספור את כמות החבורות מסדר $8$ בידיים, כי היא חבורת־$p$ סופית עבור $p=2$, ולכן יש לה מרכז לא טריוויאלי והיא נילפוטנטית.\
  נוכל לסווג אותן לחבורות אבליות ולא אבליות:\
  עבור החבורות האבליות, משפט המיון לחבורות אבליות נוצרות סופית נותן אותן בשלמותן: $C_8, C_4 times C_2, C_2 times C_2 times C_2$.\
  עבור החבורות הלא אבליות, אנחנו יודעים שהן $Q_8, D_4$ כאשר $Q_8$ היא חבורת הקווטרניונים.\
  ברור ש־$C_8 subset.not S_4$ כי אין ב־$S_4$ איבר מסדר $8$, וגם עבור $C_4 times C_2 subset.not S_4$ כי התתי־חבורות האבליות היחידות של $S_4$ היא חבורת קליין ו־$ZZ_4$, ומאותה סיבה גם $C_2 times C_2 times C_2 subset.not S_4$.\
  כמובן שגם $Q_8 subset.not S_4$ מטעמי מבנה, ולכן נשאר לבחון רק את $D_4$:
  $ D_4 = angle.l r, s bar r^4 = s^2 = e, s r s = r^(-1) angle.r $
  אכן כמובן $D_4$ מסדר 8, ואנחנו יודעים שאפשר להסתכל על $D_4$ כסימטריות של המלבן, ואנחנו יודעים ש־$D_4$ פועלת על ארבעת קודקודי הריבוע בצורה נאמנה: נמספר את הקודקודים $A,B,C,D$ ונסתכל על הפעולה של $D_4$ עליהם כאשר $r$ סיבוב ב־$90$ מעלות ו־$s$ שיקוף:
  $
    A mapsto_r B, space B mapsto_r C, space C mapsto_r D, space D mapsto_r A \
    A mapsto_(r^2) C, space B mapsto_(r^2) D, space C mapsto_(r^2) A, space D mapsto_(r^2) B \
    A mapsto_(r^2) D, space B mapsto_(r^3) A, space C mapsto_(r^3) B, space D mapsto_(r^3) C \
    A mapsto_(s) B, space B mapsto_(s) A, space C mapsto_(s) D, space D mapsto_(s) C \
    A mapsto_(s r) C, space B mapsto_(s r) D, space C mapsto_(s r) A, space D mapsto_(s r) B \
    A mapsto_(s r^2) D, space B mapsto_(s r^2) C, space C mapsto_(s r^2) B, space D mapsto_(s r^2) A \
    A mapsto_(s r^3) B, space B mapsto_(s r^3) A, space C mapsto_(s r^3) D, space D mapsto_(s r^3) C \
  $
  ולכן הפעולה היא נאמנה, ונשים לב שיצאה לנו פה תמורה ($A=1, B=2, C=3, D=4$) ולכן ניתן לשכן את $D_4$ לתת־חבורה של $S_4$ וכמובן מאותו סדר ($8$), ולכן קיבלנו שמתקיים $Gal(L slash QQ) tilde.eq D_4$.\
  ניקח $sigma in Gal(L slash QQ)$, מתקיימים אחד מהבאים
  $
    sigma(sqrt(beta_1)) mapsto -sqrt(beta_1), space sigma(sqrt(beta_2)) mapsto sqrt(beta_2) \
    sigma(sqrt(beta_1)) mapsto sqrt(beta_1), space sigma(sqrt(beta_2)) mapsto -sqrt(beta_2) \
    sigma(sqrt(beta_1)) mapsto sqrt(beta_2), space sigma(sqrt(beta_2)) mapsto sqrt(beta_1)
  $
  כאשר השניים הראשונים מקבילים ל־$r$ והאחרון זה $s$.
]
