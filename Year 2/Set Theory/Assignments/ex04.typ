#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- תורת הקבוצות, 80200 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#let rng = math.op("Range")
#let id = math.op("Id")
#show sym.lt.eq: math.scripts

#question()
נוכיח שאם $X, Y, Z$ קבוצות אז מתקיים $abs((X^Y)^Z)=abs(X^(Y times Z))$.
#proof[
  תהיי $f : Z arrow.r X^Y$ נגדיר $hat(f) : Y times Z arrow.r X$ על־ידי $hat(f)(y,z)= f(z)(y)$.\ #todo
]

#question()
נחשב את העוצמה של $C(RR)$, קבוצת הפונקציות הרציפות $f: RR arrow.r RR$.

#subquestion()
נוכיח שמתקיים $abs(RR)<=abs(C(RR))$.
#proof[
  נגדיר $f: RR arrow.r C(RR)$ על־ידי $f(x) = x$. \
  אנחנו יודעים שכל פונקציה קבועה היא פונקציה רציפה ולכן $f in C(RR)$, נראה כי היא חד־חד ערכית: נשים לב שלכל $x,y in RR$ מתקיים
  $ f(x)=f(y) <==> x=y $
  ולכן $f$ חד־חד ערכית ונקבל $abs(RR) <= abs(C(RR))$.
]

#subquestion()
נוכיח שהקבוצה $cal(P)(NN)^QQ$ היא בעוצמת הרצף, משמע יש פונקציה חד־חד ערכית ועל ממנה ל־$cal(P)(NN)$.
#proof[
  ניעזר ברמז ונסמן $cal(P)(NN) = abs({0,1}^NN)$.\
  במטלה הקודמת ראינו שמהגדרת הפונקציה המציינת מתקיים $abs(cal(P)(NN)) = 2^abs(NN)$ ומהרמז ומסקנה מההרצאה מתקיים $ abs(RR) = abs(cal(P)(NN)) = abs({0,1}^NN) = 2^abs(NN) = 2^(א_0) $
  תהיי $f in cal(P)(NN)^QQ$, זו פונקציה שלוקחת כל $q in QQ$ ומתאימה לו $A subset.eq NN$ ($f : QQ arrow.r cal(P)(NN)$), ולכן נוכל להסתכל על $f$ כזו כמו משיטת האלכסון על־ידי טבלה
  #figure(
    table(
      columns: 6,
      stroke: none,
      table.header[$dots.h.c$][$q_4$][$q_3$][$q_2$][$q_1$][],
      [$dots.h.c$], [$x_(04)$], [$x_(03)$], [$x_(02)$], [$x_(01)$], [$n=0$],
      [$dots.h.c$], [$x_(14)$], [$x_(13)$], [$x_(12)$], [$x_(11)$], [$n=1$],
      [$dots.h.c$], [$x_(24)$], [$x_(23)$], [$x_(22)$], [$x_(21)$], [$n=2$],
      [$dots.down$], [$dots.v$], [$dots.v$], [$dots.v$], [$dots.v$], [$dots.v$],
    ),
  )
  זאת אומרת שלכל $n, q$ מתקיים $x_(n q) = 1$ אם ורק אם $n in f(q)$ ו־$x_(n q) = 0$ אם ורק אם $n in.not f(q)$, במילים אחרות $f in {0,1}^(QQ  times NN)$.\
  אנחנו יודעים שמכפלה קרטזית של קבוצות בנות־מנייה היא בת־מנייה ולכן
  $ abs({0,1}^(QQ times NN))=abs({0,1}^NN)=abs(cal(P)(NN)) = abs(RR) = 2^(א_0) $
  משמע קיימות פונקציות חד־חד ערכיות ועל $ g: RR arrow.r cal(P)(NN)\
  h : cal(P)(NN) arrow.r {0,1}^NN\
  k : {0,1}^NN arrow.r {0,1}^(QQ times NN) $
  נגדיר $F: RR arrow.r {0,1}^(QQ times NN)$ על־ידי $F(x) = k(h(g(x)))$, $F$ חד־חד ערכית ועל כהרכבה של פונקציות חד־חד ערכיות ועל.\
  מצאנו פונקציה חד־חד ערכית ועל בין $cal(P)(NN)^QQ$ לבין $RR$ ולכן מהגדרת שיוויון עוצמות נובע $abs(cal(P)(NN)^QQ) = abs(RR)$.
]

#subquestion()
נוכיח שהעתקת הצמצום $F: C(RR) arrow.r RR^QQ$ המוגדרת על־ידי $F(f) = f harpoon.tr QQ$ היא חד־חד ערכית.
\
נסיק את אי־השיוויון $abs(C(RR))<=abs(RR)$ ונסיק ש־$C(RR)$ היא מעוצמת הרצף.
#proof[
  יהיו $f, g in C(RR)$ ונראה שאם לכל $q in QQ$ מתקיים $f(q) = g(q)$ אזי $f=g$.\
  יהי $x in RR without QQ$. מצפיפות הרציונליים בממשיים אנחנו יודעים שקיימת סדרה של רציונליים $(q_n)$ כך שמתקיים $q_n stretch(arrow.r)_(n arrow.r infinity) x $. \
  מרציפות $f, g$ נובע שמתקיים
  $ lim_(n arrow.r infinity) f(x_n) = f(x), lim_(n arrow.r infinity) g(x_n) = g(x) $
  היות ו־$(q_n)$ סדרה של רציונליים מהנתון נובע כי $f(x_n) = g(x_n)$ לכל $n in NN$ ובפרט הגבולות שלהם שווים, משמע מתקיים
  $ lim_(n arrow.r infinity) f(x_n) = f(x) = g(x) = lim_(n arrow.r infinity) g(x_n) $
  ראינו שלכל $x in RR without QQ$ מתקיים $f(x)=g(x)$ ומההנחה לכל $q in QQ$ מתקיים $f(q)=g(q)$ ולכן מתקיים $f=g$.\
  נסיק את אי־השיוויון $abs(C(RR))<=abs(RR)$: מהיות $QQ$ בת־מנייה נקבל
  $ abs(RR) <= abs(C(RR))<=abs(RR^QQ) =_((1)) abs(RR^NN)=_((2)) abs(RR) $
  כאשר $(1)$ נובע ממטלה 2 שאלה 1 ו־$(2)$ נובע מהסעיף הקודם ומכך שמתקיים $abs(cal(P)(NN)) = abs(RR)$.\
  בסעיף א' ראינו שגם מתקיים $abs(RR) <= abs(C(RR))$ וממשפט קנטור־שרדר־ברנשטיין נקבל את השיוויון $abs(RR)=abs(C(RR))$.\
]

#subquestion()
נחשב את עוצמת הקבוצה $C = { f in C(RR) bar f[RR] subset.eq QQ}$.
#solution[
  בעצם, $C$ זו קבוצת כל הפונקציות הרציפות מעל $RR$ שתמותן היא תת־קבוצה של $QQ$.\
  נראה שמתקיים $C = {f(x) = q bar q in QQ}$, משמע $C$ מכילה רק את הפונקציות הקבועות שתמותן מספר רציונלי.\
  ההכלה בכיוון הראשון טריוויאלית כי פונקציה קבועה היא פונקציה רציפה. בכיוון השני, נניח בשלילה שקיימת $f in C$ כך שמתקיים $abs(f(RR)) > 1$, משמע קיימים $q_1!=q_2 in QQ$ שעבורם קיימים $x_1, x_2 in RR$ כך שמתקיים בלי הגבלת הכלליות $f(x_1)=q_1, f(x_2) = q_2$.\
  מצפיפות הרציונליים בממשיים נובע כי קיים $r in RR$ כך שמתקיים $q_1 < r < q_2$ ומהסעיף הקודם או ממשפט ערך הביניים נסיק שקיים $x in RR$ כך שמתקיים $f(x) = r$, אבל הנחנו ש־$f in C$ ולכן $f[RR] subset.eq QQ$ וזו כמובן סתירה. \
  לכן $C$ מכילה את כל הפונקציות הקבועות שהקבוע שלהם הוא $q in QQ$ בלבד ומכיוון ש־$abs(QQ) = א_0$ נסיק כי $abs(C)=abs(QQ)=א_0$.
]

#question()
נחשב את העוצמה של $RR^RR$.

#subquestion()
נוכיח בעזרת האלכסון של קנטור שאין פונקציה על $F : RR arrow.r RR^RR$.
#proof[
  נניח בשלילה שקיימת $F : RR arrow.r RR^RR$ כך ש־$F$ על, ולכן לכל $g : RR arrow.r RR in RR^RR$ קיים $r in RR$ כך שמתקיים $F(r)=g$ ($F(r)(x) in RR$).\
  נגדיר $d : RR arrow.r RR$ על־ידי $d(x) = F(x)(x)+1$ ונראה שלא קיים $r in RR$ כך שיתקיים $F(r) = d$.\
  נניח שכן, ולכן קיים $r in RR$ כך ש־$F(r)=d$, משמע
  $ F(r) = d <==> F(r)(x) = d(x) = F(x)(x)+1 $
  בפרט גם עבור $x=r$ נקבל
  $ F(r)(r)= F(r)(r)+1 <==> 0=1 $
  וזו כמובן סתירה ולכן אין $F : RR arrow.r RR^RR$ על.
]

#subquestion()
נוכיח שמתקיים $abs(cal(P)(NN) times cal(P)(NN)) = abs(cal(P)(NN))$.
#proof[
  בכיוון הראשון, נגדיר $f : cal(P)(NN) arrow.r cal(P)(NN) times cal(P)(NN)$ על־ידי $f(A) = (A, emptyset)$.\
  נראה ש־$f$ חד־חד ערכית: אם $A!=B subset.eq NN$ בגלל ששיוויון הוא קורדינאטה־קורדינאטה נקבל $(A, emptyset) != (B, emptyset)$.\
  לכן $f$ חד־חד ערכית ו־$abs(cal(P)(NN))<=abs(cal(P)(NN) times cal(P)(NN))$.\
  בכיוון השני, נגדיר $g: cal(P)(NN) times cal(P)(NN) arrow.r cal(P)(NN)$ על־ידי $g(A,B) = {2n bar n in A} union {2n+1 bar n in B}$.\
  $g$ מוגדרת היטב שכן איברי $A$ נשלחים רק למספרים הזוגיים ביחידות ואיברי $B$ נשלחים למספרים האי־זוגיים ביחידות.\
  נשאר להראות ש־$g$ חד־חד ערכית: יהיו $(A,B),(C,D) in (cal(P)(NN) times cal(P)(NN))$ ונניח שמתקיים $g(A,B) = g(C,D)$.\
  נפריד לשיוונות בין כל שני חלקים של האיחוד ואנחנו יכולים לעשות זאת כי אוסף המספרים הזוגיים זר לאוסף המספרים האי־זוגיים.\
  מההנחה מתקיים $A'={2n bar n in A} = {2n bar n in C} = C'$, אבל אם $A!=C$ זה אומר שקיים בלי הגבלת הכלליות $a in A$ כך ש־$a in.not C$ ולכן $a in A'$ אבל גם $a in.not C'$ ולכן $A'=C'$ אם ורק אם $A=C$.\
  באותו אופן נקבל שגם $B' = {2n+1 bar n in B} = {2n+1 bar n in D} = D' <==> B=D$.\
  לכן $g$ חד־חד ערכית ו־$abs(cal(P)(NN) times cal(P)(NN)) <= abs(cal(P)(NN))$.\
  ממשפט קנטור־שרדר־ברנשטיין נקבל $abs(cal(P)(NN) times cal(P)(NN)) = abs(cal(P)(NN))$.
]

#subquestion()
נסיק שמתקיים $abs(NN times cal(P)(NN)) = abs(cal(P)(NN))$ וכן $abs(NN times RR) = abs(cal(P)(NN))$.
#proof[
  בכיוון הראשון, נגדיר $f: NN times cal(P)(NN) arrow.r cal(P)(NN) times cal(P)(NN)$ על־ידי $f(n, A) = angle.l {n}, A angle.r$, נראה שהיא חד־חד ערכית:\
  יהיו $n, m in NN$ ו־$A, B subset.eq NN$, מתקיים
  $ f(n, A) = f(m,B) <==> angle.l {n}, A angle.r = angle.l {m}, B angle.r <==> n = m and A = B $
  לכן $f$ חד־חד ערכית ומתקיים $abs(NN times cal(P)(NN))<=abs(cal(P)(NN) times cal(P)(NN)) =_((1)) abs(cal(P)(NN))$, כאשר $(1)$ נובע מסעיף א'.\
  בכיוון השני, נגדיר $g : cal(P)(NN) arrow.r NN times cal(P)(NN)$ על־ידי $g(A) = angle.l min(A), A angle.r$.\
  $g$ מוגדרת היטב כי מעיקרון הסדר הטוב יש מינימום ובפרט $g$ חד־חד ערכית: יהיו $A, B subset.eq NN$, מתקיים
  $ g(A)=g(B) <==> angle.l min(A), A angle.r = angle.l min(B), B angle.r <==> min(A)=min(B) and A=B $
  לכן $g$ חד־חד ערכית ומתקיים $abs(cal(P)(NN))<=abs(NN times cal(P)(NN))$.\
  ממשפט קנטור־שרדר־ברנשטיין נקבל שמתקיים $abs(NN times cal(P)(NN)) = abs(cal(P)(NN))$.\
  בהרצאה ראינו שמתקיים גם $abs(cal(P)(NN)) = abs(RR)$ ולכן מטרנזטיביות נקבל שמתקיים גם $abs(NN times RR) = abs(cal(P)(NN))$ (נקבל זאת גם מהרכבת הפונקציות ההפיכות שקיימות מפאת השיוויון עוצמות).

]

#subquestion()
נסיק שמתקיים $abs(RR^RR) = abs(cal(P)(cal(P)(NN)))$.

#proof[
  ראשית ניזכר $abs(RR) = abs(cal(P)(NN))$ ויחד עם סעיף ב' נסיק $ (diamond.stroked.small) space abs(RR times RR) = abs(RR)=abs(cal(P)(NN))$.\
  בכיוון הראשון, תהיי $f in RR^RR$ משמע $f : RR arrow.r RR$ ולכן $f subset.eq RR times RR$ מהגדרת הפונקציה כיחס.\
  אז $phi : RR^RR arrow.r cal(P)(RR times RR)$ המוגדרת על־ידי $phi(f) = f subset.eq RR times RR$ היא פונקצית חד־חד ערכית כזהות, ולכן $abs(RR^RR)<=abs(cal(P)(RR times RR))$.\
  אבל מ־$diamond.stroked.small$ נקבל בפרט שמתקיים $abs(RR^RR)<=cal(P)(RR times RR) = abs(cal(P)(RR)) = abs(cal(P)(cal(P(NN))))$.\
  בכיוון השני, ראינו במטלה 3 שהפונקציה המציינת מגדירה פונקציה חד־חד ערכית ועל בין $cal(P)(RR)$ לבין ${0,1}^RR$, ולכן $abs(cal(P)(RR)) = abs({0,1}^RR)$.\
  נגדיר $F : {0,1}^RR arrow.r RR^RR$ על־ידי $F(f) = f$ שכן כל פונקציה שתמונתה היא ${0,1} subset.eq RR$ בפרט תמונתה ב־$RR$, משמע $F$ היא הזהות פשוט מורחבת ל־$RR$ בתמונה, ולכן $F$ חד־חד ערכית ונקבל $ abs(cal(P)(cal(P)(NN))) = abs(cal(P)(RR))=({0,1}^RR)<=abs(RR^RR)$.\
  ממשפט קנטור־שרדר־ברנשטיין נקבל כי $abs(RR^RR)=abs(cal(P)(cal(P)(NN)))$.
]

#question()
תהיינה $X, Y$ קבוצות כך ש־$X subset.eq Y$ ותהי פונקציה $f : Y arrow.r X$ חד־חד ערכית.
בכל סעיף נעקוב אחר ההוכחה של משפט קנטור־שרדר־ברנשטיין ונכתוב פונקציה חד־חד ערכית ועל $hat(f) : Y arrow.r X$ המקיימת $hat(f) subset.eq id_Y union f$ (כלומר, פונקציה $hat(f)$ כך שלכל $y in Y$ מתקיים $hat(f)(y) = y$ *או* שמתקיים $hat(f)(y) = f(y)$).
#todo

#subquestion()
נתונים $f(y) = 4y, Y = NN, X = 2NN$.
#solution[]

#subquestion()
נתונים $Y = RR, X = RR without ZZ$ וכן
$
  f(y) = mycases(y+sqrt(2), exists q in QQ space exists n in NN space s.t. space y = q+n sqrt(2), y, "אחרת" )
$
#solution[]
