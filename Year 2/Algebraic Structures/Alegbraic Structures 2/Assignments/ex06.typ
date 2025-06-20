#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 06 --- מבנים אלגבריים 2, 80446 ],
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

#question()
יהי $xi_8 in CC$ שורש יחידה פרימיטיבי מסדר $8$. נמצא את כל תתי־ההרחבות הריבועיות של $QQ(xi_8) slash QQ$, כלומר את כל השדות $K$ כך שיתקיים \
$QQ subset.eq KK subset.eq QQ(xi_8)$ ו־$[K : QQ] = 2$.
#proof[
  ראשית
  $
    xi_8 = {e^((2k pi i) / 8) bar k in {1,3,5,7} space (gcd(k, 8)=1)} = { sqrt(2) / 2(1+i), sqrt(2) / 2(-1+i), -sqrt(2) / 2(1+i), sqrt(2) / 2(1-i)}
  $
  מסימטרייה סביב מעגל היחידה, נבחר $xi_8 = sqrt(2) / 2(1+i)$ ונקבל $i = sqrt(2)xi_8-1$ ולכן $i in QQ(xi_8), sqrt(2) in QQ(xi_8)$ ואז $QQ(i, sqrt(2)) subset.eq QQ(xi_8)$, אבל $xi_8 = 1 / sqrt(2) (i+1)$ ולכן $QQ(xi_8) = QQ(i, sqrt(2))$.\
  נסמן $L = QQ(xi_8)$ ונחפש את כל תתי־שדות $K$ של $L$ כך שיתקיים $[L : K]=2$. יהי $QQ subset.eq K subset.eq L$ כך ש־$[K : QQ] = 2$, זו הרחבה ריבועית ולכן קיים $d in QQ$ כך ש־$K = QQ(sqrt(d))$ ולכן $L = QQ(sqrt(-1), sqrt(2))$ וכמובן ש־$sqrt(-1) in.not QQ(sqrt(2))$, ולכן
  $[QQ(sqrt(-1), sqrt(2)) : QQ(sqrt(2))] > 1$, אבל $(-1)$ הוא שורש של $x^2+1 in QQ(sqrt(2))$ ולכן $[QQ(sqrt(-1), sqrt(2)) : QQ(sqrt(2))] > <=2$ ובסך־הכל $[QQ(sqrt(-1), sqrt(2)) : QQ(sqrt(2))] = 2$ ואז מכפליות הדרגה נקבל שמתקיים
  $ [QQ(sqrt(-1), sqrt(2)) : QQ] = [QQ(sqrt(-1), sqrt(2)) : QQ(sqrt(2))] dot.op [QQ(sqrt(2)) : QQ] = 2 dot.op 2 =4 $
  ואנחנו כבר יודעים להגיד שההרחבות
  $ QQ(sqrt(2)), QQ(sqrt(-1)), QQ(sqrt(-2)) $
  הן תתי־הרחבות ריבועיות של $QQ(sqrt(2), i) = QQ(xi_8)$.\
  משאלה $3$ במטלה $3$ נובע אם כך ש־$cal(B) = {1, sqrt(2), sqrt(-1), sqrt(-2)}$ הוא בסיס ל־$L$ וכל איבר ב־$L$ הוא מהצורה
  $ a + b sqrt(2) + c i + d sqrt(2)i space (a,b,c,d in QQ) $
  ונניח כי $alpha in QQ(sqrt(2), i)$ כך ש־$alpha^2 = d in QQ$ וגם $alpha in.not QQ(sqrt(2)), QQ(i), QQ(sqrt(-2))$. אז
  $
    alpha = a + b sqrt(2) + c i + d sqrt(2)i <==> a^2 = (a + b sqrt(2) + c i + d sqrt(2)i)^2 \
    <==> alpha^2 = a^2 - c^2 + 2sqrt(2)a b + 2 i a c + 2b^2 - 2d^2 + 2 sqrt(2) i a d + 2sqrt(2) i b c + 4 i b d + 2 sqrt(2) i^2 c d
  $
  אנחנו רוצים ש־$alpha^2 in QQ$, נסדר את הביטוי לעיל
  $
    alpha^2 = underbrace(a^2 + 2b^2 - c^2 - 2d^2, in QQ) + underbrace(2sqrt(2)a b- 2 sqrt(2) c d, in QQ(sqrt(2))) + underbrace(2 i a c + 4 i b d, in QQ(i)) + underbrace(2 sqrt(2) i a d + 2sqrt(2) i b c, in QQ(sqrt(-2)))
  $
  אז כדי ש־$alpha^2 in QQ$ צריך להתקיים
  $ 2sqrt(2)a b - 2 sqrt(2) c d + 2 i a c + 4 i b d + 2 sqrt(2) i a d + 2sqrt(2) i b c = 0 $
  ואז יש לנו את המערכת
  $ a b = c d, space a c = -2 b d, a d = -b c $
  נפתור ונקבל שיש תלות מלאה ביניהם ולכן יש לנו 4 מצבים אפשריים
  + $a = b = c = 0$ ואז ניתן לבחור $d$ ונקבל $alpha = d sqrt(2)i => alpha^2 = -2d^2$
  + $a = b = d = 0$ ואז ניתן לבחור $c$ ונקבל $alpha = c i => alpha^2 = -c^2$
  + $a = c =d = 0$ ואז ניתן לבחור $b$ ונקבל $alpha = b sqrt(2) => alpha^2 = 2b^2$
  + $c=d=b=0$ ואז ניתן לבחור $a$ ולקבל $alpha = a in QQ$ וזה לא פיתרון אפשרי להרחבה ריבועית
  אבל כל הפתרונות האלו הם עדיין בתוך $QQ(i), QQ(sqrt(2)), QQ(sqrt(-2))$.\
  שאר הפתרונות הלא טריוויאלים שנקבל יביאו לנו את התלויות
  $ c^2=-2b^2, d^2 = -b^2 ,a^2 = 2b^2 $
  וגם הם רק בתוך ההרחבות שמצאנו כבר אם ניקח שורשים.\
  ולכן התתי־הרחבות המבוקשים הם רק $QQ(sqrt(2)), QQ(i), QQ(sqrt(-2))$.
]

#question()
#subquestion()
נוכיח את הזהויות הבאות של פולינומים ציקלוטומים.
#sub_subquestion()
אם $n > 1$ אי־זוגי אז $Phi_(2n) (t) = Phi_n (-t)$.
#proof[
  אנחנו יודעים ששורשי היחידה הפרימטיביים מסדר $n$ נתונים על־ידי $e^((2pi i k) / n)$ עבור $gcd(k, n)=1$.\
  באותו אופן, שורשי היחידה הפרימיטיביים מסדר $2n$ נתונים על־ידי $e^((2pi i ell) / (2n))$ עבור $gcd(ell, 2n) = 1$.\
  עכשיו, אם $gcd(k, n)=1$ אז גם $gcd(2k+n, 2n)=1$. למה? כי אם נסמן $d = gcd(2k+n, 2n)$ אז $d divides (2k+n), d divides 2n$, ולכן בפרט $d divides (2k+n)-n = 2k$ כי הוא מחלק גם כל צירוף לינארי שלהם. לכן $d divides 2k, d divides 2n$ ולכן גם $d divides (2k, 2n) = 2 gcd (k,n) = 2$ ולכן $d in {1,2}$ בלבד. נראה ש־$d!=2$. נניח שלא, ולכן מתקיים
  $
    2 divides (2k + n) => 2k + n eq.triple 0 (mod 2) => n eq.triple -2k eq.triple 0 (mod 2) => n eq.triple 0 (mod 2) => 2 divides n
  $
  אבל מהנתון $n>1$ הוא אי־זוגי, וזאת סתירה ולכן $gcd(2k+n, 2n) = 1$.\
  אז מתקיים
  $
    Phi_(2n) (t) = product_(gcd(k, n)=1) (t-e^((2pi i(2k+n)) / (2n)))=_(e^(pi i)=-1) product_(gcd(k, n)=1) (t+e^((2pi i k) / n)) =_((star)) product_(gcd(k, n)=1) (-t-e^((2pi i k) / n)) = Phi_n (-t)
  $
  נצדיק את המעבר של $(star)$ ובזה נסיים: אנחנו יודעים שפולינום ציקלוטומי מסדר $n$ הוא יחיד ושהמקדם המוביל שלו הוא $1$ ודרגתו היא $phi_"אויילר"(n)$ אז עבור $xi$ שורש יחידה פרימיטיבי כלשהו מסדר $n$ מתקיים
  $ (-t-xi^k) = -(t+xi^k) = (-1)^(phi_"אויילר" (n)) (x+xi^k) $
  ומיחידות הפולינום הציקלוטומי (בגלל המקדם המוביל), ניתן להשמיט את הסימן.
]

#sub_subquestion()
אם $p$ ראשוני אז $Phi_(p n) (t) = Phi_n (t^p)$ אם $p divides n$ ואחרת $Phi_(p n) (t) = (Phi_n (t^p)) / (Phi_n (t))$.
#proof[
  יהי $p$ ראשוני ו־$n in NN$, באינדוקציה על $n$ נראה שמתקיים
  $ Phi_(p n) (t) = mycases(Phi_n (t^p), p divides n, (Phi_n (t^p)) / (Phi_n (t)), p divides.not n) $
  וראינו שעבור $p$ ראשוני מתקיים
  $ Phi_p (t) = (t^p-1) / (t-1) $
  וההגדרה של פולינום ציקלוטומי
  $ t^n-1 = product_(d divides n) Phi_d (t) => t^(p n) - 1 = product_(d divides p n) Phi_d (t) $
  נתתחיל מלהראות עבור $p divides.not n$ ונשתמש בהגדרה האינדוקטיבית שראינו ל־$Phi_n$
  $ Phi_n (t) = (t^p-1) / (product_(d divides n, d!=n) Phi_d) $
  ואכן, עבור $n=1$ מתקיים
  $ Phi_p (t) = (t^p-1) / (product_(d divides 1, d!=1) Phi_d) = (t^p-1) / (Phi_1 (t)) = (Phi_1 (t^p)) / (Phi_1 (t)) $

  #colbreak()

  נניח שהטענה נכונה עבור $n in NN$ כך ש־$p divides.not n$ ומתקיים
  $ Phi_(p n) (t) = (Phi_n (t^p)) / (Phi_n (t)) $
  ונחשב
  $
    Phi_(p n) (t) = (t^(p n)-1) / (product_(d divides p n \
    d!= p n) Phi_d (t)) = (t^(p n)-1) / (Phi_n (t) dot.op product_(d divides n \
    d !=n ) Phi_(p d) (t) dot.op product_(d divides n \
    d!=n) Phi_d (t)) =_("הנחת האינדוקציה") 1 / (Phi_n (t)) dot.op (t^(p n)-1) / (product_(p divides n \ p!=n)(Phi_d (t^p)) / (Phi_d (t))) dot.op 1 / (product_(d divides n\ d!= n) Phi_d (t)) \
    = ((t^p)^n-1) / (product_(p divides n \ p!=n)Phi_d (t^p)) dot.op 1 / (Phi_n (t)) = (Phi_n (t^p)) / (Phi_n (t)) / (product_(p divides n \ p!=n)Phi_d (t^p)) dot.op 1 / (Phi_n (t)) = (Phi_n (t^p)) / (Phi_n (t))
  $
  ניתן היה להפעיל את הנחת האינדוקציה כי אם $p divides.not n$ אז $p divides.not d$.\
  נראה כעת עבור המקרה בו $p divides n$ ולכן $n = p^ell k$ עבור $p divides.not k$ ונצטרך לעשות אינדוקציה על $ell$.\
  עבור בסיס האינדוקציה (יש פה אינדוקציה בתוך אינדוקציה), נניח ש־$ell=1$ ולכן $n = p k$, נחלק לשני מקרים
  + $k = 1$ ולכן $n = p$ ובמקרה זה מתקיים מצד אחד
    $ Phi_(p p) (t) = Phi_(p^2) (t) = t^p^2-1 $
    ומצד שני
    $ Phi_(p p) (t) = Phi_(p^2) (t) = product_(d divides p^2) Phi_d (t) = Phi_1 (t) Phi_p (t) Phi_(p^2) (t) $
    ולכן
    $ Phi_(p^2) (t) = (t^p^2-1) / (Phi_1 (t) Phi_p (t)) = (t^p^2-1) / ((t-1)((t^p-1) / (t-1))) = (t^p^2-1) / (t^p-1) $
    אבל
    $ Phi_p (t^p) = (t^p^p-1) / (t^p-1) = (t^p^2-1) / (t^p-1) $
    וזה סוגר את המקרה הזה.
  + לכל $d divides k$ נסמן $n' = p d$ מתקיים $Phi_(p n') (t) = Phi_n' (t^p)$ ואז
  $
    Phi_(p^2k) (t) = (t^(p^2k)-1) / (product_(d divides p^2k\ d != p^2k) Phi_d (t)) = (t^(p^2k)-1) / (product_(d divides k) Phi_d (t) product_(d divides k\
    p divides.not d) Phi_p^d (t) product_(d divides k\
    d != k) Phi_(p^2d) (t))=_(p divides.not d) ((t^p)^(p k)-1) / (product_(d divides k) Phi_d (t) product_(d divides k)((Phi_d (t^p)) / (Phi_d (t))) product_(d divides k \ d!=k) Phi_(p^2d) (t))
    \ =_("הנחת האינדוקציה" p divides k) ((t^p)^(p k)-1) / (product_(d divides k) Phi_d (t^p) product_(d divides k \ d!=k) Phi_(p d) (t^p)) = ((t^p)^(p k)-1) / (product_(d divides p k \ d != p k) Phi_d (t^p)) = Phi_(p k) (t^p)
  $
  נניח עכשיו שהטענה נכונה לכל $1<=ell' < ell$ ונראה שהטענה נכונה עבור $ell$, אז נסמן $n' = p^(ell')d$ שמתקיים $Phi_(p n') (t) = Phi_(n') (t^p)$ ואז
  $
    Phi_( p n) (t) = (t^(p n)-1) / (product_(d divides p n \ d != p n) Phi_d (t)) = (t^(p n)-1) / (product_(d divides p^ell k \ d != p^ell k) Phi_d (t))=((t^p)^n-1) / (product_(d divides k) Phi_d (t) product_(d divides k) Phi_(p d) (t)) product_(d divides k \ 1<=ell'<ell) Phi_(p p^(ell')d) (t^p)) \
    =_("הנחת האינדוקציה") ((t^p)^n-1) / (product_(d divides k) Phi_d (t) product_(d divides k) Phi_(p d) (t) product_(d divides k \ 1<=ell'<ell) Phi_(p^(ell')d) (t^p)) =_((star)) ((t^p)^n-1) / (product_(d divides n \ p divides.not d) Phi_d (t^p) product_(d divides p^ell k=n \ p divides d\ d!= p^ell k) Phi_d (t^p)) = ((t^p)^n-1) / (product_(d divides n \ d!=n) Phi_d (t^p)) = Phi_n (t^p)
  $
  היה ניתן להשתמש בהנחת האינדוקציה כי $p^(ell')k = n'$ ו־$(star)$ נובע מכך ש־$p divides.not d$ ולכן $Phi_(p d) (t) = (Phi_d (t^p)) / (Phi_d (t))$.
]

#subquestion()
נחשב את $Phi_n (t)$ לכל $1<=n<=10$.
#solution[
  ראינו שפולינום ציקלוטומי מסדר $n$ נתון על־ידי
  $ Phi_n = product_(n "שורש יחידה מסדר" omega) (x-omega) $
  אז
  $ Phi_1 = x-1, Phi_2 = x+1 $
  שכן $1$ הוא המספר המורכב היחידי מסדר $1$ ו־$(-1)$ הוא המספר המרוכב היחידי מסדר $2$.\
  באותו אופן, בגלל ש־${plus.minus i}$ הם המרוכבים היחידים מסדר $4$, כבר אפשר לנחש שמתקיים
  $ Phi_4 = (x-i)(x+i)=x^2+1 $
  נחשב גם את $Phi_3$ באותה דרך, אנחנו יודעים ש־$omega = -1 / 2 + (i sqrt(3) / 2)$ ואז ${omega, omega^2}$ הם שורשי יחידה פרימיטיביים מסדר $3$ ולכן
  $
    Phi_3 = (x-omega)(x-omega^2) = x^2-x omega^2 - x omega + omega^3 = x^2 - x (-1 / 2 + (i sqrt(3)) / 2)^2 -x (-1 / 2 + (i sqrt(3)) / 2) + 1 \ = x^2 - x(-cancel((i sqrt(3)) / 2) - 1 / 2) - x(-1 / 2 + cancel((i sqrt(3)) / 2)) + 1 = x^2+x+1
  $
  ניזכר שראינו במטלה $3$ שעבור $p$ ראשוני ו־$n in NN$, הפולינום הציקלוטומי מסדר $p^n$ הוא $(x^p^n-1) / (x^p^(n-1)-1)$. נשתמש בזה עבור $p = 5,7$ עם $n=1$ ונקבל
  $
    Phi_5 = (x^5^1-1) / (x^5^(1-1)-1) = (x^5-1) / (x-1) = ((x-1)(x^4+x^3+x^2+x+1)) / (x-1)=x^4+x^3+x^2+x+1 \
    Phi_7 = (x^7^1-1) / (x^7^(1-1)-1) = (x^7-1) / (x-1) = ((x-1)(x^6+x^5+x^4+x^3+x^2+x+1)) / (x-1) = x^6+x^5+x^4+x^3+x^2+x+1
  $
  את $Phi_6$ נחשב עם סעיף א' תת־סעיף א' ונקבל
  $ Phi_6 = Phi_(2 dot.op 3) (t) = Phi_3 (-t) = x^2-x+1 $
  ובאותו אופן אפשר גם את $Phi_10$
  $ Phi_10 = Phi(2 dot.op 5) (t) = Phi_5 (-t) = x^4-x^3+x^2-x+1 $
  עבור $Phi_9$, נשתמש עם סעיף א' תת־סעיף ב' עבור $p=n=3$ ונקבל
  $ Phi_9 = Phi_(3 dot.op 3) (t) = Phi_3 (t^3) = x^6+x^3+1 $
  אחרון חביב נשאר לחשב את $Phi_8$ ובאותו אופן ל־$Phi_9$ נבחר $p=2, n=4$ ונקבל
  $ Phi_8 = Phi_(2 dot.op 4) = Phi_2 (t^4) = x^4+1 $
  את אלו שנשארו, נחשב עם
  נשאר לחשב עבור $5<=n<=10$: מפונקציית $phi_"אויילר"(5)=5-1=4$ ולכן יש לנו ארבעה שורשי יחידה מסדר $5$
  בסך־הכל קיבלנו
  $
    Phi_1 = x-1, Phi_2 = x+1, Phi_3 = x^2+x+1, Phi_4 = x^2+1, Phi_5 = x^4+x^3+x^2+x+1 \
    Phi_6 = x^2-x+1, Phi_7 = x^6+x^5+x^4+x^3+x^2+x+1, Phi_8 = x^4+1, Phi_9 = x^6+x^3+1, Phi_10 = x^4-x^3+x^2-x+1
  $
]

#question()
בהרצאה ראינו ש־$FF_(p^d) slash FF_p$ היא הרחבה ציקלוטומית על־ידי שורש יחידה $xi$ מסדר $p^d -1$ ושבמצב כזה קיים שיכון $ Aut(FF_(p^d) slash FF_p) arrow.r.hook Aut(mu_(p^d-1)) arrow.r.tilde (ZZ slash (p^d-1)ZZ)^times $
נתאר את השיכון $Aut_(FF_p)(FF_(p^d)) = Fr_p^(ZZ slash d ZZ) arrow.r.hook (ZZ slash (p^d-1)ZZ)^times$ ונקבע את תמונת איבר הפרובניוס $Fr_p$.
#proof[
  אנחנו יודעים ש־$FF_(p^d)^times$ היא חבורה ציקלית ולכן נסמן $FF_(p^d)^times = angle.l xi angle.r$ עבור $xi in FF_(p^d)$ וכל $0!=alpha in FF_(p^d)^times$ הוא מהצורה $xi^k$ עם $k in ZZ slash (p^d-1)ZZ$ וכבר ראינו בהרצאה ובתרגיל הקודם ש־$mu_(p^d-1) = FF_(p^d)^times tilde.eq (ZZ slash (p^d-1)ZZ)$ באמצעות $exp$.\
  מכיוון שהשדה סופי, אנחנו יודעים שהפרובניוס הוא אוטומורפיזם (למה? אנחנו יודעים שפרובניוס הוא הומומורפיזם, והוא חד־חד ערכי כי אם $Fr_p (x) = Fr_p (y)$ אז $x^p=y^p$ ובגלל שאין מחלקי אפס כי זה תחום שלמות קיבלנו חד־חד ערכיות. וכל העתקה חד־חד ערכית מקבוצה אל עצמה היא על ולכן אוטומורפיזם) ולכן
  $ Aut_(FF_p) (FF_(p^d)) = {Fr_p^k : x mapsto x^p^k bar k in [d-1]} $
  היא חבורה ציקלית מסדר $d$ (כי $x^p^d=x$ לכל $x$ ואין חזקה נמוכה יותר שעושה את זה).\
  ניקח את $xi$ ממקודם, ומתקיים $Fr_p^k(xi) = xi^p^k$ ולכן לכל $k in [d-1]$ נקבל $ Fr_p^k : xi^m mapsto (xi^m)^p^k = xi^(m dot.op p^k) $ שזו בעצם מכפלה ב־$p^k mod (p^d-1)$ וזה בעצם אוטומורפיזם כפלי של החבורה הציקלית $mu_(p^d-1)$.\
  בגלל שאוטומורפיזם מכבד את מבנה החבורה נקבל $Fr_p^k in Aut_FF_p (FF_(p^d))$
  $ Fr_p^k mapsto [p^k] in (ZZ slash (p^d-1)ZZ)^times $

]

#question()
תהיי $q = p^k$ חזקת ראשוני. פולינום $f in FF_q [x]$ מדרגה $d > 1$ נקרא פרימיטיבי אם הוא אי־פריק וכל שורש של $f$ ב־$FF_(q^d)$ הוא יוצר של $FF_(q^d)^times$.

#subquestion()
נמצא דוגמה לשדה סופי $FF_q$ ולפולינום אי־פריק מדרגה $d>1$ מעל $FF_q$ שאינו פרימיטיבי.
#solution[
  נבחר $k = 1, p = 3$ והפולינום $f(x)=x^2+1$ הוא אי־פריק ב־$FF_3$ כי אין לו שורשים ולכן לפי מטלה $1$ הוא אי־פריק, ו־$deg(f)_FF_3 = 2$.\
  בהרצאה ראינו תרגיל שמתקיים $FF_9 = FF_3 (i)$ (זה נובע מכך של־$f(x)$ אין שורשים ב־$FF_3$, וכל איבר ב־$FF_3 (i)$ הוא מהצורה $a + b i in FF_3$ ו־$i^2=2$ ולכן יש לנו 9 צירופים אפשריים מקומבינטוריקה, וממשפט שראינו בהרצאה שלכל ראשוני $p in NN$ ו־$q = p^n$ עבור $n>=1$ קיים שדה $FF_q$ עם $q$ איברים והוא יחיד עד־כדי איזומורפיזם). אבל $f(sqrt(2)) = 2 + 1 = 0$ הוא שורש של $f(x)$ מעל $FF_3 (sqrt(2))$ ומהמשפט שהזכרנו נובע ש־$FF_9 tilde.eq FF_3 (sqrt(2))$.\
  אבל גם מתקיים $abs(FF_(q^d)^times) = 3^2-1=8$ ו־$(sqrt(2))^4=4=1 in FF_3 (sqrt(2))$ ולכן $o(sqrt(2)) <=4 < 8$ ולכן לא ייתכן ש־$sqrt(2)$ ייצור את $FF_(q^d)^times$.\
  זה עונה על תנאי השאלה.
]

#subquestion()
נראה שאם $alpha in FF_(q^d)$ יוצר את $FF_(q^d)^times$ אז המסלול שלו ב־$Aut(FF_(p^d) slash FF_q)$ מכיל $d$ איברים שונים.
#proof[
  יהי $alpha in FF_(q^d)$ יוצר של $FF_(q^d)^times$. אז המסלול שלו ב־$Aut(FF_(q^d) slash FF_q)$ זה קבוצת הצמודים שלו, $C_alpha$, אז
  $ abs(o(alpha)) = abs(C_alpha) = abs(deg(f)_(alpha slash FF_q)) = [FF_q (alpha) : FF_q] $
  אבל $alpha$ הוא יוצר של $FF_(q^d)^times$ ולכן $ [FF_q (alpha) : FF_q] = [ FF_(q^d) : FF_q] = d $
]

#subquestion()
נוכיח שיש בידיוק $(phi(q^d-1)) / d$ פולינומים פרימיטביים מתוקנים מדרגה $d$ ב־$FF_q [x]$.
#proof[
  ראינו ש־$FF_(q^d)^times$ היא חבורה ציקלית מסדר $q^d-1$ ולכן מספר היוצרים שלה הוא $phi(q^d-1)$, נסמן $A = { alpha in FF_(q^d)^times bar angle.l alpha angle.r = FF_(q^d)^times}$, קבוצת היוצרים.\
  כל פולינום אי־פריק $f in FF_q [x]$ מדרגה $d$ יש לו $d$ שורשים ב־$FF_(q^d) [x]$ אשר צמודים תחת הפרובניוס
  $ {alpha, alpha^q, alpha^q^d, ..., alpha^q^(d-1)} $
  עם המיפוי $sigma : x mapsto x^q$ (פורבניוס אוטומורפיזם ב־$FF_q$).\
  יהי $alpha in A$ הפולינום המינימלי המתוקן מעל $FF_q [x]$ עם $alpha$ בתור שורש הוא $f_alpha (x)$, אבל גם כל הצמדת פרבוניוס $alpha$ לעיל היא גם שורש של הפולינום המינימלי הזה, וזה אומר שכל המסלול של ההצמדה לעיל הם שורשים של $f_alpha (x)$, משמע יש $d$ שורשים: כל מסלול ההצמדה.\
  ברור שלכל פרימיטיבי אין את אותו המסלול כי יש לכל אחד מהם מסלול שונה תחת הצמדת הפרובניוס ולכן כל פולינום פרימטיבי מגיע ממסלול אחד בגודל $d$.\
  אז ראינו שכל הפרימטיביים הם בידיוק $phi(q^d-1)$ (זה גם בעצם $abs(A)$), כל מחלקת צמידות כזאת מתחלקת למסלולים שונים מגודל $d$ ולכן מספר המסלולים האלו, שכפי שראינו עכשיו זה מספר הפולינומים הפרימטיביים זה בידיוק $phi(q^d-1) / d$.

]
