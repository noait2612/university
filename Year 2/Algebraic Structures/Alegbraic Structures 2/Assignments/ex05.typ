#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- מבנים אלגבריים 2, 80446 ],
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
#let Aut = math.op("Aut")

#question()

#subquestion()
נוכיח שחבורה אבלית סופית היא מכפלה ישרה של חבורות הסילו שלה.\
נסיק שאם $n = p_1^(k_1) dot.op ... dot.op p_r^(k_r)$ פירוק לחזקות של ראשוניים שונים אז $ZZ_(p_1^(k_1)) times ... times ZZ_(p_r^(k_r)) tilde.eq ZZ_n$ ושהאיזומורפיזם הזה שולח את הקבוצה
$
  {(x_1, ..., x_r) bar space forall 1<=i<=r, space angle.l x_i angle.r = ZZ_(p_i^(k_i)) } mapsto { x in ZZ_n bar angle.l x angle.r = ZZ_n}
$
#proof[
  נסמן $abs(A) = n = p_1^a_1 dot.op ... dot.op p_k^a_k$ עבור $p_1, ..., p_k$ שונים זה מזה.\
  ממשפט סילו הראשון נובע שקיימות תתי־חבורות $A_p_1, ..., A_p_k$ כל אחת מסדר $p_i$ מתאים, וממשפט לגראנז' נובע שלכל $i!=j in [k]$ מתקיים $A_p_i inter A_p_j = {e}$, ולכן מתאמי סדר נקבל
  $ A = A_p_1 times A_p_2 times ... times A_p_k $
  ונגדיר $phi: A_p_1 times A_p_2 times ... times A_p_k arrow.r A$ על־ידי $phi(a_1, ..., a_k) = a_1 dot.op ... dot.op a_k$.\
  היות ו־$A$ אבלית, נובע שהמכפלה $a_1 dot.op ... dot.op a_k$ לא תלויה בסדר המכפלה ומכאן נובע ישר כי $phi$ הוא הומומורפיזם.\
  נניח כי $phi(a_1, ..., a_k) = e$ ולכן $a_1 dot.op ... dot.op a_k = e$, היות וכל איבר במכפלה הוא מסדר $p_i$ מתאים (ששונים זה מזה מההנחה) ונקבל שכל $a_i = e$.\
  אם נניח בשלילה כי $a_1 != e$, נקבל $a_1 = (a_2 dot.op ... dot.op a_k)^(-1)$, אבל $p_1 divides.not o(a_2 dot.op ... dot.op a_k)^(-1)$ בגלל שזו מכפלה של איברים מסדר שהוא זר ל־$p_1$ וזו סתירה, ולכן $a_1 = ... = a_k = e$ משמע $ker(phi) = e$ ולכן $phi$ חד־חד ערכית.\
  $phi$ על, כי אם ניקח $a in A$ והוא יהיה בידיוק ב־$A_p_i$ יחיד ולכן בלי הגבלת הכלליות נניח כי $a in A_p_1$ ונוכל לבחור $phi(a, e, ..., e) = a$.\
  לכן $phi$ איזומורפיזם וקיבלנו ש־$A$ איזומורפית למכפלה של החבורות סילו שלה.\
  עבור ההסקה, נבחין שזה נובע ממשפט השאריות הסיני: היות ו־$n = p_1^(k_1) dot.op ... dot.op p_r^(k_r)$ ראשוניים שונים זה מזה נובע כי לכל $i!=j in [r]$ מתקיים $gcd(p_i^k_i, p_j^k_j) = 1$ וזאת גם בידיוק המכפלה של החבורות סילו מההוכחה לעיל וממשפט השאריות הסיני נקבל ש־$ ZZ_(p_1^(k_1)) times ... times ZZ_(p_r^(k_r)) tilde.eq ZZ_n $
  הנתון על־ידי $phi : ZZ_(p_1^(k_1)) times ... times ZZ_(p_r^(k_r)) arrow.r ZZ_n$, ואיזומורפיזם מכבד את מבנה החבורה ולכן שולח יוצרים ליוצרים ולכן היוצרים של \
  $ZZ_(p_1^(k_1)) times ... times ZZ_(p_r^(k_r))$ נשלחים ליוצרים של $ZZ_n$.\
]

#subquestion()
נוכיח ש־$Aut(ZZ slash n ZZ) tilde.eq (ZZ slash n ZZ)^times$ ובנוסף שאם $n = p_1^(k_1) dot.op ... dot.op p_r^(k_r)$ פירוק לחזקת ראשוניים שונים אז $ (ZZ slash n ZZ)^times tilde.eq (ZZ slash p_1^k_1 ZZ)^times times ... times (ZZ slash p_r^k_r ZZ)^times $
#proof[
  ראשית, $1$ יוצר את $ZZ slash n ZZ$ ולכן להגדיר את $f in Aut(ZZ slash n ZZ)$ זה כמו להגדיר את $f(1)$.\
  $f$ היא חד־חד ערכית ועל כי חייב להתקיים $o(f(1)) = n$ וממבנים1 אנחנו כבר יודעים שזה שקול לכך ש־$gcd(f(1), n) = 1$.\
  אם $g in Aut(ZZ slash n ZZ)$ אז
  $
    g compose f(1) = g(f(1)) = g(underbrace(1 + ... + 1, " פעמים " f(1)))= underbrace(g(1) + ... + g(1), " פעמים " f(1)) = g(1)f(1)
  $
  משמע $Aut(ZZ slash n ZZ)$ איזומורפית לחבורה שאיבריה הם המספרים הטבעיים הקטנים מ־$n$ וזרים לו עם פעולת הכפל, וזה בידיוק $(ZZ slash n ZZ)^times$.\
  נניח ש־$n = p_1^(k_1) dot.op ... dot.op p_r^(k_r)$ פירוק לחזקת ראשוניים שונים ולכן מהסעיף הקודם
  $
    Aut(ZZ slash n ZZ) tilde.eq Aut(ZZ_(p_1^(k_1)) times ... times ZZ_(p_r^(k_r))) tilde.eq Aut(ZZ_(p_1^(k_1))) times ... times Aut(ZZ_(p_r^(k_r)))
  $
  ויחד עם מה שהראינו מתקיים
  $
    (ZZ slash n ZZ)^times tilde.eq Aut(ZZ slash n ZZ) => (ZZ slash n ZZ)^times tilde.eq Aut(ZZ_(p_1^(k_1))) times ... times Aut(ZZ_(p_r^(k_r))) tilde.eq (ZZ_(p_1^(k_1)))^times times ... times (ZZ_(p_r^(k_r)))^times
  $
]

#subquestion()
תהיי $(A, +)$ חבורה אבלית סופית. נסיק מסעיף א' שאם לכל $p$ ראשוני כך ש־$p divides abs(A)$ מתקיים ש־$A[p] = { a in A bar exists k in NN space s.t. space p^k a = 0 }$ ציקלית אז $A$ ציקלית.
#proof[
  היות ו־$A$ חבורה אבלית סופית נובע שהיא מכפלה ישרה של החבורות סילו שלה, ולכן
  $ A tilde.equiv ZZ_(p^(k_1)) times ... times ZZ_(p^(k_m)) $ עבור $k_1 + ... + k_m = n$ ונבחן את
  $ A[p] = { a in A bar exists k in NN space s.t. space p^k a = 0 } $
  ולכן מהגדרה נובע שכל חבורת $p_i$ סילו של $A$ מוכלת ב־$A[p]$ ולכן $p_i^(k_i) divides abs(A[p])$.\
  מההנחה כי $A[p]$ ציקלית, נובע שקיים $a in A[p]$ מסדר $p_i^(k_i)$ ולכן $angle.l a angle.r$ היא חבורת סילו של $A$ שהיא ציקלית. \
  זה נכון לכל $p_i^(k_i)$ במכפלה, ולכן נקבל ש־$A$ היא מכפלה ישרה של חבורות ציקליות מסדרים שונים ובמקרה זה נקבל ש־$A$ ציקלית: נראה רק למקרה של מכפלה של $2$ חבורות ציקליות מסדרים שונים, והמקרה הפרטי הזה מספיק להוכחה של כל מכפלה ישרה סופית: נניח שיש לנו $C_n, C_m$ שתי חבורות ציקליות מסדרים זרים ואנחנו יודעים ש־$C_n times C_m = {(x,y) bar x in C_n, y in C_m}$.\
  נניח ש־$C_n times C_m$ לא ציקלית, ולכן לכל $x in C_n times C_m$ מתקיים $o(x) < n m$, ולכן $lcm(n, m)< n m$ וזה בהכרח גורר ש־$gcd(n, m)>1$, אבל הנחנו שהסדרים זרים זה לזה ולכן $gcd(n, m)=1$ וזאת סתירה, ולכן מכפלה ישרה של חבורות ציקליות מסדרים זרים היא ציקלית ומאינדוקציה נקבל ש־$A$ ציקלית.
]

#subquestion()
נוכיח שאם $(A, +)$ אבלית מסדר $p^n$ ל־$p$ ראשוני כלשהו ובנוסף ל־$A$ יש תת־חבורה ציקלית יחידה מסדר $p$ אז $A$ ציקלית.
#proof[
  אם $n=1$ אז הטענה טריוויאלית, ולכן נניח ש־$n>1$.\
  מסעיף א' נסיק שמתקיים
  $A tilde.equiv ZZ_(p^(k_1)) times ... times ZZ_(p^(k_m))$ עבור $k_1 + ... + k_m = n$.
  נגדיר
  $ A[p] colon.eq { x in A bar p x = e} $
  תת־חבורת פיתול של האיברים מסדר המחלק את $p$, וזה מרחב וקטורי מעל $FF_p$ שמימדו הוא $dim_FF_p A[p] = k$, כי במילים אחרות תת־חבורת הפיתול היא המכפלה הישרה של כל $ZZ slash p^(a_i) ZZ$.\
  נטען כעת שאם המימד גדול מ־$2$ אז יש שתי תתי־חבורות מסדר $p$ שהן ממימד $1$ (חבורה ציקלית היא תת־מרחב מדרגה $1$), ואז
  $ (p^k-1)(p-1) >= (p^2-1) / (p-1) = p+1 > 1 $
  ולכן יש ל־$A$ לפחות שתי תתי־חבורות מסדר $p$ וזו סתירה להנחה.\
  אז $A$ היא מכפלה ישרה של תת־חבורה אחת מסדר $p$ שהיא ציקלית, ולכן $A$ ציקלית.

  נניח בשלילה כי $A$ לא ציקלית, ולכן בהכרח יש לפחות שני גורמים במכפלה הישרה לעיל שמצאנו
]

#subquestion()
ננסח ונוכיח חיזוק של סעיף ג' באמצעות הטענה מסעיף ד'.
#proof[
  ניסוח:
  אם $(A, +)$ חבורה אבלית כל שלכל $p divides abs(A)$ עבור $p$ ראשוני מתקיים ש־$A[p]$ אבלית עם תת־חבורה ציקלית יחידה מסדר $p$, אז $A$ ציקלית.\
  _הוכחה_: מסעיף ד' אנחנו מקבלים ש־$A[p]$ ציקלית לכל $p divides abs(A)$ ראשוני, ומסעיף ג' נקבל ש־$A$ ציקלית (שכן החבורות סילו של $A$ הן ציקליות ולכן $A$ ציקלית בתור מכפלה ישרה של חבורות ציקליות מסדרים זרים).
]

#question()

#subquestion()
נראה שאם $epsilon_1, ..., epsilon_n in {plus.minus 1}$ אז יש אוטומורפיזם של $QQ(sqrt(p_1), ..., sqrt(p_n))$ ששולח את $sqrt(p_i)$ ל־$epsilon_i sqrt(p_i)$, לכל $i$.
#proof[
  עבור בסיס האינדוקציה: עבור $n=1$, נסמן $K = QQ[x] slash (x^2-p_1)$ ונגדיר שני איזומורפיזמים $phi_1, phi_2 : K arrow.r QQ(sqrt(p_1))$ על־ידי $ phi_2 (overline(f)) = f(epsilon_1 sqrt(p_1)), space phi_1(overline(f)) = f(sqrt(p_1)) $
  דהיינו $phi_1, phi_2$ הם הצמדה וזהות שאנחנו כבר יודעים שהם איזומורפיזמים, ונגדיר $alpha : QQ(sqrt(p_1)) arrow.r QQ(sqrt(p_1))$ על־ידי $alpha = phi_2 compose phi_1^(-1)$ ונקבל $ alpha(sqrt(p_1)) = phi_2(phi_1^(-1)(sqrt(p_1))) = phi_2 (overline(f)(x)) = epsilon_1 sqrt(p_1) $
  נסמן $L = QQ(sqrt(p_1), ..., sqrt(p_(n-1)))$ ונניח שראינו את נכונות הטענה עבור מקרה זה ונראה עבור $QQ(sqrt(p_1), ..., sqrt(p_(n-1)), sqrt(p_n)))$.\
  במטלה $3$ ראינו שמתקיים $[QQ(sqrt(p_1), ..., sqrt(p_n)) : QQ] = 2^n$, ולכן $QQ(sqrt(p_1), ..., sqrt(p_n)) = L(sqrt(p_n)) / L[x] slash (x^2-p_n)$ ונגדיר שני איזומורפיזמים $phi_1, phi_2 : L[x] / (x^2-p_n) arrow.r QQ(sqrt(p_1), ..., sqrt(p_n))$ על־ידי
  $
    phi_1 (overline(f)) = f(sqrt(p_b)), space phi_2(overline(f)) = phi_2(c_0 + c_1 overline(x) + ... + c_n overline(x_n)^n) = alpha(c_0) + alpha(c_1) epsilon_1 sqrt(p_1) + ... alpha(c_n) epsilon_n sqrt(p_n)
  $
  נגדיר $beta : QQ(sqrt(p_1), ..., sqrt(p_n)) arrow.r QQ(sqrt(p_1), ..., sqrt(p_n))$ על־ידי $beta = phi_2 compose phi_1^(-1)$ כמקודם, וזה מביא לנו אוטומורפיזם.\
]

#subquestion()
נראה שאם $epsilon_1, ..., epsilon_n in {plus.minus 1}$ אז $sum_(i=1)^n epsilon_i sqrt(p_i)$ צמוד של $sum_(i=1)^n sqrt(p_i)$מעל $QQ$ ונסיק שיש להם את אותו הפולינום המינימלי מעל $QQ$.
#proof[
  מהסעיף הקודם אנחנו יודעים שיש אוטומורפיזם $sigma$ של $QQ(sqrt(p_1), ..., sqrt(p_n))$ שמקיים
  $ sigma(sum_(i=1)^n sqrt(p_i)) = sum_(i=1)^n sigma(sqrt(p_i)) = sum_(i=1)^n epsilon_i sqrt(p_i) = beta $
  נסתכל על $sigma (harpoon.tr)_QQ(alpha) : QQ(alpha) arrow.r QQ(beta)$
  \
  אבל בהרצאה ראינו ששני איברים הם צמודים מעל שדה אם ורק אם הם שורשים של אותו פולינום אי־פריק ופולינום מינימלי הוא כמובן אי־פריק ולכן יש להם בפריט את אותו פולינום מינימלי מעל $QQ$.
]

#subquestion()
נחשב את דרגת הפולינום המינימלי של $sqrt(p_1) + ... + sqrt(p_n)$ מעל $QQ$ ונסיק שאם $p_1, .,,,. p_n$ ראשוניים שונים זה מזה אז $ QQ(sqrt(p_1) + ... + sqrt(p_n)) = QQ(sqrt(p_1), ..., sqrt(p_n)) $
#proof[
  נסמן $f = sqrt(p_1) + ... + sqrt(p_n)$.\
  מהסעיפים הקודמים אנחנו יודעים של־$f$ יש $2^n$ שורשים שונים שהם $f = epsilon_1 sqrt(p_1) + ... + epsilon_n sqrt(p_n)$ ולכן $deg(f) >= 2^n$.\
  אבל זה פולינום מינימלי, והדרגה של הפולינום המינימלי קטנה או שווה לדרגת ההרחבה, ולכן נובע ש־$deg_QQ (f) <= 2^n$ (כי $[QQ(sqrt(p_1), ..., sqrt(p_n)) : QQ] = 2^n$) ולכן $deg_QQ (f) = 2^n$.\
  אז נקבל ש־$[QQ(sqrt(p_1), ..., sqrt(p_n)) : QQ(sqrt(p_1)+ ... + sqrt(p_n))] = 1$ ולכן
  $QQ(sqrt(p_1) + ... sqrt(p_n)) = QQ(sqrt(p_1), ..., sqrt(p_n))$.
]

#question()
בכל סעיף נתון $f in QQ[x]$, נוכיח ש־$f$ אי־פריק ובנוסף עבור $alpha in CC$ שורש שרירותי של $f$ נגדיר את $K = QQ(alpha)$ ונקבע האם $K slash A$ הרחבה נורמלית.

#subquestion()
$f(x) = x^4+x^3+x^2+x+1$.
#proof[
  ראשית נשים לב שבהרצאה ראינו ש־$phi.alt_5 = x^4+x^3+x^2+x+1$ וזהו פולינום ציקלוטומי ולכן $f(x) = phi.alt_5 = (x^5-1) / (x-1)$ ובמטלה $3$ ראינו כבר שהוא אי־פריק עבוד $p=3, n=1$.\
  כעת, השורשים של $f$ מעל $CC$ הם ${e^((2pi i n) / 5) bar 1<=n<=4 }$.\
  בלי הגבלת הכלליות נבחר $alpha = omega$. למה מותר לנו לעשות את זה? אנחנו יודעים ש־$f$ הוא הפולינום המינימלי של $QQ(omega^k)$ לכל $k in [4]$ מהיותו שורש, משמע $[QQ(omega^k) : QQ] = deg(f) = 4$ ונראה ש־$QQ(omega^k) = QQ(omega)$:\
  ההכלה הראשונה $QQ(omega^k) subset.eq QQ(omega)$ היא ישירות מהגדרה, ההכלה בכיוון השני $QQ(omega) subset.eq QQ(omega^k)$ נובע מכך ש־$gcd(k, 5) = 1$ ולכן קיים $m in ZZ$ כך שיתקיים $k m eq.triple 1 mod 5$ ולכן $(omega^k)^m = omega^(k m) = omega$ וקיבלנו את ההכלה בכיוון השני.\
  לכן, $QQ(alpha) = QQ(omega)$ מכיל את כל השורשים של $f$ ולכן $f$ מתפצל לחלוטין ב־$QQ(alpha)$ וזה מקיים את התנאים השקולים לנורמליות שראינו בהרצאה (אי־פריק מעל $QQ[x]$, יש לו שורש ב־$QQ(alpha)$ והוא מתפצל לחלוטין מעל $QQ(alpha)$).
]

#subquestion()
$f(x) = x^4-7x^2+7$.
#proof[
  ראשית, מקריטריון אייזנשטיין אנחנו יודעים ש־$f$ הוא אי־פריק עבור $p=7$, נסמן $t=x^2$ ולכן $p(t) = x^2-7t+7$ ואז השורשים של $p(t)$ הם
  $ (7+sqrt(21)) / 2, (7-sqrt(21)) / 2 $
  והשורשים של $f$ הם
  $ sqrt((7+sqrt(21)) / 2), sqrt((7-sqrt(21)) / 2), -sqrt((7+sqrt(21)) / 2), -sqrt((7-sqrt(21)) / 2) $
  נראה שההרחבה לא נורמלית: נפעל לפי הרמז וניקח $alpha^2 = beta_1$ אחד השורשים שמקיים $beta^2-7b+7=0$ ולמשוואה $y^2-7y+7=0$ שני פיתרונות, $beta_1, beta_2$.\
  בלי הגבלת הכלליות, נבחר $alpha = beta_1 = (7 + sqrt(21)) / 2$ ונניח בשלילה ש־$sqrt(beta_2) in QQ(sqrt((7+sqrt(21)) / 2))$ וראינו שזו הרחבה מדרגה $4$ ולכן
  $ cal(B) = {1, alpha, sqrt(21), alpha sqrt(21)} $
  מהווה בסיס להרחבה $QQ(alpha)$ ונשים לב ש־$beta_1, beta_2 in QQ(sqrt(21))$ ו־${1, alpha} subset.eq cal(B)$ מהווה בסיס ל־$QQ(alpha) slash QQ(sqrt(21))$ $(star)$ ו־$[QQ(sqrt(21)) : QQ] = 2$,
  ולכן גם מתקיים $QQ(alpha) subset.eq QQ(sqrt(21))$.
  מההנחה קיימים $a,b,c,d in QQ$ כך שמתקיים
  $
    sqrt(beta_2) = a + b alpha + c sqrt(21) + d alpha sqrt(21) <==> beta = ((a + c sqrt(21)) + (b+sqrt(21)d) alpha)^2 \
    =_(alpha^2 = beta_1) (a+c sqrt(21))^2 + beta_1 (b+sqrt(21)d)^2 + 2(a+c sqrt(21))(alpha(b + sqrt(21)d))
  $
  נשים לב שמתקיים
  $
    (diamond.small) space beta_1 beta_2 = ((7 + sqrt(21)) / 2)((7 - sqrt(21)) / 2) = ((7 + sqrt(21))(7-sqrt(21))) / 4 = (49-21) / 4= 7\
    (diamond.small diamond.small) space beta_1 + beta_2 = (7+sqrt(21)+7-sqrt(21)) = 14 / 2 = 7
  $
  #colbreak()

  מ־$(star)$ נקבל שחייב שיתקיים $2(a+c sqrt(21))(b + sqrt(21) d) = 0$ שכן $alpha!=0$, ונחלק למקרים:
  + אם $a + c sqrt(21) = 0$
    $
      beta_2 = beta_1 (b + sqrt(21)d)^2 <==> beta_2^2 = beta_1 beta_2 (b + sqrt(21)d)^2 <==>_(diamond.small) beta_2^2 = 7 (b + sqrt(21)d)^2 \
      <==> (49-14 sqrt(21)+21) / 4 = 7 (b + sqrt(21)d)^2
      <==> 7(beta_2 - 1) = 7 (b + sqrt(21)d)^2 \
      => beta_2-1 = (b + sqrt(21)d)^2 <==> (5-sqrt(21)) / 2 = b^2+2d b sqrt(21) + 21d^2
    $
    ולכן צריך להתקיים
    $ b^2+21d^2 = 5 / 2, space 2b d = -1 / 2 <==> b d = -1 / 4 $
    נכפול את הביטוי הראשון ב־$b^2$ ונקבל עם הביטוי הראשון ש־$b^2d^2 = -1 / 16$
    $ b^4 + 21 d^2 b^2 = 5 / 2 b^2 <==> b^4 + 21 / 14 = 5 / 2 b^2 <==> (b^2-7 / 4)(b^2-3 / 4) = 0 $
    אבל לא קיים אף $b in QQ$ כך ש־$b^2 = 3 / 4$ או ש־$b^2=7 / 4$ וזה מקרה לא אפשרי.
  + אם $b + d sqrt(21) = 0$ אז מתקיים
    $ beta_2 = (a+c sqrt(21))^2 = a^2+21c^2 + 2a c sqrt(21) $
    ולכן צריך להתקיים
    $ a^2 + 21c^2 = 7 / 2, space 2 a c = -1 / 2 <==> a c = -1 / 4 $
    שוב נכפול ב־$a^2$ ונקבל ממה שראינו $a^2c^2 = -1 / 16$ ואז
    $ a^4 + 21c^2 a^2 = 7 / 2a^2 <==> a^4+21 / 16 = 7 / 2a^2 <==> a^4 - 7 / 2a^2 + 21 / 16 $
    וגם במקרה הזה אין פיתרון מעל $QQ$.
  בשני המקרים מצאנו שלא ייתכן ש־$sqrt(beta_2) in QQ(alpha)$ ולכן זו סתירה ובאותו אופן נקבל עבור $alpha = beta_2$ ולכן $QQ(alpha)$ לא מכילה את כל השורשים ולכן $QQ(alpha) slash QQ$ לא הרחבה נורמלית.
]

#subquestion()
$f(x) = x^4-x-1$.
#proof[
  נעזר ברמז, עבור אי־פריקות נראה שזה אי־פריק מודלו $2$:\
  נראה תחילה שהפולינום $x^2+x+1$ הוא הפולינום הריבועי האי־פריק היחידי מעל $FF_2$: ראשית, כל הפולינומים ממעלה $2$ הם:
  + $x^2+ 0 x + 0 = x^2$
  + $x^2 + 1 x + 0 = x^2+x$
  + $x^2 + 0 x + 1 = x^2+1$
  + $x^2 + 1 x + 1 = x^2+x+1$
  נבחן אי־פריקות לכל אחד בהתאמה:
  + הוא אי־פריק כ־$x dot.op x$
  + נבחן קודם כל לפי שורשים
    + $x = 0$ ואז $0^2+1=1 != 0$ ולכן לא שורש
    + $x = 1$ ואז $1^2+1 = 2 mod 2 = 0$ ולכן $1$ הוא שורש ואנחנו כבר יודעים שהפיצול שלו הוא $ x^2 + x = (x+1)(x+1) = x^2 +2x + 1 =_(mod 2) x^2+1 $
    משמע בין כה וכה הפולינום הוא פריק.
  + $x^2+x = x(x+1)$ ולכן פריק
  + נבחן קודם כל לפי שורשים
    + $x=0$ ואז $0^2+0+ = 1$ ולכן לא שורש
    + $x=1$ ואז $1^2+1+1 =_(mod 2) 1$ ולכן לא שורש
    לכן אין לפולינום $x^2+x+1$ שורשים ב־$FF_2$ ולכן הוא אי־פריק לפי טענה מתרגיל $1$.
  עכשיו נשים לב
  $ x^4-x-1 =_(mod 2) x^4+x+1 $
  ולפולינום $x^4+x+1$ אין שורשים מעל $FF_2$ (כי $1^4+1+1 =_(mod 1) 1 !=0, 0^4+0+1 = 1 !=0$) ולכן $f_(mod 2)$ לא מתפרק לגורמים לינאריים מעל $FF_2$ ונרצה להראות שהוא לא מתפרק לפי חזקות ריבועיות: נניח בשלילה שהוא כן, אז קיימים $a, b, c, d in FF_2$ כן שמתקיים $ x^4+x+1 = (x^2+a x + b)(x^2 + c x + d)=x^4 + (a+c)x^3+(a c + b + d)x^2 + (a d + b c) x + b d $
  אבל חישוב ישיר יראה לנו שהפיתרון היחידי למערכת זה $b = d = 1, a = c = 0$ אבל
  $x^4 + x+ 1 != x^4 + 2x^2 + 1 = x^4+1$
  ולכן $f$ אי־פריק מעל $FF_2$ (מספיק להוכיח שהוא אי־פריק מעל $FF_2$ כי ראינו שאם פולינום הוא פריק ב־$QQ[x]$ הוא גם בהכרח פריק מעל $FF_p [x]$ עבור $p$ ראשוני).\
  עבור הנורמליות, נמצא כמה שורשים ממשיים יש עבור $f$: נשים לב ש־$f' = 4x^3-1$ ולכן יש נקודת מינימום יחידה. נשים לב שגם מתקיים $ f(x) stretch(arrow.r)_(x arrow.r infinity) infinity, f(x) stretch(arrow.r)_(x arrow.r minus infinity) infinity $ לכן ממשפט ערך הביניים נקבל שיש שני שורשים ממשיים, אבל אנחנו יודעים שיש לו גם שורשים מרוכבים: לכן אם נבחר $alpha$ שורש שרירותי של $f$ נקבל ש־$f$ לא מתפצל לחלוטין מעל $QQ(alpha) slash QQ$ ולכן ההרחבה לא נורמלית.
]

#question()
יהי $K$ שדה שבו החבורה $mu_infinity$ מתפצלת (כלומר, לכל שורש יחידה $z in overline(K)$ מתקיים $z in K$). נסמן $p = char(K)$ אם המציין של $K$ חיובי ואחרת $p=1$ ונראה שמתקיים $mu_infinity (K) tilde.equiv QQ slash(ZZ[1 / p])$.
#proof[
  נחלק לנוחות לשני מקרים
  + $char(K) = 0$ ולכן $p =1$.\
    $K$ סגור אלגברית ולכן מכיל את כל שורשי היחידה $xi_n$ לכל $n$.
    \כל $a / n in QQ slash ZZ$ הוא מסדר סופי ולכן $QQ slash ZZ$ היא חבורת פיתול עם "עותק" לכל $ZZ slash n ZZ$ לכל $n>=1$, וזה בידיוק $mu_infinity (K)$: נסתכל על ההומומורפיזם $phi : QQ slash ZZ arrow.r mu_infinity (K)$ הנתון על־ידי $phi(p / q + ZZ) = e^((2pi i p) / q)$, נראה שזה איזומורפיזם וזה יסיים:
    + מוגדר היטב
      כי אם $p / q eq.triple p' / q' mod ZZ$ אז $ p / q-p' / q' in ZZ => e^(2pi i p / q) = e^(2pi i p' / q') dot.op e^(2pi i (p / q-p' / q')) = e^(2pi i p' / q') dot.op 1 = e^(2pi i p' / q') $
    + אכן הומומורפיזם
      $
        phi((p / q+ZZ) + (p' / q'+ZZ)) = phi((p / q+p' / q')+ ZZ)=e^(2pi i (p / q+p' / q')) = e^(2pi i p / q) dot.op e^(2pi i p' / q') = phi(p / q+ZZ) dot.op phi(p' / q'+ZZ)
      $
    + חד־חד ערכי
      $ phi(p / q+ZZ) = 1 <==> e^(2pi i p / q) = 1 <==> p / q in ZZ => p / q+ZZ = 0 + ZZ $
    + על
      כי כל $xi in mu_infinity (CC)$ הוא שורש יחידה, ולכן הוא מהצורה $xi = e^(2pi i p / q)$ ולכן $phi(p / q + ZZ) = xi$.
  + במקרה השני, $char(K) = p > 1$.
    \ יהי $xi in K$ שורש יחידה מסדר $p^n$, משמע $xi^p^n = 1$ ולכן $xi$ הוא שורש של $x^p^n-1$, אבל $(x^p^n-1)' = 0$ כי $char(K) = p$ ולכן $gcd(x^p^n-1, (x^p^n-1)') = 1$ ולכן זהו פולינום פריד.\
    מנגד, כל השורשי יחידה במציין $p$ חייבים להיות מסדר זר ל־$p$, ולכן
    $ mu_infinity (K) = union.big_(n>=1,\ gcd(n, p)=1) mu_n (K) $
    אבל זה בידיוק אומר ש־$mu_infinity(K) tilde.equiv QQ slash ZZ [1 / p]$, שכן כל $x in QQ slash ZZ$ הוא מהצורה $x = a / n + ZZ$, ואם $p divides n$ אז $xi_n in.not K$, ולכן נשאר רק עם $n$־ים שעבורם $gcd(n, p)=1$, משמע
    $ mu_infinity (K) tilde.equiv union.plus.big_(n>=1,\ gcd(n, p)=1) ZZ slash n ZZ tilde.equiv QQ slash ZZ[1 / p] $
]
