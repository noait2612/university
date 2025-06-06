#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 07 --- מבנים אלגבריים 2, 80446 ],
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

#question()
#subquestion()
נמצא תת־חבורה $H$ מאינדקס $2$ של $Gal(QQ(xi_7) slash QQ) tilde.eq ZZ slash 6 ZZ$ ונמצא במפורש אוטומורפיזם $sigma$ שיוצר אותה.

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
  נניח כי $Gal(L slash K)$ אבלית
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
  ראשית, $Gal(L slash QQ)$ היא לא חבורה אבלית: מספיק שנסתכל על
  $
    sigma : sqrt(beta_1) mapsto - sqrt(beta_1), sqrt(beta_2) mapsto sqrt(beta_2) \
    tau : sqrt(beta_1) mapsto sqrt(beta_1), sqrt(beta_2) mapsto -sqrt(beta_2)
  $
  ונסתכל על ההרכבות $sigma tau, tau sigma$, מתקיים
  $ sigma compose tau(sqrt(beta_1)) = -sqrt(beta_1) != sqrt(beta_1) = tau compose sigma(sqrt(beta_1)) $
]
