#import "../../../../src/article.typ": *
#show: article.with(title: [ פתרון שאלות חזרה למבחן --- חשבון אינפיניטסימלי 3, 80415 ], signature: [#align(
    center,
  )[#image("../../../../src/duck.png", width: 30%, fit: "contain")]])
#show figure.caption: emph
#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let vol = math.op("Vol")
#let sgn = math.op("sgn")
#let im = math.op("Im")
#let supp = math.op("supp")

#question()
שאלה 4 – מועד א' תשפ"ב של שיא.\
יהי התחום $D = {vec(x, y, z) in RR^3 bar x+y+z=1}$ ותהיי $f:RR^3 arrow.r RR$ הפונקציה הנתונה על־ידי $f(x,y,z)=x^2+2y^2+3z^2$.\
נקבע האם $f$ משיגה מינימום ומקסימום ב־$D$ ואם כן נחשב את הערך.

#solution[\
  #definition(
    "הלגראנז’יאן",
  )[תהיי $B subset.eq RR^k$ פתוחה ו־$f, g_1, dots.h.c, g_n : B arrow.r RR$ גזירות ברציפות עבור $n+1<=k$.\
    נגדיר את הקבוצה
    $ A colon.eq { x in B bar g_1 (x) = dots.h.c = g_n (x) = 0} $
    נניח כי לכל $a in A$ מתקיים ש־$gradient g_1 (a), dots.h.c, gradient g_n (a) in RR^k$ בלתי־תלויים לינארית.\
    נגדיר את *הלגראנז’יאן* $cal(L) : RR^n times B arrow.r RR$ באמצעות
    $ cal(L)(lambda, x) = f(x)-sum_(i=1)^n lambda_i g_i (x) $
    תהיי $(lambda, a) in RR^n times A$ נקודת קריטית של הלגראנז’יאן ונסמן $hat(H) = H cal(L)_((lambda, a))$. אז מתקיים
    + $a$ היא מינימום מקומי של $f|_A$ אם $H cal(L)_a^lambda$ חיובית בהחלט על $ker(D g_a)$ ולפי ההסיאן המוגבל זה קורה אם $(-1)^n det(hat(H)_i)) > 0$ לכל \ $2n+1<=i<=k+n$
    + $a$ היא מקסימום מקומי של $f|_A$ אם $H cal(L)_a^lambda$ שלילית בהחלט על $ker(D g_a)$ ולפי ההסיאן המוגבל זה קורה אם $(-1)^(n+i) det(hat(H)_i)) > 0$ לכל $2n+1<=i<=k+n$
    + $a$ היא אוכף של $f|_A$ אם $H cal(L)_a^lambda$ אינה מוחלטת על $ker(D g_a)$ ולפי ההסיאן המוגבל זה קורה אם $det(hat(H)_(2n+1)), dots.h.c, det(hat(H)_i)$ בעלי סימנים המתאימים לאחד משני המקרים הקודמים אבל ל־$det(hat(H)_(i+1))$ יש סימן הפוך
  ]
  אז נגדיר $g(x,y,z) = x+y+z-1$ ונשים לב ש־$D g_((x,y,z)) = mat(1, 1, 1) != 0$ לכל $(x,y,z) in RR^3$ נובע שניתן להשתמש בשיטת הלגראנז’יאן, והלגראנז’יאן נתון על־ידי
  $ cal(L)(lambda, x,y,z) = x^2+2y^2+3z^2-lambda x - lambda y - lambda z + lambda $
  נחשב את הנקודות הקריטיות של $cal(L)$ זוהי כמובן פונקציה רציפה
  $ D cal(L)_((lambda, x,y,z)) = mat(-x-y-z+1, 2x-lambda, 4y-lambda, 6z - lambda) $
  נשווה ל־0 ונפתור את מערכת המשוואות
  $
    2x-lambda = 0 ==> 2x = lambda \
    4y-lambda = 0 ==> 4y=lambda \
    6z - lambda = 0 ==> 6z = lambda \
    -x-y-z+1 = 0 ==> x+y+z=1
  $
  אז
  $ 2x = 4y = 6z ==> x = 2y = 3z $
  ולכן
  $ x+y+z=1 <==>_(x=2y) 3y+z = 1 <==> z = 1-3y $
  אבל
  אבל
  $ x = 3z <==> x = 3-9y <==> 11y = 3 <==> y = 3/11 $
  אז בסך־הכל
  $
    x = 6/11, y = 3/11, z = 2/11, lambda = 12/11
  $
  ואכן גם מתקיימים
  $
    x+y+z = 3/11+6/11+2/11 = 11/11 = 1 checkmark \
    12/11 = 2 dot.op 6/11 = 4 dot.op 3/11 = 6 dot.op 2/11 checkmark
  $
  ולכן יש נקודה אחת חשודה לקיצון והיא $(lambda, x, y, z) =(12/11, 6/11, 3/11, 2/11)$, נחשב את ההסיאן של $cal(L)$:
  $
    H cal(L)_((lambda,x,y,z)) = mat(
      0, -1, -1, -1;
      -1, 2, 0, 0;
      -1, 0, 4, 0;
      -1, 0, 0, 6
    )
  $
  צריך לבדוק את המינורים הראשיים מסדר מסדרים $3$ ו־$4$.\
  מתקיים $(-1)^3 det(H cal(L)) = 44$ ועבור המינור מסדר $3$ מתקיים $(-1)^3 det mat(0, -1, -1; -1, 2, 0; -1, 0, 4) = 6$ ולכן זו נקודת מינימום יחידה.

]

#question()
שאלה $4$ ממטלה $11$ של דניאל: תהיי $f:RR^3 arrow.r RR$ הנתונה על־ידי $f(x,y,z)=2x+2y+3z$.\
נסביר ונמצא למה $f$ מקבלת ערך מקסימלי ומינימלי בקבוצה $A colon.eq {(x,y,z) in RR^3 bar x^2+y^2+3z^3=35, space x+y+z=7}$.

#proof[
  נטען ש־$A$ קבוצה קומפקטית ולכן $f$ שהיא פונקציה רציפה (פולינום בכמה משתנים) מקבלת עליה מינימום ומקסימום.\
  נגדיר $B colon.eq {(x,y,z) in RR^3 bar x^2+y^2+3z^3=35 }$ ונטען ש־$B$ סגורה וחסומה ולכן לפי משפט היינה־בורל נקבל שהיא קומפקטית.\
  סגורה: אם $(x_n, y_n, z_n)_(n=1)^infinity$ סדרה ב־$B$ שמתכנסת ל־$(x,y,z)$ ובפרט $x_n arrow.r x, y_n arrow.r y, z_n arrow.r z$. \
  לכל $n in NN$ מתקיים $x_n^2 + y_n^2 + 3z_n^2 = 35$ לכן מאריתמטיקה של גבולות נסיק שמתקיים $(x,y,z) = lim_(n arrow.r infinity) x_n^2 + y_n^2 + 3z_n^2 = 35$ ולכן $(x,y,z) in B$.\
  חסומה: נשים לב שמתקיים $x^2/35 + y^2/35 + z^2/(35/3)=1$ וזה בבירור חסום כי לדוגמה $x$ מקבל ערך מקסימלי כאשר $y=z=0$ ואז $x=sqrt(35)$.\
  אז $B$ סגורה וחסומה ולכן לפי משפט היינה־בורל היא קומפקטית.\
  נגדיר $C colon.eq {(x,y,z) in RR^3 bar x+y+z=7}$, זו בבירור קבוצה לא חסומה אבל זו כן קבוצה סגורה כי אם $(x_n, y_n, z_n)_(n=1)^infinity$ קבוצה ב־$C$ שמתכנסת ל־$(x,y,z)$ בפרט $x_n arrow.r x, y_n arrow.r y, z_n arrow.r z$.\
  לכל $n in NN$ מתקיים $x_n+y_n+z_n=7$ ולכן מאריתמטיקה של גבולות נסיק שמתקיים $x+y+z = lim_(n arrow.r infinity) x_n+y_n+z_n = 7$ ולכן $(x,y,z) in C$, אז $C$ קבוצה סגורה.\
  נשים לב ש־$A = B inter C$ ובהרצאה ראינו שחיתוך סופי של קבוצות סגורות הוא סגור (זה נובע מכך שאיחוד סופי של קבוצות פתוחות הוא פתוח, וקבוצה סגורה היא קבוצה שהמשלים שלה הוא פתוח ועם כללי דה־מורגן נקבל את הנדרש).\
  אז $A$ קבוצה סגורה אבל מהגדרה $A subset.eq B$ ש־$B$ קומפקטית וראינו שתת־קבוצה סגורה של קבוצה קומפקטית היא קומפקטית, ולכן $A$ קומפקטית ולכן בהכרח $f$ שרציפה מקבלת עליה מינימום ומקסימום.\
  אם $f$ מינימום/מקסימום בנקודה פנימית של $A$, נוכל לבדוק לפי איפוס הגרדיאנט
  $ gradient f(x,y,z) = mat(2, 2, 3) != mat(0, 0, 0) $
  אז אין אף נקודה פנימית שבה $f$ מקבלת מינימום/מקסימום, ולכן נצטרך להשתמש בשיטת כופלי לגראנז' (כי הנקודות קיצון מתקבלות רק על השפה של האילוצים).\
  נגדיר $g_1 : RR^3 arrow.r RR$ על־ידי $g_1 (x,y,z) = x^2+y^2+3z^2-35$ ו־$g_2 : RR^3 arrow.r RR$ על־ידי $g_2 (x,y,z) = x+y+z-7$ וכמובן ש־$g_1, g_2$ דיפרנציאביליות ברציפות כי אלו פולינומים ומתקיים
  $ gradient g_1 (x,y,z) = mat(2x, 2y, 6z), space gradient g_2 (x,y,z) = mat(1, 1, 1) $
  יש לנו בפועל שלוש משוואות של אילוצים שאנחנו יכולים להוציא
  $
    gradient f (x,y,z) = lambda gradient g_1 (x,y,z)+ mu gradient g_2 (x,y,z) <==> mat(2, 2, 3) = lambda (2x, 2y, 6z) + mu mat(1, 1, 1)
  $
  בבירור $lambda !=0$ כי $mat(2, 2, 3)$ ו־$mat(1, 1, 1)$ בלתי תלויים לינארית ולכן $x= (2 - mu)/lambda = y$ ואם נציב $x=y$ באילוץ השני נקבל
  $ z=7-2x $
  ומהצבה באילוץ הראשון
  $ 2x^2 + 3(7-2x)^2=35 <==> x = 2,4 $
  ולכן הנקודות הן $(2,2,3), (4,4,-1)$ ומתקיים $f(2,2,3)=17, f(4,4,-1)=13$ ולכן המינימום הוא $13$ בנקודה $(4,4,-1)$ והמקסימום הוא 17 בנקודה$(2,2,3)$.\
  אפשר גם בצורה אלימה לפתור את מערכת המשוואות
  אז נקבל מערכת משוואות
  $
    2 = 2x lambda + mu ==> mu = 2-2x lambda \
    2 = 2y lambda + mu ==> mu = 2-2y lambda \
    3 = 6z lambda + mu ==> mu = 3-6z lambda \
    x^2+y^2+3z^2=35 \
    x+y+z=7
  $
  אבל אני אוותר.
]

#question()
שאלה 7 תרגיל בית 11: בכל סעיף נתונה קבוצה ואינטגרל, נשתמש במשפט חילוף משתנה כדי לחשב את האינטגרל על הקבוצה.
#theorem(
  "משפט חילוף משתנה – תזכורת",
)[תהיינה $A, B subset.eq RR^k$ קבוצות פתוחות ו־$g:A arrow.r B$ דיפאומורפיזם (חד־חד ערכית, על, גזירה ברציפות ובעלת הופכית גזירה ברציפות) ו־$f:B arrow.r RR$ פונקציה רציפה.\
  אז $f$ אינטגרבילית על $B$ אם ורק אם הפונקציה $x mapsto (f compose g)(x) abs(det(D g_x))$ אינטגרבילית על $A$ ובמקרה זה מתקיים
  $ integral_B f(t)d t = integral_A (f compose g)(x)abs(det(D g_x)) d x $]

#subquestion()
תהיי $B colon.eq {(x,y) in RR^2 bar x^2-x y+y^2<2}$ ונחשב את האינטגרל $integral_B (x^2-x y + y^2) d x d y$ באמצעות משפט חילוף משתנה.

#solution[
  הקבוצה $B$ מהווה אליפסה סביב הראשית שאינה מקבילה לצירים, ולכן נצטרך לבצע חילוף משתנה לינארי כדי להפוך את האליפסה לעיגול. נשתמש בהשלמה לריבוע:
  $ x^2-x y + y^2 = (x-1/2y)^2 - 1/4y^2 + y^2 = (x-1/2y)^2 + (sqrt(3)/2y)^2 $
  נבצע את חילוף המשתנה הלינארי $vec(u, v) = vec(x-1/2y, sqrt(3)/2y)$ ואז
  $ T^(-1) = mat(1, -1/2; 0, sqrt(3)/2)^(-1) $
  נזכר שמתקיים $det(T^(-1)) = 1/det(T)$ ולכן
  $ d x d y = abs(det(T^(-1))) d u d v = 2/sqrt(3) d u d v $
  נסמן $A = T(B) = B_2 (0) without {0}$ אז ממשפט חילוף משתנה, הפונקציה $f$ אינטגרבילית על $B$ אם ורק אם $f compose T^(-1)$ אינטגרבילית על $A$ ומתקיים
  $
    integral_B f(x,y) d x d y = integral_A u^2+v^2 dot.op s/sqrt(3) d u d v = 2/sqrt(3) =_("קוטביות") 2/sqrt(3) integral_0^(2pi) integral_0^2 r^2 d r d theta = 2/sqrt(3) integral_0^(2pi) [r^3/3]_(r=0)^(r=2) d theta = (24pi)/(3sqrt(3))
  $
]

#subquestion()
תהיי
$ C colon.eq {(x,y) in RR^2 bar x>0, space y> 0, space 1<x y< 3, space x^2<y^2<x^2+1} $
ונחשב באמצעות משפט חילוף משתנה את האינטגרל
$ integral_C (y^2-x^2)^(x y) (x^2+y^2)d x d y $

#solution[
  נשים לב שמהאילוץ $x^2<y^2<x^2+1$ אנחנו מקבלים $0<y^2-x^2<1$ לכן הגיוני שנגדיר $vec(u, v) = vec(x y, y^2-x^2)$ ואז
  $
    J = mat((partial u)/(partial x), (partial u)/(partial y); (partial v)/(partial x), (partial v)/(partial v)) = mat(y, x; -2x, 2y)
  $
  אז
  $ det(J) = 2 y dot. y + x dot.op 2x = 2(x^2+y^2) $
  ולכן
  $ d x d y = abs(det(J^(-1))) d u d v ==> d x d y = 1/(2(x^2+y^2)) d u d v $
  אז תחום האינטגרציה שלנו יהיה $A = {(u,v) in RR^2 bar 1<u<3, 0<v<1}$ ולכן
  $
    integral_C f(x,y) d x d y = integral_A (v^u cancel((x^2+y^2)))/(2 cancel((x^2+y^2))) d u d v = 1/2 integral_A v^u d u d v = 1/2 integral_0^1 integral_1^3 v^u d u d v = 1/2 integral_0^1 [v^u/ln(v)]^(u=3)_(u=1) d v \
    = 1/2 integral_0^1 v^3/ln(v) - v/ln(v) d v
  $
  אבל האינטגרל האחרון הוא לא אינטגרל שאנחנו יודעים לחשב, ולכן נשתמש במשפט פוביני
  $
    1/2 integral_0^1 integral_1^3 v^u d u d v = 1/2 integral_1^3 integral_0^1 v^u d v d u = 1/2 integral_1^3 [v^(u+1)/(u+1)]_(v=0)^(v=1) = 1/2 integral_1^3 1^(u+1)/(u+1) d u = 1/2 integral_1^3 1/(u+1) d u = 1/2 [ln(u+1)]_(u=1)^(u=3) \
    = 1/2 (ln(4)-ln(2)) = 1/2 ln(2)
  $
]

#question()
מטלה 12 שאלה 1: תהיי $f: RR arrow.r RR$ הפונקציה הנתונה על־ידי
$ f(x) = mycases(e^(-1/x), x>0, 0, x<=0) $
נגדיר $g:RR arrow.r RR$ על־ידי $g(x)=f(x)f(1-x)$.

#subquestion()
נוכיח כי $g$ היא פונקציה חלקה (גזירה אינסוף פעמיים) עם תומך $supp(g)=[0,1]$.

#proof[
  ניזכר
  $ supp(g) colon.eq overline({x in RR^k bar g(x)!=0}) subset.eq RR $
  עבור $x>0$ בבירור $f$ חלקה כי היא מזדהה עם הפונקציה החלקה $e^(-1/x)$ וגם אם $x<=0$ אז $f$ מזדהה עם הפונקציה החלקה $0$.\
  נשים לב של־$g$ יש לנו $3$ חלוקות:
  + $x>1$ – במקרה זה, $f(x) > 0$ אבל $1-x <= 0$ ולכן $f(1-x)=0$ ולכן $g(x) = 0$
  + $x < 1$ – במקרה זה $f(x) = 0$ ולכן $g(x)=0$
  + $0<x<1$ במקרה זה מתקיים $f(x) > 0$ וגם $f(1-x) > 0$ כי $1-x>0$ ולכן במקרה זה $g(x)!=0$
  בסך־הכל מצאנו שמתקיים
  $ {x in RR bar g(x) != 0 } = (0,1) $
  ולכן כמובן שמתקיים
  $ supp(g) = overline({x in RR bar g(x) != 0 }) = overline((0,1)) = [0,1] $
  וכמובן ש־$g$ חלקה כי בכל קטע היא מזדהה עם פונקציה חלקה (ובפרט מרציפות הגבול בשאיפה ל־$0$ זהה).
]

#subquestion()
תהיי $Q = [a_1, b_1] times dots.h.c times [a_k, b_k] subset.eq RR^k$ תיבה לא מנוונת. נגדיר $phi.alt : RR^k arrow.r RR$ על־ידי
$ phi.alt(x) = product_(i=1)^k g((x_i-a_i)/(b_i-a_i)) $
נוכיח כי $phi.alt$ היא פונקציה חלקה עם תומך $supp(phi.alt)=Q$.

#proof[
  אנחנו מחפשים את $supp(phi.alt) = overline({x in RR bar phi.alt(x) != 0 })$.\
  היות ו־$phi.alt$ היא מכפלה של $g_i$ אז אנחנו צריכים שכל $g_i (x) !=0$. ממה שמצאנו בסעיף הקודם, זה קורה אם ורק אם
  $ 0<=(x_i-a_i)/(b_i-a_i) <=1 <==> 0<=x_i-a_i <= b_i - a_i <==> a_i <= x_i <= b_i $
  משמע $x_i in [a_i, b_i]$ ולכן
  $ {x in RR bar phi.alt(x) != 0 } = [a_1, b_1] times dots.h.c times [a_k, b_k] = Q $
  אבל $Q$ היא קבוצה קומפקטית ב־$RR^k$ ולכן סגורה, על־כן $overline(Q)=Q$ ולכן אכן מתקיים $supp(phi.alt) = overline({x in RR bar phi.alt(x) != 0 }) = Q$.
]

#question()
מטלה 12 שאלה 2: תהיי $A subset.eq RR^k$ קבוצה פתוחה ו־$f:A arrow.r RR$ פונקציה רציפה.

#subquestion()
נוכיח כי אם $f$ בעלת תומך קומפקטי אז $f$ אינטגרבילית על $A$ ומתקיים
$ integral_A f(x) d x = integral_supp(f) f(x) d x $

#proof[
  נגדיר $f_minus = - min{f,0}, f_plus = max{f,0}$.\ $f$ אינטגרבילית על $A$ ולכן $f_minus, f_plus$ אינטגרביליות, כאשר אנחנו אומרים שהן אינטגרביליות אומר שמתקיים
  $
    integral_A f_plus.minus (x) d x colon.eq sup { integral_D f_plus.minus (x) d x bar "קומפקטית בעלת נפח" D subset.eq A} < infinity
  $
  $f$ בעלת תומך קומפקטי, ולכן $f=0$ לכל $x in A without supp(f)$ ולכן
  $
    integral_A f(x) d x = integral_supp(f) f(x) d x + integral_(A without supp(f)) f(x) d x = integral_supp(f) f(x) d x
  $
]

#question()
מטלה 13 שאלה 7 סמסטר א' 2025: תהיי $f : RR^k arrow.r RR^k$ פונקציה ליפשצית. נראה שאם $N subset.eq RR^k$ ממידה אפס, אז $f(N)$ ממידה אפס.

#proof[
  תהיי $N subset.eq RR^k$ ממידה אפס ויהי $epsilon > 0$. \
  $f$ ליפשיצית, ומכך שכל הנורמות שקולות אז בפרט הנורמות $norm(dot.op)_2, norm(dot.op)_infinity$ שקולות ולכן קיים $L$ כך שלכל $x,y in RR^k$ מתקיים
  $ norm(f(x)-f(y))_infinity <= L norm(x-y)_infinity $
  (מהלשפיציות ומהשקילות נורמות).\
  תהיי $B = product[a_i, b_i]$ תיבה, אז $f(B)$ מוכלת בתיבה שאורך צלעותיה הן $L(b_i-a_i)$.\
  $N$ ממידה אפס ולכן קיים אוסף ${B_n}_(n=1)^infinity$ כך ש־$N subset.eq union_(n=1)^infinity B_n$ ומתקיים
  $ sum_(n=1)^infinity V(B_n) < epsilon/L^k $
  ולכן
  $ f(N) subset.eq f(union.big_(n=1)^infinity B_n) subset.eq union.big_(n=1)^infinity f(B_n) $
  ולכן
  $
    sum_(n=1)^infinity V(f(B_n)) <= sum_(n=1)^infinity V(L B_n) =_("הגדרת נפח תיבה") L^k sum_(n=1)^infinity V(B_n) = L^k epsilon/L^k < epsilon
  $
]

#question()
נמצא את ערכי $alpha in RR$ עבורם האינטגרל הבא מתכנס
$ integral_B 1/(x^2+y^2+z^2)^(alpha/2) d x d y d z $
כאשר
$ B colon.eq {(x,y,z) in RR^3 bar x^2+y^2+z^2 > 1, x,y,z > 0} $

#solution[
  אם נעבור לכדוריות, מתקיים $r=sqrt(x^2+y^2+z^2), phi, theta in (0, pi/2)$ כי $x, z >0$ ולכן
  $ B = {(r, theta, phi) in RR^3 bar r^2 > 1, phi in (0, pi/2), theta in (0, pi/2)} $
  ואז האינטגרל שלנו הוא
  $
    integral_1^infinity integral_0^(pi/2) integral_0^(pi/2) 1/r^(alpha/2) r^2 sin(phi) d theta d phi d r = integral_1^infinity integral_0^(pi/2) integral_0^(pi/2) r^((4-alpha)/2) sin(phi) d theta d phi d r
  $
  נשים לב שאפשר לשנות סדר אינטגרציה מפוביני כי הכל רציף ולכן אינטגרבילי, אבל נשים לב
  $ integral_0^(pi/2) sin(phi) d phi = [-cos(phi)]_(phi=0)^(phi=pi/2) = -cos(pi/2) + cos(0) = 1 $
  וכן
  $ integral_0^(pi/2) d theta = pi/2 $
  אז אנחנו רק צריכים לבדוק מתי האינטגרל הבא מתכנס
  $ integral_1^infinity r^((4-alpha)/2) d r $
  נזכר ש־$r>1$ ולכן מאינפי $2$ אנחנו יודעים שהאינטגרל מתכנס אם ורק אם $(4-alpha)/2 < -1 <==> 4-alpha < -2 <==> 6 < alpha$.\
  לכן האינטגרל מתכנס אם ורק אם $alpha > 6$.
]

#question()
מטלה 13 שאלה 1: נוכיח כי קיימת פונקציה רציפה יחידה $f:[0,1] arrow.r RR$ עבורה לכל $x in [0,1]$ מתקיים
$ f(x)=x+1/2 sin(f(x)) $

#proof[
  נעזר ברמז ונרצה להשתמש במשפט העתקה מכווצת.
  #theorem(
    "משפט העתקה מכווצת – תזכורת",
  )[יהי $(X,d)$ מרחב מטרי שלם ו־$g: X arrow.r X$ העתקה מכווצת. אז ל־$f$ יש נקודת שבת אחת.\
    #definition(
      "העתקה מכווצת",
    )[$g:X arrow.r X$ נקראת *העתקה מכווצת* אם יש $0<lambda<1$ כך שלכל $x,y in X$ מתקיים $d(f(x), f(y))<=lambda d(x,y)$.]]
  נגדיר $T:C[0,1] arrow.r C[0,1]$ כאשר $C[0,1] = {f : [0,1] arrow.r RR bar "רציפה" f}$ על־ידי $T(f)(x) = x+1/2 sin(f(x))$ ונזכר שבמרחב הפונקציות הרציפות אנחנו עובדים עם נורמת סופרמום $norm(f)_infinity = sup_(x in [0,1]) abs(f(x))$.\
  לכל $x in [0,1]$ מתקיים עבור $f,g in C[0,1]$
  $ abs(T(f)(x)-T(g)(x)) = abs(x+1/2 sin(f(x))-x-1/2 sin(g(x))) = 1/2 abs(sin(f(x))-sin(g(x))) $
  נשים לב ש־$sin(x)$ עומדת בתנאי משפט לגראנז', ולכן קיימת $c in (0,1)$ כך שמתקיים
  $ abs(sin(f(x))-sin(g(x)))<= abs(f(x)-g(x)) abs(cos(c)) $
  ולכן
  $ abs(T(f)(x)-T(g)(x))<= 1/2 abs(f(x)-g(x)) abs(cos(c))<=_(abs(cos(c))<=1) 1/2 abs(f(x)-g(x)) $
  וכשניקח סופרמום
  $ norm(T(f)(x)-T(g)(x))_infinity <= 1/2 norm(f-g)_infinity $
  ולכן $T$ היא העתקה מכווצת עם $lambda = 1/2$, וממשפט העתקה מכווצת קיימת ל־$T$ נקודת שבת אחת, קרי פונקציה רציפה אחת המקיימת $T(f) = f$, משמע $ T(f)(x) = x+1/2 sin((f(x))) = f(x) $
]

#question()
מטלה 13 שאלה 2: תהיי $S subset.eq RR^k$ קבוצה קשירה מסילתית ו־$f:S arrow.r RR$ פונקיה רציפה.
#definition(
  "תזכורת – קבוצה קשירה מסילתית",
)[נגיד שקבוצה $S subset.eq RR^k$ היא קשירה מסילתית אם לכל $x_1, x_2 in S$ קיימת מסילה $gamma : [0,1] arrow.r S$ כך ש־$gamma(0)=x_0, gamma(1)=x_1$.]
#subquestion()
יהיו $a,b in S$ ונניח שמתקיים $f(a)<f(b)$. נראה כי לכל $t in (f(a), f(b))$ קיים $s in S$ כך ש־$f(s)=t$.

#proof[
  $S$ קשירה מסילתית ולכן יש $gamma : [0,1] arrow.r S$ כך שמתקיים $gamma(0)=a, gamma(1)=b$ ($gamma$ רציפה) ונסתכל על ההרכבה $f compose gamma : [0,1] arrow.r RR$ שהיא רציפה כהרכבה של פונקציות רציפות.\
  נשים לב $im(f compose gamma) = [f(a), f(b)]$ (כי $f(gamma(0))=f(a), f(gamma(1))=f(b)$).\
  ממשפט ערך הביניים, $f compose gamma$ מקבלת כל ערך בין $f(a)$ לבין $f(b)$, גם בקטע הסגור וגם בקטע הפתוח ולכן קיים $s in[0,1]$ כך ש־$f(gamma(s))=t$ לכל $t in (f(a), f(b))$.
]

#subquestion()
נראה כי למשוואה הבאה יש פיתרון ב־$B_2 (0) subset.eq RR^2$
$ x^2+2y^2=e^((x-1/2)^2) cos(e^(-sin(y/(x+2)))) $

#proof[
  נגדיר $F(x,y) = x^2+2y^2-e^((x-1/2)^2) cos(e^(-sin(y/(x+2))))$.\
  נשים לב ש־$F$ רציפה: $x^2+2y^2$ רציפה כפולינום, $e^((x-1/2)^2)$ גם־כן רציפה כי $e$ חלקה וכן הרכבה של רציפות זה רציף.\
  נשאר לבחון האם $cos(e^(-sin(y/(x+2))))$ מהווה פונקצייה רציפה ב־$B_2 (0)$ (הכדור הפתוח סביב $0$ מרדיוס $2$): נבחן את $y/(x+2)$, ונשים לב \
  $x+2 != in B_2 (0)$ כי $x > 2$ ולכן הפונקציה $y/(x+2)$ היא פונקציה רציפה כמנה של פונקציות רציפות.\
  אז כל ההרכבה $cos(e^(-sin(y/(x+2))))$ היא רציפה כהרכבת פונקציות רציפות ב־$B_2 (0)$, ולכן $F$ היא סכום, מכפלה והרכבה של פונקציות רציפות ולכן רציפה.\
  אנחנו יודעים ש־$B_2 (0)$ הוא קשיר מסילתית כי אם נגדיר $gamma:[0,1] arrow.r B_2 (0)$ על־ידי $gamma(t)=t x + (1-t)y$ עבור $x,y in B_2 (0)$ כי אנחנו יודעים שמתקיים $norm(x)<2, norm(y)<2$ ולכן
  $ norm(t x+(1-t)y) = norm(t x + (1-t)y - (t 0 + (1-t) 0))<=t norm(x) + (1-t)norm(y) < 2 t + 2(1-t) = 2 $
  לכן $F$ רציפה על קבוצה קשירה מסילתית ולכן ניתן להשתמש בסעיף א'. נשים לב שמתקיים
  $ F(0,0) = 0^2+2 dot.op 0^2 - e^((0-1/2)^2) cos(e^(-sin(0/(0+2)))) = -e^(1/4)cos(1) < 0 $
  ומצד שני
  $ F(1,1) = 1^2+2 dot.op 1^2 - e^((1-1/2)^2)cos(e^(-sin(1/(1+2))))= 3-e^(1/4)cos(e^(-sin(1/3))) $
  ברור שמתקיים $e^(-sin(1/3)) < 1$ ולכן $cos(e^(-sin(1/3)))<1$ אז
  $ F(1,1) < 3-e^(1/4) > 0 $
  לכן ממשפט ערך הממוצע שראינו בסעיף א' נובע שיש פיתרון למשוואה.
]

#subquestion()
יש טעות בשאלה, השאלה הנכונה היא להראות שהקבוצה $S = {(x,y) in RR^2 bar x^2-y^2>=1}$ אינה קשירה מסילתית.

#proof[
  נעזר ברמז ונסתכל על הפונקציה $f:RR^2 arrow.r RR$ הנתונה על־ידי $f(x,y)=x$ ראינו שפונקציית ההטלה היא פונקציה רציפה.\
  מסעיף א', פונקציה רציפה על מרחב קשיר מסילתית מקיימת את משפט ערך הביניים.\
  ניקח את הנקודות $(2,0), (-2,0)$ ולכן מסעיף א' לכל $t in (f(-2,0), f(2,0)) = (-2, 2)$ יש $s in S$ כך שמתקיים $f(s)=0$, אבל מהגדרת $S$ מתקיים $x^2>=1+y^2$ משמע $abs(x)>=1$ משמע $x>=1$ או $x<=1$ אבל אז לא ייתכן $-1<x<1$ וזו סתירה.
]

#question()
מטלה 13 שאלה 5: תהיי $f:RR^2 arrow.r RR$ פונקציה גזירה ברציפות ונניח כי $g(0,0)=0$. עבור $epsilon > 0$ נגדיר
$ g_epsilon (x,y) = g(x,y)+epsilon(x+y) $

#subquestion()
נוכיח כי קיים $epsilon_0 > 0$ כך שלכל $epsilon in (0, epsilon_0)$ קיימת $delta>0$, סביבה $U$ של $(0,0)$ ופונקציה $f_epsilon : (-delta, delta) arrow.r RR$ כך שלכל $(x,y) in U$ מתקיים
$ y = f_epsilon (x) <==> g_epsilon (x,y) = 0 $

#proof[
  מזכיר את משפט הפונקציה הסתומה.
  #theorem(
    "תזכורת – משפט הפונקציה הסתומה",
  )[תהיינה $A subset.eq RR^k, B subset.eq RR^m$ פתוחות ו־$G : A times B arrow.r B$ גזירה ברציפות. נניח שמתקיים $(x_0, y_0) in A times B$ ומתקיים $G(x_0, y_0)=0$ וכן כי $((partial G_i)/(partial y_i) (x_0, y_0))_(1<=i,j<=m)$ הפיכה.\
    אז יש $U subset.eq A times B$ פתוחה סביב $(x_0, y_0)$ ו־$V in RR^k$ פתוחה ו־$f:V arrow.r B$ גזירה ברציפות כך שלכל $(x,y) in U$ מתקיים $f(x)=y <==> G(x,y)=0$.]
  מהנתון מתקיים $g_epsilon (0,0) = g(0,0)+epsilon(0+0)=0$ ומתקיים גם
  $
    (partial g_epsilon)/(partial y) (x,y) = g_y (x,y) + epsilon ==> (partial g_epsilon)/(partial y) (0,0) = g_y (0,0) + epsilon
  $
  אז יש לנו שתי אופציות: $g_y (0,0) = 0$ או $g_y (0,0) !=0$.\
  אם זה השני, סיימנו ומשפט הפונקציה הסתומה נותן לנו את הנדרש ישירות.\
  אחרת, $(partial g_epsilon)/(partial y) (0,0) = epsilon > 0$ ולכן עדיין תנאי משפט הפונקציה הסתומה מתקיימים.\
  אז קיימת סביבה $epsilon_0 > 0$ כך שלכל $epsilon in (0, epsilon_0)$ מתקיים $(partial g_epsilon)/(partial y) (0,0)!=0$ ולכן ממשפט הפונקציה הסתומה יש $delta>0$ כך ש־$f_epsilon : (-delta, delta) arrow.r RR$ וסביבה של $(0,0)$ כך שמתקיים לכל $(x,y) in U$
  $ g_epsilon (x,y) = 0 <==> y = f_epsilon (x) $
]

#subquestion()
נוכיח כי קיים $epsilon_1 > 0$ כך שלכל $epsilon in (0,epsilon_1)$ הפונקציה $f_epsilon$ הפיכה בסביבה של $0$ עם הופכית גזירה ברציפות.

#proof[
  מזכיר את משפט הפונקציה ההפוכה.
  #theorem(
    "תזכורת – משפט הפונקציה ההפוכה",
  )[תהיי $f: A arrow.r RR^k$ עבור $A subset.eq RR^k$ פתוחה, $f$ גזירה ברציפות ב־$A$ ותהיי $a in A$ עבורה $det(D f)_a !=0$. \
    אז יש $U subset.eq A$ פתוחה, $a in U$ כך ש־$f|_U$ חד־חד ערכית, $f(U)=V$ פתוחה ו־$f^(-1)|_V$ גזירה ברציפות ומתקיים $(D f^(-1))_y = [(D f)_(f^(-1)(y))]^(-1)$ לכל $y in V$.
  ]
  ממשפט הפונקציה הסתומה קיבלנו
  $ g_epsilon (x, f_epsilon (x)) = 0 $
  נגזור לפי כלל שרשרת
  $
    (partial g_epsilon)/(partial x) (x,f_epsilon (x)) + (partial g_epsilon)/(partial y) (x, f_epsilon (x)) dot.op f'_epsilon (x) = 0 ==> f'_epsilon (x) = - (g_(epsilon, x) (x, f_epsilon (x)))/(g_(epsilon, y) (x, f_epsilon (x)))
  $
  עבור $x=0, f_epsilon (0) = 0$ ולכן
  $ f'_epsilon (0) = - (g_(epsilon, x) (0, 0))/(g_(epsilon, y) (0,0)) = - (g_x (0,0) + epsilon)/(g_y (0,0) + epsilon) $
  ולכן עבור $epsilon > 0$ קטן דיו נקבל $f'_epsilon (0) != 0$, ולכן קיים $epsilon_1 > 0$ שלכל $epsilon in (0,epsilon_1)$ מתקיים $f'_epsilon (0) !=0$ ולכן אנחנו עומדים בתנאי משפט הפונקציה ההפוכה וממנה נקבל את הנדרש.
]

#subquestion()
עבור המקרה בו $f_epsilon$ הפיכה בסביבה של $0$ נביע את $(f_epsilon^(-1))'(0)$ במונחי $g$ ונגזורתיה.

#solution[
  באינפי 1 ראינו שמתקיים
  $ (f_epsilon^(-1))'(0) = 1/(f'_epsilon (f_epsilon^(-1) (0))) $
  ראינו כבר שמתקיים $f_epsilon (0) = 0$ ולכן $f^(-1)_epsilon (0) = 0$ ואז
  $
    (f_epsilon^(-1))'(0) = 1/(f'_epsilon (0)) = - (g_(epsilon, y) (0,0))/(g_(epsilon, x) (0,0)) = - (g_y (0,0) + epsilon)/(g_x (0,0) + epsilon)
  $
]

#question()
מטלה 13 שאלה 4: תהיי $A subset.eq RR^3$ החיתוך בין הפרבולואיד $z=x^2+y^2$ והמישור $z+x=2$. נוכיח כי קיימת ב-$A$ נקודה הרחוקה ביותר מהראשית ונמצא אותה.

#solution[
  גיאומטרית: אנחנו מחפשים חיתוך בין משטח לבין פרבלואיד וזה נותן לנו חישוק, אז ברור שיש נקודה שרחוקה ביותר מהראשית (חישוק זו קבוצה קומפקטית כי היא סגורה וחסומה).\
  נגדיר פורמלית, אנחנו מחפשים את החיתוך בין שתי הצורות ולכן עם השלמה לריבוע נקבל
  $ A colon.eq {(x,y,z) in RR^3 bar z=x^2+y^2, space z+x=2} = {(x,y) in RR^2 bar (x+1/2)^2+y^2=9/4 } $
  זה בעצם השפה של מעגל ברדיוס $3/2$ שמוזז $1$ שמאלה על ציר ה־$x$.\
  זו השפה של מעגל מוזז ולכן כמובן סגורה, וזאת תת־קבוצה של מעגל ומעגל הוא קבוצה קומפקטית אז $A$ קומפקטית (כי תת־קבוצה סגורה של קבוצה קומפקטית היא קומפקטית), אפשר גם להראות ישירות מהגדרה (זה לא ארוך).\
  נגדיר $f: RR^2 arrow.r RR$ על־ידי $f(x,y) = x^2+y^2+(x^2+y^2)^2 = x^2+y^2+x^4+y^4+2x^2y^2$ (כי $z=x^2+y^2$) נזכר ששורש זו פעולה שמשמרת מינימום ומקסימום ולכן ניתן לוותר עליה ופונקציית האילוץ היא $g: RR^2 arrow.r RR$ על־ידי $g(x,y) = (x+1/2)^2+y^2-9/4$.\
  אלו כמובן שתי פונקציות רציפות והן גזירות ברציפות כפולינומים ומתקיים
  $
    gradient f(x,y) = mat(2x+4x(x^2+y^2), 2y+4y(x^2+y^2)) \
    gradient g(x,y) = mat(2x+1, 2y)
  $
  נשים לב ש־$gradient f(x,y) = 0 <==> x=y=0$ (כי $2x(1+2(x^2+y^2)) = 0 <==> x = 0 or 1+2(x^2+y^2) = 0$ והאחרון לא אפשרי כמובן).\
  אז הראשית היא נקודה חשודה ומתקיים מהאילוץ על $g$, $g(0,0) = 1/2^2 != 9/4$ ולכן היא לא נקודה מעניינת.\
  אז קיצון אחר מתקבל על השפה, ומשיטת כופלי לגראנז' נקבל
  $
    gradient f(x,y) = lambda gradient g(x,y) ==> cases(
      2x+4x(x^2+y^2)=2x(1+2(x^2+y^2)) = lambda (2x+1),
      2y+4y(x^2+y^2)=2y(1+2(x^2+y^2)) = lambda 2y,
      (x+1/2)^2+y^2=9/4
    )
  $
  אם $y=0$ זה פותר את המשוואה השנייה, ואז המשוואה השלישית מניבה $(x+1/2)^2=9/4 ==> x=-2, x=1$ ואלו שתי נקודות חשודות.\
  אם $x=0$ זה פותר את המשוואה הראשונה ואז המשוואה השלישית מניבה $y^2 = 9/4 <==> y = plus.minus 3/2$ ולכן זה עוד צמד נקודות חשודות.\
  אם גם $x!=0, y!=0$ אז משילוב המשוואה הראשונה והשנייה נקבל
  $
    (2x(1+2(x^2+y^2)))/(2x+1) = (2y(1+2(x^2+y^2)))/(2y) <==> (2x(1+2(x^2+y^2)))/(2x+1) = 1+2 (x^2+y^2) \
    <==> 2x+4x(x^2+y^2) = 2x+4x(x^2+y^2)+1+2(x^2+y^2) <==> -1/2 = x^2+y^2 crossmark
  $
  ולאחרון כמובן אין פיתרון מעל $RR$.\
  אז יש לנו $4$ נקודות חשודות
  $ (-2, 0), (1,0), (0, 3/2), (0, -3/2) $
  ואם נציב ב־$f$ נקבל
  $ f(-2,0) = 20, f(1,0) = 2, f(0,3/2) = 117/16 = f(0,-3/2) $
  ולכן מקסימום מתקבל בנקודה $(-2, 0, 4)$ הנקודה שהכי רחוקה מהראשית על שתי הצורות.
]

#question()
מטלה 13 שאלה 5: נכתוב כל קבוצה בקורדינאטות גליליות.

#subquestion()
$A colon.eq {(x,y,z) in RR^3 bar abs(x)<y, x^2+y^2<z}$.

#solution[
  בגליליות מתקיים
  $ 0<rho = sqrt(x^2+y^2), theta in [0, 2pi) x = rho cos(theta), y = rho sin(theta), z =h $
  ברור שמתקיים $0<rho^2<z$, וצריך להתקיים
  $ abs(x)<y ==> abs(r cos(theta)) = r sin(theta) <==> abs(cos(theta))<=sin(theta) $
  אם אני אמורה לדעת מתי זה קורה זאת טעות, אבל הדסמוס אומר $theta in [pi/4, (3pi)/4]$, ולכן
  $
    A = {(x,y,z) in RR^3 bar abs(x)<y, x^2+y^2<z} = {(rho, theta, z) in RR^3 bar 0<rho^2<z, theta in [pi/4, (3pi)/4], z>0 }
  $
]

#subquestion()
$B colon.eq {(x,y,z) in RR^3 bar x,y>0, 0<z<pi/2, y<x tan(z)}$.

#solution[
  נשים לב שעבור $0<z<pi/2$ מתקיים $0<=tan(z)<infinity$ שזה תמיד נחמד.\
  כמובן מכך ש־$x>0$ נובע כי $theta in (0, pi/2)$ (יחד עם $y>0$).\
  $
    B={(x,y,z) in RR^3 bar x,y>0, 0<z<pi/2, y<x tan(z)}={(rho, theta, z) in RR^3 bar 0<rho, theta in (0, pi/2) < z, 0 < z < pi/2}
  $
  בגלל ש־$x,y > 0$ אז $ y<x tan(z) <==> y/x < tan(z) <==> arctan(y/x) = z $
  ויתרתי באמצע.
]

#question()
מטלה 13 שאלה 6: נכתוב כל קבוצה בקורדינאטות כדוריות. תזכורת:
$
  r = sqrt(x^2+y^2+z^2), space theta in [0, 2pi), space phi in [0, pi], space x = r cos(theta) sin(phi), space y = r sin(theta) sin(phi), space z = r cos(phi)
$

#subquestion()
$A colon.eq {(x,y,z) in RR^3 bar 1/3z^2 < x^2+y^2<3z^2}$.

#solution[
  ונשים לב ש־$r!=0$ כי זה לא מניב פיתרון לאי־שיוויון ולכן נוכל לחלק ב־$r$ כשנצטרך.
  נשים לב
  $
    1/3z^2 < x^2+y^2<3z^2 ==> 1/3 r^2 cos^2(phi) < r^2 cos^2(theta) sin^2(phi)+r^2 sin^2(theta) sin^2(phi) < 3 r^2 cos^2(phi) space (star)
  $
  אז
  $
    r^2 cos^2(theta) sin^2(phi)+r^2 sin^2(theta) sin^2(phi) = r^2 sin^2(phi) (cos^2(theta) + sin^2(theta)) =_(cos^2(theta) + sin^2(theta) = 1) r^2 sin^2(phi)
  $
  אז
  $
    (star) = 1/3 r^2 cos(phi) < r^2 sin^2(phi) < 3 r^2 cos^2(phi) <==>_(r > 0) 1/3 cos^2(phi) < sin^2(phi) < 3 cos^2(phi)
  $
  נמשיך להשתמש בזהות $cos^2(theta) + sin^2(theta)=1$ ונגזורתיה
  $
    sin^2(phi) - 1/3 cos^2(phi) > 0 <==> 1-cos^2(phi) > 1/3 cos^2(phi) <==> 1 > 4/3 cos^2(phi) <==> cos^2(phi) < 4/3 <==> abs(cos(phi)) < sqrt(3)/2
  $
  וזה קורה כאשר $phi in (pi/6, 5pi/6)$ תודה לדסמוס.
  $
    sin^2(phi)<3cos^2(phi) <==> sin^2(phi) < 3 - 3sin^2(phi) <==> 4 sin^2(phi) < 3 <==> sin^2(phi) < 3/4 <==> abs(sin(phi))< sqrt(3)/2
  $
  ובזכות דסמוס זה קורה כאשר $phi in (0, pi/3) union (2pi/3, pi)$.\
  אם נחבר את התלויות נקבל $phi in (pi/6, pi/3) union (2pi/3, pi)$.
  $
    A colon.eq {(x,y,z) in RR^3 bar 1/3z^2 < x^2+y^2<3z^2} = {(r, theta, phi) in RR^3 bar r >0, theta in [0,2pi), phi in (pi/6, pi/3) union phi in (2pi/3, pi)}
  $
]

#subquestion()
$B colon.eq {(x,y,z) in RR^3 bar x,y,z > 0, z^2(x^2+y^2) < x^2(x^2+y^2+z^2)}$.

#solution[
  נסמן $r = sqrt(x^2+y^2+z^2)$ ומהנתון של $x,y,z > 0$ נקבל $r>0$ וגם מכך אנחנו לומדים ש־$theta in (0, pi/2), phi in (0, pi/2)$
  $ x^2 (x^2+y^2+z^2) <==> r^4 cos^2(theta) sin^2(phi) $
  וגם
  $
    z^2(x^2+y^2) = r^2 cos^2(phi) (r^2cos^2(theta)sin^2(phi) + r^2sin^2(theta)sin^2(phi)) = r^2 cos^2(phi)(r^2sin^2(phi)(cos^2(theta)+sin^2(theta))) \
    =_(cos^2(theta)+sin^2(theta)=1) r^2 cos^2(phi)(r^2sin^2(phi)) = r^4cos^2(phi)sin^2(phi)
  $
  אז
  $
    r^4 cos^2(phi)sin^2(phi) < r^4 cos^2(theta)sin^2(phi) <==>_(r>0) cos^2(phi) sin^2(phi) < cos^2(theta)sin^2(phi) <==>_(sin^2(phi) > 0, phi in (0, pi/2)) cos^2(phi) < cos^2(theta)
  $
  אז בסך־הכל
  $
    B = {(r, theta, phi) in RR^3 bar r>0, theta in (0,pi/2), phi in (0, pi/2), cos^2(phi)<cos^2(theta)}
  $
]


#question()
מטלה 13 שאלה 7: נחשב את הנפח שכלוא בין הצילינדרים עם $a>0$
$ x^2+y^2 = a^2, x^2 + z^2 = a^2, y^2 + z^2 = a^2 $

#solution[
  אני רוצה לחשב את הנפח של
  $ A = {(x,y,z) in RR^3 bar x^2+y^2<=a^2, x^2+z^2<=a^2, y^2+z^2<=a^2} $
  כמובן שנשתמש בקורדינאטות גליליות (דה), $x = r cos(theta), y = r sin(theta), z=z$.\
  כל הצילנדרים סימטריים ולכן מספיק שנסתכל על אחד הכיוונים, נניח הכיוון שבו $x>=0, y>=0, z>=0$ (יש לנו בסך־הכל $2^3=8$ כיוונים אז נצטרך לכפול בסוף ב־$8$), וברגע שהגבלנו את עצמנו לציר החיובי אנחנו יודעים בהכרח שמתקיים $0<=theta<=pi/2$.\
  ברור שמתקיים $0<=r=sqrt(x^2+y^2)<a$ ונשים לב שגם מתקיים
  $
    cases(x^2+z^2<=a^2 ==> z<=sqrt(a^2-x^2) = sqrt(a^2-r^2cos^2(theta)), y^2+z^2<=a^2 ==> z<=sqrt(a^2-y^2) = sqrt(a^2-r^2sin^2(theta)))
  $
  אנחנו כבר יודעים ש־$cos(x)>=sin(x)$ בקטע $[0, pi/4]$ ולכן גם בקטע הזה $sqrt(a^2-x^2)>=sqrt(a^2-y^2)$ וזה כמובן סימטרי בקטע השני ולכן פשוט ניקח את אחד מהם ונכפול ב־$2$.\
  את סדר האינטגרציה נקבע באמצעות משפט פוביני בהתאם למה שיהיה לנו נוח.\
  $
    8 dot.op 2 integral_0^(pi/4) integral_0^(a) integral_0^(sqrt(a^2-r^2cos^2(theta))) d z d r z d theta = 16 integral_0^(pi/4) integral_0^(a) r sqrt(a^2-r^2cos^2(theta)) d r d theta = (star)
  $
  נחשב בנפרד כי זה ארוך ונעשה החלפת משתנה
  $
    integral r sqrt(a^2-r^2cos^2(theta)) d r =_(x=a^2-r^2cos^2(theta) \
    -1/(2cos^2(theta)) d x = r d r) (-1)/(2cos^2(theta)) integral sqrt(x) d x = -1/(2cos^2(theta)) (2x^(3/2))/3 = (-x^(3/2))/(3cos^2(theta)) = ((r^2-a^2/(cos^2(theta)))sqrt(a^2-r^2cos^2(theta)))/3
  $
  ובחזרה לעניינו
  $
    (star) = 16 integral_0^(pi/4) [((r^2-a^2/(cos^2(theta)))sqrt(a^2-r^2cos^2(theta)))/3]_(r=0)^(r=a) = 16/3 integral_0^(pi/4) (a^2-a^2/(cos^2(theta)))sqrt(a^2(1-cos^2(theta))) + a^3/(cos^2(theta)) d theta space (star star)
  $
  גם את האינטגרל הזה אנחנו עוד יודעים לחשב אבל זרקתי למחשבון כי אני לא שונאת את עצמי אז עשינו יחד עבודה מצויינת עם הרבה חילופי משתנה
  $
    integral (a^2-a^2/(cos^2(theta)))sqrt(a^2(1-cos^2(theta))) d theta =_(a>0) -(sqrt(tan^2(theta)+1)(a^3tan^2(theta)+2a^3)abs(tan(theta)))/(tan^3(theta)+tan(theta))
  $
  ובחזרה למקורות נשים לב שיש לנו פה גם אינטגרל לא אמיתי ובזכות מחשבונים טובים נגלה
  $
    lim_(theta arrow.r 0^plus) -(sqrt(tan^2(theta)+1)(a^3tan^2(theta)+2a^3)abs(tan(theta)))/(tan^3(theta)+tan(theta)) = -2a^3
  $
  ולסיום סיומת
  $
    (star)(star) = 16/3 [-(sqrt(tan^2(theta)+1)(a^3tan^2(theta)+2a^3)abs(tan(theta)))/(tan^3(theta)+tan(theta))+ a^3tan(theta)]_(theta=0)^(theta=pi/4) =16/3 ((-3sqrt(2)a^3)/2 + 3a^3) \
    = (16a^3)/3 (3(-sqrt(2)+2)/2) = 16a^3((-sqrt(2)+2)/2) = 8a^3(2-sqrt(2))
  $
  שזו בידיוק הנוסחה מהאינטרנט.
]

#question()
מבחן מועד א' סמסטר א' 2025 שאלה 2: יהי $X$ מרחב מטרי קומפקטי, $Y$ מרחב מטרי כלשהו ו־$f: X arrow.r Y$.\
נניח שלךכל $x in X$ קיימת $delta>0$ כך שלכל $x' in B_delta (x)$ מתקיים $d(f(x),f(x'))<1/10$.\
נוכיח שקיימת $delta>0$ כך שלכל $x,x' in X$ עם $d(x,x') < delta$ מתקיים $d(f(x), f(x')) <=1/5$.

#proof[
  נניח שלא ככה, ולכן לא קיימת $delta > 0$ כזאת. \
  לכן, לכל $n in NN$ יש $(x_n)_(n=1)^infinity, (y_n)_(n=1)^infinity in subset.eq X$ כך ש־$y_n in B_(1/n) (x_n)$ וגם מתקיים $d(f(x_n), f(y_n)) > 1/5$.\
  $X$ קומפקטי ולכן קומפקטית סדרתית (במרחבים מטריים הטענות הללו שקולות) ולכן ל־$(x_n)_(n=1)^infinity$ יש תת־סדרה מתכנסת $(x_n_k)_(k=1)^infinity$ כך ש־$x_n_k stretch(arrow.r)_(k arrow.r infinity) x_0 in X$.\
  בפרט, לכל $k in NN$ מתקיים $y_n_k in B_(1/(n_k)) (x_n_k)$ ולכן $y_n_k stretch(arrow.r)_(k arrow.r infinity) x_0$ (זה מההגדרה השקולה להתכנסות).\
  מהנתון, ל־$x_0$ קיימת $delta>0$ כך שלכל $x' in B_(delta) (x_0)$ מתקיים $d(f(x_0), f(x')) < 1/10$, אבל עבור $k$ גדול מספיק מתקיים $x_n_k_0, y_n_k_0 in B_delta (x_0)$ ואז מתקיים
  $
    1/5 < d(f(x_n_k_0), f(y_n_k_0))<=_"אי־שיוויון המשולש" d(f(x_n_k_0), f(x_0)) + d(f(x_0), f(y_n_k_0)) < 1/10 + 1/10 < 1/5
  $
  וזאת סתירה.
]

#question()
מבחן מועד א' סמסטר א' 2025 שאלה 4: תהיי $f:RR^k arrow.r RR^m$ גזירה. נניח שקיימים $epsilon, delta > 0$ ו־$x in RR^k$ כך שלכל $y in B_delta (x)$ מתקיים $norm(D f_y - D f_x)_"op" < epsilon$.\
אז לכל $v_1, dots.,h.c v_k in RR^k$ עם $norm(v_i)_2 < delta$ ו־$v_1 + dots.h.c + v_k = 0$, מתקיים
$ norm(f(x+v_1) + dots.h.c f(x+v_k) - k f(x))_2 <= epsilon(norm(v_1)_2 + dots.h.c + norm(v_k)_2) $

#proof[
  ראשית, מהנתון $norm(v_i)_< delta$ נובע ש־$x+v_i in B_delta (x)$ (star).
  שנית, מאי־שיוויון המשולש מתקיים
  $
    norm(f(x+v_1) + dots.h.c f(x+v_k) - k f(x))_2 = norm(sum_(i=1)^k f(x+v_i) - f(x))_2 = norm(sum_(i=1)^k (f(x+v_i) - f(x) + D f_x (v_i)) + sum_(i=1)^k D f_x (v_i))_2 \
    <= norm(sum_(i=1)^k (f(x+v_i) - f(x) + D f_x (v_i))) + norm(sum_(i=1)^k D f_x (v_i))_2 = norm(sum_(i=1)^k (f(x+v_i) - f(x) + D f_x (v_i))) + norm(D f_x (sum_(i=1)^k v_i))_2
  $
  $D f_x (v)$ לינארית ולכן $v_1 + dots.h.c v_k = 0 ==> norm(D f_x (sum_(i=1)^k v_i))_2 = 0$.\
  נגדיר $g(v) = f(x+v)-f(x)-D f_x (v)$, נשים לב שזו פונקציה על כל $RR^k$ והיא גזירה מאריתמטיקה של פונקציות גזירות , ($D f_x (v)$ זו הנגזרת כיוונית של $f$ בנקודה $x$ בכיוון $v$ ולכן בגלל ש־$f$ גזירה, זה גם גזיר) ולכן ניתן להשתמש במשפט ערך הממוצע: מתקיים $ norm(g(x)-g(y)) <= sup_(c in [a,b]) norm(D g_c)_"op" norm(x-y)_2 $ בפרט זה אומר שמתקיים
  $
    sum_(i=1)^k norm(f(x+v_i) - f(x) - D f_x (v))_2 = sum_(i=1)^k norm(g(v_i)-g(0))_2 <= sum_(i=1)^k sup_(c in [0,v_i]) norm(D g_c)_"op" norm(v_i)_2
  $
  אבל $D g_c = D f_c - D f_x$ ולכן
  $
    sum_(i=1)^k sup_(c in [0,v_i]) norm(D g_c)_"op" norm(v_i)_2 = sum_(i=1)^k sup_(c in [0,v_i]) norm(D f_c - D f_x)_"op" <= sup_(c in B_delta (x)) norm(D f_c - D f_x)_"op" dot.op sum_(i=1)^k norm(v_i)_2 =_"מהנתון" epsilon sum_(i=1)^k norm(v_i)
  $
]

#question()
מבחן מועד א' סמסטר ב' 2022 שאלה 6: נגדיר $H: Delta_d arrow.r RR$ הנתונה על־ידי
$ H(x_1, dots.h.c, x_d) = - sum_(i=1)^d x_i ln(x_i) $
כאשר $0 ln(0) = 0$ ונתונה
$ Delta_d colon.eq { (x_1, dots.h.c, x_d) in RR^d bar sum_(i=1)^d x_i = 1, x_i >=0} $
נעשה בפעם אחת – גם נמצא האם יש נקודות מינימום/מקסימום פנימיות ב־$Delta_d^circle.stroked.small$ וגם המינימום-מקסימום של $H$ בכל $Delta_d$.

#solution[
  ראשית נצדיק למה בכלל מתקבלים מינימום-מקסימום: זה בגלל ש־$Delta_d$ היא סגורה וחסומה ולכן קומפקטית ופונקציה רציפה ($H$ רציפה כסכום של פונקציות רציפות) מקבלת מינימום/מקסימום בקבוצה קומפקטית.\
  החסומה זה ברור כי $sum_(i=1)^d x_i = 1$ והערכים הם אי־שליליים ולכן $x_i in [0,1]$ לכל $1<=i<=d$.\
  נראה שהקבוצה סגורה: ניקח ${(x_n)_1, dots.h.c, (x_n)_d}$ סדרה ב־$Delta_d$ כך שמתקיים $sum_(i=1)^d x^i_n = 1 and x^i_n >=0$ ונניח שהיא מתכנסת ל־$(x_1, dots.h.c, x_d)$.
  מאריתמטיקה של גבולות נקבל
  $
    x_i = lim_(n arrow.r infinity) x_n^i >= 0 \
    sum_(i=1)^d x_i = sum_(i=1)^d lim_(n arrow.r infinity) x_n^i = lim_(n arrow.r infinity) sum_(i=1)^d x_n^i = lim_(n arrow.r infinity) 1 = 1
  $
  כשהשתמשנו ברציפות של הסכום ולכן $(x_1, dots.h.c, x_d) in Delta_d$ ולכן $Delta_d$ סגורה וחסומה ולפי משפט היינה־בורל היא קומפקטית (וקומפקטית סדרתית מהשקילות במרחבים מטריים).\
  $H$ סכום של פונקציות גזירות ולכן גזירה ומתקיים מכללי גזירת מכפלה
  $
    gradient(H) = mat((partial H)/(partial x_i), dots.h.c, (partial H)/(partial x_d)) = mat(-ln(x_1)-1, dots.h.c, -ln(x_d)-1)
  $
  ומתקיים
  $ gradient(H) = 0 <==> forall space 1<=i<=d, space -ln(x_i)-1 = 0 <==> ln(x_i) = -1 $
  וזה כמובן היה מיותר כי אין פיתרון ועלינו להשתמש שיטת כופלי לגראנז' כדי לאלץ שהפיתרון יהיה על $Delta_d$, כלומר נגדיר את האילוץ $ g(x_1, dots.h.c, x_d) = sum_(i=1)^d x_i-1, space gradient(g) = mat(1, dots.h.c, 1) $
  משיטת כופלי לגראנז' נקבל
  $
    gradient(g) = mat(1, dots.h.c, 1) ==> gradient(H) = -lambda gradient(1, dots.h.c, 1) <==> ln(x_i) + 1 = lambda <==> ln(x_i) = lambda-1 <==> x_i = e^(lambda-1)
  $
  אבל מתקיים
  $ sum_(i=1)^d x_i = 1 ==> d e^(lambda-1) =1 <==> e^(lambda -1) = 1/d ==> x_i = 1/d $
  ולכן יש לנו נקודה חשודה אחת לקיצון $mat(1/d, dots.h.c, 1/d)$ והיא מקיימת את כל התנאים של $Delta_d$, והיא כמובן נקודה פנימית אם בוחרים $epsilon <1/d$ וגם $x_i > 0$.\
  בשביל נקודות על השפה, זה רק המקרים בהם $x_i =0$ ולכן יש לנו $k in {0, dots.h.c, d-1}$ קורדינאטות שאינן מתאפסות.\
  אם $k=0$ אז ברור שנקבל מינימום כי יצא $H(0) = 0$ וזה מינימום (כי $0<=x_i <=1$ ולכן $ln(x_i)<=0$ כלומר $x_i ln(x_i) <=0$ ולכן $H(x_1, dots.h.c, x_d)>=0$).\
  אם יש $k$ קורדינאטות שלא מתאפסות, אפשר לחזור על כל התהליך ממקודם עם ולהחליף את $d$ עם $k$ (כי בכל מקר $0$־ים בסכום לא משנים את הסכום) וכנראה ששוב נקבל שכל הקורדינאטות צריכות להיות שוות זו לזו.\
  אז $-sum_(i=1)^k 1/k ln(1/k)$ ו־$ln(x)$ מונוטונית עולה ממש ולכן נקבל מקסימום עבור $x_i = 1/d$ לכל $1<=i<=d$.
]

#question()
מבחן מועד א' סמסטר ב' 2022 שאלה 7: יהי $(X,d)$ מרחב מטרי קומפקטי. תהיי $f:K arrow.r K$ פונקציה כך שלכל $x,y in K$ מתקיים $d(f(x), f(y))<d(x,y)$.

#subquestion()
נוכיח כי ל־$f$ יש לכל היותר נקודת שבת אחת ב־$K$.

#proof[
  נניח בשלילה שגם $x,y in K$ הן נקודות שבת, קרי $f(x)=x, f(y)=y$. אזי מתקיים
  $ d(x,y) = d(f(x), f(y)) < d(x,y) $
  מהנתון וזאת כמובן סתירה.
]

#subquestion()
נוכיח כי ל־$f$ יש נקודת שבת ב־$K$.

#proof[
  $K$ קומפקטית ובמרחבים מטריים קומפקטית סדרתית וקומפקטית הם שקולים ולכן קומפקטית סדרתית, על־כן לכל סדרה יש תת־סדרה מתכנסת והמרחב חסום וסגור.\
  נעזר ברמז ונגדיר $h(x) = d(x, f(x))$, זו פונקציה רציפה מאריתמטיקה של פונקציות רציפות (פונקציית המרחק רציפה) ופונקציה רציפה על מרחב קומפקטי מקבלת מינימום, נסמנו ב־$m$ ולכן יש $x_0 in K$ כך שמתקיים $h(x_0)=m$.\
  נניח בשלילה ש־$m!=0$, ולכן מתקיים
  $ h(f(x_0)) = (f(x_0), f(f(x_0))) <_"העתקה מכווצת" d(x_0, f(x_0)) = h(x_0) = m $
  אבל זאת סתירה להנחה ש־$m$ הוא המינימום של $h$! ולכן בהכרח מתקיים $h(x_0) = d(x_0, f(x_0)) = 0$ וזה קורה אם ורק אם $f(x_0) = x_0$, קרי זאת נקודת שבת.
]

#question()
מבחן מועד א' סמסטר ב' 2022 שאלה 9: תהיי $ A = {(x,y) in RR^2 bar x^2+y^2<=1, y>=0} $ ותהיי $f:RR^2 arrow.r RR^2$ הנתונה על־ידי $ f(x,y) = (x-y,y^2) $
נוכיח שלקבוצה $f(A)$ יש שטח ("נפח ב־$RR^2$") ונמצא את $op("Area")(f(A))$.

#solution[
  קצת אלתור עם כלים של אנליזה2.\
  ראשית נשים לב ש־$A$ היא קבוצה קומפקטית כי זה החצי העליון של מעגל היחידה.\
  נרצה להשתמש במשפט החלפת משתנה כדי לבטא מחדש את $f$, נגדיר $u = x-y, v= y^2$ ולכן
  $
    J = mat((partial u)/(partial x), (partial u)/(partial y); (partial v)/(partial x), (partial v)/(partial y)) = mat(1, -1; 0, 2y) ==> det(J) = 2y
  $
  אז אנחנו רוצים לחשב את
  $
    op("Area")(f(A)) = 2 integral_A y d A =_("מעבר לקוטביות") 2 integral_0^pi integral_0^1 r^2 sin(theta) d r d theta = integral_0^(pi) sin(theta)/3 d theta = 2/3
  $
]

#question()
מבחן מועד א' סמסטר ב' 2022 שאלה 10: תהיי $f:RR^2 arrow.r RR$ המוגדרת על־ידי
$ f(x,y) = mycases((y^3x^2)/(x^8+y^4), (x","y) != (0","0), 0, (x"," y) = (0,0)) $

#subquestion()
נוכיח שכל הנגזרות הכיווניות של $f$ קיימות ב־$(0,0)$ (רשום במבחן $y$ במקום $f$ אבל זאת טעות).

#proof[
  יהי $accent(v, arrow) = (a,b) in RR^2$ ונראה שהנגזרת הכיוונית של $f$ בכיוון $v$ קיימת בראשית, כלומר קיים הגבול
  $ lim_(t arrow.r 0) (f(0+t v) -f(0,0))/(t) = lim_(t arrow.r 0) f(t a, t b)/t $
  נשים לב שהמקרה של $a=0 or b=0$ סימטריים ולכן בלי הגבלת הכלליות $b=0$ ומתקיים
  $ lim_(t arrow.r 0) 0/(t^8 a^8)/t = 0 = lim_(t arrow.r 0) /(t^9 a^8) = 0 $
  כעת נניח ש־$a!=0 and b!=0$ ולכן מתקיים
  $
    lim_(t arrow.r 0) (t^5b^3a^2)/(a^8t^8+b^4t^4)/t = (cancel(t^5)b^3a^2)/(cancel(t^5)(t^4a^8+b^4)) = lim_(t arrow.r 0) (b^3a^2)/(t^4a^8 + b^4) = (b^3a^2)/b^4 = a^2/b
  $
  מצאנו שבכל מקרה הגבול קיים ולכן לכל כיוון הנגזרת הכיוונית של $f$ קיימת בראשית.
]

#subquestion()
נקבע האם $f$ דיפרנציאבילית ב־$(0,0)$.

#proof[
  נזכר שפונקציה דיפרנציאבילית בנקודה היא רציפה בנקודה ו־$f$ בכלל לא רציפה בראשית, אפשר לראות את זה עם עיקרון היינה לרציפות: נבחר $x_n = 1/n, y_n = 1/n^2$ ומתקיים
  $ lim_(n arrow.r infinity) ((y_n)^3(x_n)^2)/((x_n)^8+(y_n)^4) = (1/n^6 1/n^2)/(1/n^8+1/n^8) = 1/n^8/2/n^8 = 1/2 != 0 $
  שזה הערך של הפונקציה בראשית ולכן בוודאי שלא רציפה, ובטח שלא דיפרנציאבילית.
]

#question()
שאלה של דניאל: לנסח את הנוסחה של פיתוח פולינום טיילור מסדר 2 ולחשב את הפולינום טיילור מסדר 2 סביב הראשית של $f(x,y)=e^(x^2+x y)$.

#proof[
  הנוסחה נתונה על־ידי
  $ P_(f, 2, (a,b)) (x,y) = f(a,b) + D f_((a,b)) vec(x-a, y-b) + 1/2 mat(x-a, y-b) D^2 f_((a,b)) vec(x-a, y-b) $
  $f$ כמובן גזירה אינסוף פעמים כחלקה, אבל בשביל המקרה שלנו נשים לב שמתקיים
  $
    (partial f)/(partial x) = e^(x^2+x y)(2x+y), space (partial f)/(partial y) = x e^(x^2+ x y) ==> D f_((x,y)) = mat(e^(x^2+x y)(2x+y), x e^(x^2+ x y))
  $
  הנגזרת החלקיות רציפות בראשית ולכן לפי תנאי מספיק לדיפרנצאביליות הפונקציה $f$ גזירה בראשית.\
  נחשב נגזרות שניות ונגזרות מעורבות (אלו כמובן גם פונקציות גזירות) ונשים לב שהנגזרות המעורבות תהיינה שוות
  $
    (partial^2 f)/(partial^2x) = (2x+y+2)^2e^(x^2+ x y), space (partial^2 f)/(partial^2 y) = x^2e^(x^2+x y), space (partial^2 f)/(partial x partial y) = x e^(x^2+ x y)(2x+y)+e^(x^2+ x y) = (partial^2 f)/(partial y partial x) \
    ==> D^2f_((x,y)) = mat((2x+y+2)^2e^(x^2+ x y), x e^(x^2+ x y)(2x+y)+e^(x^2+ x y); x e^(x^2+ x y)(2x+y)+e^(x^2+ x y), x^2e^(x^2+x y))
  $
  כאשר $partial x partial y$ זה אומר קודם כל לפי $x$ ואז לפי $y$.\
  נציב את הנקודה שלנו
  $ D f_((0,0)) = mat(0, 0), D^2f_((0,0)) = mat(2, 1; 1, 0) $
  אז פולינום טיילור יהיה
  $
    P_(f, 2, (0,0)) (x,y) = 1 +mat(x, y) mat(1, 1/2; 1/2, 0) vec(x, y) = 1 + mat(x + y/2, x/2) vec(x, y) = 1 + ((2x+y)x)/2 + (y x)/2
  $
]

#question()
מבחן מועד ב' סמסטר ב' 2022 שאלה 6: נמצא את המינימום של $f(x,y,z) = x^2+8y^2+27z^2$ תחת האילוץ $ A colon.eq {(x,y,z) in RR^3 bar 1/x+1/y+1/z = 1, x,y,z>0} $

#solution[
  ראשית $f$ רציפה וגזירה מאריתמטיקה של פונקציות גזירות ובפרט מתקיים
  $ gradient f(x,y,z) = mat(2x, 16y, 54z) ==> gradient f(x,y,z) = 0 <==> x=y=z=0 $
  ונשים לב ש־$(0,0,0) in.not A$, אז גם אם מתקבל קיצון מינימלי ל־$f$ הוא חייב להיות על השפה של $A$.\
  נשים לב שהתחום $A$ הוא תחום שאינו חסום (אולי סגור) ולכן אי אפשר להפעיל את משפט כופלי לגראנז' עליו ישירות.\
  אין לי כח להשתמש בלגראנז'יאן כי זה ארוך, אבל נשים לב שמכך ש־$1/x+1/y+1/z = 1$ נובע ש־$0<1/x,1/y,1/z < 1$ ולכן $x,y,z>1$ ובפרט $f(x,y,z) > 1^2+8 dot.op 1^2+27 dot.op 1^2 = 36$ ולכן בהכרח $f$ חסומה מלרע תחת האילוץ על $A$ והפונקציה היא אי־שלילית לכן היא רק עולה, אז נוכל ליצור קבוצה שעליה נבחן את ההתניות שלנו.\
  בנוסף, אם ניקח $x=100$ אז $f(x,y,z) > x^2=100^2$ ומצד שני $f(3,3,3) = 3^2+8 dot.op 3^2 + 27 dot.op 3^2 = 324 < 100^2$ אז גם אם יש מינימום הוא כבר לא יתקבל, אז נגדיר
  $ A' = {(x,y,z) in RR^3 bar x,y,z <= 100} $ שהיא סגורה וחסומה ולכן אם מתקבל עליה מינימום (כי $f$ רציפה ואפשר משיטת כופלי לגראנז') אז אותו מינימום יהיה אם מתאים לתנאי $A$ גם המינימום של $A$.\
  אז נגדיר $g : (0, infinity) arrow.r RR$ על־ידי $g(x,y,z) = 1/x+1/y+1/z-1$ זו פונקציה רציפה וגזירה ומתקיים $gradient g(x,y,z) = (-1/x^2, -1/y^2,-1/z^2)$ ונשתמש בשיטת כופלי לגראנז' (כבר פסלנו את הראשית כמובן ולכן החלוקה מוגדרת היטב)
  $
    gradient f(x,y,z) = lambda gradient g(x,y,z) ==> cases(2x=-lambda/x^2, 16y=-lambda/y^2, 54z = -lambda/z^2) ==> 2x^3= 16y^3 = 54z^3 <==> x^3 = 8y^3 = 27z^3 <==> x=2y = 3z
  $
  כאשר הפעולה של לקחת שורש הוגדרה היטב כי $x,y,z>0$ ובפרט לקחנו את השורשים החיוביים של המקדמים.\
  עלינו לוודא שמתקיים האילוץ $g=0$ ולכן ממה שמצאנו נובע ש־$z=x/3, y=x/2$ ולכן בהצבה ב־$g$ נקבל
  $ 1/x+1/(x/2)+1/(x/3)-1 = 0 <==> 1/x + 2/x + 3/x = 1 <==> 6 = x $
  ולכן $x=6, z=2, y=3$ ואכן $1/6+1/3+1/2 = 1/6+2/6+3/6 = 6/6 = 1$.\
  מצאנו רק נקודה אחת חשודה ואפשר לראות די בקלות שהיא מינימום ולכן $(6,2,3)$ מינימום מקומי ו־$f(6,2,3)=216$
]

#question()
מבחן מועד ב' סמסטר ב' 2022 שאלה 7: נראה שקיימת פונקציה יחידה $f in C([0,1])$ כך שמתקיים
$ f(x) = x+(x f(sqrt(x))+(1-x)f(x^2))/2 $
לכל $x in [0,1]$.

#proof[
  צועק משפט העתקה מכווצת.\
  נזכר שמעל $C([0,1])$ אנחנו עובדים עם $norm(f)_infinity = sup_(x in [0,1]) abs(f(x))$.\
  נגדיר $T : C([0,1]) arrow.r C([0,1])$ על־ידי $ T(f)(x) = x+(x f(sqrt(x))+(1-x)f(x^2))/2 $
  נשים לב שמתקיים עבור $g, f in C([0,1])$ ולכל $x in [0,1]$
  $
    norm(T(f)(x)-T(g)(x))_infinity &= norm(x+(x f(sqrt(x))+(1-x)f(x^2))/2 - x-(x g(sqrt(x))+(1-x)g(x^2))/2)_infinity \
    &= 1/2 norm(x f(sqrt(x))+(1-x)f(x^2)- x g(sqrt(x))-(1-x)g(x^2))_infinity \
    &<=_("אי־שיוויון"\ "המשולש") 1/2(norm(x f(sqrt(x))-x g(sqrt(x)))_infinity+norm((1-x)f(x^2)-(1-x)g(x^2))_infinity) \
    &<=_(x in [0,1]) 1/2(x norm(f(sqrt(x))-g(sqrt(x)))_infinity + (1-x) norm(f(x^2)-g(x^2))_infinity) \
    &<= 1/2 ( x norm(f-g)_infinity + (1-x) norm(f-g)_infinity) = 1/2 norm(f-g)_infinity
  $
  אז $T$ היא העתקה מכווצת ולכן יש לה נקודת שבת אחת, קרי יש פונקציה אחת המקיימת את הנדרש.\
  *הנתון על הרציפות הוא הכרחי*: כי $1/2 dot.op infinity = infinity$.
]

#question()
מבחן מועד ב' סמסטר ב' 2022 שאלה 8.

#subquestion()
נחשב את נפח הקבוצה $A colon.eq {(x,y,z) in RR^3 bar x^2+y^2+z^2<=4, x^2+y^2<=1}$ ונסביר למה הנפח קיים.

#solution[
  פתרתי על דף. \
  הנפח קיים כי $A$ היא חיתוך של גרפים ועל־כן היא ממידה אפס והיא גם קומפקטית (קל לראות את הסגורה וחסומה) ובתרגול ראינו שקבוצות קומפקטיות ממידה אפס הן מתכולה אפס ועל־כן בעלות נפח (קבוצה מתכולה אפס היא בהכרח חסומה וממידה אפס).
  אפשר לעבור גם לגלילות וגם לכדוריות אז האחד של כדוריות מסובך יותר, האינטגרלים הם בכל אופן
  $
    integral_0^(2pi) integral_0^1 integral_(-sqrt(4-r^2))^(sqrt(4-r^2)) r d z d r d theta \
    integral_0^(2pi) integral_0^(pi) integral_0^(min(2, 1/(sin(phi)))) r^2 sin(phi)d r d phi d theta
  $
]

#subquestion()
נחשב את האינטגרל
$ integral_0^1 (integral_y^1 e^(-x^2)) d x d y $

#proof[
  ראשית $e^(-x^2)$ פונקציה רציפה ולכן אינטגרבילית, אבל זאת לא פונקציה אלמנטרית אז אנחנו לא יודעים לאנטגרל אותה ולכן עלינו להשתמש במשפט פוביני.\
  נצטרך לעשות שינוי של התחום, נשים לב שכרגע $0<=y<=1, y<=x<=1$ וזה עושים קודם לפני $x$ ואז לפי $y$ ואנחנו רוצים קודם לפי $y$ ואז לפני $x$.\
  קיבענו את $0<=x<=1$ ולכן $0<=y<=x$ (אפשר לראות את זה גם על תזוזה על המשולש התחתון שחוצה את ריבוע היחידה) ולכן
  $
    integral_0^1 (integral_y^1 e^(-x^2)) d x d y & = integral_0^1 integral_0^x e^(-x^2) d y d x         \
                                                 & = integral_0^1 [y e^(-x^2)]_(y=0)^(y=x) d x          \
                                                 & = integral_0^1 x e^(-x^2) d x                        \
                                                 & =_(u = -x^2 \ d u = -2x d x) integral_0^1 -e^u/2 d u \
                                                 & = [-1/2e^u]_(u=0)^(u=1)                              \
                                                 & = [-1/2e^(-x^2)]_(x=0)^(x=1)                         \
                                                 & = (1-e^(-2))/2
  $
]

#question()
מבחן מועד ב' סמסטר ב' 2022 שאלה 9: תהיי $A = {(x,y) in RR^2 bar y>0}$ ו־$h : A arrow.r RR^2$ הפונקציה הנתונה על־ידי
$ h(x,y) = (y^2cos(x), y sin(x)) $

#subquestion()
נוכיח שלכל נקודה $p in A$ יש סביבה פתוחה $p in U$ כך ש־$h|_U : U arrow.r h(U)$ הפיכה.

#proof[
  צועק משפט הפונקציה ההפוכה.\
  נסמן לנוחות $h_1 (x,y) = y^2 cos(x), h_2 (x,y) = y sin(x)$ ואז
  $
    D h_((x,y)) = mat((partial h_1)/(partial x), (partial h_1)/(partial y); (partial h_2)/(partial x), (partial h_2)/(partial y)) = mat(-y^2sin(x), 2y cos(x); y cos(x), sin(x))
  $
  ומתקיים
  $
    J(D h_((x,y))) = det mat(-y^2sin(x), 2y cos(x); y cos(x), sin(x)) = -y^2sin^2(x)-2y^2cos^2(x) = -y^2 (sin^2(x)+2cos^2(x))
  $
  נטען ש־$J(D h_((x,y))) != 0$: זה נובע מכך ש־$y>0$ וכן $sin^2(x) + 2cos^2(x) > 0$ כסכום של שתי פונקציות אי־שליליות (זה בהכרח גדול מ־$0$ בגלל המחזוריות של פונקציות סינוס וקוסינוס).\
  כמובן ש־$h$ גזירה ברציפות כי נגזרתה מורכבות מפונקציות רציפות ועל־כן כל התנאים של משפט הפונקציה ההפוכה מתקיימים ולכן הנדרש קיים.
]

#subquestion()
נמצא את $S = {(x,y) in RR^2 bar h(x,y)=(1,0)}$.

#proof[
  אנחנו מחפשים מתי $ cases(y^2 cos(x) = 1, y sin(x) = 0) $
  $y$ גדול מאפס ולכן $y sin(x) = 0 <==> x in pi k$ עבור $k in ZZ$ ולכן $y^2 cos(pi k) = 1$ אבל $cos(pi k) = (-1)^k$ ולכן $y^2(-1)^k = 1$, אבל $y>0$ ולכן $k$ חייב להיות זוגי ולכן $y^2=1$ ועל־כן $y=1$.\
  אז כלל הפתרונות הם מהצורה $x = 2pi k, y = 1$.
]

#subquestion()
עבור כל $p in S$ נסמן ב־$g$ את הצמצום של $h$ לסביבה $p in U$ בה $h|_U$ הפיכה ונסמן $q=g^(-1)$.
נמצא את $(D q)_((1,0))$.

#proof[
  נזכר שמהגדרה מתקיים
  $ (D q)_((1,0)) = (D h)_((1,0))^(-1) $
  נשים לב שמתקיים
  $ D h_((0,1)) = mat(0, 2; 1, 0) ==> det(D h_((0,1))) = -2 $
  והמטריצה ההפיכה הנדרשת מתקבלת לפי
  $ 1/(a d - b c) mat(d, -b; -c, a) ==> -1/2 mat(0, -2; -1, 0) = mat(0, 1; 1/2, 0) $
]

#question()
מבחן מועד ב' סמסטר ב' 2022 שאלה 10.


#subquestion()
נוכיח כי האינטגרל הלא נאות הבא קיים ונחשב את ערכו
$ integral_(RR^2) 1/(1+4x^2+9y^2)^3 d x d y $

#solution[
  ראשית $f(x,y) = 1/(1+4x^2+9y^2)^3$ היא פונקציה רציפה ואי־שלילית.\
  נשים לב ש־$C_N = [N, N+1]$ היא סדרת מיצוי
]
