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

#let deg = math.op("deg")
#let Aut = math.op("Aut")
#let Gal = math.op("Gal")

#question()
יהי $K$ שדה עם rank-$p$ של $1$ (כלומר, $[K:K^p]=p^1$).

#subquestion()
נוכיח שלכל $n in NN$, ל-$K$ יש בידיוק הרחבה אחת $L slash K$ שהיא בלתי־ספרבילית לחלוטין (אי־פרידה בטהורה) מדרגה $p^n$ וש־$L = K(a^(1 / p^n))$ עבור כל $a in K slash K^p$.

#proof[
  נראה קודם קיום: מכך ש־$[K : K^p]=p$, נובע ש־$K$ הוא מרחב וקטורי ממימד $1$ מעל $K^p$ ולכן $K=K^p (a)$ (כי $p$ ראשוני ולכן אין שדות ביניים בין $K$ לבין $K^p$) עבור $a in K without K^p$.\
  נגדיר $L = K(a^(1 / p^n))$, $alpha=a^(1 / p^n)$ ואז $alpha^p^n=a in K$, אז $alpha in overline(K)$ ולכן $alpha$ הוא שורש של הפולינום $x^p^n-a$, נראה שהוא אי־פריק:\
  נניח שהוא פריק ב־$K[x]$ ולכן $a in K^p^m$ עבור $m<n$ אבל אז $a in K^p$ (במגדל ההרחבות יש לנו הכלה) וזו סתירה, ולכן הפולינום אי־פריק ומתקיים $[K(alpha):K]=p^n$. ההרחבה הזאת אי־פרידה בטהרה: לפולינום $x^p^n-a$ יש רק שורש אחד (בגלל שהפרובניוס $x mapsto x^p$ היא העתקה אי־פרידה גם בגלל $gcd(f, f')=0$).\
  אז לפולינום הזה יש שורש יחיד והוא מהצורה $a^(1 / p^n)$ אז עבור $alpha=a^(1 / p^n)$ נקבל $alpha^p^n=a in K$ אבל $alpha^p^k in.not K$ לכל $k<n$ כי $a in.not K^p$, אז ההרחבה$L=K(alpha)$ היא הרחבה אי־פרידה בטוהרה מדרגה $p^n$ (זה מהתנאים השקולים גם לאי־פרידות בטהרה שראינו בהרצאה).\
  כעת, עלינו להראות יחידות: נניח כי $L' slash K$ היא הרחבה אי־פרידה בטהורה מדרגה $p^n$ נוספת, ולכן קיים $beta in L'$ כך ש־$L=K(beta)$ ומתקיים $beta^p^n = b in K$ וגם $x^p^n-b$ הוא פולינום אי־פריק מעל $K$, ולכן $L'=K(b^(1 / p^n))$ ונרצה להראות ש־$L=L'$: \
  מכך ש־$[K : K^p] = p$ ו־$K=K^p (a)$ עבור $a in K without K^p$ נובע שכל $b in K without K^p$ ניתן לביטוי על־ידי $b = c^p dot.op a$ עבור $c in K$, ומכיוון ש־$b^(1 / p^n), a^(1 / p^n)$ יוצרים הרחבות מדרגה $p^n$, בהכרח מתקיים
  $ b^(1 / p^n)=(c^p a)^(1 / p^n)= c^(1 / p^(n-1)) dot.op a^(1 / p^n) $
  אבל $c in K$ ולכן גם $c^(1 / p^(n-1)) in K$ וזה סוגר את היחידות.

]

#subquestion()
נוכיח שלכל הרחבה סופית $L slash K$ יש שדה ביניים $L slash L_i slash K$ כך ש־$L_i slash K$ היא בלתי־ספרבילית לחלוטין (אי־פרידה בטהורה) ו־$L slash L_i$ ספרבילית.

#proof[
  ראשית, מתקיים
  $ K subset.eq K^(1 / p) subset.eq K^(1 / p^2) subset.eq ... subset.eq K^(1 / p^n) $
  נבחר $L_i = L inter K^(1 / p^infinity)$ (משמע קיים $n in NN$ כך שמתקיים $L_i = L inter K^(1 / (p^n))$).\
  מסעיף א' אנחנו מקבלים $K^(1 / p^n) = K(alpha^(1 / p^n))$ עבור $alpha in K without K^p$ ולכן $L_i = L inter K(alpha^(1 / p^n))$.\
  קודם כל, $L_i subset.eq K^(1 / p^n)$ ולכן $L_i slash K$ הרחבה בלתי־ספרבילית לחלוטין לפי הטענה על תנאים שקולים שראינו בהרצאה.\
  נשאר להראת ש־$L slash L_i$ היא הרחבה ספרבילית, אבל נניח בשלילה שהיא לא ספרבילית: ולכן קיים $alpha in L$ כך שהפולינום המינימלי של $alpha$ מעל $L_i$ יש לו שורשים מרובים. מכיוון שאנחנו במציין $p$, הפולינום המינימלי של $alpha$ הוא מהצורה
  $ f(x)=(x-alpha)^p^k g(x) $
  עבור $g(x)$ פולינום ש־$alpha$ לא שורש שלו ו־$k>=1$.\
  אבל $L_i$ היא אי־פרידה בטהרה מעל $K$ ולכן כל איבר ב־$L_i$ הוא שורש של פולינום מהצורה $x^p^j-a$ עבור $a in K$.\
  היות ו־$alpha in L$ אבל $alpha in.not L_i$, נבחן את הפולינום המינימלי של $alpha$ מעל $L_i$. מההנחה, ההרחבה אי־פרידה בטוהרה ולכן הפולינום המינימלי של $alpha$ מעל $L_i$ הוא מהצורה
  $ f(x)=(x-alpha)^p^k, space k>=1 $
  ולכן $alpha$ הוא שורש של פולינום בלתי־ספרבילי לחלוטין מעל $L_i$. \
  אבל $L_i$ נוצר על־ידי איברים עם חזקות $p^m$ של $alpha_1, alpha_2, ..., alpha_n$ ולכן האיברים ב־$L_i$ הם מהצורה
  $ beta = c_1 alpha_1^(p^m)+c_2alpha_2^(p^m) + ... c_n alpha_n^(p^m) $
  עבור $c_i in K$, אבל $alpha_i$ הם לא חזקות $p^m$ ב־$L_i$ וזו סתירה להנחה (כי אחרת, אי אפשר לבנות את $alpha$ לפי חזקות $p^m$ אבל הנחנו שהפולינום בלתי־ספרבילי לחלוטין), ולכן קיבלנו סתירה ו־$L slash L_i$ הרחבה ספרבילית.
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
  ראשית, $QQ(xi_7) slash QQ$ היא הרחבת גלואה וממה שראינו $H <= Gal(QQ(xi_7) slash QQ)$ אז מהתזכורת גם מתקיים $[QQ(xi_7)^H : QQ] = 2$.\
  מסעיף ב' נובע ישירות כי $z in QQ(xi_7)^H$ ולכן בהכרח גם מתקיים
  $ [QQ(z) : QQ]<=[QQ(xi_7) : QQ]<=2 $
]

#subquestion()
נמצא $d in ZZ$ כך שמתקיים $QQ(z)=QQ(sqrt(d))$.

#solution[
  עלינו להסתכל על החלק המרוכב ועל החלק הממשי כי אנחנו מחפשים $d in ZZ$.\
  נשים לב שהחלק הממשי של $z$ מתקיים
  $ cal(R)(z) = sum_(i=1)^3 cos((2^i pi) / 7) = cos((2pi) / 7) + cos((4pi) / 7) + cos((8pi) / 7) = -1 / 2 $
  אז
  $ z = -1 / 2 + i dot.op y space (y in RR) $
  ולכן
  $ z=(-1+i sqrt(t)) / 2 $
  עבור $t>0$ כלשהו ואז נקבל $QQ(z)=QQ(sqrt(t))$.\
  נסתכל על המכפלה בצמוד ונחשב
  $
    z dot.op overline(z) = (xi_7+xi_7^2+xi_7^4) dot.op (xi_7^(-1)+xi_7^(-2)+xi_7^(-4)) = xi_7^0+xi_7^(-1)+xi_7^(-3)+xi_7+xi_7^0+xi_7^(-2)+xi_7^3+xi_7^2+xi_7^0 \
    =_(mod 7) = 3xi_0^7+xi_7^6+xi_7^4+xi_7+xi_7^5+xi_7^3+xi_7^2 = 3 + sum_(i=1)^6 xi_7^i =_(sum_(i=1)^6 xi_7^i=-1) 3-1 = 2
  $
  ונשים לב שמזהויות המרוכבים מתקיים
  $ z dot.op overline(z) = 2 = abs(z)^2 $
  וגם מתקיים
  $ z + overline(z) = xi_7+xi_7^2+xi_7^4 + xi_7^(-1)+xi_7^(-2)+xi_7^(-4) =_(mod 7) sum_(i=1)^6 xi_7^i = -1 $
  אז מתקיים
  $
    z = -1 / 2 + i dot.op sqrt(t) / 2 <==> 2 = abs(z)^2 = abs(-1 / 2 + i dot.op sqrt(t) / 2)^2 = 1 / 4+t / 4 <==> 8 = 1+t <==> t=7
  $
  נבחר $d=7$ ונקבל ש־$QQ(z)=QQ(sqrt(d))$.
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
