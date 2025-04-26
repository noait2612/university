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
#proof[]

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
  חד־חד ערכיות: יהיו $a = (x_1, (l_1, i_1)), c = (x_2, (l_2, i_2)) in X times (Y union.plus Z) $, נשים לב שמתקיים
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
  נשים לב שמתקיים $ abs(X^(Y union.plus Z)) = abs(X^((Y times {0} union (Z times {1})))) =_((1)) abs((X^(Y times {0})^(Z times {1})))  = $
]
