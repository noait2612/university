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
#show sym.lt.eq: math.scripts

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
  כעת, נרצה לבנות פונקציה חד־חד ערכית ועל $f: [QQ^n]^m arrow.r (QQ^n)^m$.\
  נגדיר סדר מילוני לכל $x, y in QQ^n$ בצורה הבאה
  $ x <=_(l e x) y <==> (exists i < n (forall j < i, x_j = y_j) and (x_i < y_i)) or x=y $
  אנחנו יודעים שזה סדר קווי ולכן נגדיר לכל
  $ forall {q^i}_(i=1)^m in [QQ^n]^m, q^i <=_(l e x) x^(i+1) $
  ונגדיר את $f$ להיות $ f({q^i}_(i=1)^m) = angle.l q^i angle.r_(i=1)^m $
  נראה כי $f$ חד־חד ערכית: יהיו $A, B in [QQ^n]^m$ כך ש־$A!=B$ ולכן קיים $a in A without B$ ולכן $a in f(A)$ אבל $a in.not f(b)$ (שכן הפונקציה רק משרה סדר ולא משנה את הוקטורים במקור) ובאותו אופן גם עבור $b in B without A$ ולכן נקבל $f(A)!=f(B)$ ו־$f$ חד־חד ערכית.\
  מצאנו פונקציה חד־חד ערכית בין $[QQ^n]^m$ לבין $(Q^n)^m$, היות והאחרונה בת־מנייה נובע כי $abs([QQ^n]^m)<=abs((QQ^n)^m) = abs(NN)$.\
  נראה שגם מתקיים $abs(NN) <= abs([QQ^n]^m)$:\
  נגדיר $g: NN arrow.r [QQ^n]^m$ כך שלכל $k in NN$
  $
    g(k) = {underbrace(underbrace((0, ..., 0), "פעמים" n )"," ..."," (0, ..., m-1), "פעמים" m-1), underbrace((k, ..., k), "פעמים" n )}
  $
  ואז אכן $abs(g(k)) = m$ ו־$g(k) subset.eq QQ^n$, וכמובן היא חד־חד ערכית שכן יש וקטור אחד תלוי ב־$k in NN$ ולכן $abs(NN)<=abs([QQ^n]^m)$.\
  מצאנו שמתקיים $abs([QQ^n]^m)<=abs(NN)$ וגם $abs(NN)<=abs([QQ^n]^m)$
  וממשפט קנטור־ברנשטיין־שרדר נקבל ש־$abs([QQ^n]^m) = abs(NN)$ ולכן $[QQ^n]^m$ בת־מנייה.
]

#question()
נשתמש בטיעון האלכסון של קנטור כדי להוכיח שהקבוצה $A = {f in NN^NN bar f "חד־חד ערכית"}$ אינה בת־מנייה.
#proof[
  נניח בשלילה כי היא $A$ כן בת־מנייה ולכן קיימת פונקציה $f: NN arrow.r A$ חד־חד ערכית ועל. \
  לכן נוכל למנות את כל האיברים ב־$A$ כ־$f_1, f_2, f_3,...$ ולסדר אותם בשורות בתור טבלה אינסופית
  #figure(
    table(
      columns: 4,
      stroke: none,
      table.header[$dots.h.c$][$f_0(2)$][$f_0(1)$][$f_0(0)$],
      [$dots.h.c$], [$f_1(2)$], [$f_1(1)$], [$f_1(0)$],
      [$dots.h.c$], [$f_1(2)$], [$f_2(1)$], [$f_2(0)$],
      [$dots.down$], [$dots.v$], [$dots.v$], [$dots.v$],
    ),
  )
  נגדיר $g: NN arrow.r NN$ בצורה רקורסיבית: \
  תהיי $ A_n = { g(0),... , g(n-1)} $
  ואת $g(n)$ נגדיר על־ידי $ g(n) = min{NN without (A_n union {f_n (n)})} $
  $g$ חד־חד ערכית וגם לכל $n in NN$ מתקיים $g(n)!=f_n (n)$ ולכן $g in.not A$ אבל הנחנו ש־$A$ בת־מנייה וזאת סתירה.
]

#question()
קבוצה $a subset.eq RR^2$ נקראת צמד ריבועים אופקיים אם קיימים ריבועים (קווי מתאר ללא פנים) $a_1, a_2 in RR^2$ המקיימים את התכונות הבאות:
1. צלעות הריבועים $a_1, a_2$ מאונכות לצירים
2. $a_1 inter a_2$ הוא צלע ב־$a_1$ וב־$a_2$
3. $a_1 union a_2 = a$

#subquestion()
נוכיח שכל קבוצה $X subset.eq cal(RR^2)$ שאיבריה הם צמדי ריבועים אופקיים כך שלכל $a, b in X$ מתקיים $a inter b = emptyset$ היא סופית או בת־מנייה.
#proof[
  תהיי $X subset.eq RR^2$ המקיימת את התנאים לעיל ונראה שהיא לכל היותר בת־מנייה.\
  אם $X$ סופית הטענה טריוויאלית ולכן נניח כי $X$ אינסופית. \
  בשאלה 2 ראינו ש־$[QQ^2]^2$ בת־מנייה ולכן קיימת פונקציה חד־חד ערכית ועל $f: NN arrow.r [QQ^2]^2$.\
  לכל $a in X$ נגדיר כמו בתרגול
  $
    Q_a = {(q_1, q_2) in [QQ^2]^2} bar underbrace(q_1 in D_1^a,  a_1"הפנים של"), underbrace(q_2 in D_2^a,  a_2"הפנים של") }
  $
  מצפיפות הרציונלים בממשיים נקבל ש־$Q_a != QQ$ ולכן נגדיר את $g : XX arrow.r NN$
  $ g(a)=min {n in NN bar f(n) in Q_a} subset.eq NN $
  מעיקרון הסדר הטוב יש לנו מינימום כזה.\
  נראה כי $g$ חד־חד ערכית: \
  לכל $a, b in X$ נתון שמתקיים $a inter b = emptyset$ משמע
  $
    a inter b = emptyset <==> (underbrace(a_1 union a_2, a)) inter (underbrace(b_1 union b_2, b)) = emptyset <==> (D_1^a union D_2^a) inter (D_1^b inter D_2^b) = emptyset \
    <==> Q_a inter Q_b = emptyset
    <==> f(b) subset.eq Q_b != f(a) subset.eq Q_a
  $
  לכן $g$ היא חד־חד ערכית. \
  מצאנו פונקציה חד־חד ערכית מקבוצה אינסופית לקבוצה בת־מנייה ולכן לפי מטלה 1 נובע כי $X$ בת־מנייה.
]

#subquestion()
נראה שיש אוסף לא בן־מנייה $X subset.eq cal(P)(RR^2)$ של ריבועים זרים בזוגות.
#proof[
  נגדיר את הקבוצה
  $
    X = { [-r, r] times {r} union [-r, r] times {-r} union {-r} times [-r, r] union [-r, r] union {r} union [-r, r] | r in (0, infinity)}
  $
  4 צלעות של ריבוע לכל $r in (0, infinity)$.\
  הקטע $(0, infinity)$ הוא לא בן־מנייה: נסתכל על $f: (0, infinity) : RR$ המוגדרת על־ידי $ f(x) = ln(x) $, $f$ פונקציה חד־חד ערכית ועל (שכן יש לה הופכית) ולכן $abs((0,infinity))=abs(RR)$ ו־$(0, infinity)$ לא בן־מנייה.\
  $X$ היא קבוצה של ריבועים, עלינו להראות שהם זרים בזוגות: יהיו $a, b in X$ ולכן קיימים $r, q in (0,infinity)$ כך שהם מגדירים את $a$ ו־$b$ בהתאמה.\
  שני הריבועים הם סביב הראשית ולכן יש ביניהם הכלה ממש (משמע אחד יותר קטן מהשני): נניח בלי הגבלת הכלליות ש־$r<q$ ולכן הריבועים זרים ואם הייתה להם נקודה משותפת אז היה מתקיים $r!=q$.\
  זהו כמובן אוסף לא בן־מנייה מהיות $(0,infinity)$ לא בן־מנייה.


]
