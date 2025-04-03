#import "../../../src/article.typ": *
#show: article.with(
	title: [ פתרון מטלה 02 --- תורת הקבוצות, 80200 ],
	author: [  ],
	signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]]
)

#set math.cases(gap: 1em)
#let rng = math.op("Range")

#question()
תהיינה $X, Y, X', Y'$ קבוצות המקיימות $abs(X)=abs(Y), abs(X')=abs(Y')$.

#subquestion()
נוכיח שמתקיים $abs(X times X')=abs(Y times Y')$.
#proof[
מכך שמתקיים $abs(X)=abs(Y)$ נובע שקיימת פונקציה חד־חד ערכית ועל $f: X arrow.r Y$ ומכך שמתקיים $abs(X')=abs(Y')$ קיימת פונקציה חד־חד ערכית ועל $g: X' arrow.r Y'$.\
נגדיר $f: X times X' arrow.r Y times Y'$ על־ידי $h(x,x') = angle.l f(x) , g(x') angle.r$.  נראה כי היא חד־חד ערכית ועל: \
חד־חד ערכית: נשים לב שמתקיים $ h(x_1, x'_1) = h(x_2, x'_2) <==> angle.l f(x_1), g(x'_1) angle.r = angle.l f(x_2), g(x'_2) angle.r <==> f(x_1) = f(x_2) and g(x'_1) = g(x'_2) <==>_((1)) x_1=x_2 and x'_1 = x'_2 $
כאשר $(1)$ נובע מהיות $f$ ו־$g$ חד־חד ערכיות. \
על: יהי $angle.l y, y' angle.r in Y times Y'$. מהיות $f$ על, נובע כי קיים $x_y in X$ כך שמתקיים $f(x)=y$ ומכך ש־$g$ על נובע שקיים $x'_y' in X'$ כך שמתקיים $g(x')=y'$. ולכן $h(x_y, x'_y') = angle.l y, y' angle.r$ וקיבלנו ש־$h$ על. \
מצאנו פונקציה חד־חד ערכית ועל ולכן מהגדרת שיוויון עוצמות נובע $abs(X times X')=abs(Y times Y')$.
]

#subquestion()
נניח שמתקיים $X inter X' = Y inter Y' = emptyset$ ונוכיח שמתקיים $abs(X union X')=abs(Y union Y')$.
#proof[
מכך שמתקיים $abs(X)=abs(Y)$ נובע שקיימת פונקציה חד־חד ערכית ועל $f: X arrow.r Y$ ומכך שמתקיים $abs(X')=abs(Y')$ קיימת פונקציה חד־חד ערכית ועל $g: X' arrow.r Y'$.\
נגדיר כמו בתרגול: $ f xor g(x) = cases( f(x) wide& x in X, g(x) wide& x in X') $
הפונקציה מוגדרת היטב שכן מכך ש־$X inter X' = Y inter Y' = emptyset$ נובע שכל $x in X union X'$ נשלח לערך יחיד תחת $f xor g$. \
נראה שהיא חד־חד ערכית ועל: את החד־חד ערכיות ראינו בתרגול, נראה שהיא גם על: יהי $y in Y union Y'$. \
מכך שמתקיים $Y inter Y' = emptyset$ נובע כי $y in Y$ או $y in Y'$. \
אם $y in Y$, מהיות $f$ על, נובע כי קיים $x in X$ כך שמתקיים $f(x)=y$. \
אם $y in Y'$, מהיות $g$ על, נובע כי קיים $x in X'$ כך שמתקיים $g(x')=y$. \
מכך שמתקיים $X inter X' = emptyset$ נובע כי $x!=x'$ ואלו שני מקרים שונים. \
מהגדרת $f xor g$ נובע כי קיים $x in X union X'$ כך שמתקיים $f xor g(x) = y$ וקיבלנו כי $f xor g$ חד־חד ערכית ועל.\
מצאנו פונקציה חד־חד ערכית ועל ולכן מהגדרת שיוויון עוצמות נובע $abs(X union X')=abs(Y union Y')$.
]

#pagebreak()

#subquestion()
נוכיח שמתקיים $abs(X^(X'))=abs(Y^(Y'))$.
#proof[
מכך שמתקיים $abs(X)=abs(Y)$ נובע כי קיימת פונקציה חד־חד ערכית ועל $f: X arrow.r Y$ ומכך שמתקיים $abs(X')=abs(Y')$ נובע שקיימת פונקציה חד־חד ערכית ועל $g: X' arrow.r Y'$. \
נגדיר $phi: X^(X') arrow.r Y^(Y')$ על־ידי $phi(h)(y') = (f compose h compose g^(-1))(y')$ ו־$phi$ מוגדרת היטב כהרכבה של פונקציות. \ 
נראה כי $phi$ היא חד־חד ערכית ועל: \ 
חד־חד ערכית: נניח כי קיימים $h, h' in X^(X')$ כך שמתקיים $phi(h')=phi(h)$, נשים לב כי מתקיים:
$ phi(h') = phi(h) <==> forall y' in Y', quad phi(h')(y')=phi(h)(y') <==> f(h'(g^(-1)(y'))) = f(h(g^(-1)(y'))) <==>_((1)) h(g^(-1)(y'))=h'(g^(-1)(y')) $
כאשר $(1)$ נובע מהיות $f$ הפיכה. \
כמו כן, מכיוון ש־$g$ הפיכה מתקיים שלכל $x' in X'$ קיים ויחיד $y' in Y'$ כך שמתקיים $g^(-1)(y')=x'$, ולכן נקבל
$ h(g^(-1)(y'))=h'(g^(-1)(y')) <==> forall x' in X, quad h'(x')=h(x') ==> h'=h $
וקיבלנו $phi$ היא חד־חד ערכית. \
נראה כי $phi$ היא על, ולכן עלינו להוכיח שלכל $l: Y' arrow.r Y$, קיימת $h : X' arrow.r X$ כך שמתקיים $phi(h) = l$. מתקיים: 
$ forall y' in Y', quad phi(h)(y') = l(y') <==>_("def") f(h(g^(-1)(y'))) = l(y') <==>_((1)) h(g^(-1)(y')) = (f^(-1) compose l)(y') $
כאשר $(1)$ נובע מהיות $f$ הפיכה. \
אבל מהיות $g$ הפיכה נובע שלכל לכל $y' in Y'$ קיים ויחיד $x' in X'$ כך שמתקיים $g(x)=y$ ולכן:
$ forall x' in X', quad h(g^(-1)(g(x))) = (f^(-1)(l(g(x)))) ==> h(x) = (f^(-1)(l(g(x)))) $
מצאנו בנייה ל־$h$ ולכן לכל $l$ קיים מקור ובהתאם $phi$ על.\
מצאנו פונקציה חד־חד ערכית ועל בין $X^(X')$ לבין $Y^(Y')$ ולכן מהגדרת שיוויון עוצמות מתקיים $abs(X^(X'))=abs(Y^(Y'))$.
]

#question()
תהיינה $X, X'$ קבוצות.

#subquestion()
נוכיח ש־$(X times {0}) inter (X' times {1}) = emptyset$.
#proof[
נניח בשלילה ש־$(X times {0}) inter (X' times {1}) != emptyset$ ולכן קיים $(a,b) in (X times {0}) inter (X' times {1})$. \
מהגדרת החיתוך נובע כי $(a,b) in X times {0}$ ולכן $b=0$. מצד שני, מהגדרת החיתוך נובע כי גם $(a,b) in X' times {1}$ ולכן $b=1$ וזו סתירה.
]

#subquestion()
נגדיר $X union.plus X' = (X times {0}) union (X' times {1})$ ונגדיר פונקציה $f: X union.plus X' arrow.r X union X'$ על־ידי $f(a,i)=a$. \
נוכיח ש־$f$ היא על.
#proof[
נניח בשלילה כי $f$ איננה על, ולכן קיים $x_0 in X union X'$ כך שלא קיים $(x,i) in X union.plus X'$ המקיים $f(x,i) = x_0$. \
אבל $x_0 in X union X'$ ולכן מתקיימים אחד מהבאים: \
$x_0 in X$ ולכן $f(x_0,0) = x_0$ או $x_0 in X'$ ולכן $f(x_0, 1)=x_0$ או $x_0 in X and x_0 in X'$ ואז $f(x_0, 0)=f(x_0, 1) = x_0$. \
בכל מקרה הגענו לסתירה ולכן $f$ על.
]

#subquestion()
נוכיח שהפונקציה מהסעיף הקודם היא חד־חד ערכית אם ורק אם $X inter X'=emptyset$.
#proof[ \
$<==$ נניח כי $f$ חד־חד ערכית ונראה כי $X inter X'=emptyset$. \
נניח בשלילה כי $X inter X' != emptyset$ ולכן קיים $x_0 in X inter X'$, ולכן $x_0 in X$ מקיים $f(x_0, 0)=x_0$ אבל מהגדרת החיתוך $x_0 in X'$ ולכן מתקיים $f(x_0, 1)=x_0$ וזו סתירה לחד־חד ערכיות של $f$ ולכן $X inter X'=emptyset$. \
$==>$ נניח $X inter X'=emptyset$ ונראה כי $f$ חד־חד ערכית. \
נניח כי $f$ לא חד־חד ערכית, ולכן קיימים $(x_1, i_1), (x_2, i_2) in X union.plus X'$ כך ש־$(x_1, i_1) != (x_2, i_2)$ אבל $f((x_1, i_1))=f((x_2, i_2))$, אבל אז מהגדרת $f$ נובע $x_1 = x_2$, אבל $X inter X' = emptyset$ ולכן נקבל $i_1 = i_2 = 0$ או $i_1 = i_2 = 1$ ולכן $f$ חד־חד ערכית.
]

#pagebreak()
#subquestion()
נגדיר $i: X arrow.r X union.plus X'$ על־ידי $i(x) = (x,0)$ ונגדיר $i': X' arrow.r X union.plus X'$ על־ידי $i'(x) = (x,1)$. \
נוכיח שאם יש קבוצה $Y$ ופונקציות $f: X arrow.r Y$ ו־$g: X' arrow.r Y$ אז יש פונקציה יחידה $f xor g: X union.plus X' arrow.r Y$ המקיימת $(f xor g) compose i = f$ וגם $(f xor g) compose i' = g$.
#proof[ \
נניח כי קיימת קבוצה $Y$ ופונקציות $f: X arrow.r Y$ ו־$g: X' arrow.r Y$ לעיל ונראה כי קיימת פונקציה יחידה המקיימת את הנדרש. \
נגדיר: $ f xor g = { angle.l angle.l  x, j angle.r, y angle.r bar (j=0 and y=f(x) and x in X) or (j=1 and y=g(x) and x in X') } $
נשים לב שמתקיים מהגדרת $i$ ו־$f xor g$:
$ forall x in X, quad ((f xor g) compose i)(x) = (f xor g)(angle.l x, 0 angle.r) = f(x) ==> (f xor g) compose i = f $
באותו אופן נובע מהגדרת $i'$ ו־$f xor g$:
$ forall x' in X', quad ((f xor g) compose i')(x') = (f xor g)(angle.l x', 1 angle.r) = g(x) ==> (f xor g) compose i' = g $
ולכן הראינו קיום, נשאר להראות יחידות: נניח כי $h = f xor g$ ו־$h'$ המקיימות את הנדרש ונראה שהן זהות. מתקיים מהגדרה:
$ forall a in X union.plus X', quad h'(a) = cases(f(x) quad a = angle.l x","0 angle.r, g(x) quad a = angle.l x","1 angle.r) = h(a) $
ולכן $h=h'$ ו־$h$ מוגדרת ביחידות.
]

#question()
תהיינה $X, X', Y, Y'$ קבוצות כך שמתקיים $abs(X)<=abs(Y)$ ו־$abs(X')<=abs(Y')$.

#subquestion()
נניח $X inter X' = emptyset$ אבל $Y inter Y' != emptyset$. נפריך את הטענה $abs(X union X')<=abs(Y union Y')$.
#proof[
נגדיר $ X = {1,2,3}, X' = {4,5}, Y = {1,2,3}, Y' = {3,4} $ אכן מתקיים $abs(X)<=abs(Y), abs(X')<=abs(Y')$ ו־$X inter X' = emptyset$. \ 
אבל 
$X union X' = {1,2,3,4,5} => abs(X union X') = 5$ ומנגד $Y union Y' = {1,2,3,4} => abs(Y union Y') = 4$. \ 
ניתן דוגמה גם לקטן ממש:
נגדיר $ X = {1,2}, X' = {4,5}, Y = {1,2,3} = Y' $ אכן מתקיים $abs(X)<=abs(Y), abs(X')<=abs(Y')$ ו־$X inter X' = emptyset$. \ 
אבל 
$X union X' = {1,2,4,5}$ אז $ abs(X union X') = 4$ ומנגד $Y union Y' = {1,2,3} $ וכן $ abs(Y union Y') = 3$. \ 
נשים לב שבשני המקרים לא יכולה להיות פונקציה חד־חד ערכית מעקרון שובך היונים – יש לנו יותר יונים (איברים ב־$X union X'$) מאשר שובכים (איברים ב־$Y union Y'$) ולכן בהכרח יהיה לנו שובך עם שתי יונים, דהיינו פונקציה לא חד־חד ערכית.
]

#subquestion()
נניח $X inter X' = emptyset$ וגם $Y inter Y' = emptyset$. נוכיח שמתקיים $abs(X union X')<=abs(Y union Y')$.
#proof[
מכך שמתקיים $abs(X)<=abs(Y)$ נובע כי קיימת פונקציה חד־חד ערכית $f: X arrow.r Y$ ומכך שמתקיים $abs(X')<=abs(Y')$ נובע כי קיימת פונקציה חד־חד ערכית $g: X' arrow.r Y'$. \
נגדיר $h: X union X' arrow.r Y union Y'$ על־ידי: $ h(x) = cases( f(x) wide& x in X, g(x) wide& x in X') $
הפונקציה מוגדרת היטב שכן $X inter X' = emptyset$ ולכן כל $x_0 in X union X'$ נשלח לערך יחיד תחת $h$.\
$h$ חד־חד ערכית, שכן $f$ ו־$g$ חד־חד ערכיות ומכך ש־$Y inter Y' = emptyset$ נובע שלכל $x in X$ ולכל $x' in X'$ מתקיים $f(x)!=g(x')$. \
מצאנו פונקציה חד־חד ערכית בין $X union X'$ לבין $Y union Y'$ ולכן מתקיים $abs(X union X')<=abs(Y union Y')$.
]

#subquestion()
נניח $X=X'=emptyset$. נפריך את הטענה $abs(X^(X'))<=abs(Y^(Y'))$.
#proof[
בהרצאה ראינו שאם $X = X'=emptyset$ אז $emptyset : X arrow.r X'$ היא חד־חד ערכית, על ויחידה. \ 
נבחר $Y = emptyset, Y'!= emptyset$ ונשים לב שבמקרה זה מתקיים $abs(Y^(Y'))=0$: \
נשים לב שבמקרה זה אנחנו לא מקיימים את הגדרת הפונקציה: אמרנו כי יחס $F$ בין $Y'$ ל־$Y$ נקרא פונקציה אם לכל $y' in Y'$ קיים $y in Y$ \ כך ש־$ angle.l y', y angle.r in F$ אבל $Y = emptyset$ וקיבלנו סתירה להגדרת הפונקציה.\
לכן נקבל במקרה זה שמתקיים $abs(X^(X'))=1<=0=abs(Y^(Y'))$ וזו סתירה.
]

#subquestion()
נניח $X' = emptyset$ אבל $X != emptyset$. נוכיח שמתקיים $abs(X^(X'))<=abs(Y^(Y'))$.
#proof[
ראשית נשים לב שמהיות $X != emptyset$ נובע כי $Y != emptyset$ שכן $1<=abs(X)<=abs(Y)$. \
נשים לב שמהיות $X' = emptyset$ נובע כי $abs(X^(X'))=1$: ניזכר כי היחס $F$ יקרא פונקציה אם לכל $x' in X$ קיים $x in X$ כך ש־$ angle.l x', x angle.r in F$. \
מכך ש־$X' = emptyset$, המכפלה הקרטזית $emptyset times X$ ריקה, ולכן היחס היחידי שיתאים הוא היחס הריק: לכל $x' in emptyset$ קיים $x in X$ יחד כך שמתקיים $(x', x) in emptyset times X = emptyset$. נקבל אם כך $abs(X^(X'))=1$. \
כעת, אם נבחר $Y' = emptyset$ נקבל $abs(Y^(Y'))=1$ וזו התוצאה המינימלית מהנימוק לעיל ומכך ש־$Y != emptyset$. \
נקבל בסך־הכל שמתקיים $abs(X^(X'))=1<=1=abs(Y^(Y'))$.
]

#question()
תהיינה $X', Y'$ קבוצות ונניח שמתקיים $X'!=emptyset$ וגם $abs(X')<=abs(Y')$. נוכיח שיש פונקציה על $g: Y' arrow.r X'$.
#proof[
מכך שמתקיים $abs(X')<=abs(Y')$ נובע כי קיימת $f: X' arrow.r Y'$ חד־חד ערכית ומתקיים $Y' = f(X') union.plus (Y' without f(X'))$. \
יהי $x'_0 in X' without f^(-1)(X')$ (אם $X' without f^(-1)(X')=emptyset$ הטענה טריוויאלית כי $f$ הפיכה ו־$f^(-1)$ הפיכה גם כן).\
מהיות $f$ חד־חד ערכית נובע שלכל $y' in f(X')$ קיים $x'_y' in X'$ יחיד כך שמתקיים $f(x'_y')=y'$. נגדיר $g: Y' arrow.r X'$ על־ידי: $ g(y') = cases(f^(-1)(y') wide& y' in f(X'), x'_0 & y' in.not f(X')) $ 
$g$ מוגדרת היטב שכן לכל $f(X') inter (Y' without f(X')) = emptyset$ ולכן כל $y' in Y'$ נשלח לערך יחיד תחת $g$. \
היות ו־$f$ חד־חד ערכית נובע $abs(X')=abs(f(X'))<=abs(Y)$ וקיבלנו ש־$g$ על (שכן לכל $x' in X'$ קיים $y' in Y$ כך שמתקיים $g(y')=x'$).
]