#import "../../../../src/article.typ": *
#show: article.with(
	title: [ פתרון מטלה 01 --- חשבון אינפיניטסימלי 3, 80415 ],
	author: [  ],
	signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]]
)

#let hom = math.op("Hom")

#question()
#subquestion()
#box(width: 100%)[תהיי $F: RR arrow.r RR$ פונקציה מונוטונית עולה ממש. נוכיח כי הפונקציה $ d(x,y) = abs(F(x) - F(y)) $ מגדירה מטריקה על $RR$.]
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
יהי $G = (V,E)$ גרף לא־מכוון קשיר, כלומר לכל שני קודקודים $u, v in V$ קיים מסלול $gamma = (x_0, ..., x_n)$ עבור $x_i in V$ ו־${x_(i-1), x_i} in E$ המקיים $x_0=u$ ו־$x_n = v$. \
נסמן ב־$ell(gamma)=n$ את אורך המסלול (מספר הקשתות). נוכיח כי הפונקציה: 
$ d(u,v)=min{ell(gamma) bar gamma "is a path between u and v" } $ מגדירה מטריקה על $V$.
#proof[
1. סימטרייה – מקבלים ישר מהגדרת המסלול שכן אם יש מסלול בין $u$ לבין $v$ יש גם מסלול בין $v$ לבין $u$ והוא כמובן באותו אורך (כי הגרף לא־מכוון) 
2. אי־שליליות ראשית הוא אי־שלילי שכן אורך מסלולי מינימלי הוא מספר הקשתות שכמובן אי־שלילי. מכיוון שבגרף לא־מכוון קשיר יחס של צלע הוא אנטי־רפלקסיבי נובע כי בין $u$ לבין $u$ אין מסלול, משמע מספר הקשתות הוא 0.
3. אי־שיוויון המשולש – ראשית מכיוון שהגרף קשיר נובע כי בין כל שני קודקודים שונים יש מסלול. יהיו $u,v,w in V$ ונניח בשלילה כי אי־שיוויון המשולש לא מתקיים, משמע $ d(u,v) + d(v,w) < d(u,w) $
	מהגדרה, $d(u,v)$ זה אורך המסלול המינימלי בין $u$ לבין $v$ וכן $d(v,w)$ הוא אורך המסלול המינימלי בין $v$ לבין $w$. \
	אבל $d(u,w)$ הוא אורך המסלול המינימלי בין $u$ לבין $w$ ולכן לא יתכן כי $d(u,v) + d(v,w) < d(u,w)$ וקיבלנו סתירה ולכן אי־שיוויון המשולש מתקיים.
]

#pagebreak()

#subquestion()
יהיו $(X, d_X), (Y, d_Y)$ מרחבים מטריים. נוכיח כי הפונקציה $ d((x_0, y_0), (x_1, y_1)) = d_X (x_0, x_1) + d_Y (y_0, y_1) $ מגדירה מטריקה על המכפלה $X times Y$.
#proof[
1. סימטרייה – נשים לב שמתקיים מהגדרת $(X, d_X), (Y, d_Y)$ בתור מרחבים מטריים:
	$ d((x_0, y_0), (x_1, y_1)) = d_X (x_0, x_1) + d_Y (y_0, y_1) = d_X (x_1, x_0) + d_Y (y_1, y_0) = d((x_1, y_1), (x_0, y_0)) $
2. אי־שליליות – מהיות $(X, d_X), (Y, d_Y)$ מרחבים מטריים נובע כי $d((x_0, y_0), (x_1, y_1))$ הנתונה אי־שלילית כסכום של מספרים אי שליליים. נשים לב שמתקיים:
	$ d(x_0, y_0), (x_1, y_1) = 0 <==> d_X (x_0, x_1)= 0 and d_Y (y_0, y_1)=0 <==> x_0=x_1 and y_0=y_1 $
	ולכן $d((x_0, y_0), (x_1, y_1)) = 0 <==> (x_0, y_0)= (x_1, y_1)$
3. אי־שיוויון המשולש – יהיו $(x_1, y_1), (x_2, y_2), (x_3, y_3) in X times Y$. מתקיים:
	$ d((x_1, y_1), (x_3, y_3)) = d_X (x_1, x_3) + d_Y (y_1, y_3) <=_((1)) d_X (x_1, x_2) + d_X (x_2, x_3) + d_Y (y_1, y_2) + d_Y (y_2, y_3) \
  = d((x_1, y_1), (x_2, y_2)) + d((x_2, y_2), (x_3, y_3)) $
	כאשר $(1)$ נובע מאי־שיוויון המשולש עבור המרחבים המטריים $(X, d_X), (Y, d_Y)$. 
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
כאשר $(1)$ נובע מכך ש־$display(lim_(p arrow.r infinity) n^((1/p)) arrow.r.long 1)$ שכן $display(lim_(p arrow.r infinity) 1/p arrow.r.long 0)$ ומכלל הכריך נקבל:
$ lim_(p arrow.r infinity) norm(x)_p = norm(x)_infinity $
]

#subquestion()
נוכיח שהטענה מהסעיף הקודם לא נכונה גם עבור $x in ell^infinity$, כאשר $ell^infinity$ הוא מרחב כל הסדרות האינסופיות החסומות.
#proof[
ראשית, ניזכר כי הגדרנו את הנורמה על מרחבי $ell^p$ על־ידי $norm((x_0,x_1, ...))_p = display(root(p, sum_(i=0)^infinity abs(x_i)^p))$	\
נסתכל על הסדרה הקבועה $(1, 1, ...)$ הסדרה הקבועה 1. מתקיים: 
$ lim_(p arrow.r infinity) norm((x_0,x_1, ...))_p = lim_(p arrow.r infinity) root(p, sum_(i=0)^infinity abs(x_i)^p) = lim_(p arrow.r infinity) root(p, sum_(i=0)^infinity 1) = infinity != 1 =  (sup_i abs(x_i)^p)^(1/p) = norm(x)_infinity  $
]
#pagebreak()

#subquestion()
יהיו $1<=p<q<=infinity$ ונוכיח כי לכל סדרה $x in RR^NN$ מתקיים: $norm(x)_q <= norm(x)_p$ ונסיק כי מתקיים $ell^p subset.eq ell^q$.
#proof[
נתחיל מהרמז. יהיו $1<=p<q<=infinity$ ובתרגול הגדרנו $norm(x)_p = (sum_i abs(x_i)^q)^(1/q)$. \
נניח כי $norm(x)_q = 1$ ולכן כמובן מתקיים $norm(x)_q^q=1$ ולכן $i$ מתקיים $abs(x_i)<=1$ ובפרט מכך שמתקיים $q > p$ נובע כי $abs(x_i)^q<=abs(x_i)^p$ לכל $i$ ומתקיים: 
$ 1 = norm(x)_q^q = sum_i abs(x_i)^q <= sum_i abs(x_i)^p = norm(x)_p^p $
וקיבלנו $norm(x)_q >= 1 = norm(x)_p$ \
עכשיו אם $x=0$ זה טריוויאלי ולכן $x!=0$ ונגדיר $e = x/norm(x)_p$ ולכן לכל $abs(e_k)<=1$ וכן $norm(e_k)=1$ ובאותו אופן לעיל בגלל ש־$p<q$ מתקיים:
$ norm(e)_q = (sum_i abs(e_k)^q)^(1/q) <= (sum_i abs(e_k)^p)^(1/q) = norm(e)_p^(p/q) =1 $
ולכן
$ norm(x)_q = norm(norm(x)_p e)_q = norm(x)_p norm(e)_q <= norm(x)_p $
מאי־השיוויון לעיל נוכל להסיק כי $ell^p subset.eq ell^q$ ישירות מהגדרה, שכן מתקיים $x_n in ell^p$ אם ורק אם $(sum abs(x_n)^p)^(1/p)$ מתכנס במובן הצר וזה קורה אם ורק אם $sum abs(x_n)^p < infinity$ וניזכר כי משפט הזנב לטורים אי־שליליים אומר כי $sum_(n=1)^infinity a_n$ מתכנס אם ורק אם לכל $m>1$ הטור $sum_(n=m)^infinity a_n$ מתכנס.
]

#subquestion()
נוכיח כי בתנאים של הסעיף הקודם קיימת הכלה ממש $ell^p subset ell^q$.
#proof[
נבחן את הסדרה $x(i) = i^(-1/p)$ נשים לב כי היא אכן ב־$ell^q$ שכן מתקיים: 
$ norm(x)_q = (sum_i abs(x(i))^q)^(1/q) = (sum_i abs(i^(-1/p))^q)^(1/q) =  (sum_i abs(1/i^(q/p)))^(1/q) <_((1)) infinity $
כאשר $(1)$ נובע מאריתמטיקה של טורים אי־שליליים.
\ מנגד, מתקיים:
$ norm(x)_p = (sum_i abs(x(i))^p)^(1/p) = (sum_i abs(i^(-1/p))^p)^(1/q) =  (sum_i abs(1))^(1/q) = infinity $
ולכן מתקיים $ell^p subset ell^q$.
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
בתרגול ראינו שמתקיים לכל $T in B(X,X)$ ו־$x in X$: $ norm(T x)_X <= norm(T)_op norm(x)_X $ 
יהי $u$ וקטור עצמי של הערך עצמי $lambda$, מתקיים:
$ abs(lambda) = (abs(lambda) dot.op norm(u)_X)/norm(u)_X = norm(lambda u)_X/norm(u)_X = norm(T u)_X/norm(u)_X <=_((1))  (norm(T)_op norm(u)_X)/norm(u)_X = norm(T)_op $
כאשר $(1)$ נובע מהתזכורת מהתרגול.
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
ונשים לב ש־$(x,y) mapsto angle.l x,y angle.r$ היא רציפה כצירוף לינארי של פונקציות רציפות (ראינו שנורמה היא רציפה), נסמן טענה זאת ב־$diamond.stroked$. \
נשים לב שמתקיימים:
1. $angle.l x,y angle.r = angle.l y,x angle.r$ וכן $norm(x)=root(2, angle.l x","x angle.r)$
2. נרצה להראות שמתקיים $angle.l x+y, z angle.r = angle.l x, z angle.r + angle.l y, z angle.r$. מכלל המקבילית, מתקיים:
	$ 2 norm(x+z)^2 + 2 norm(y)^2 = norm(x+y+z)^2 + norm(x-y+z)^2 \ <==> norm(x+y+z)^2 = 2 norm(x+z)^2 + 2 norm(y)^2 - norm(x-y+z)^2 \ =_((1)) 2 norm(y+z)^2 + 2 norm(x)^2 - norm(y-x+z)^2 $
	כאשר $(1)$ מתקיים מחילוף תפקידים בין $x$ לבין $y$. 
	מתקיים אם כך:
	$ norm(x+y+z)^2 = (2 norm(x+z)^2 + 2 norm(y)^2 - norm(x-y+z)^2 + 2 norm(y+z)^2 + 2 norm(x)^2 - norm(y-x+z)^2)/2 \ = norm(x)^2+norm(y)^2+norm(x+z)^2+norm(y+z)^2 - 1/(2) norm(x-y+z)^2-1/(2) norm(y-x+z)^2 $
	נזכור שמתקיים $norm(w) = norm(-w)$ ולכן:
	$ norm(x+y+z)^2 = norm(x)^2+norm(y)^2+norm(x-z)^2+norm(y-z)^2 - 1/(2) norm(x-y-z)^2-1/(2) norm(y-x-z)^2 $
	ולכן
	$ angle.l x+y, z angle.r = 1/(4)(norm(x+y+z)^2-norm(x+y-z)^2)
	= 1/(4)(norm(x+z)^2-norm(x-z)^2) + 1/(4)(norm(y+z)^2-norm(y-z)^2)
	= angle.l x,z angle.r + angle.l y,z angle.r $
3. נרצה להראות שמתקיים $angle.l lambda x, y angle.r = lambda angle.l x,y angle.r$ לכל $lambda in RR$. \ 
	נשים לב שעבור $lambda in NN$ הטענה נובעת באינדוקציה מהמקרה הקודם. עבור 
	עבור $lambda in ZZ$ נסמן $lambda = p/q$ כאשר $p, q in ZZ$ ו־$q !=0$ מתקיים:
	$ p angle.l x,y angle.r = angle.l p x, y angle.r = angle.l q/q p x, y angle.r = q angle.l p/q x, y angle.r ==> p/q angle.l x, y angle.r = angle.l p/q x, y angle.r $
	כאשר המעברים נובעים מהומגניות שהוכחנו ועונה על המקרה כאשר $p/q in QQ$.
	נשאר להראות שהטענה נכונה עבור כל $p in RR$, ובשביל זה נשתמש ברציפות שראינו ב־$diamond.stroked$.\
	נגדיר: $ f(lambda) = lambda angle.l x,y angle.r, quad g(lambda) = angle.l lambda x, y angle.r $ 
	מ־$diamond.stroked$ נובע כי $f$ ו־$g$ רציפות מלינאריות והרכבה של פונקציות רציפות. בפרט, לכל $lambda in QQ$ מתקיים $f(lambda) = g(lambda)$. \
	אבל פונקציות רציפות שמשתוות בכל $lambda in QQ$ בהכרח משתוות גם בכל $lambda in RR without QQ$ מצפיפות, ולכן לכל $lambda in RR$ מתקיים $f(lambda) = g(lambda)$ ובמילים אחרות מתקיים $angle.l lambda x, y angle.r = lambda angle.l x,y angle.r$.
	]

#pagebreak()

#subquestion()
יהי $1<=p<=infinity$. נראה כי הנורמה על המרחב $(ell^p, norm(dot.op))$ מושרית ממכפלה פנימית אם ורק אם $p=2$.
#proof[ \
ראשית, בתרגול ראינו כי $ell^p$ אכן מהווה מרחב וקטורי ולכן הוא מרחב נורמי. \
$<==$ נניח כי הנורמה על המרחב $(ell^p, norm(dot.op))$ מושרית ממכפלה פנימית ונראה כי $p=2$. \
מהיות $ell^p$ מרחב נורמי, נובע מהסעיף הקודם כי הוא מושרה ממכפלה פנימית אם ורק אם הוא מקיים את כלל המקבילית. \
לכן מספיק שניקח $x = (1, 0, 0), y=(0,1,0)$ ונשים לב שמתקיים $norm(x)=norm(y)=1$. מכלל המקבילית מתקיים:
$ norm(x+y)_p^2 + norm(x-y)_p^2 = 2 dot.op 2^(2/p) = 4 = 2+2 = 2 norm(x)_p^(2/p) + 2 norm(y)_p^(2/p) <==> 2^(2/p) = 2 <==> p=2 $
\
$==>$ נניח כי $p=2$ ונראה כי הנורמה על המרחב $(ell^p, norm(dot.op))$ מושרית ממכפלה פנימית.
יהיו $x = (x_n), y(y_n) in ell^2$ ונגדיר $angle.l x,y angle.r = display(sum_(n=1)^infinity x_n y_n)$.
נראה כי זו אכן מכפלה פנימית:
1. לינאריות ברחיב הראשון: יהיו $x,y,z in ell^2$ ו־$alpha in RR$, מתקיים:
$ angle.l alpha x+y,z angle.r = sum_(n=1)^infinity (alpha x_n + y_n)z_n = alpha sum_(n=1)^infinity x_n z_n + sum_(n+1)^infinity y_n z_n = alpha angle.l x, z angle.r + +angle.l y,z angle.r $
2. סימטרייה: ישיר
3. אי־שליליות: 
	$ infinity > angle.l x,x angle.r = sum_(n=1)^infinity x_n^2 >= 0 $
	וכמובן $angle.l x,x angle.r = 0 <==> x=0$ והביטוי לעיל קטן מאינסוף כי אנחנו ב־$ell^2$.  \
ולכן זו אכן מכפלה פנימית, ולכן היא מקיימת את כלל המקבילית והנורמה:
 $ norm(x)_2 = root(2, sum_(n=1)^infinity abs(x_n)^2) = root(2, angle.l x "," x angle.r) $ נורמה על  $ell^2$ המושרית ממכפלה פנימית.
]

#question()
יהי $(X,d)$ מרחב אולטרה־מטרי, כלומר $(X,d)$ מרחב מטרי המקיים את אי־שיוויון המשולש החזק: $d(x,z)<=max(d(x,y),d(y,z))$.

#subquestion()
יהיו $x,y,z in X$ ונוכיח כי אם $d(x,y) > d(y,z)$ אזי $d(x,z)=d(x,y)$.
#proof[
מכך שמתקיים $d(x,y) > d(y,z)$ ומכך ש־$(X,d)$ מרחב אולטרה־מטרי נובע כי $d(x,z) <= d(x,y)$.\
נשים לב שבאותו אופן נובע גם $d(x,y)<= max {d(x,z), d(y,z)} =_((1)) d(x,z)$ כאשר $(1)$ נובע מהנתון $d(x,y) > d(y,z)$.\
בסך־הכל קיבלנו $d(x,z)=d(x,y)$.
]

#subquestion()
נוכיח כי לכל $x,y in X$ ו־$r>0$ כך ש־$y in B_r (x)$ מתקיים $B_r (x)=B_r (y)$.
#proof[
יהי $y in B_r (x)$. מהגדרה נובע כי זה קורה אם ורק אם $abs(y-x)<r$ ויהי $z$ כך שמתקיים $abs(z-x)<r$. מהגדרת המרחב האולטרה־מטרי, נובע כי מתקיים $abs(z-y)<=max{abs(z-x), abs(y-x)}<r$ משמע $z in B_r (y)$ ולכן $B_r (x) subset.eq B_r (y)$ ונשים לב שבהחלפת תפקידים בין $x$ לבין $y$ נקבל את ההכלה בכיוון השני.
]

#subquestion()
נוכיח כי לכל $x in X$ ו־$r>0$ הכדור הסגור $hat(B)_r (x)$ הוא גם פתוח.
#proof[
יהי $y in hat(B)_r (x)$ ולכן $d(y,x)<=r$ ונבחן את $B_r (y)$. \
נשים לב שמתקיים $z in B_r (y) subset.eq hat(B)_r (x)$ מכיוון שהמרחב הוא אולטרה־מטרי ולכן $d(x,z) = max{d(x,y), d(y,z)}<=r$ וקיבלנו כי הכדור הוא גם פתוח (לכל נקודה בכדור הסגור יש סביבה מוכלת ממש בכדור הפתוח).
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
#solution[
ראשית נשים לב כי $X_n = display(sum_(i=0)^n p^i)$ זהו סכום גיאומטרי ולכן $X_n = display(sum_(i=0)^n p^i) = (p^(n+1)-1)/(p-1) in QQ$ ולכן ננחש שמתקיים $display(lim_(x arrow.r infinity) x_n = 1/(1-p))$ (זה יהיה טור גיאומטרי אינסופי). \
נסמן $L=1/(1-p)=-1/(p-1) in QQ$ ומתקיים: $ x_n - L = (p^(n+1)-1)/(p-1) + 1/(p-1) = p^(n+1)/(p-1) $
ועם המטריקה ה־$p$־אדית מתקיים:
$ abs(x_n - L)_p = abs(p^(n+1)/(p-1))_p = abs(p^(n+1))_p dot.op abs(1/(p-1))_p =_((1)) p^(-(n+1)) ==> d_p (x_n, L) = p^(-(n+1)) stretch(arrow.r)_(n arrow.r infinity) 0 $
כאשר $(1)$ נובע מכך ש־$abs(1/(p-1))_p = 1$ שכן $abs(p-1)_p = 1$ מהגדרת המטריקה ה־$p$־אדית.
]

#question()
יהי $(X,d)$ מרחבי מטרי ו־$A subset.eq X$ תת־קבוצה.

#subquestion()
נוכיח שמתקיים $(A^circle.stroked.small)^circle.stroked.small = A^circle.stroked.small$.
#proof[
ראשית ניזכר שראינו כי הפנים של $A$ מוגדר על־ידי $A^circle.stroked.small colon.eq union.big_(U subset.eq A "open") U$ וראינו שאיחוד כלשהו של קבוצות פתוחות הוא פתוח ולכן $A^circle.stroked.small$ היא קבוצה פתוחה. \
נראה אז שהפנים של קבוצה פתוחה הוא הקבוצה עצמה: תהיי $B subset.eq X$ קבוצה ונראה כי $B^circle.stroked.small=B$ אם ורק אם $B$ פתוחה: \
בכיוון הראשון מכיוון ש־$B^circle.stroked.small$ מהטענה לעיל פתוחה אז אם $B = B^circle.stroked.small$ פתוחה. מצד שני, אם $B$ פתוחה אז $B^circle.stroked.small$ היא איחוד של קבוצות פתוחות המוכלות ב־$B$, שאחת מהן היא $B$ ולכן $B^circle.stroked.small = B$. \
זה סוגר את שני הכיוונים ולכן $(A^circle.stroked.small)^circle.stroked.small = A^circle.stroked.small$.
]

#subquestion()
נוכיח שמתקיים $overline((overline(A))) = overline(A)$.
#proof[
ניזכר כי $overline(A) = inter.big_(C subset.eq A "close") C$ וכן ראינו שחיתוך כלשהו של קבוצות סגורות הוא סגור ולכן $overline(A)$ היא קבוצה סגורה.\
מספיק שנראה כי $B = overline(B)$ אם ורק אם $B$ סגורה: \
בכיוון הראשון, $overline(B)$ סגורה ולכן אם $overline(B) = B$ נובע כי $B$ סגורה. בכיוון השני, $overline(B)$ היא חיתוך של קבוצות סגורות המכילות את $B$ ואם $B$ סגורה אז היא אחד האיברים בחיתוך ולכן שווה לחיתוך.\
זה סוגר את שני הכיוונים ולכן $overline((overline(A))) = overline(A)$.
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
ראשית $overline(A)$ סגורה ולכן $(overline(A))^c$ היא פתוחה (קבוצה היא סגורה אם ורק אם המשלים שלה קבוצה פתוחה). \
ניזכר כי קבוצה $A$ תהיה פתוחה אם כל $a in A$ היא נקודה פנימית (או ריקה), ולכן: $ A^circle.stroked.small = { x in X bar exists epsilon > 0, B_epsilon (x) subset.eq A } $
$A$ סגורה אם $A^c$ פתוחה, ולכן מהגדרה שנתנו לעיל נובע כי: $ overline(A) = { x in X bar forall epsilon > 0 B_epsilon (x) inter A != emptyset } $
נשים לב שמתקיימת שרשרת הגרירות הבאה מההגדרות לעיל:
$ x in (overline(A))^c <==> x in.not overline(A) <==>_((1)) exists epsilon > 0, quad B_epsilon (x) inter A = emptyset <==>_((1)) exists epsilon > 0, quad  B_epsilon (x) subset.eq A^c <==>_((3)) x in (A^c)^circle.stroked.small $
כאשר $(1)$ זה מהגדרת $x in overline(A)$, $(2)$ מהגדרת חיתוך והכלת קבוצות ו־$(3)$ נובע מהגדרת $x in A^circle.stroked.small$.
ולכן $(overline(A))^c=(A^c)^circle.stroked.small$.
]
#pagebreak()

#subquestion()
נוכיח שמתקיים $overline(partial A) = partial A$.
#proof[
נראה כי $partial A$ היא סגורה: $partial A = overline(A) without (A^circle.stroked.small)^c = overline(A) inter (underbrace(X without A^circle.stroked.small, "closed set"))$ וחיתוך של קבוצות סגורות הוא סגור ולכן $partial A$ סגורה. \
מהטענה בסעיף ב' נקבל $overline(partial A) = partial A$.
]