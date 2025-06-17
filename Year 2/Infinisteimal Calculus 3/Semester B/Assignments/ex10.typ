#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 10 --- חשבון אינפיניטסימלי 3, 80415 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)
#show figure.caption: emph
#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let vol = math.op("Vol")

#question()
תהיי $B subset.eq RR^k$ תיבה.

#subquestion()
נוכיח שלכל כיסוי ${B_i}_(i=1)^infinity$ של $B$ על־ידי תיבות מתקיים
$ sum_(i=1)^infinity V(B_i) >= V(B) $

#proof[
  בהרצאה ראינו שעבור $B subset.eq RR^k$ תיבה מתקיים
  $ B = product_(i=1)^k [a_i, b_i] => vol(B) = product_(i=1)^k (b_i-a_i) $
  יהי $epsilon > 0$ וניקח $B_epsilon subset.eq B$ כך שיתקיים
  $ vol(B_epsilon) > vol(B)-epsilon $
  היות ו־$B subset.eq union.big_(i=1)^infinity B_i$ נובע כי $B_epsilon subset.eq union.big_(i=1)^infinity B_i$.\
  $B_epsilon$ היא קבוצה סגורה וחסומה ולכן יש לה תת־כיסוי סופי (כי היא קומפקטית) $B_epsilon subset.eq union.big_(i=1)^N B_i$.\
  כעת, גם אם עבור $i!= j in [N]$ מתקיים $B_i inter B_j !=emptyset$, מתקיים
  $ vol(B_epsilon) <= sum_(i=1)^N vol(B_i) <= sum_(i=1)^infinity vol(B_i) $
  משמע
  $ vol(B) - epsilon < vol(B_epsilon) <= sum_(i=1)^infinity vol(B_i) $
  היות וזה נכון לכל $epsilon$ נקבל כאשר $epsilon arrow.r 0$
  $ sum_(i=1)^infinity vol(B_i) >= vol(B) $

]

#subquestion()
נוכיח כי קיימת חלוקה של $B$ לתיבות ${B_i}_(i=1)^m$ עבורן היחס בין הצלע הארוכה ביותר לצלע הקצרה ביותר הוא לכל היותר $2$.

#proof[
  #todo
]

#question()
#subquestion()
תהיי $K subset.eq RR^k$ קומפקטית ו־$f: K arrow.r RR$ פונקציה רציפה, נזכור כי הגרף של $f$ מוגדר באמצעות
$ Gamma_f colon.eq {(x, f(x)) in RR^k times RR bar x in K} $
נוכיח כי $Gamma_f$ ממידה אפס.

#proof[
  $K$ קומפקטית ולכן $f$ רציפה במידה שווה, ולכן לכל $epsilon > 0$ יש $delta > 0$ כך שלכל $x,y in K$ מתקיים
  $ norm(x-y)<delta => abs(f(x)-f(y))<epsilon $
  ניקח תיבה $B subset.eq RR^(k-1)$ כך ש־$K subset.eq B$
  #todo

]

#subquestion()
תהיי $U subset.eq RR^k$ פתוחה ו־$g : U arrow.r RR$ גזירה ברציפות. נגדיר $A = g^(-1)({0})$ ונניח כי $gradient g(a) != 0$ לכל $a in A$.\
נראה כי $A$ ממידה אפס.

#proof[
  #todo
]

#subquestion()
נסיק כל כל תת־מרחב $V subset.eq RR^k$ ממימד $n<k$ הוא ממידה אפס.

#proof[
  #todo
]

#question()
תהיי $A subset.eq RR^k$ תיבה ו־$f:A arrow.r RR$ פונקציה אינטגרבילית כך שקיימת קבוצה $E subset.eq A$ ממידה אפס עבורה $f|_(A without E) eq.triple 0$.\
נוכיח כי $integral_A f(x) d x = 0$.

#proof[
  $f$ אינטגרבילית על $A$ ולכן חסומה על $A$ ולכן קיים $0<M in RR$ כך שלכל $x in A$ מתקיים $abs(f(x))<=M$.\
  תהיי $P$ חלוקה של $A$ ונרצה להראות שלכל $epsilon>0$ מתקיים $overline(S)(f,P)-underline(S)(f,p) < epsilon$ וכן $overline(S)(f,P), underline(S)(f,P)<epsilon$ ומהגדרה נקבל אם כך שיתקיים $integral_A f(x) d x = 0$.\
  $E subset.eq A$ קבוצה ממידה אפס, מהגדרה נובע שלכל $epsilon>0$ קיימת קבוצה בת־מנייה ${B_i}_(i=1)^infinity$ של תיבות המכסות את $E$, כלומר $E subset.eq union.big_(n in NN) B_i$ ובנוסף מתקיים $sum_(i=1)^infinity vol(B_i) < epsilon / M$.\
  ניקח ${B_j}_(j=1)^N$ תת־כיסוי סופי של $E$ (קיים כזה בגלל ש־$E$ ממידה אפס) וניקח חלוקה $P$ של $A$ כך שמתקיים לכל תיבה $R_i in P$ אחד מהבאים
  + $R_i$ מחוץ ל־$union.big_(j=1)^N B_j$
  + $R_i subset.eq union.big_(j=1)^N B_j$
  היות ו־$f(x)|_(A without E) eq.triple 0$, אז לכל $R_i subset.eq A without E$ נקבל $sup_(x in R_i) abs(f(x))=0$ ולכן לכל $R_i subset.eq A without union.big_(j=1)^N B_j$ מתקיים $f(x) eq.triple 0$.\
  עבור כל $R_i$ כך שמתקיים $R_i inter E != emptyset$, הם כולם מוכלים ב־$union.big_(j=1)^N B_j$ ולכן התרומה שלהם לסכומים תהיה
  $
    sum_(R_i subset.eq union.big_(j=1)^N B_j) sup_(x in R_i) abs(f(x)) dot.op vol(R_i) <= M dot.op sum_(j=1)^N vol(B_j) < M dot.op epsilon / M = epsilon
  $
  עבור הסכום התחתון, התהליך זהה.\
  זה נכון לכל חלוקה $P$, אז מצאנו שמתקיים $overline(S)(f,P)-underline(S)(f,p) < epsilon$ וכן $overline(S)(f,P), underline(S)(f,P)<epsilon$ ומהגדרה נקבל אם כך שמתקיים $integral_A f(x) d x = 0$.\
]

#question()
תהיי $f:[0,1]^2 arrow.r RR$ הפונקציה הנתונה על־ידי
$ f(x,y) = mycases(1 / q, y in QQ "וגם" x=p / q in QQ "שבר מצומצם", 0, "אחרת") $
נוכיח כי $f$ אינטגרבילית ומקיימת $integral_([0,1]^2) f(x,y)d x d y=0$.

#proof[
  ניזכר כי $QQ$ בת־מנייה ולכן קבוצת הנקודות $(x,y)$ כך ש־$f(x,y)!=0$ היא קבוצה בת־מנייה (גם לכל $y in QQ$, ערכי $x$ עבורכם $x in QQ$ שבר מצומצם הוא לכל היותר בן־מנייה (בת־מנייה או סופית) כתת־קבוצה של קבוצה בת־מנייה).\
  נסמן $ E = {(x,y) in RR^2 bar f(x,y)!=0} $
  ומהנימוק לעיל $E$ קבוצה בת־מנייה, ולכן ממידה אפס.\
  בנוסף, $f$ רציפה בכל $[0,1]^2 without E$ (כי היא זהותית $0$) ולכן $E$ זה גם קבוצת נקודות האי־רציפות של $f$. \
  ראינו כי פונקציה היא אינטגרבילית אם ורק אם קבוצת נקודות האי־רציפות שלה היא ממידה אפס, ולכן $f$ אינטגרבילית.\
  מכך ש־$f|_([0,1]^2 without E) eq.triple 0$, אנחנו עומדים בתנאי שאלה $3$ ולכן $f|_([0,1]^2)=0$ וממשפט פוביני לא משנה סדר האינטגרציה ולכן $integral_([0,1]^2 f(x,y) d x d y = 0)$.
]

#question()
תהיי $Q = A times B subset.eq RR^k times RR^n$ מכפלה של תיבות $A subset.eq RR^k, B subset.eq RR^n$ ותהיי $f : Q arrow.r RR$ פונקציה אינטגרבילית.\
נגדיר $h : A arrow.r RR$ על־ידי
$ h(x) = overline(integral_B) f(x,y) d y $
נוכיח כי לכל חלוקה $P$ של $Q$ מתקיים
$ overline(S)(f,P)>=overline(integral_B) h(x) d x $

#proof[
  תהיי $P$ חלוקה של $Q = A times B$ לתוך תיבות $R = R_i times S_j$.\
  סכום רימן העליון נתון על־ידי
  $
    overline(S)(f,P) = sum_(i,j) sup_((x,y) in R_i times S_j) f(x,y) dot.op vol(R_i) dot.op vol(S_j) =_(M_(i j) = sup_((x,y) in R_i times S_j) f(x,y)) sum_(i,j) M_(i j) dot.op vol(R_i) dot.op vol(S_j)
  $
  נקבע $x in R_i$ ונעשה אינטגרציה על $y$, מתקיים
  $
    sup_(y in S_j) f(x,y) <= sup_((x,y) in R_i times R_j) f(x,y)= M_(i j) => sum_(j) sup_(y in S_j) dot.op vol(S_j) <= sum_(j) M_(i j) dot.op vol(S_j)
  $
  מהגדרה זה גם חסם של
  $ overline(integral_B) f(x,y) d y = h(x) <= sup_(x in R_i) h(x) $
  היות ונפח הוא אי־שלילי מתקיים
  $
    overline(integral_A) h(x) d x <= sum_(i) sup_(x_i in R_i) h(x) dot.op vol(R_i) <= sum_(i,j) M_(i j) dot.op vol(R_i) dot.op vol(S_j) = overline(S)(f,P)
  $
  וזה נכון לכל חלוקה $P$.
]

#question()
בכל סעיף נחשב את האינטגרל בעזרת משפט פוביני ונצדיק את השימוש.

#subquestion()
$integral_0^1 (x^b-x^a) / ln(x) d x$ עבור $0<a<b$.

#solution[
  נצדיק את השימוש במשפט פוביני: \
  נגדיר $f : [0,1] times [a,b] arrow.r RR$ על־ידי $f(x,y)=x^y$.\
  למה זה עוזר לנו? כי נסתכל על
  $ (partial f) / (partial y) = partial / (partial y)x^y = x^y ln(x) $
  ואז
  $ (x^b-x^a) / ln(x) = integral_a^b x^y d y $
  עכשיו, נבחן את $lim_(x arrow.r 0)(x^b-x^a) / ln(x)$, בבירור כאשר $x arrow.r 0^(minus)$ הביטוי הנ"ל לא מוגדר ולכן הגבול מתבדר, אבל כאשר $x arrow.r 0^(plus)$ הגבול שואף ל־$0$ מאריתמטיקה של גבולות
  $
    lim_(x arrow.r 0^plus) (x^b-x^a) / ln(x) = (lim_(x arrow.r 0^plus) (x^b-x^a)) / (lim_(x arrow.r 0^plus) (ln(x))) = 0 / (-infinity) = 0
  $
  אז הכל מוגדר כשאנחנו מסתכלים על $x in [0,1]$. נקבל בעצם שמתקיים
  $ integral_a^b x^y d y = (x^b-x^a) / ln(x) $
  שזה בידיוק האינטגרל שרצינו לחשב, ולכן
  $ integral_0^1 (x^b-x^a) / ln(x) d x = integral_0^1 integral_a^b x^y d y d x $
  היות ו־$f(x,y)$ היא פונקציה רציפה על $[0,1] times [a,b]$ ולכן ניתן להשתמש במשפט פוביני (זו גם קבוצה קומפקטית בעלת נפח כי השפה שלה היא איחוד של ישרים המרכיבים את המלבן), ונצטרך להשתמש במשפט פוביני כי האינטגרל הפנימי הוא אינטגרל לא אלמנטרי, על־כן נחשב
  $
    integral_0^1 integral_a^b x^y d y d x = integral_a^b integral_0^1 x^y d x d y = integral_a^b [x^(y+1) / (y+1)]_(x=0)^(x=1) d y = integral_a^b 1^(y+1) / (y+1) d y = [ln(y+1)]_(y=a)^(y=b) = ln(b+1)-ln(a+1)
  $
  גבולות האינטגרציה לא השתנו בגלל האי־תלות בין הפרמטרי אינטגרציה.
]

#subquestion()
$integral_([0,1]^2) min {x,y} d x d y$.

#solution[
  נצייר בתור התחלה את התחום שלנו\
  #figure(
    image("../../../../src/images/infi3 ex10 question 6.b.jpg", width: 30%, fit: "contain"),
    caption: [
      חלוקה של התחום הנתון
    ],
  )

  סימנתי בו כמה דברים: אנחנו מסתכלים על הישר $y=x$ ובעצם מחפשים מה קטן בין שני הערכים.\
  $[0,1]^2$ הוא ריבוע היחיד והוא מתחלק ל־$2$ חלקים: מתי $y<=x$ ובקטע זה המינימום הוא $y$ ומתי $x<=y$ ובקטע זה המינימום שלנו הוא $x$.\
  אז $y=x$ פונקציה רציפה ולכן אינטגרבילית וריבוע היחידה הוא בעל נפח (השפה שלה היא איחוד של ארבעה ישרים) וריבוע היחידה הוא כמובן קבוצה קומפקטית.\
  כל תנאי משפט פוביני מתקיימים ולכן ניתן להשתמש במשפט.\
  אם־כך, יש לנו חלוקה של לתחומים בהתאם למינימום הנדרש ולכן אפשר לחשב עם פוביני
  $
    integral_([0,1]^2) min{x,y} = underbrace(integral_0^1 integral_0^y x d x d y, 0<=x<=y "המינימום כבול בתחום")+ underbrace(integral_0^1 integral_0^x y d y d x, 0<=y<=x "המינימום כבול בתחום ") = 1 / 3
  $
]

#subquestion()
$integral_S e^(-x^2) d x d y$ כאשר $S = {(x,y) in RR^2 bar 0<=y<=1, y<=x<=1}$.

#solution[
  לפי הקבוצה $S$, האינטגרל הכפול שאנחנו מתבקשים לחשב הוא $integral_0^1 integral_y^1 e^(-x^2)d x d y$, אבל הפונקציה הפנימית היא לא אלמנטרית ולכן עלינו להשתמש במשפט פוביני.\
  הפונקציה הפנימית היא כמובן $f(x,y)=e^(-x^2)$ שהיא פונקציה רציפה בתחום והקבוצה $S$ היא בעלת נפח כי השפה שלה היא איחוד של שלושה ישרים: $y=0, y=1, x=1$, לכן תנאי משפט פוביני מתקיימים ואפשר לחשב את האינטגרל בחישוב לפי $d y d x$, אז נצטרך להבין את התחום מחדש:
  מהיות $0<=y<=1$ ומכך ש־$y<=x<=1$ נובע כי $0<=x<=1$ ולכן גם $0<=y<=x$, אז האינטגרל שנחשב יהיה
  $
    integral_0^1 integral_y^1 e^(-x^2)d x d y = integral_0^1 integral_0^x e^(-x^2)d y d x = integral_0^1 [e^(-x^2)y]_(y=0)^(y=x) d x = integral_0^1 x e^(-x^2) d x (star)
  $
  נחשב את האינטגרל מימין באמצעות אינטגרציה בחלקים יחד עם
  $
    integral x e^(-x^2) d x =_(u = x^2 \
    (d u) / 2 = x d x) integral 1 / (2e^u) d u = 1 / 2 integral 1 / e^u d u =_(v = -u \ -d v = d u ) 1 / 2 integral -e^v d v = -1 / 2 e^v = -1 / (2e^u) = -1 / (2e^x^2)
  $
  ואז בחזרה ל־$(star)$

  $ (star) integral_0^1 x e^(-x^2) d x = [-1 / (2e^x^2)]_(x=0)^(x=1) = 1 / 2 - 1 / (2e) = 1 / 2(1-e^(-1)) $
]
