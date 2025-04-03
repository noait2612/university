#import "../../../../src/article.typ": *
#show: article.with(
	title: [ פתרון מטלה 01 --- חשבון אינפיניטסימלי 3, 80415 ],
	author: [  ],
	signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]]
)

#let hom = math.op("Hom")
#let todo = text(red)[*TODOOOOOOOOOOOOOOOOOO*]

#question()
#subquestion()
תהיי $F: RR arrow.r RR$ פונקציה מונוטונית עולה ממש. נוכיח כי הפונקציה $ d(x,y) = abs(F(x) - F(y)) $ מגדירה מטריקה על $RR$.
#proof[
1. סימטרייה – מהגדרת הערך המוחלט מתקיים עבור $x, y in RR$:
$ d(x,y) = abs(F(x) - F(y)) = abs(F(y) - F(x)) = d(y,x) $
2. אי שליליות – נובע ישירות מהגדרת הערך המוחלט כאי־שלילי. כמו כן מתקיים עבור $x,y in RR$:
$ x=y <==> F(x)-F(y) ==> abs(F(x)-F(y))=0 \0 = d(x,y) = abs(F(x)-F(y))=0 <==> F(x)=F(y) ==>_((1)) x=y $
כאשר $(1)$ נובע מהיות $F$ מונוטונית עולה ממש ולכן חד־חד ערכית.
3. אי־שיוויון המשולש – יהיו $x, y,z in RR$. מאי־שיוויון המשולש (על ערך מוחלט) מתקיים: 
$ d(x,z) = abs(F(x)-F(z))<=abs(F(x)-F(y))+abs(F(y)-F(z)) = d(x,y)+d(y,z) $
ולכן $d(x,y) = abs(F(x) - F(y)) $ מגדירה מטריקה על $RR$.
]

#subquestion()
יהי $G = (V,E)$ גרף לא־מכוון קשיר, כלומר לכל שני קודקודים $u, v in V$ קיים מסלול $gamma = (x_0, ..., x_n)$ עבור $x_i in V$ ו־${x_(i-1), x_i} in E$ המקיים $x_0=u$ ו־$x_n = v$. נסמן ב־$ell(gamma)=n$ את אורך המסלול (מספר הקשתות). נוכיח כי הפונקציה $ d(u,v)=min{ell(gamma) bar ""}$ מגדירה מטריקה על $V$.
#proof[#todo]

#subquestion()
יהיו $(X, d_X), (Y, d_Y)$ מרחבים מטריים. נוכיח כי הפונקציה $d((x_0, y_0), (x_1, y_1)) = d_X (x_0, x_1) + d_Y (y_0, y_1)$.
#proof[
#todo
]

#subquestion()
יהיו ${(X_i, d_i)}_(i=0)^infinity$ מרחבים מטריים. נגדיר מטריקה על המכפלה $display(product_(i=0)^infinity X_i)$.
#proof[
	#todo
]

#question()
#subquestion()
נוכיח כי לכל $x in RR^n$ מתקיים $display(lim_(p arrow.r infinity) norm(x)_p = norm(x)_infinity)$.
#proof[
יהי $x in RR^n$ ויהי $p>=1$, מהגדרה מתקיים:
$ norm(x)_p = (sum_(i=1)^n abs(x_i)^p)^(1/p) >= (sup_i abs(x_i)^p)^(1/p) = norm(x)_infinity $
$ norm(x)_p = (sum_(i=1)^n abs(x_i)^p)^(1/p) <= (n dot.op sup_i abs(x_i)^p)^(1/p) = n^(1/p) dot.op norm(x)_infinity $
זאת אומרת, מתקיים:
$ norm(x)_infinity <= norm(x)_p <= n^(1/p) dot.op norm(x)_infinity $
ובפרט כאשר ניקח גבול מאריתמטיקה של גבולות נקבל:
$ lim_(p arrow.r infinity) norm(x)_infinity <= lim_(p arrow.r infinity) norm(x)_p <= lim_(p arrow.r infinity) n^(1/p) dot.op norm(x)_infinity $
וכן:
$ lim_(p arrow.r infinity) norm(x)_infinity = norm(x)_infinity <= lim_(p arrow.r infinity) norm(x)_p = lim_(p arrow.r infinity) (sum_(i=1)^n abs(x_i)^p)^(1/p) <= lim_(p arrow.r infinity) n^(1/p) dot.op norm(x)_infinity =_((1)) 1 dot.op norm(x)_infinity==> lim_(p arrow.r infinity) norm(x)_p = norm(x)_infinity $
כאשר $(1)$ נובע מכך ש־$display(lim_(p arrow.r infinity) n^((1/p)) arrow.r.long 1)$ שכן $display(lim_(p arrow.r infinity) 1/p arrow.r.long 0)$.
]

#subquestion()
נוכיח שהטענה מהסעיף הקודם לא נכונה גם עבור $x in ell^infinity$, כאשר $ell^infinity$ הוא מרחב כל הסדרות האינסופיות החסומות.
#proof[
ראשית, ניזכר כי הגדרנו את הנורמה על מרחבי $ell^p$ על־ידי $norm((x_0,x_1, ...))_p = display(root(p, sum_(i=0)^infinity abs(x_i)^p))$	\
נסתכל על הסדרה הקבועה $(1, 1, ...)$ הסדרה הקבועה 1. מתקיים: 
$ lim_(p arrow.r infinity) norm((x_0,x_1, ...))_p = lim_(p arrow.r infinity) root(p, sum_(i=0)^infinity abs(x_i)^p) = lim_(p arrow.r infinity) root(p, sum_(i=0)^infinity 1) = infinity != 1 =  (sup_i abs(x_i)^p)^(1/p) = norm(x)_infinity  $
]

#subquestion()
יהיו $1<=p<q<=infinity$ ונוכיח כי לכל סדרה $x in RR^NN$ מתקיים: $norm(x)_q <= norm(x)_p$ ונסיק כי מתקיים $ell^p subset.eq ell^q$.
#proof[
יהיו $1=<p<q<=infinity$, לכל $m in NN$ מתקיים
$ abs(a_m) <= (sum_(n in NN) abs(a_n)^p)^1/p $
תהיי $x in RR^NN$ ויהיו $1<=p<q<infinity$ ונניח כי $x!=0$ כי אחרת המקרה טריוויאלי. \
נסמן $e = x/norm(x)_p$ ולכל $k in NN$ מתקיים $abs(e_k)<=1$ ו־$norm(e)_p = 1$. מכך שמתקיים $p<q$ נקבל:
$ norm(e)_q = (sum_(k=1)^infinity abs(e_k)^q)^1/q <= (sum_(k=1)^infinity abs(e_k)^p)^1/q = norm(e)_p^(p/q)=1 $
זאת אומרת
$ norm(x)_q = norm(norm(x)_p e)_q = norm(x)_p norm(e)_q <- norm(x)_p $
ראשית, ניזכר כי הגדרנו את הנורמה על מרחבי $ell^p$
#todo
]

#question()
עבור מרחב נורמי $(X, norm(dot.op))$ נסמן ב־$B(x) colon.eq B(X,X)$ את מרחב ההעתקות הלינאריות החסומות תחת הנורמה האופרטורית מ־$X$ לעצמו.

#subquestion()
נוכיח כי לכל $T, S in B(X)$ מתקיים $norm(S compose T)_"op" <= norm(S)_"op" norm(T)_"op"$
#proof[
ראשית, בתרגול ראינו כי $(B(X,X), norm(dot.op)_"op")$ הוא מרחב נורמי ולכן הוא מקיים את אי־שיוויון המשולש, ולכן מתקיים לכל $x in X$:
$ norm((S compose T)(x))_"op" <= norm(S)_"op"norm(T x)_"op" <= norm(S)_"op"norm(T)_"op"norm(x)_"op" $
בתרגול ראינו שלכל $T in B(X,X)$ ו־$x in X$ מתקיים $norm(T(x))_X <= norm(T)_"op" norm(x)_X$, ולכן נובע מכך
$ norm(S compose T)_"op" = sup_(norm(x)=1) norm((S compose T)(x))_"op" <= sup_(norm(x)=1) norm(S)_"op"norm(T)_"op"norm(x)_"op" = norm(S)_"op"norm(T)_"op" $
כמובן שמכך ש־$B(X,X) colon.eq { T in hom(X, X) bar norm(T)_"op" < infinity }$ נובע כי $norm(S compose T)_"op" <= norm(S)_"op"norm(T)_"op" < infinity$.
]

#subquestion()
נוכיח כי אם $lambda$ ערך עצמי של $T in B(X)$ אז $lambda <= norm(T)_"op"$.
#proof[
	ראשית, נשים לב שמתקיים:
$ norm(T)_"op" = sup_(norm(x)_X = 1) { norm(T(x))_X } $
יהי $u$ וקטור עצמי של הערך עצמי $lambda$, מתקיים:
$ norm(T)_"op"  $
#todo
]

#question()
#subquestion()
יהי $(X, d)$ מרחב מטרי עבור $X$ מרחב וקטורי מעל $RR$. נוכיח כי המטריקה $d$ מושרית מנורמה אם ורק אם היא הומגניות ואינווריאנטית להזזה.
#proof[ \ 
$<==$ נניח כי המטריקה $d$ מושרית מנורמה ונראה כי היא הומוגנית ואינווריאנטית להזזה. \ 
ניזכר כי מטריקה המושרית מנורמה מוגדרת על־ידי $d(x,y) colon.eq norm(x-y)$. \
ולכן לפי התזכורת מתקיים:
1. הומגניות:
$ d(alpha x, alpha y) = norm(alpha x - alpha y) = norm(alpha (x-y)) = abs(alpha) norm(x-y) $
2. אינווריאנטיות להזזה:
$ d(x+z, y+z) = norm((x+z)-(y+z)) = norm(x+z-y-z) = norm(x-y) $
$==>$ נניח כי $d$ הומוגנית ואינווריאנטית להזזה ונראה כי $d$ מושרית מנורמה. \
מכיוון ש־$d(x,y)$ אינווריאנטית להזזה נובע כי $d(x,y) = d(x-y,0)$. \
נגדיר $norm(x)=d(x,0)$ ונראה כי זוהי נורמה:
1. חיוביות: $d$ מטריקה ולכן אי־שלילית וכן $norm(x) = d(x,0) = 0 <==> x = 0$.
2. הומוגניות: 
$ norm(alpha x) = d(alpha x, 0) = d(alpha x, alpha 0) = abs(alpha) d(x,y) = abs(alpha) norm(x) $
3. אי־שיוויון המשולש:
$ abs(x+y) = d(x+y,0) = d(x,-y) <= d(x,0) + d(0, -y) = d(x,0) + d(y,0) = norm(x) + norm(y) $
]

#subquestion()
יהי $(X, norm(dot.op))$ מרחב נורמי מעל $RR$. נוכיח כי הנורמה $norm(dot.op)$ מושרית ממכפלה פנימית אם ורק אם היא מקיימת את כלל המקבילית, כלומר לכל $x,y in X$ מתקיים: $ norm(x+y)^2 + norm(x-y)^2 = 2(norm(x)^2 + norm(y)^2) $
#proof[ \
$<==$ נניח כי הנורמה $norm(dot.op)$ מושרית ממכפלה פנימית ונראה כי היא מקיימת את כלל המקבילית.\
מתקיים מהגדרה:
$ norm(x+y)^2 + norm(x-y)^2 = angle.l x+y, x+y angle.r + angle.l x-y, x-y angle.r \ = angle.l x,x angle.r + angle.l x,y angle.r + angle.l y,x angle.r + angle.l y,y angle.r + angle.l x,x angle.r - angle.l x,y angle.r - angle.l y,x angle.r + angle.l y,y angle.r = 2angle.l x,x angle.r + 2angle.l y,y angle.r \ = 2 norm(x)^2 + 2norm(y)^2 $
וקיבלנו את כלל המקבילית. \
$==>$ נניח כי הנורמה $norm(dot.op)$ מקיימת את כלל המקבילית ונרצה להראות שהיא מושרית ממכפלה פנימית.\
נגדיר: $ angle.l x,y angle.r = (1/4)(norm(x+y)^2 - norm(x-y)^2) $
ונשים לב ש־$(x,y) mapsto angle.l x,y angle.r$ היא רציפה כצירוף לינארי של פונקציות רציפות (ראינו שנורמה היא רציפה).
נשים לב שמתקיימים:
1. $angle.l x,y angle.r = angle.l y,x angle.r$ וכן $norm(x)=root(2, angle.l x","x angle.r)$
2. נרצה להראות שמתקיים $angle.l x+y, z angle.r = angle.l x, z angle.r + angle.l y, z angle.r$. מכלל המקבילית, מתקיים:
$ 2 norm(x+z)^2 + 2 norm(y)^2 = norm(x+y+z)^2 + norm(x-y+z)^2 \ <==> norm(x+y+z)^2 = 2 norm(x+z)^2 + 2 norm(y)^2 - norm(x-y+z)^2 \ =_((1)) 2 norm(y+z)^2 + 2 norm(x)^2 - norm(y-x+z)^2 $
כאשר $(1)$ מתקיים מחילוף תפקידים בין $x$ לבין $y$. 
מתקיים אם כך:
$ norm(x+y+z)^2 = (2 norm(x+z)^2 + 2 norm(y)^2 - norm(x-y+z)^2 + 2 norm(y+z)^2 + 2 norm(x)^2 - norm(y-x+z)^2)/2 \ = norm(x)^2+norm(y)^2+norm(x+z)^2+norm(y+z)^2 - 1/(2) norm(x-y+z)^2-1/(2) norm(y-x+z)^2 $
נזכור שמתקיים $norm(w) = norm(-w)$ ולכן
$ norm(x+y+z)^2 = norm(x)^2+norm(y)^2+norm(x-z)^2+norm(y-z)^2 - 1/(2) norm(x-y-z)^2-1/(2) norm(y-x-z)^2 $
ולכן
$ angle.l x+y, z angle.r = 1/(4)(norm(x+y+z)^2-norm(x+y-z)^2)
= 1/(4)(norm(x+z)^2-norm(x-z)^2) + 1/(4)(norm(y+z)^2-norm(y-z)^2)
= angle.l x,z angle.r + angle.l y,z angle.r $
3. נרצה להראות שמתקיים $angle.l lambda x, y angle.r = lambda angle.l x,y angle.r$ לכל $lambda in RR$. \ 
נשים לב שעבור $lambda in NN$ הטענה נובעת באינדוקציה מהמקרה הקודם. עבור $lambda in ZZ$, נסמן $lambda = p/q$ כאשר $p, q in ZZ$ ו־$q !=0$, מתקיים:
$ q angle.l lambda x, y angle.r = q angle.l p dot.op (x/q), y angle.r  = p angle.l q x/q, y angle.r = p angle.l x,y angle.r $
#todo
]

#subquestion()
יהי $1<=p<=infinity$. נראה כי הנורמה על המרחב $(ell^p, norm(dot.op))$ מושרית ממכפלה פנימית אם ורק אם $p=2$.
#proof[ \
ראשית, בתרגול ראינו כי $ell^p$ אכן מהווה מרחב וקטורי ולכן הוא מרחב נורמי. \
$<==$ נניח כי הנורמה על המרחב $(ell^p, norm(dot.op))$ מושרית ממכפלה פנימית ונראה כי $p=2$. \
$==>$ נניח כי $p=2$ ונראה כי הנורמה על המרחב $ell^p, norm(dot.op)$ מושרית ממכפלה פנימית.
#todo
]

#question()
יהי $(X,d)$ מרחב אולטרה־מטרי, כלומר $(X,d)$ מרחב מטרי המקיים את אי־שיוויון המשולש החזק: $d(x,z)<=max(d(x,y),d(y,z))$.

#subquestion()
יהיו $x,y,z in X$ ונוכיח כי אם $d(x,y) > d(y,z)$ אזי $d(x,z)=d(x,y)$.
#proof[
מכך שמתקיים $d(x,y) > d(y,z)$ ומכך ש־$(X,d)$ מרחב אולטרה־מטרי נובע כי $d(x,z) <= d(x,y)$.\
מאי־שיוויון המשולש מתקיים $d(x,z)<=d(x,y) + d(y,z) <_((1)) 2d(x,y)$ 
#todo
]

#subquestion()
נוכיח כי לכל $x,y in X$ ו־$r>0$ כך ש־$y in B_r (x)$ מתקיים $B_r (x)=B_r (y)$.
#proof[
יהי $y in B_r (x)$. מהגדרה נובע כי זה קורה אם ורק אם $abs(y-x)<r$ ויהי $z$ כך שמתקיים $abs(z-x)<r$. מהגדרת המרחב האולטרה־מטרי, נובע כי מתקיים $abs(z-y)<=max{abs(z-x), abs(y-x)}<r$ משמע $z in B_r (y)$ ולכן $B_r (x) subset.eq B_r (y)$ ונשים לב שבהחלפת תפקידים בין $x$ לבין $y$ נקבל את ההכלה בכיוון השני.
]

#subquestion()
נוכיח כי לכל $x in X$ ו־$r>0$ הכדור הסגור $hat(B)_ r(x)$ הוא גם פתוח.
#proof[
#todo
]

#subquestion()
נוכיח כי לכל $x in X$ ו־$r>0$ הכדור הפתוח $B_r (x)$ הוא גם סגור.
#proof[
יהי $y in partial B_r (x)$. מהגדרה, נובע כי כל כדור פתוח $B_r (y)$ מכיל סביבה של הכדור $B_r (x)$.\
יהי $s<=r$, נבחן את הכדור הפתוח $B_s (y)$: \
מהיות $y$ נקודה על השפה נובע כי $B_r (x) inter B_s (y) != emptyset$ ולכן קיים $z in B_r (x) inter B_s (y)$ זאת אומרת $abs(z-x)<r$ ו־$abs(z-y)<s<=r$ ומהיות המרחב אולטרה־מטרי נקבל:
$ abs(y-x)<=max { abs(y-z), abs(z-x)} < max{s,r} = r $
ולכן $y in B_r (x)$ אבל מצאנו שנקודה בשפה של הכדור נמצאת בתוך הכדור ולכן הכדור סגור.
]

#subquestion()
יהי $p in NN$ מספר ראשוני. נחשב את הגבול של הסדרה $X_n = display(sum_(i=0)^n p^i)$ ב־$(QQ, d_p)$ כאשר $d_p$ היא המטריקה ה־$p$־אדית.
#proof[
	#todo
]

#question()
יהי $(X,d)$ מרחבי מטרי ו־$A subset.eq X$ תת־קבוצה.

#subquestion()
נוכיח שמתקיים $(A^circle.stroked.small)^circle.stroked.small = A^circle.stroked.small$.
#proof[
נוכיח באמצעות הכלה דו כיוונית: \
$(A^circle.stroked.small)^circle.stroked.small subset.eq A^circle.stroked.small$: 	
\
$A^circle.stroked.small subset.eq (A^circle.stroked.small)^circle.stroked.small$:

\
#todo
]

#subquestion()
נוכיח שמתקיים $overline((overline(A))) = overline(A)$.
#proof[
נוכיח באמצעות הכלה דו כיוונית: \
$overline(overline(A)) subset.eq overline(A)$  \
$overline(A) subset.eq overline(overline(A))$ 
\ #todo
]

#subquestion()
נוכיח שמתקיים $(A^circle.stroked.small)^c = overline(A^c)$.
#proof[
נזכור כי קבוצה מוכלת ב־$A$ אם ורק אם המשלים שלה מכיל את $A^c$, ולכן:
$ (A^circle.stroked.small)^c = (union.big_(U subset.eq A "open")U)^c = inter.big_(U subset.eq A "open") U^c = inter.big_(A^c subset.eq F "closed") F = overline(A^c) $
]

#subquestion()
נוכיח שמתקיים $(overline(A))^c=(A^c)^circle.stroked.small$.
#proof[
#todo
]

#subquestion()
נוכיח שמתקיים $overline(partial A) = partial A$.
#proof[
נוכיח באמצעות הכלה דו־כיוונית:
$overline(partial A) subset.eq partial A$: 
\
$partial A subset.eq overline(partial A)$:
	ניזכר כי $partial A$ היא סגורה: $partial A = overline(A) without (A^circle.stroked.small)^c = overline(A) inter (underbrace(X without A^circle.stroked.small, "closed set"))$.

]