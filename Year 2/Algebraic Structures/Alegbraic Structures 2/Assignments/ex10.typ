#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 10 --- מבנים אלגבריים 2, 80446 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#show sym.lt.eq: math.scripts

#let deg = math.op("deg")
#let Aut = math.op("Aut")
#let Gal = math.op("Gal")
#let char = math.op("char")
#let Tr = math.op("Tr")
#let Id = math.op("Id")
#let im = math.op("Im")
#let norma = math.op("N")

#question()
יהי $f in QQ[x]$ פולינום אי־פריק מדרגה $3$ ויהי $L$ שדה הפיצול.\
נוכיח ש־$[L:QQ]=3$ אם ורק אם $D_f$ ריבוע ב־$QQ$ ואחרת $[L:QQ]=6$.

#proof[
  נתחיל מלהראות אם האם ורק אם ואחרי זה נראה את האחרת.\
  $<==$ נניח כי $[L:QQ]=3$ ונרצה להראות ש־$D_f in QQ$.\
  מהתאמת גלואה אנחנו יודעים ש־$Gal(L slash QQ) <= S_3$, נסביר למה: $Gal(L slash QQ)$ מכילה את כל האוטומורפיזמים של $L$ שמשמרים את $QQ$, והם בעצם מבצעים תמורות על השורשים של $f$ שמדרגה $3$ ולכן יש לו שלושה שורשים $alpha_1, alpha_2,alpha_3$ שמהטרנזטיביות יכולים לעבור לשורש אחר והאוטומורפיזמים מכבדים כמובן את מבנה החבורה ולכן $Gal(L slash QQ) <= S_3$.\
  ל־$S_3$ יש שישה איברים ולכן ממשפט לגראנז' $Gal(L slash QQ) divides 6 = abs(S_3)$ וגם $Gal(L slash QQ)$ צריכה להיות טרנזטיבית ולכן $Gal(L slash QQ)$ היא או $S_3$ עצמה או $A_3$, הראשונה כמובן לא אפשרית כי $[L : QQ]=3$ ולכן $Gal(L slash QQ)=A_3$.\
  מהגדרת הדיסקרמיננטה נקבל
  $ D_f = product_(i<j) (alpha_i - alpha_j)^2 in QQ $
  ונשים לב ש־$sqrt(D_f) = product_(i<j) (alpha_i - alpha_j)$ הוא פולינום סימטרי ואינווריאנטי תחת תמורות זוגיות ולכן $sqrt(D_f) in L$ ובכלל שהחבורת גלואה כי $A_3$ כל האוטומורפיזמים של החבורת גלואה משמרים את $sqrt(D_f)$ ולכן $sqrt(D_f) in QQ => D_f = (sqrt(D_f))^2 in QQ^2$, כנדרש.\
  $==>$ בכיוון השני, נניח כי $D_f in QQ^2$ ונרצה להראות ש־$[L:QQ]=3$.\
  מההנחה, $sqrt(D_f) in QQ$ ומהגדרה $sqrt(D_f) = (alpha_1 - alpha_2)(alpha_1-alpha_3)(alpha_2-alpha_3)$ כאשר כמקודם $alpha_1, alpha_2, alpha_3$ שורשים של $f$.\
  אבל מכך ש־$sqrt(D_f) in QQ$ זה אומר שהוא נשמר תחת כל האוטומורפיזמים, ו־$sqrt(D_f)$ הוא אנטי־סימטרי (כי החלפה בסדר של ביטוי פנימי במכפלה משנה סימן), ולכן $sqrt(D_f)$ נשמר רק תחת תמורות זוגיות ולכן $Gal(L slash QQ) subset.eq A_3$, אבל זה בהכרח גורר כי $Gal(L slash QQ) tilde.eq A_3$ כי חבורת גלואה היא טרנזטיבית וכמובן כתת־חבורה היא צריכה לחלק את הסדר, אבל ל־$A_3$ אין תתי־חבורות טרנזטיביות מלבד עצמה.\
  אז $ Gal(L slash QQ) tilde.eq A_3 => abs(Gal(L slash QQ))=3 => [L : QQ = 3 $
  וזה סוגר את החלק הראשון, עבור החלק השני גם נראה את שני הכיוונים:\
  $<==$ נניח כי $[L:QQ]=6$ ונראה כי $D_f in.not QQ^2$.\
  מאותם נימוקים לעיל נובע כי $Gal(L slash QQ) = S_3$ (עם ההנחה נפסלת האפשרות של $A_3$), ולכן תמורות אי־זוגיות משנות את הסימן
  $ sigma(sqrt(D_f))= - sqrt(D_f) $
  וזה בהכרח אומר כי $sqrt(D_f) in.not QQ$ כי הוא לא נשמר תחת כל האוטומורפיזמים מחבורת גלואה ולכן $D_f in.not QQ^2$.\
  $==>$ בכיוון השני, נניח כי $D_f in.not QQ^2$ ונראה כי $[L:QQ]=6$.\
  אז $sqrt(D_f)$ משנה סימן תחת האוטומורפיזמים של חבורת גלואה, אבל הטרנזטיביות כמובן צריכה להישמר ומכיוון שחלק מהאוטומורפיזמים משנים סימן נובע שהחבורת גלואה מכילה תמורות אי־זוגיות ולכן היא לא $A_3$ ונשאר רק $Gal(L slash QQ) tilde.eq S_3$ ולכן $[L:QQ]=6$.
]

#question()
יהיו $F$ שדה ממציין שונה מ־$2$, $f in F[x]$ פולינום ספרבילי אי־פריק ומתוקן ו־$L$ שדה הפיצול של $f$ מעל $F$.\
נסמן ב־$alpha_1, dots.h.c alpha_n$ את שורשי $f$ ב־$L$ ונגדיר $K = F(sqrt(D_f))$ כאשר $D_f = product_(1<=i<j<=n) (alpha_i-alpha_j)^2$ היא הדיסקרמיננטה של $f$.\
נוכיח שמתקיים
$ Gal(L slash K) = {sigma in Gal(L slash F) bar sigma harpoon.tr_({alpha_1, dots.h.c alpha_n}) "תמורה זוגית"} $
כלומר, אם מזהים את $Gal(L slash F)$ עם תמונתה בחבורת התמורות $S_n tilde.eq op("Sym")({alpha_1, dots.h.c, alpha_n})$ אז $Gal(L slash K) = Gal(L slash F) inter A_n$.

#proof[
  מהיות $L$ שדה הפיצול של $f$ ומכך ש־$f$ פולינום ספרבילי, אי־פריק ומתוקן כל אוטומורפיזם ב־$Gal(L slash F)$ הוא תמורה על שורשי $f$, ולכן
  $ sigma dot.op alpha_i colon.eq sigma(alpha_i) $
  וזה מביא לנו הומומורפיזם כפי שראינו לחבורת התמורות, ונטען שהפעולה לעיל היא פעולה נאמנה: בעצם, $sigma=op("Id")$ וזה כי:
  $L$ נוצר על־ידי השורשים $alpha_1, dots.h.c, alpha_n$, ולכן אם $sigma$ נקבע על־ידי $alpha_1 dots.h.c alpha_n$ הוא מקבע את כל איברי $L$, לכן $Gal(L slash F) arrow.r.hook S_n$ (הגרעין של ההומומורפיזם הוא טריוויאלי ולכן חד־חד ערכי והפעולה נאמנה. היא כמובן גם טרנזטיבית כי הפולינום $f$ הוא אי־פריק וספרבילי ולפי טענה שראינו זה אומר שחבורת גלואה פועלת בצורה טרנזטיבית במקרה זה על השורשים של הפולינום).\
  אז $Gal(L slash F)$ הוא תת־חבורה של חבורת התמורות וכל $sigma in Gal(L slash F)$ מקיימת $sigma : alpha_i mapsto alpha_(sigma(i))$.\
  אם נסתכל על הדיסקרמיננטה נקבל
  $
    sqrt(D_f) = product_(i<j) (alpha_i - alpha_j) =>_(sigma in Gal(L slash F)) sqrt(D_f) mapsto^sigma product_(i<j)(sigma(alpha_i)-sigma(alpha_j))=product_(i<j)(alpha_sigma(i)-alpha_sigma(j)) = op("sgn")(sigma) dot.op sqrt(D_f)
  $
  זאת־אומרת $sigma(sqrt(D_f))=sqrt(D_f)$ אם $sigma$ תמורה זוגית ו־$sigma(sqrt(D_f))=-sqrt(D_f)$ אפ $sigma$ תמורה אי־זוגית.\
  אז נגדיר
  $
    H colon.eq { sigma in Gal(L slash F) bar sigma(sqrt(D_f))=sqrt(D_f)} =_"מהנימוק למעלה על זוגיות" {sigma in Gal(L slash F) bar op("sgn")(sigma)=+1}
  $
  אבל נשים לב ש־$H = Gal(L slash K)$! למה? כי $K=F(sqrt(D_f))$ משמע כל $sigma$ מקבעת את $sqrt(D_f)$ (מהמשפט היסודי של תורת גלואה).\
  נשים לב שבידיוק מתקיים אם כך $Gal(L slash K)=Gal(L slash F) inter A_n$.
]

#question()
יהיו $F$ שדה, $f in F[x]$ פולינום ספרבילי, אי־פריק ומתוקן ו־$L$ שדה הפיצול של $f$ מעל $F$.\
אם $0!= p = char(F)$, נניח ש־$p divides.not abs(Gal(L slash F))=n$ ותהיי $H <= Gal(L slash F)$.

#subquestion()
נגדיר העתקה לינארית $A_H : L arrow.r L$ על־ידי $A_H (x) = 1 / abs(H) sum_(sigma in H) sigma(x)$.\
נוכיח ש־$A_H$ היא הטלה על $L^H$, כלומר $im(A_H) = L^H$ ו־$A_H harpoon.tr_(L^H) = Id_(L^H)$

#proof[
  נתחיל מלהראות ש־$im(A_H)=L^H$ באמצעות הכלה דו־כיוונית:\
  $im(A_H) subset.eq L^H$: נרצה להראות שלכל $x in L$ מתקיים $A_H (x) in L^H$, בשביל זה ניקח $tau in H$ ונחשב עבור $x in L$ שרירותי
  $
    tau(A_H (x))= tau(1 / abs(H) sum_(sigma in H) sigma(x)) =_(abs(H)=m) 1 / m sum_(sigma in H) (tau sigma)(x) =_({tau sigma bar sigma in H}=H "ולכן" "חבורה" H) 1 / m sum_(sigma in H) sigma(x)
  $
  זה אומר ש־$A_H (x) in L^H$ לכל $x in L$ ומביא לנו את ההכלה בכיוון הזה.\
  $L^H subset.eq im(A_H)$: מספיק שנראה ש־$A_H harpoon.tr_(L^H) = Id_(L^H)$.\
  ניקח $x in L^H$ ולכן לכל $sigma in H$ מתקיים $sigma(x)=x$, אז
  $
    A_H (x) = 1 / abs(H) sum_(sigma in H) sigma(x) =_(abs(H) = m) 1 / m dot.op m dot.op x = x
  $
  ולכן $A_H harpoon.tr_(L^H) Id_(L^H)$, וזה גם אומר שלכל $y in L$ מתקיים $A_H (y) = y$ וזה מביא לנו את ההכלה בכיוון השני.\
  מצאנו הכלה דו־כיוונית ולכן $im(A_H)=L^H$ ולכן $A_H$ היא הטלה על $L^H$.
]

#subquestion()
נסיק שאם $cal(B)=(b_1, dots.h.c b_n)$ בסיס ל־$L$ מעל $F$ אזי $op("Spna")(A_H (b_1), dots.h.c A_H (b_n)) = L^H$.

#proof[נראה באמצעות הכלה דו־כיוונית:\
  $op("Span")(A_H (b_1), dots.h.c, A_H (b_n)) subset.eq L^H$: ניקח $b_i in cal(B)$, אז מתקיים
  $ A_H (b_i) = 1 / abs(H) sum_(sigma in H) sigma(b_i) in L^H $
  וזה סוגר את ההכלה בכיוון הזה, זה כבר נובע מתהליכים שעשינו בסעיף א' אבל ארשום שוב: כי אם ניקח $tau in H$ נקבל
  $
    tau(A_H (b_i)) = sigma(1 / abs(H) sum_(sigma in H) sigma(b_i))=1 / m sum_(sigma in H) (tau sigma)(b_i)=_("חבורה" H) 1 / m sum_(rho in H) rho(b_i)=A_H (b_i)
  $
  $tau in H$ שרירותי וקיבלנו ש־$tau(A_H (b_i)) = A_H (b_i)$ ולכן זה נכון לכל $tau in H$ ולכן $A_H (b_i) in L^H = {x in L bar sigma(x)=x forall sigma in H}$.\
  $op("Span")(A_H (b_1), dots.h.c, A_H (b_n)) supset.eq L^H$: ניקח $b_i in cal(B)$: ניקח $y in L^H$, בגלל ש־$cal(B)$ בסיס ל־$L$ מעל $F$, מתקיים
  $ y=sum_(i=1)^n c_i b_i space (c_i in F) $
  בפרט מתקיים
  $ A_H (y) = A_H (sum_(i=1)^n c_i b_i) = sum_(i=1)^n c_i A_H (b_i) $
  אבל מסעיף א' אנחנו יודעים שמתקיים $A_H (y) = y$ ולכן
  $ y = sum_(i=1)^n c_i A_H (b_i) $
  וזה מביא לנו את ההכלה בכיוון השני.\
  הראינו הכלה דו־כיוונית ולכן $op("Spna")(A_H (b_1), dots.h.c A_H (b_n)) = L^H$.
]

#subquestion()
נמצא דוגמה ל־$F, f, L, H$ כבשאלה ו־$alpha in L$ כך ש־$F(alpha) = L$ אבל $F(A_H (alpha)) subset.eq.not L^H$.

#proof[
  נגדיר
  $ F = QQ, f(x) = x^3-2, alpha = xi_3 root(3, 2), L^H = F(xi_3) $
  וכן
  $ H = A_3 = {xi_3 mapsto xi_3^i bar 0<=i<=2} $
  ונקבל
  $ A_H (alpha) = 1 / 3 sum_(sigma in H) sigma(alpha) = 1 / 3 sum_(i=0)^2 xi_3^i root(3, 2) = 0 $
  ואז
  $ F(A_H (alpha)) = F(0) = F subset.eq.not L $
]

#question()
נביט בפולינום $f(x)=x^4-7x^2+7 in QQ[x]$.\
בתרגיל $8$ ראינו שחבורת גלואה של שדה הפיצול $L$ של $f$ איזומורפית ל־$D_4$.\
אם $beta_1, beta_2$ הם השורשים של $y^2-7y+7=0$ אז $plus.minus sqrt(beta_1),plus.minus sqrt(beta_2)$ הם ארבעת שורשי $f$ (שמוגדרים היטב כי $beta_1, beta_2$ ממשיים חיוביים).\
נמצא את שמונה התמורות של השורשים שמושרות מאיברי $Gal(L slash QQ)$.

#proof[
  נעזר ברמז: לא ייתכן ש־$sigma in Gal(L slash QQ)$ תקיים $sigma(sqrt(beta_1)) in {sqrt(beta_2), -sqrt(beta_2)}$ ו־$sigma(-sqrt(beta_1)) in {sqrt(beta_1), -sqrt(beta_1)}$ כי חייב להתקיים $sigma(sqrt(beta_1))+sigma(-sqrt(beta_1))=sigma(sqrt(beta_1)-sqrt(beta_1))=0$, ונפעיל שיקולים דומים כדי לפסול את כל התמורות פרט ל־$8$.\
  מהרמז אנחנו מקבלים $sigma(-sqrt(beta_1))=-sigma(sqrt(beta_1))$, ולכן אם $sigma(sqrt(beta_1))=sqrt(beta_2)$ אז $sigma(-sqrt(beta_1))=-sqrt(beta_2)$, ואז נקבל שגם מתקיים $sigma(sqrt(beta_1)), sigma(-sqrt(beta_1)) in {plus.minus sqrt(beta_2)}$.\
  נשים לב שלא ייתכן $sqrt(beta_1) mapsto sqrt(beta_2)$ וגם $-sqrt(beta_1) mapsto -sqrt(beta_1)$ כי אז
  $sigma(sqrt(beta_1))+sigma(-sqrt(beta_1))=sqrt(beta_2)-sqrt(beta_1) !=0$
  אז כבר מצאנו תמורה לא תקינה.\
  גם אם נמשיך ונכתוב את הקומבינציות האלו ידנית נגיע לתמורות לא כשרות; זאת מכיוון שחבורת גלואה צריכה למפות כל זוג ${sqrt(beta_i), -sqrt(beta_i)}$ לזוג מתאים בצורה 'קונסיסטנטית' זאת אומרת שאם $sqrt(beta_1) mapsto sqrt(beta_2)$ אז חייב שיתקיים גם $-sqrt(beta_1) mapsto -sqrt(beta_2)$ (כמובן אפשר גם להחליף בין הצמדים האלו, זאת־אומרת $sqrt(beta_1) mapsto -sqrt(beta_2), -sqrt(beta_1) mapsto sqrt(beta_2)$), או לחילופין תמורת הזהות $sqrt(beta_1) mapsto sqrt(beta_1)$ או התמורה מחליפת סימן $sqrt(beta_1) mapsto -sqrt(beta_1)$.\
  אז כל תמורה חייבת לשמר את הזוג או להחליף אותו בשלמותו עם זוג אחר – אין אמצע.\
  קומבינטורית, יש לנו 2 זוגות של שורשים ${plus.minus sqrt(beta_1)}, {plus.minus sqrt(beta_2)}$, ויש לנו את אחת מהאופציות הבאות:
  + או שאנחנו מחליפים בין הזוגות ויש לכך $2$ אופציות
  + בצורה בלתי תלויה, להחליף בין הסימנים בתוך כל זוג ולכן יש לנו $2$ אפשרויות בכל זוג
  זה באמת נותן לנו $2 dot.op 2 dot.op 2 = 8$ אפשרויות כמו שנדרשנו למצוא, נרשום בצורה ישירה (לכתוב טבלאות זה קשה):

  #set table(stroke: (_, y) => if y > 0 { (top: 0.8pt) })
  #table(
    columns: 5,
    align: center,
    table.header(
      [*מספר תמורה*],
      [*החלפת זוגות*],
      [*שינוי סימן ${plus.minus sqrt(beta_1)}$*],
      [*שינוי סימן ${plus.minus sqrt(beta_2)}$*],
      [*מיפוי*],
    ),

    [$ sigma_1 $],
    [$crossmark$],
    [$crossmark$ ],
    [$crossmark$],
    [$
        sqrt(beta_1) mapsto sqrt(beta_1), -sqrt(beta_1) mapsto -sqrt(beta_1) \
        sqrt(beta_2) mapsto sqrt(beta_2), -sqrt(beta_2) mapsto -sqrt(beta_2)
      $
    ],

    [$ sigma_2 $],
    [$crossmark$],
    [$checkmark$],
    [$crossmark$],
    [$
        sqrt(beta_1) mapsto -sqrt(beta_1), -sqrt(beta_1) mapsto sqrt(beta_1) \
        sqrt(beta_2) mapsto sqrt(beta_2), -sqrt(beta_2) mapsto -sqrt(beta_2)
      $
    ],

    [$ sigma_3 $],
    [$crossmark$],
    [$crossmark$],
    [$checkmark$],
    [$
        sqrt(beta_1) mapsto sqrt(beta_1), -sqrt(beta_1) mapsto -sqrt(beta_1) \
        sqrt(beta_2) mapsto -sqrt(beta_2), -sqrt(beta_2) mapsto sqrt(beta_2)
      $
    ],

    [$ sigma_4 $],
    [$crossmark$],
    [$checkmark$],
    [$checkmark$],
    [$
        sqrt(beta_1) mapsto -sqrt(beta_1), -sqrt(beta_1) mapsto sqrt(beta_1) \
        sqrt(beta_2) mapsto -sqrt(beta_2), -sqrt(beta_2) mapsto sqrt(beta_2)
      $
    ],

    [$ sigma_5 $],
    [$checkmark$],
    [$crossmark$],
    [$crossmark$],
    [$
        sqrt(beta_1) mapsto sqrt(beta_2), -sqrt(beta_1) mapsto -sqrt(beta_2) \
        sqrt(beta_2) mapsto sqrt(beta_1), -sqrt(beta_2) mapsto -sqrt(beta_1)
      $
    ],

    [$ sigma_6 $],
    [$checkmark$],
    [$checkmark$],
    [$crossmark$],
    [$
        sqrt(beta_1) mapsto -sqrt(beta_2), -sqrt(beta_1) mapsto sqrt(beta_2) \
        sqrt(beta_2) mapsto sqrt(beta_1), -sqrt(beta_2) mapsto -sqrt(beta_1)
      $
    ],

    [$ sigma_7 $],
    [$checkmark$],
    [$crossmark$],
    [$checkmark$],
    [$
        sqrt(beta_1) mapsto sqrt(beta_2), -sqrt(beta_1) mapsto -sqrt(beta_2) \
        sqrt(beta_2) mapsto -sqrt(beta_1), -sqrt(beta_2) mapsto sqrt(beta_1)
      $
    ],

    [$ sigma_8 $],
    [$checkmark$],
    [$checkmark$],
    [$checkmark$],
    [$
        sqrt(beta_1) mapsto -sqrt(beta_2), -sqrt(beta_1) mapsto sqrt(beta_2) \
        sqrt(beta_2) mapsto -sqrt(beta_1), -sqrt(beta_2) mapsto sqrt(beta_1)
      $
    ],
  )
]
