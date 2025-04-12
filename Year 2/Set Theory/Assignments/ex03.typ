#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- תורת הקבוצות, 80200 ],
  author: [ ],
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

#question()
תהיי $A$ קבוצה. לכל $A_0 subset.eq A$ נתאים פונקציה $chi_A_0 : A arrow.r {0,1}$, הנקראת הפונקציה המציינת של $A_0$, באופן הבא:
$ chi_(A_0) (a) = cases(1 wide a in A_0, 0 wide "אחרת") $
נוכיח שהתאמה זו מגדירה פונקציה חד־חד ערכית ועל $chi : cal(P)(A) arrow.r {0,1}^A$.
#proof[
  נגדיר $phi : {0, 1}^A arrow.r cal(P)(A)$ על־ידי $f mapsto f^(-1)(1) = {a in A bar f(a)=1}$ כאשר $f in {0,1}^A$.\
  נראה $chi compose phi = id_({0,1}^A)$ וכן $phi compose chi = id_(cal(P)(A))$ ואז פונקציות אלו הופכיות אחת של השנייה ולכן $chi$ היא פונקציה חד־חד ערכית ועל.\
  בכיוון הראשון, תהיי $A in cal(P)(A)$ ונרצה להראות ש־$(phi compose chi)(A) = A$:
  $ (phi compose chi)(A) = phi(chi(A)) = {a in A bar chi_A (a)=1} =_((1)) A $
  כאשר $(1)$ נובע מכך שלכל $A in cal(P)(A)$ ולכל $x in X$ מתקיים $chi_A (x) = 1$ אם ורק אם $x in A$. \
  בכיוון השני, תהיי $f in {0,1}^A$ ונרצה להראות ש־$(chi compose phi)(f) = f$:
  $ (chi compose phi)(f) = chi({a in A bar f(x)=1}) =_((1)) f $
  כאשר $(1)$ נובע מכך שאם נסמן $S = {a in A bar f(x)=1}$ אז $chi_S (x) = 1 <==> f(x)=1$ וגם $chi_S (x) = 0 <==> f(x)=0$ אבל זוהי בידיוק ההגדרה של $f$. \
  הראינו כי $phi$ ו־$chi$ הופכיות אחת של השנייה ולכן ההתאמה של הפונקציה המציינת מגדירה פונקציה חד־חד ערכית ועל על $chi$. \
  אפשר להוכיח זאת גם על־ידי זה שנראה ש־$chi$ היא חד־חד ערכית ועל: \
  על: יהי $f in {0,1}^A$ ונראה להראות שקיים $S in cal(P)(A)$ כך ש־$chi_S (a) = f(a)$. לכל $a in A$. \
  נגדיר $S = {a in A bar f(a)=1 }$ ואז לכל $a in A$ יתקיים:
  $ chi_S (a) = cases(1 wide a in S, 0 wide "אחרת") $
  ולפי איך שבנינו את $S$ נקבל $chi_S (a) = f(a)$ לכל $a in A$, ולכן קיבלנו שהיא על.\
  חד־חד ערכיות: נניח כי קיימות $S_1, S_2 in cal(P)(A)$ כך שמתקיים $chi_(S_1) = chi_(S_2)$, משמע לכל $a in A$ מתקיים:
  $
    chi_(S_1) (a) = chi_(S_2) (a) <==> chi_A_0 (a) = cases(1 wide a in S_1, 0 wide "אחרת") = cases(1 wide a in S_2, 0 wide "אחרת") = chi_(S_2) (a)
  $
  במילים אחרות $S_1$ ו־$S_2$ מזדהות איבר־איבר משמע $S_1 = S_2$ והראינו כי $chi$ היא חד־חד ערכית.
]

#question()
נוכיח שלכל $n,m in NN_(>0)$, הקבוצה $[QQ^n]^m = { A subset.eq QQ^n bar abs(A) = abs([m])}$ בת־מנייה.
#proof[
  יהיו $n, m in NN_(>0)$ כאשר $[QQ^n]^m$ זה אוספים בגודל $m$ של וקטורים מעל $QQ^n$. \
  ראשית, נוכיח באינדוקציה כי $display(QQ^n = times.big_(i=1)^n QQ)$ היא בת־מנייה: \
  עבור בסיס האינדוקציה, $QQ$ בת־מנייה ובהרצאה ראינו שמכפלה קרטזית של קבוצות בנות מנייה היא בת־מנייה ולכן $QQ^2$ היא בת־מנייה.\
  נניח כי הטענה נכונה עבור $k in NN$ משמע $QQ^k$ היא בת־מנייה ונרצה להראות שגם $QQ^(k+1)$ היא בת־מנייה. מתקיים:
  $ times.big_(i=1)^(k+1) QQ = underbrace(times.big_(i=1)^(k+1) QQ, "בת־מנייה מהנחת האינדוקציה") times QQ $
  אבל מכפלה קרטזית של קבוצות בנות מנייה היא בת־מנייה, ולכן $display(times.big_(i=1)^(k+1) QQ)$ בת־מנייה (מכפלה קרטזית סופית) ולכן גם $(QQ^n)^m$ בת־מנייה.\
  כעת, נרצה לבנות פונקציה חד־חד ערכית $psi: [QQ^n]^m arrow.r (QQ^n)^m$. \
  $QQ^n$ בת־מנייה ולכן קיימת $psi : NN arrow.r QQ^n$ חד־חד ערכית ועל כך שלכל $q=(q_1, q_2, ..., q_n) in QQ^n$ קיים ויחיד $k in NN$ כך ש־$psi(k)=q$.\
  יהי $A in [QQ^n]^m$ משמע $abs(A) = m$ ולכן נוכל להגדיר:
  $I_A = { i in NN bar psi(i) in A} subset.eq NN$
  ונשים לב כי $abs(I_A) = m$ וזו קבוצת אינדקסים שיש לה $m!$ תמורות שונות לסידור ונבחר את התמורה שתסדר את $I_A$ בסדר עולה, נסמן תמורה זו ב־$sigma$.\
  נסתכל על $I_A$ שמתאים לכל $A in [QQ^n]^m$ ונגדיר את $psi(A) = (phi(i_(sigma(1))), ..., phi(i_(sigma(m))))$. \
  $psi$ מוגדרת היטב כהרכבה של פונקציות והיא חד־חד ערכית שכן אם $A!=B$ אז בוודאי ש־$I_A != I_B$ ולכן יש לפחות אינדקס אחד כך שיתקיים $psi(A)!=psi(B)$. \
  במטלה 1 הראינו שאם קיימת פונקציה חד־חד ערכית מ־$A$ קבוצה אינסופית אל $B$ קבוצה בת־מנייה נובע כי $A$ בת־מנייה ולכן$[QQ^n]^m$ היא בת־מנייה.
  \
]

#question()
נשתמש בטיעון האלכסון של קנטור כדי להוכיח שהקבוצה $A = {f in NN^NN bar f "חד־חד ערכית"}$ אינה בת־מנייה.
#proof[
  נניח בשלילה כי היא $A$ כן בת־מנייה ולכן קיימת פונקציה $f: NN arrow.r A$ חד־חד ערכית ועל. \
  לכן נוכל למנות את כל האיברים ב־$A$ כ־$f_1, f_2, f_3,...$. \
  נגדיר $g: NN arrow.r NN$ על־ידי $g(n)=f_n(n)+1$ ונשים לב כי $forall n in NN, f_n(n)!=g(n)$ כי הן שונות לכל הפחות באיבר ה־$n$. \
  כעת נראה ש־$g$ היא חד־חד ערכית: יהיו $n,m in NN$ ונניח כי $g(n)=g(m)$ משמע $f_n (n) = f_m (m)$ שאני לא רואה סיבה למה זה מוביל לסתירה #todo\
  היות ו־$g$ שונה מכל $f_n$ בלפחות נקודה אחת נובע כי $g not in A$ אבל $g$ היא חד־חד ערכית והנחנו כי $A$ בת־מנייה ולכן זו סתירה.
]

#question()
קבוצה $a subset.eq RR^2$ נקראת צמד ריבועים אופקיים אם קיימים ריבועים (קווי מתאר ללא פנים) $a_1, a_2 in RR^2$ המקיימים את התכונות הבאות:
1. צלעות הריבועים $a_1, a_2$ מאונכות לצירים
2. $a_1 inter a_2$ הוא צלע ב־$a_1$ וב־$a_2$
3. $a_i union a_2 = a$

#subquestion()
הוכיח שכל קבוצה $X subset.eq cal(RR^2)$ שאיבריה הם צמדי ריבועים אופקיים כך שלכל $a, b in X$ מתקיים $a inter b = emptyset$ היא סופית או בת־מנייה.
#proof[]

#subquestion()
נראה שיש אוסף לא בן־מנייה $X subset.eq cal(P)(RR^2)$ של ריבועים זרים בזוגות.
#proof[]
