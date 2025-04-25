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
#let id = math.op("Id")
#show sym.lt.eq: math.scripts

#question()
נוכיח שאם $X, Y, Z$ קבוצות אז מתקיים $abs((X^Y)^Z)=abs(X^(Y times Z))$.
#proof[
  נעזר בהכוונה ונגדיר $phi : (X^Y)^Z arrow.r X^(Y times Z), psi : X^(Y times Z) arrow.r (X^Y)^Z$ על־ידי
  $
    phi(f)(y,z) = f(z)(y)
    \ psi(f')(z)(y) = f'(y,z)
  $
  נראה שאלו פונקציות הפיכות אחת של השנייה
  $
    psi(phi(f))(z)(y) = phi(f)(y,z) = f(z)(y) => psi(phi(f)) = f\
    phi(psi(f'))(y,z) = psi(f')(z)(y) = f;(y,z) => phi(psi(f'))=f'
  $
  ולכן מצאנו פונקציות הפיכות אחת של השנייה, משמע חד־חד ערכיות ועל ולכן מהגדרת שיוויון עוצמות $abs((X^Y)^Z)= abs(X^(Y times Z))$.
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
  ניעזר ברמז $abs(cal(P)(NN)) = abs({0,1}^NN)$ ונשים לב שמתקיים
  $
    abs(cal(P)(NN)^(QQ)) = abs(({0,1}^NN)^QQ) =_((1)) abs({0,1}^(NN times QQ)) =_((2)) abs({0,1}^NN) = abs(cal(P)(NN))= abs(RR)
  $
  כאשר $(1)$ נובע משאלה 1 ו־2 נובע מכך שמכפלה קרטזית סופית של קבוצות בנות־מנייה היא בת־מנייה.
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
  $g$ מוגדרת היטב כי מעיקרון הסדר הטוב יש מינימום ($A subset.eq NN$) ובפרט $g$ חד־חד ערכית: יהיו $A, B subset.eq NN$, מתקיים
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
  אבל מ־$diamond.stroked.small$ נקבל בפרט שמתקיים $abs(RR^RR)<=abs(cal(P)(RR times RR)) = abs(cal(P)(RR)) = abs(cal(P)(cal(P(NN))))$.\
  בכיוון השני, ראינו במטלה 3 שהפונקציה המציינת מגדירה פונקציה חד־חד ערכית ועל בין $cal(P)(RR)$ לבין ${0,1}^RR$, ולכן $abs(cal(P)(RR)) = abs({0,1}^RR)$.\
  נגדיר $F : {0,1}^RR arrow.r RR^RR$ על־ידי $F(f) = f$ שכן כל פונקציה שתמונתה היא ${0,1} subset.eq RR$ בפרט תמונתה ב־$RR$, משמע $F$ היא הזהות פשוט מורחבת ל־$RR$ בתמונה, ולכן $F$ חד־חד ערכית ונקבל $ abs(cal(P)(cal(P)(NN))) = abs(cal(P)(RR))=({0,1}^RR)<=abs(RR^RR)$.\
  ממשפט קנטור־שרדר־ברנשטיין נקבל כי $abs(RR^RR)=abs(cal(P)(cal(P)(NN)))$.
]

#question()
תהיינה $X, Y$ קבוצות כך ש־$X subset.eq Y$ ותהי פונקציה $f : Y arrow.r X$ חד־חד ערכית.
בכל סעיף נעקוב אחר ההוכחה של משפט קנטור־שרדר־ברנשטיין ונכתוב פונקציה חד־חד ערכית ועל $hat(f) : Y arrow.r X$ המקיימת $hat(f) subset.eq id_Y union f$.

#subquestion()
נתונים $f(y) = 4y, Y = NN, X = 2NN$.
#solution[
  נשתמש בחלק הראשון של ההוכחה של המקרה הפרטי של משפט קנטור־שרדר־ברנשטיין ונחזר את התהליך.\
  נסמן $A = NN = Y$ ו־$B = 2NN = X$, $f=F$ (בשביל לשמור על עקביות עם ההוכחה מההרצאה).\
  עלינו להגדיר פונקציה $H: A arrow.r B$ שהיא חד־חד ערכית ועל.\
  נסמן $C_0 = A without B = 2NN+1$, האי־זוגיים.\
  עבור כל $a in C_0$ בהכרח מתקיים $H(a) = F(a) = 4a$ כיוון שתמונת $H$ צריכה להיות בתוך $B = 2NN$.\
  נסמן $ C_1 = F[C_0] = {n in NN bar 4 divides n and 8 divides.not n} $
  נקבל כי $C_1 inter C_0 = emptyset$ ושלכל $a in C_1$ נגדיר $H(a)=F(a)$ זאת שכן אחרת באופן דומה להוכחה מההרצאה, לא אפשרי תחת ההגבלות שלנו להגדיר בדרך אחרת.\
  נמשיך ברקורסיה ונגדיר $ C_(n+1) = F[C_n] $
  ובהתאם נקבל שתחת האילוץ בהכרח מתקיים $H harpoon.tr C_(n+1) = F harpoon.tr C_n$.\
  נסמן $C = union.big {C_n bar n in NN}$ ונגדיר
  $ H = F harpoon.tr C union id_(A without C) $
  זו אכן פונקציה מ־$A$ ל־$B$ שכן $A without C subset.eq A without C_0= A without (A without B)$. \
  מהטענה מההרצאה נובע כי $H$ היא חד־חד ערכית ועל.\
  ואכן, עבור $x in Y$ אם קיים $n in NN$ כך ש־$x in C_n$ אזי $H(x) = F(x)$ וזה קורה אם ורק אם $4^k divides x and 2 dot.op 4^k divides.not x$. \
  הראשון קורה אם $k$ חזקה זוגית והשני קורה כאשר $k$ חזקה אי־זוגית.\
  לכן $hat(f) = H$ מקיימת את הנדרש.
]

#subquestion()
נתונים $Y = RR, X = RR without ZZ$ וכן
$
  f(y) = mycases(y+sqrt(2), exists q in QQ space exists n in NN space s.t. space y = q+n sqrt(2), y, "אחרת" )
$
#solution[
  בדומה לסעיף הקודם, נסמן $A = RR, B = RR without ZZ, f = F$.\
  מהסעיף הקודם אנחנו רק צריכים לאפיין את $C_n$ לכל $n$.\
  נבחין ש־$C_0 = A without B = RR without (R without ZZ) = ZZ$.\
  נשים לב ש־$C_1 = F[C_0] = {y + sqrt(2) bar y in ZZ}$, ואז נקבל $C_n = F[C_(n-1)] = {y + sqrt(2) bar y in C_(n-1)} = {y + n sqrt(2) bar y in ZZ}$.\
  באופן זהה לסעיף הקודם אם נגדיר $ hat(f)(y) = mycases(f(y), exists z in ZZ"," space exists n in NN space s.t.space y = z+n sqrt(2), y, "אחרת") $

]
