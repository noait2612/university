#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 09 --- מבנים אלגבריים 2, 80446 ],
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
#let Tr = math.op("Tr")
#let norma = math.op("N")

#question()
תהיי $L slash K$. עבור $alpha in L$ נסמן $M_alpha : L arrow.r L$ את הפונקציה $M_alpha (x)$, אופרטור לינארי על $L$ כמרחב וקטורי מעל $K$.\
בתרגול הגדרנו את הפונקציה $Tr_(L slash K) : L arrow.r K$ על־ידי $Tr_(L slash K) (alpha) = tr(M_alpha)$ ובאופן דומה את הפונקציה $N_(L slash K) : L arrow.r K$ על־ידי $N_(L slash K) (alpha) = det(M_alpha)$.\
יהי $alpha in L$ עם פולינום מינימלי $f_(alpha slash K) (x) = x^d + c_1x^(d-1) ++ dots.h.c + c_d$.\

#subquestion()
יהי $cal(B) = (b_1, dots.h.c, b_t)$ בסיס ל־$L slash K(alpha)$. ניזכר מדוע $cal(C) = (1, x, dots.h.c x^(d-1)$ בסיס ל־$K(alpha)$ מעל $K$ ומדוע
$
  cal(D) = (1 dot.op b_1, x dot.op b_1, dots.h.c x^(d-1)b_1, 1 dot.op b_2, x dot.op b_2, dots.h.c x^(d-1)b_2, dots.h.c, 1 dot.op b_t, dots.h.c x^(d-1)b_t)
$
בסיס ל־$L slash K$.

#proof[
  עבור הבסיס $cal(D)$ זה נובע ממגדל הרחבות ומכפלה ישרה של בסיסים ועבור $cal(C)$ הוא בסיס של $K(alpha)$ מעל $K$ כי $K(alpha)$ הוא שקול ל־$K[x] slash (f_(alpha slash K))$ ואנחנו יודעים שהפולינום הזה מדרגה $d$ ולכן גם הבסיס יהיה מסדר $d$ וברגע שנעשה מודלו $d$ על $f_(alpha slash K)$ נקבל $ x^d = -(c_1x^(d-1) + dots.h.c + c_d) $
  כלומר שאם ניקח את הבסיס $cal(C)$ נוכל להציג כל $g in K(alpha)$ על־ידו.
]

#subquestion()
תהיי $T : K(alpha) arrow.r K(alpha)$ ההעתקה שכופלת כל איבר ב־$alpha$.\
נראה שעבור בסיס $cal(C)$ מסעיף א' מתקיים
$
  [T]_cal(C) = mat(
    delim: "[", 0, , , -c_d;
    1, dots.down, , dots.down;
    , dots.down, 0, -c_2;
    , , 1, -c_1
  )
$

#proof[
  היות ו־$T$ העתקה לינארית מתקיים
  $ T(alpha^i) = alpha dot.op alpha^i=alpha^(i+1) $
  וגם
  $
    T(alpha^(d-1)) = alpha dot.op alpha^(d-1) = alpha^d = f_(alpha slash k(alpha)) - sum_(i=0)^(d-1) c_i alpha_i = 0 - sum_(i=0)^(d-1) c_(d-i) alpha^i
  $
  והמטריצה שמייצגת את ההעתקה הלינארית $T$ לפי הבסיס $cal(C)$ היא
  $
    [T]_cal(C) = mat(delim: "[", 0, 0, dots.h.c, -c_d; 1, 0, dots.h.c, -c_(d-1); 0, 1, dots.h.c, -c_(d-2); 0, 0, dots.h.c -c_1)
  $
]

#pagebreak()

#subquestion()
נוכיח שעבור הבסיס $cal(D)$ מסעיף א' מתקיים $[M_alpha]_cal(D) = mat(
  delim: "[", [T]_(cal(C)), , 0;
  , dots.down, ;
  0, , [T]_cal(C)
)$ ונסיק שמתקיים $ Tr_(L slash K) (alpha) = [L:K] / d dot.op (-c_1), space N_(L slash K) (alpha) = ((-1)^d c_d)^([L:K] / d) $
כאשר $[L:K] / d = [L : K(alpha)]$.

#proof[
  ראשית, $alpha eq.triple x$. שנית, יהי $0<=i<d$ ו־$1<=j<=t$ אז מתקיים
  $ M_alpha (x^i b_j) = alpha dot.op x^i dot.op b_j = x^(i+1)b_j $
  מהסעיף הקודם מתקיים
  $
    x^(i+1)b_j = (- sum_(i=0)^(d-1)c_(d-i) x^i) b_j = sum_(i=0)^(d-1)(-c_(d-i) x^i) b_j = sum_(i=0)^(d-1) (-c_(d-i) cal(d)_i^j)
  $
  כאשר $cal(d)_i^j in cal(D)$, אז נקבל (סליחה שדילגתי על שלב בכתיבה, הסתבכתי עם ה־typst, אבל זה ישיר)
  $
    mat(
      delim: "[", |, |, |, |;
      [M_alpha (x^0b_j)]_cal(D), [M_alpha (x^1b_j)]_cal(D), dots.h.c, [M_alpha (x^(d-1)b_j)]_cal(D); |, |, |, |
    ) =mat(
      delim: "[", [T]_(cal(C)), , 0;
      , dots.down, ;
      0, , [T]_cal(C)
    )
  $
  נעבור לחלק של ההסקה, מתקיים ממה שראינו
  $
    Tr_(L slash K) (alpha) = tr[M_alpha]_cal(D) = sum_(i=1)^t tr[T]_cal(C) = sum_(i=1)^t (-c_1) = -t c_1 = -[L : K(alpha)] dot.op c_1 = -[L:K] / [K(alpha):K] c_1 = -[L:K] / d c_1 \
    N_(L slash K) (alpha) = det[M_alpha]_cal(D) = product_(i=1)^t det[T]_cal(C) = (det[T]_(cal(C)))^t =_"פיתוח לפי שורה ראשונה" (-c_d)^t =_(t = [K : K(alpha) = [L : K] / d]) (-c_d)^([L : K] / d)
  $
]

#subquestion()
נסיק בנוסף שאם $alpha_1, dots.h.c, alpha_d$ הם צמודים של $alpha$ בסגור אלגברי של $K$ אז $ Tr_(L slash K) (alpha) = [L:K] / d sum_(i) alpha_i, space N_(L slash K) (alpha) = (product_(i) alpha_i)^([L:K] / d) $

#proof[
  מההנחה מתקיים
  $ product_(i=1)^d (x-alpha_i) = f_(alpha slash K) (x) = x^d+c_1x^(d-1)+ dots.h.c + c_d $
  ואז $c_1 = sum_(i=1)^d alpha_i, c_d = (-1)^d product_(i=1)^d alpha_i$ וממה שמצאנו בסעיף א'
  $
    Tr_(L slash K) (alpha) = -[L:K] / d c_1 = -[L:K] / d sum_(i=1)^d alpha_i \
    N_(L slash K) (alpha) = (-1)^[L:K] c_d^([L:K] / d) = (-1)^[L:K]((-1)^d product_(i=1)^d alpha_i)^([L:K] / d) = (product_(i) alpha_i)^([L:K] / d)
  $
]

#question()
יהי $F$ שדה ויהי $L=F(t_1, dots.h.c, t_n)$ עם הפעולה $S_n$ המוגדרת על־ידי $sigma. P(t_1, dots.h.c, t_n) = P(t_(sigma(1)), dots.h.c t_(sigma(n)))$.\
נסמן ב־$s_1, dots.h.c, s_n$ את הפולינומים הסימטריים האלמנטריים ב־$t_1, dots.h.c, t_n$ אלו הפולינומים המקיימים
$ product_(i=1)^n (x-t_i)=x^n - s_1x^(n-1) + s_2x^(n-2)- dots.h.c + (-1)^n s_n $
בכל אחד מהסעיפים נתון איבר $P$ ב־$L^(S_n)$ ונבטא אותו באמצעות הפולינומים הסימטריים האלמנטריים.\
_תזכורת:_ הנוסחה שראינו בתרגול למציאת הפולינום הסימטרי $s_n$ עבור $k$ נעלמים היא
$ s_n = sum_(1<=i_1<i_2<dots.h.c<i_n<=k) (x_i_1 dots.h.c x_i_k) $

#subquestion()
$P = t_1^3+t_2^3 + dots.h.c + t_n^3$.

#solution[
  ראשית, $P$ פולינום סימטרי (שכן כל החזקות אותו הדבר ולכן שינוי מיקום הסכימה לא משנה את סדר הסכימה).\
  נעבוד כמו בתרגול: בצעד הראשון, ניקח את $f-s_1^2$ כאשר $s_1 = t_1 + t_2 + t_3$.\
  נחשב את $s_1^3$
  $
    s_1^3 = (t_1 + dots.h.c + t_n)^3 =_"נוסחת הבינום" sum_(i=1)^n t_i^3 + 3sum_(1<=i<j<=n) t_i^2t_j + 3sum_(1<=i<j<=n) t_i t_j^2 + 6 sum_(1<=i<j<k<=n) t_i t_j t_k
  $
  אז בסך־הכל כרגע יש לנו
  $
    f-s_1^3 = t_1^3+ dots.h.c + t_n^3 - (sum_(i=1)^n t_i^3 + 3sum_(1<=i<j<=n) t_i^2t_j + 3sum_(1<=i<j<=n) t_i t_j^2 + 6 sum_(1<=i<j<k<=n) t_i t_j t_k )\
    = - (3sum_(1<=i<j<=n) t_i^2t_j + 3sum_(1<=i<j<=n) t_i t_j^2 + 6 sum_(1<=i<j<k<=n) t_i t_j t_k)
  $
  כעת נשים לב שמתקיים (זה בגלל חישוב של פתיחת סוגריים ומהגדרה)
  $ 3sum_(1<=i<j<=n) t_i^2t_j + 3sum_(1<=i<j<=n) t_i t_j^2= 3 sum_(1<=i<j<=n) t_i t_j (t_1 + dots.h.c + t_n)=3 s_2s_1 $
  הגורם האחרון שנשאר לנו לבטא באמצעות הפולינומים הסימטריים הוא כמובן
  $ 6 sum_(1<=i<j<k<=n) t_i t_j t_k = 6s_3 $
  מצאנו שבסך־הכל מתקיים
  $ P = t_1^3 + dots.h.c t_n^3 = s_1^3-3s_1s_2 + 6s_3 $
]

#pagebreak()

#subquestion()
$P = sum_(1<=i!=j<=n) t_i t_j^2$.

#solution[
  קודם כל, $P$ אכן פולינום סימטרי (אפשר לראות כבר עבור $n=2$), ולכן נשתמש במשפט היסודי.\
  נפרק את $P$ לביטוי שיהיה לנו נוח יותר לעבודה:
  $
    P = sum_(1<=i!=j<=n) t_i t_j^2 = sum_(i=1)^n t_i sum_(i!=j)t_j^2=sum_(i=1)^n t_i (sum_(j=1)^n t_j^2 - t_i^2) = sum_(i=1)^n t_i sum_(j=1)^n t_j^2 - sum_(i=1)^n t_i^3
  $
  זה ביטוי שיותר נוח לנו :דרך מפורשת יותר להגיד שלכל $i in [n]$ אנחנו סוכמים את כל המכפלות של $t_i$ עם כל $t_j$ עבור $j!=i$, זאת־אומרת שאנחנו *לא* רוצים את חזקות $3$ של $t_i$ בסכום שלנו, ובצורה הזאת הפולינומים הסימטריים הנדרשים נובעים כמעט ישירות:\
  מהסעיף הקודם
  $ sum_(i=1)^n t_i^3 = s_1^3-3s_1s_2++6s_3 $
  ניקח $i in [n]$ ונשים לב שמתקיים
  $
    sum_(1<=j<=n\
    i!=j) t_j^2 = s_1^2 - 2s_2 = (t_1 + dots.h.c t_n)^2 -2sum_(1<=k<l<=n) t_k t_l
  $
  וכמובן
  $ sum_(i=1)^n t_i = s_1 $
  נרכיב ביחד ונקבל
  $
    P = sum_(1<=i!=j<=n) t_i t_j^2 = sum_(i=1)^n t_i sum_(j=1)^n t_j^2 - sum_(i=1)^n t_i^3 = s_1(s_1^2-2s_2)-(s_1^3-3s_1s_2+6s_3)
    =_(s_1s_2=s_2s_1)
    cancel(s_1^3)-2s_1s_2 - cancel(s_1^3)+3s_1s_2-6s_3\
    = s_1s_2-6s_3
  $
]

#subquestion()
$P=[(t_1-t_2)(t_1-t_3)(t_2-t_3)]^2$.

#solution[
  נתחיל מלחשב את הביטוי הפנימי
  $
    (t_1-t_2)(t_1-t_3)(t_2-t_3)=(t_1^2-t_1t_3-t_2t_1+t_2t_3)(t_2-t_3)=t_1^2t_2-t_1^2t_3+t_1 (t_3^2-t_2^2)+t_2^2t_3-t_2t_3^2
  $
  נעלה בריבוע
  $
    (t_1^2t_2-t_1^2t_3+t_1 (t_3^2-t_2^2)+t_2^2t_3-t_2t_3^2)(t_1^2t_2-t_1^2t_3+t_1 (t_3^2-t_2^2)+t_2^2t_3-t_2t_3^2)\
    =t_1^4 t_2^2 - 2 t_1^4 t_2 t_3 + t_1^4 t_3^2 - 2 t_1^3 t_2^3 + 2 t_1^3 t_2^2 t_3 + 2 t_1^3 t_2 t_3^2 - 2 t_1^3 t_3^3 \
    + t_1^2 t_2^4 + 2 t_1^2 t_2^3 t_3 - 6 t_1^2 t_2^2 t_3^2 + 2 t_1^2 t_2 t_3^3 + t_1^2 t_3^4 - 2 t_1 t_2^4 t_3 + 2 t_1 t_2^3 t_3^2 + 2 t_1 t_2^2 t_3^3 - 2 t_1 t_2 t_3^4 + t_2^4 t_3^2 - 2 t_2^3 t_3^3 + t_2^2 t_3^4
  $
  קצת מגעיל אבל ניגש לעבודה: נתחיל מהביטויים של חזקת $4$, הם מופיעים עם
  $ s_1^2s_2^2 = sum_(1<=i<j<=n) t_i^2t_j^2 $
  $ P - s_1^2s_2^2 $
  #todo
]

#question()
#subquestion()
תהיי $L slash K$ הרחבת גלואה כך ש־$Gal(L slash K) = G$. נשתמש בהתאמת גלואה כדי להוכיח שלכל $H <= G$ מתקיים $[G:H]=[L^H : K]$.

#proof[
  ראשית, אנחנו עובדים עם הרחבות סופיות בלבד לפי הערה שמיכאל אמר. אז בלי הגבלת הכלליות, ההרחבת גלואה $L slash K$ היא הרחבה סופית.\
  מהתאמת גלואה אנחנו יודעים שיש התאמה חד־חד ערכית ועל בין תתי חבורות של $G$ לבין שדות ביניים של ההרחבה $L slash K$ ובפרט שאם $H <= G$ אז $L^H$ הוא שדה ביניים בין $K$ לבין $L$ (כי $K subset.eq L^H subset.eq L$ כי $K subset.eq L^H$ כי $K$ מכיל את כל האיברים שנשמרים תחת כל האוטומורפיזמים ב־$G$, בפרט אלו ב־$H$) ולכן לפי טענה שראינו בהרצאה מתקיים גם $H = Gal(L slash L^H)$ ונובע על־כן $[L : L^H] = abs(H)$.\
  נשתמש בטענות על מגדל הרחבות וכפליות הדרגה
  $ [L:K] = [L: L^H] dot.op [L^K : K] $
  מהתאמת גלואה נובע גם $[L : K] = abs(G)$ אז בסך־הכל
  $ [L : K ] = abs(G) = abs(H) dot.op [L^k : K] = [L : L^H] dot.op [L^K : K] $
  ולכן
  $ abs(G) / abs(H) = [G:H] = [L^H :K] $
]

#subquestion()
נוכיח של־$A_4$ אין תת־חבורה מאינדקס $2$ ונסיק שאם $Gal(L slash K) tilde.eq A_4$ אז אין הרחבת ביניים $L slash F slash K$ כך ש־$[F:K]=2$.

#proof[
  ראשית, תת־חבורה מאינדקס $2$ ב$A_4$ היא מסדר $6$ ($abs(A_4)=4! / 2=12, abs(A_4) / 2=6$).\
  נניח כי יש תת־חבורה כזאת, ואנחנו כבר יודעים שיש רק $2$ חבורות מסדר $6$ בידיוק (לפי משפטי סילו) וזה או $ZZ_6$ או $S_3$.\
  נניח כי יש תת־חבורה כזאת $H$ ולכן מלגראנז' נקבל ש־$H lt.tri A_4$.\
  אז $g^2 in H$ לכל $g in A_4$ ולכן כל 3־מחזור $(a,b,c) in A_4$ מתקיים $(a,b,c)^2 in H$ ולכן כל ה־3 מחזורים של $A_4$ הם גם ב־$H$.\
  אבל מספר ה־3־מחזורים ב־$A_4$ נתונים על־ידי
  $ binom(4, 3) dot.op 2! = 8 $
  ולכן ב־$H$ יש שמונה איברים, אבל זאת סתירה.\
  עבור החלק השני, נניח ש־$L slash K$ הרחבת גלואה ו־$Gal(L slash K) tilde.eq A_4$, ולכן מהתאמת גלואה אנחנו יודעים שלכל $H <= A_4$ יש התאמה חד־חד ערכית ועל אל $K subset.eq L^H$ וראינו בסעיף הקודם שמתקיים $[L^H : K]=[A_4 : H]$.\
  אם הייתה הרחבת ביניים $L slash F slash K$ כך ש־$[F : K]=2$, היה נובע כי ה־$H$ המתאימה לה מהתאמת גלואה היא חבורה נורמלית ב־$A_4$ וראינו שזה לא אפשרי.\
]
