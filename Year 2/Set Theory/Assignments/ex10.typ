#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 10 --- תורת הקבוצות, 80200 ],
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
תהיי $X$ קבוצה.

#subquestion()
נוכיח ש־$X$ טרנזיטיבית אם ורק אם $X subset.eq cal(P)(X)$.

#proof[
  $<==$ נניח כי $X$ טרנזטיבית ונרצה להראות ש־$X subset.eq cal(P)(X)$.\
  יהי $x in X$. מהגדרת הטרנזטיביות, מתקיים $x subset.eq X$ ולכן מהגדרת קבוצת החזקה $x in cal(P)(X)$ ובפרט מהגדרת תת־קבוצה מתקיים $x subset.eq cal(P)(X)$.\
  $==>$ נניח שמתקיים $X subset.eq cal(P)(X)$ ונראה ש־$X$ טרנזטיבית.\
  יהי $X subset.eq cal(P)(A)$ ויהי $x in X$. מהגדרת תת־הקבוצה מתקיים $x in cal(P)(X)$ ומהגדרת קבוצת החזקה מתקיים $x subset.eq X$ וזה נכון לכל $x in X$, וזו בידיוק ההגדרה של טרנזטיביות (קבוצה $x$ תקרא טרנזטיבית אם לכל $y in x$ ולכן $z in y$ מתקיים $z in x$).
]

#subquestion()
נוכיח שאם $X$ טרנזטיבית אז $cal(P)(X)$ טרנזטיבית.

#proof[
  יהי $Y in cal(P)(X)$ ולכן $Y subset.eq X$.\
  אז לכל $x in Y$ מתקיים $x in X$ ולכן $x subset.eq X$ – משמע $x in cal(P)(X)$ כי $X$ טרנזטיבית.\
  זה נכון לכל $x in Y$ ולכן $Y subset.eq cal(P)(X)$, וזו בידיוק הגדרת הטרנזטיביות ולכן $cal(P)(X)$ טרנזטיבית.
]

#subquestion()
נמצא את כל הקבוצות $X$ כך ש־$cal(P)(X)$ סודר.

#proof[
  ראשית, ברור כי עבור $X = emptyset, cal(P)(X) = {emptyset}$ וראינו בהרצאה שהקבוצה הריקה היא סודר, וראינו גם כי כל $n in omega$ הוא סודר (כי $omega$ הוא סודר וכל איבריו הם סודרים).\
  כעת, ניזכר שקבוצה $X$ תיקרא סודר אם
  + הקבוצה טרנזטיבית
  + $angle.l X, in angle.r$ הוא סדר טוב
  נבחן את המקרה של $X = {emptyset}$ ובמקרה זה מתקיים $cal(P)(X)={emptyset, {emptyset}}$, היות ו־$X$ טרנזטיבית אז במקרה זה גם $cal(P)(X)$ טרנזטיבית וברור שהיא סדורה היטב.\
  נבחן מה קורה עבור $X ={emptyset, {emptyset}}$: במקרה זה מתקיים $cal(P)(X)={emptyset, {emptyset}, {{emptyset}}, {emptyset, {emptyset}}}$ ונראה שזה איננו סודר.\
  נבחן את $A = {emptyset, {emptyset, {emptyset}}}$ ואת $B={{emptyset}}$, מתקיים $B in.not A$ אבל גם מתקיים $A!=B$ וגם $A in.not B$ ולכן זה איננו סדר קווי ובפרט לא סדר טוב.\
  נטען אם כך שלכל קבוצה $X$ כך שמתקיים $abs(X)>2$, אז $cal(P)(X)$ הוא לא סדר טוב, ולכן לא סודר.\
  מכך ש־$abs(X)>2$, קיימים $X_1, X_2 in X$ כך ש־$X_1 != X_2$ וכמובן ${X_1}, {X_2} in cal(P)(X)$ אבל גם מתקיים
  $ {X_1} != {X_2} and {X_1} in.not {X_2} and {X_1} in.not.rev {X_2} $
  משמע זה לא סדר קווי ובפרט לא טוב ולא סודר.\
  ולכן רק $X = emptyset, X = {emptyset}$ עבורם $cal(P)(X)$ סודר.
]

#question()
תהיי $X$ קבוצה שאיבריה הם קבוצות טרנזטיביות.

#subquestion()
נוכיח ש־$union.big X$ קבוצה טרנזטיבית.

#proof[
  נניח כי $X != emptyset$.\
  נתחיל מלהוכיח טענה: תהיי $A in X$, זוהי קבוצה טרנזטיבית מהנתון ונראה כי $union.big A subset.eq A$.\
  בשאלה הקודמת ראינו ש־$x subset.eq A <==> x in cal(P)(A)$ ולכן $forall x in A => x in cal(P)(A)$ ולכן $forall x in A => x subset.eq A$.\
  זה אומר שמתקיים $union.big x in A = A$ מהגדרה ולכן $union.big A subset.eq A$.\
  נשים לב שזה גורר גם ש־$A$ טרנזטיבית (זה בעצם אם ורק אם): יהי $x in A$ אז $x subset.eq union.big A subset.eq A$ ומהגדרת האיחוד קיבלנו ש־$forall x, x in A => x subset.eq A$ וזו הגדרת הטרנזטיביות.\
  כעת, תהיי $x in X$, היא טרנזטיבית ולכן מהטענה לעיל נקבל $union.big x subset.eq x$, נפעיל את פעולת האיחוד על שני־האגפים ונקבל $union.big union.big X subset.eq union.big X$ ומהטענה שראינו לעיל (מהכיוון השני) נקבל ש־$union.big X$ גם טרנזטיבית.
]

#subquestion()
נוכיח ש־$inter.big X$ קבוצה טרנזטיבית.

#proof[
  יהי $y in inter.big X$ משמע $forall x in X, y in x$.\
  מתקיים גם $forall x in X, y in x => y subset.eq x => y subset.eq inter.big X$ משמע קיבלנו שהחיתוך הוא טרנזטיבי.
]

#question()
תהיי $X$ קבוצה ונניח ש-$R_1, R_2 subset.eq X times X$ יחסים על $X$ כך ש־$R_2$ יחס אנטי־רפלקסיבי וטרנזטיבי ו־$R_1$ מקיים שלכל $x,y in X$ שונים מתקיים $(x,y) in R_1$ או $(y,x) in R_1$.\
נוכיח שאם $R_1 subset.eq R_2$ אז מתקיים $R_1=R_2$.

#proof[
  היות ו־$R_2$ הוא אנטי־רפלקסיבי זה גם אומר שכל $(x,y) in R_2$ בהגדרה מתקיים $x!=y$.\
  יהי $(x,y) in R_2$ כך ש־$x!=y$ ונרצה להראות ש־$(x,y) in R_1$.\
  מהגדרת $R_1$ נובע כי אחד מהבאים מתקיים
  + $(x,y) in R_1$ – אם זה המקרה, סיימנו
  + $(y,x) in R_1$ – אם זה המקרה, נראה שנגיע לסתירה:
    נניח כי $(y,x) in R_1$, מכך שמתקיים $R_1 subset.eq R_2$ נובע כי $(y,x) in R_2$, ומהנתון $R_2$ טרנזטיבי ולכן $(x,x) in R_2$ אבל $R_2$ הוא אנטי־רפלקסיבי ולכן $(x,x) in.not R_2$ וזאת סתירה.\
    לכן האפשרות היחידה היא ש־$(x,y) in R_1$.\
  הראינו שלכל $(x,y) in R_2$ מתקיים $(x,y) in R_1$ ולכן $R_2 subset.eq R_1$ ומהכלה דו־כיוונית נקבל $R_2=R_1$.
]

#question()
נניח $(Z, <_Z)$ סדר טוב ונניח $F$ פונקציה שתחומה $Z$ כך שלכל $z in Z$ מתקיים ש־$F(z)$ סודר.\
נגדיר $F(Z) = union.big_(z in Z) F(z)$ ולכל $z in F(z)$ נגדיר $T_z = min_<_Z { t in Z bar z in F(t)}$.\
נגדיר סדר $<_F(Z)$ באופן הבא: עבור $x,y in F(Z)$ מתקיים $x <_F(Z) y$ אם ורק אם $T_x < T_y$ או אם $T_x = T_y$ וגם $x in y$.\
נוכיח שהסדר $<_F(Z)$ מתלכד עם יחס השייכות על $F(Z)$.

#proof[\
  $<==$ נניח כי $x lt_(F(Z)) y$ ונראה $x in y$, נחלק למקרים
  + אם $T_x = T_y$ אז $x<_(F(Z)) y$ ולכן $x in y$+
  + אם $T_x < T_y$ מהגדרה נקבל שמתקיים $x in F(T_x)$ ו־‚$y in F(T_y)$ ומהמינילמיות מתקיים $y in.not F(T_x)$ ומההנחה נקבל שמתקיים $x,y in F(T_y)$
    היות ו־$F(T_x)$ סודר, נובע כי $(F(T_x), in)$ הוא סדר טוב ולכן סדר קווי וכל שני איברים ברי השוואה עם $in$ ולכן $x=y$ או $y in x$.\
    כמובן שלא ייתכן ש־$x=y$ כי אז $T_x=T_y$ בסתירה לנתון ולא ייתכן ש־$y in x$ כי $y in F(T_x)$ בסתירה למינילמיות $T_y$ ולכן בהכרח מתקיים $x in y$.
  $==>$ נניח כי $x in y$ ונרצה להראות שמתקיים $x<_F(Z) y$ ושוב נחלק למקרים
  + אם $T_x=T_y$ יחד עם ההנחה נקבל ש־$X<_(F(Z)) y$ ויתקיים המקרה השני
  + אם $T_x < T_y$ מהגדרת $X<_(F(Z)) y$ נקבל את המקרה הראשון
  \
  הערה: סליחה, לא הצלחתי להבין איך ב־typst עושים ש־$<_F(Z)$ הוא מימין למטה מהצד ולא לגמרי למטה.
]
