#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 05 --- תורת הקבוצות, 80200 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)
#show sym.lt.eq: math.scripts

#question()
נוכיח מאקסיומות פאנו את הטענה הבאה
$ forall x space forall y space (x dot.op y = y dot.op x) $
#proof[
  נשתמש באקסיומות פאנו מסדר שני הבאות
  $
    (1) space forall x(x dot.op 0 = 0) \
    (2) space forall x forall y (x dot.op S(y) = x dot.op y + x) \
    (3) space forall A subset.eq N((0 in A and (forall x(x in A arrow.r S(x) in A) arrow.r A = N))) \
    (4) space forall x (x+0 = x) \
    (5) space forall x forall y space x+y = y+x space ("הוכחנו בתרגול")
  $
  לכל $x in NN$ נסמן $A_x = {y in NN bar x dot.op y = y dot.op x}$ ונסמן גם $A = {x in NN bar A_X = NN}$ ונרצה להראות שמתקיים $A = NN$.\
  כדי להראות זאת, מאקסיומת האינדוקציה $(3)$ מספיק להראות ש־$0 in A$ ואז שלכל $x in A$ גם $S(x) in A$.\
  נראה שמתקיים $0 dot.op m = 0$ לכל $m in NN$:\
  מאקסיומה $(2)$ נובע ש־$A_0 = NN$. נניח שמתקיים $m in A_0$, כלומר $0 dot.op m = 0$
  אז מאקסיומה $(2)$ מתקיים
  $ 0 dot.op S(m) = 0 dot.op m + 0 =_((star.op)) 0 dot.op m=_((star.op star.op)) 0 $
  כאשר $(star.op)$ נובע מאקסיומה $(4)$ לעיל ו־$(star.op star.op)$ נובע מהנחת האינדוקציה, ולכן $0 in A$.\
  נניח שמתקיים $x in A$ ונרצה להראות ש־$S(x) in A$ ואז $A_(S(x)) = NN$.\
  נראה ש־$0 in A_(S(x))$ ושלכל $m in A_(S(x))$ מתקיים $S(m) in A_(S(x))$: נשים לב ש־ $S(x) dot.op 0 = 0 dot.op S(x)$ לפי מה שהראינו עבור $A_0$, ולכן נניח \
  $m in A_(S(x))$ כלומר $S(x) dot.op m = m dot.op S(x)$. \
  כמו כן, נשים לב שמתקיים
  $ S(m) dot.op S(x) = S(m) dot.op x + S(m) $
  וכן עם אקסיומה $(3)$ נקבל
  $
    S(x) dot.op S(m) =_((2)) S(x) dot.op m + S(x) =_(m in A_S(x)) m dot.op S(x) + S(x) =_((2)) m dot.op x + m + S(x) =_((5)) m dot.op x + x + S(m) \
    =_("הנחת האינדוקציה") x dot.op m + x + S(m) =_((2)) x dot.op S(m)+S(m) =_("הנחת האינדוקציה") S(m) dot.op x + S(m) = S(m) dot.op S(x)
  $
  כאשר המיספורים הם בהתאם למיספור האקסיומות לעיל וקיבלנו את הנדרש.
]

#question()
תהיינה $X,Y,Z$ קבוצות.
ניזכר $X union.plus X' = (X times {0}) union (X' times {1})$.

#subquestion()
נוכיח שמתקיים $abs(X times (Y union.plus Z)) = abs((X times Y) union.plus(X times Z))$.
#proof[
  נגדיר $f : X times (Y union.plus Z) arrow.r (X times Y) union.plus(X times Z)$ על־ידי
  $ f(x, (l, i)) = ((x, l), i) $
  $f$ מוגדרת היטב: נשים לב שאיברי $X times (Y union.plus Z)
  X times (Y union.plus Z)$ הם משתי צורות אפשריות:
  1. $(x,(y,0))$ עבור $x in X, y in Y$ שימופה ביחידות אל $((x,y),0)$
  2. $(x,(z,1))$ עבור $x in X, z in Z$ שימופה ביחידות אל $((x,z),1)$
  ולכן $f$ מוגדרת היטב. נראה כי היא חד־חד ערכית ועל.\
  על: יהי $b=((x,l), i) in (X times Y) union.plus(X times Z)$ נשים לב שבבחירה של $a = (x, (l, i)) in X times (Y union.plus Z)$ נקבל $f(a)=b$ ולכן $f$ על.\
  חד־חד ערכיות: יהיו $a = (x_1, (l_1, i_1)), c = (x_2, (l_2, i_2)) in X times (Y union.plus Z)$, נשים לב שמתקיים
  $ f(a) = f(c) <==> ((x_1, l_1), i_1) = ((x_2, l_2), i_2) <==> x_1 = x_2 and l_1 = l_2 and i_1 = i_2 <==> a = c $
  ולכן $f$ חד־חד ערכית.\
  מצאנו פונקציה חד־חד ערכית ועל $f$ ולכן לפי הגדרת שיוויון עוצמות מתקיים $abs(X times (Y union.plus Z)) = abs((X times Y) union.plus(X times Z))$.
]

#subquestion()
נוכיח שמתקיים $abs((X times Y)^Z) = abs(X^Z times Y^Z)$.
#proof[
  לכל $f in (X times Y)^Z$ ולכל $z in Z$ נסמן $f(z) colon.eq angle.l x, y angle.r$.\
  נגדיר גם $g: Z arrow.r X, h: Z arrow.r Y$ על־ידי $g(z)=x, space h(z)=y$ (לכל $z in Z$ בהתאם ל־$f$).\
  בהתאמה, נגדיר את $phi : (X times Y)^Z arrow.r (X^Z times Y^Z)$ על־ידי $phi(f) colon.eq angle.l g,h angle.r$.\
  נראה כי $phi$ חד־חד ערכית ועל:\
  על: יהיו $(g, h) in (X^Z times Y^Z)$ ולכן $psi(z) = angle.l g(z), h(z) angle.r$ (ואכן $psi : Z arrow.r X times Y$ מקיימת $phi(psi)= angle.l g,h angle.r$).\
  חד־חד ערכית: יהיו $f_1, f_2 in (X times Y)^Z$, נשים לב שמתקיים
  $
    phi(f_1) = phi(f_2) <==> angle.l g_1, h_1 angle.r = angle.l g_2, h_2 angle.r <==> forall z in Z, g_1(z)=g_2(z) and h_1(z) = h_2(z) <==> f_1 = f_2
  $
  ולכן $phi$ חד־חד ערכית.\
  מצאנו פונקציה חד־חד ערכית ועל ולכן לפי הגדרת שיוויון עוצמות מתקיים $abs((X times Y)^Z) = abs(X^Z times Y^Z)$.
]

#subquestion()
נוכיח שמתקיים $abs(X^(Y union.plus Z)) = abs(X^Y times X^Z)$.
#proof[
  תהיי $f : Y union.plus Z arrow.r X$, נגדיר את $phi: X^(Y union.plus Z) arrow.r X, phi_1 : Y arrow.r X, phi_2 Z arrow.r X$ על־ידי
  $
    phi_1(y) = f(angle.l y, 0 angle.r)\
    phi_2(z) = f(angle.l z, 1 angle.r)\
    phi(f) = angle.l phi_1, phi_2 angle.r
  $
  $phi, phi_1, phi_2$ מוגדרות היטב מהגדרת $Y union.plus Z$, נראה כי $phi$ חד־חד ערכית ועל:\
  על: יהי $(g, h) in X^Y times X^Z$, ונרצה להראות שקיימת $f in Y union.plus Z arrow.r X$ כך שמתקיים $phi(f) = angle.l g, h angle.r$.\
  נגדיר $ f(angle.l alpha, i angle.r ) = mycases(g(alpha), i=0, h(alpha), i =1) $
  ואז $phi(f) = angle.l g,h angle.r$ וקיבלנו ש־$phi$ על.\
  נראה כי $phi$ חד־חד ערכית: יהיו $f_1, f_2 in X^(Y union.plus Z)$ כך שמתקיים $phi(f_1)= phi(f_2)$, נשים לב שמתקיים:
  $
    phi(f_1) = phi(f_2) <==> angle.l phi_1_(f_1), phi_2_(f_1) angle.r = angle.l phi_1_(f_2), phi_2_(f_2) angle.r <==>\ forall y in Y, space f_1(angle.l y, 0 angle.r) = f_2(angle.l y, 0 angle.r) and forall z in Z, space f_1(angle.l z, 1 angle.r) = f_2(angle.l z, 1 angle.r) <==> f_1 = f_2
  $
  משמע $f_1 = f_2$ וקיבלנו כי $phi$ חד־חד ערכית.\
  מצאנו פונקציה חד־חד ערכית ועל ולכן לפי הגדרת שיוויון עוצמות מתקיים $abs(X^(Y union.plus Z)) = abs(X^Y times X^Z)$.
]
