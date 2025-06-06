#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 08 --- חשבון אינפיניטסימלי 3, 80415 ],
  signature: [#align(center)[#image("../../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#let hom = math.op("Hom")
#let im = math.op("Im")

#question()
תהיי $g : B_r (0) subset.eq RR^k arrow.r RR^k$ פונקציה $c$־ליפשיצית עבור $c in (0,1)$ ונניח בנוסף כי $g(0)=0$.\
נגדיר $f : B_r (0) arrow.r RR^k$ על־ידי $f(x) = x+g(x)$.

#subquestion()
נראה כי $f$ היא חד־חד ערכית.
#proof[
  יהיו $x, y in B_r (0)$ ונשים לב שמתקיים
  $
    f(x)=f(y) <==> x + g(x) = y + g(y) <==> x-y = g(y) - g(x) <==> norm(x-y) = norm(g(y)-g(x)) <=_("ליפשיציות") c norm(y-x)
  $
  אבל זאת כמובן סתירה, שכן $c in (0,1)$, ולכן $f(x)=f(y)$ אם ורק אם $x=y$ וקיבלנו כי $f$ היא חד־חד ערכית.
]

#subquestion()
נוכיח כי מתקיים
$ B_((1-c)r) (0) subset.eq f(B_r (0)) subset.eq B_((1+c)r) (0) $
#proof[
  יהי $x in B_r (0)$ ולכן
  $ norm(x) = norm(x+g(x)) <= norm(x) + norm(g(x))<=_((star)) norm(x) + c norm(x) = (1+c)norm(x) < (1+c)r $
  כאשר המעבר $(star)$ נובע מהנתון כי $g(0)=0$ וש־$g$ היא $c$־ליפשיצית, כי אז לכל $x,y in B_r (0)$ מתקיים
  $ norm(g(x)-g(y))<= c norm(x-y) $
  וזה נכון בפרט עבור $y=0$ ומהנתון ש־$g(0)=0$ נקבל
  $ norm(g(x)-g(0))<= c norm(x-0) = c norm(x) $
  וקיבלנו ש־$f(x) in B_(1(+c)r) (0)$ ולכן קיבלנו את ההכלה $f(B_r (0)) subset.eq B_((1+c)r) (0)$.\
  בשביל הכיוון השני, נרצה להראות שלכל $y in B_((1-c)r) (0)$ מתקיים $y in f(B_r (0))$, משמע שקיים $x in B_r (0)$ כך שיתקיים
  $ f(x)=x+g(x)=y => x = y-g(x) $
  בשביל זה, נגדיר $h(x) = y-g(x)$ ונרצה להראות ש־$x = h(x)$.\
  נשים לב שמתקיים
  $ norm(h(x)-h(y)) = norm(g(x)-g(y))<=_((star)) c norm(x-y) $
  כאשר $(star)$ זה שוב מהליפשיציות, והיות ו־$c in (0,1)$ נובע כי $h$ העתקה מכווצת! \
  ניקח $y in B_((1-c)r) (0)$ ונראה שלמשוואה $x = h(x)$ יש פיתרון ב־$B_r (0)$, דהיינו $x$ נקודת שבת (שאנחנו יודעים שיש ממשפט העתקה מכווצת), אז עבור $x in B_r (0)$ מתקיים
  $ norm(h(x))=norm(y-g(x))<=norm(y)+norm(g(x))<(1-c)r + c norm(x) < (1-c)r + c r = r $
  אז $h(B_r (0)) subset.eq B_r (0)$, ו־$h$ העתקה מכווצת ולכן קיים $x in B_r (0)$ כך שמתקיים
  $ x = h(x) = y-g(x) => f(x)=y $
  ולכן $y in B_r (0)$ וזה מביא לנו את ההכלה $B_((1-c)r) (0) subset.eq f(B_r (0))$.
]

#question()
#subquestion()
תהיי $A subset.eq RR^k$ פתוחה ו־$f : A arrow.r RR^k$ פונקציה חד־חד ערכית וגזירה ברציפות כך ש־$D f_a$ הפיכה לכל $a in A$. \
נוכיח כי התמונה $B = f(A)$ היא פתוחה וכי $f^(-1) : B arrow.r A$ היא גזירה ברציפות.
#proof[
  היות ו־$f$ גזירה ברציפות ו־$D f_a$ הפיכה לכל $a in A$, ממשפט הפונקציה ההפוכה נובע כי לכל $a in A$ קיימת סביבה $U_a$ של $a$ כך ש־$f$ היא דיפאומורפיזם (חד־חד ערכית ועל ו־$f, f^(-1) in C^1$) מ־$U_a$ אל $f(U_a)$ וממשפט הפונקציה ההפוכה אנחנו מקבלים גם ש־$f(U_a)$ היא פתוחה.\
  היות ו־$A$ פתוחה, נובע שלכל $a in A$ נוכל למצוא סביבה $U_a$ כך ש־$f(U_a)$ היא פתוחה, ובפרט כך נוכל לכסות את $A$.\
  אז $ B = f(A) = union.big_(a in A) f(U_a) $
  היא איחוד של קבוצות פתוחות וראינו כבר שאיחוד של קבוצות פתוחות הוא פתוח, ולכן $B$ קבוצה פתוחה.\
  ממשפט הפונקציה ההפוכה אנחנו מקבלים ש־$f^(-1) in C^1$ לכל $b = f(a)$ עבור $a in A$ וכפי שראינו האיחוד של זה מכסה את התמונה, את $B$ ולכן לכל $b in B$ קיימת סביבה סביב $b$ כך ש־$f^(-1) in C^1$, אבל זה בידיוק אומר שגם האיחוד בכיוון הזה מוביל לכך ש־$f^(-1) in C^1$ ב־$B$.
]

#subquestion()
עבור הסעיפים הבאים נתבונן בפונקציה $f : RR^2 arrow.r RR^2$ הנתונה על־ידי
$ f(x,y) = vec(e^x cos(y), e^x sin(y)) $

#sub_subquestion()
נוכיח כי $f$ אינה חד־חד ערכית אבל $D f_((x,y))$ הפיכה לכל $(x,y) in RR^2$.
#proof[
  $f$ לא חד־חד ערכית שכן מהמחזוריות של $cos, sin$ נקבל
  $ f(0, pi) = vec(e^0 cos(pi), e^0 sin(pi)) = vec(-1, 0) = vec(e^0 cos(3pi), e^0 sin(3pi)) = f(0, 3pi) $
  אז $f$ לא חד־חד ערכית.\
  נעבור להראות ש־$D f_((x,y))$ כן הפיכה:
  נסמן
  $ f_1 (x,y) = e^x cos(y), space f_2 (x,y) = e^x sin(y) $
  $f$ היא גזירה ברציפות מאריתמטיקה של פונקציות גזירות (פונקציות טריגונומטריות ואקספוננט הם גזירים ברציפות) ועל־כן היא דיפרנציאבילית ומתקיים
  $
    D f_((x,y)) = mat((partial f_1) / (partial x), (partial f_1) / (partial y); (partial f_2) / (partial x), (partial f_2) / (partial y);) = mat(e^x cos(y), -e^x sin(y); e^x sin(y), e^x cos(y))
  $
  נחשב את היעקוביאן של $D f_((x,y))$:
  $
    J f_((x,y)) = det mat(delim: "[", e^x cos(y), -e^x sin(y); e^x sin(y), e^x cos(y)) = e^(2x) cos^2(y) + e^(2x)sin^2(y) = e^(2x)(cos^2(y)+sin^2(y))=_(cos^2(y)+sin^2(y)=1) e^(2x)
  $
  נשים לב כי $J f_((x,y))!=0$ לכל $(x,y) in RR^2$ ולכן $D f_((x,y))$ הפיכה לכל $(x,y) in RR^2$.
]

#sub_subquestion()
תהיי $A = RR times (-pi / 2, pi / 2)$ ונוכיח כי $f|_A$ היא חד־חד ערכית ונמצא את $B = f(A)$.
#proof[
  יהיו $a_1 = (x_1, y_1), a_2=(x_2,y_2) in A$ ונניח שמתקיים $f(a_1) = f(a_2)$, משמע מתקיים
  $
    f(a_1) = f(a_2) <==> f(x_1, y_1) = f(x_2, y_2) <==> vec(e^(x_1) cos(y_1), e^(x_1)sin(y_1)) = vec(e^(x_2) cos(y_2), e^(x_2)sin(y_2))
  $
  וקיבלנו מערכת משוואות
  $ cases((1) space e^(x_1) cos(y_1) = e^(x_2) cos(y_2), (2) space e^(x_1)sin(y_1)=e^(x_2)sin(y_2)) $
  נעלה כל משוואה בריבוע ונחבר ביניהן
  $
    e^(2x_1)cos^2(y_1)+e^(2x_1)sin^2(y_1)=e^(2x_2)cos^2(y_2)+e^(2x_2)sin^2(y_2) <==> e^(2x_1)(cos^2(y_1)+sin^2(y_1))=e^(2x_2)(cos^2(y_2)+sin^2(y_2))
    \ <==>_(cos^2(x)+sin^2(x)=1) e^(2x_1) = e^(2x_2) <==>_("אקספוננט מונוטוני עולה ממש") x_1 = x_2
  $
  ועכשיו נקבל במערכת המשוואות שלנו
  $
    cases((1) space e^(x_1) cos(y_1) = e^(x_1) cos(y_2), (2) space e^(x_1)sin(y_1)=e^(x_1)sin(y_2)) <==> cases((1) space cos(y_1) = cos(y_2), (2) space sin(y_1)=sin(y_2))
  $
  אבל $sin(x), cos(x)$ הן חד־חד ערכיות בגלל המחזוריות שלהן ב־$(-pi / 2, pi / 2)$ (כי המחזור של $sin(x)$ הוא הקטע $(0, 2pi)$ ששם $sin$ חד־חד ערכית ועבור $cos(x)$ זה הקטע $(pi / 2, (5pi) / 2)$ ששם $cos$ היא חד־חד ערכית, אז אם נזיז את הקטעים לקטע $(-pi / 2, pi / 2)$ אנחנו שומרים על הקטעים החד־חד ערכיים).\
  ולכן נקבל שאם $f(a_1) = f(a_2)$ אז $a_1 = a_2$ בהכרח, דהיינו $f$ חד־חד ערכית ב־$A$.\
  עבור התמונה $f(A)$, נכתוב
  $ f(x,y) = e^x vec(cos(y), sin(y)) $
  עבור $x in RR, y in (-pi / 2, pi / 2)$, אבל זה בידיוק התצוגה במישור (אם נסתכל על זה כקורדינאטות קוטביות, יש לנו $theta in (-pi / 2, pi / 2)$ זווית ו־$r = e^x in (0, infinity)$, ללא הראשית בכלל ובעצם הזווית מכווינה לחצי המישור הימני), ובמילים אחרות$ f(A) = {(u, v) in RR^2 bar u > 0} $
]

#sub_subquestion()
נתאר במפורש את הפונקציה ההופכית $g = (f|_A)^(-1) : B arrow.r A$.
#proof[
  נסמן
  $
    (u,v) = f(x,y) = e^x vec(cos(y), sin(y)) <==>_(cos^2(x)+sin^2(x) = 1 "נורמה והזהות") sqrt(u^2+v^2) = e^x <==> x = ln(sqrt(u^2+v^2)) = 1 / 2 ln(u^2+v^2)
  $
  עבור הקורדינאטה השנייה, נשים לב
  $ tan(y) = sin(y) / cos(y) = v / u => y = arctan(v / u) $
  שמוגדר היטב עבור $y in (-pi / 2, pi / 2)$.\
  אז $g : B = {(u,v) in RR^2 bar u > 0} arrow.r RR times (-pi / 2, pi / 2)$ נתונה על־ידי
  $ g(u,v) = vec(1 / 2 ln(u^2+v^2), arctan(v, u)) $
]

#question()
נמצא את הנקודה הקרובה ביותר והנקודה הרחוקה ביותר מהראשית ב־$RR^3$ על החיתוך של שתי הספירות
$ (x-1)^2+y^2+z^2=1, x^2+y^2+(z-1)^2=1 $

#proof[
  נגדיר את הפונקציה שלנו $f : RR^3 arrow.r RR$ על־ידי $f(x,y,z) = x^2+y^2+z^2$, השורש לא משנה לנו בפונקציית המרחק כי שורש משמר יחסי מינימום־מקסימום.\
  נגדיר את פונקציות האילוצים
  $ g_1 (x,y,z)=(x-1)^2+y^2+z^2-1, g_2 (x,y,z) = x^2+y^2+(z-1)^2-1 $
  ונסתכל על
  $ gradient f = lambda gradient g_1 + mu gradient g_2 $
  נחשב אותם
  $
    gradient f = 2(x, y, z) \
    gradient g_1 = 2(x-1, y,z) \
    gradient g_2 = 2(x,y, z-1)
  $
  אפשר כבר לבטל את הפקטור של $2$ ונקבל
  $ gradient f = lambda gradient g_1 + mu gradient g_2 <==> (x,y,z) = lambda(x-1, y, z) + mu(x, y, z-1) $
  קיבלנו אם ככה כמה משוואות
  $
    cases(
      (1) space x = lambda(x-1)+mu x = lambda x - lambda + mu x,
      (2) space y = lambda y + mu y,
      (3) space z = lambda z + mu(z-1) = lambda z + mu z - mu
    )
  $
  ממשוואה $(2)$ נקבל $y=0$ או $lambda + mu =1$. נניח תחילה ש־$y=0$ ונציב באילוצים שלנו, נקבל
  $ g_1 (x,0,z) = (x-1)^2+z^2-1=x^2-2x+z^2 = 0, space g_2 (x,0,z)=x^2+(z-1)^2-1 = x^2+z^2-2z $
  נחסר ביניהם, ונקבל
  $ (x^2-2x+z^2)-(x^2-2z+z^2) = 2x+2z = 0 => x=z $
  נציב באחד האילוצים ונקבל
  $ g_1 (x=z,0,z) = (z-1)^2+z^2-1 = 2z^2-2z => 2z(z-1) = 0 <==> z = 0 or z = 1 $
  בסך־הכל מהמקרה הזה הנקודות החשודות שלנו הם $P_1=(0,0,0), P_2=(1,0,1)$.\
  נבחן את המקרה השני, נניח ש־$lambda+mu = 1$ נקבל
  אז אם נציב ב־$x = lambda(x-1)+mu x$ את $lambda = 1-mu$ נקבל
  $
    x = lambda(x-1) + mu x <==>_(lambda = 1 - mu) x = (1-mu)(x-1) + mu x <==> x=x-1-mu x + mu + mu x <==> x = x-1+mu <==> mu = 1
  $
  ובהצבה עבור $(3)$ נקבל
  $ z = lambda z + mu(z-1) <==> z = 0 dot.op z + 1(z-1) <==> z = z-1 <==> 0 = -1 $
  וזאת סתירה!\
  אז הנקודות היחידות שלנו הן $P_1, P_2$ ולכן $P_1=(0,0,0)$ הנקודה הקרובה ביותר לראשית ו־$P_2=(1,0,1)$ הנקודה הרחוקה ביותר מהראשית תחת האילוצים (כמובן שהן נמצאות על שתי הספירות!).
]

#question()
נוכיח את אי־שיוויון קושי־שוורץ באמצעות כופלי לגראנז', כלומר נראה שלכל $u,v in RR^k$ מתקיים
$ abs(angle.l u","v angle.r)<=norm(u) norm(v) $

#proof[
  נגדיר $U = sum_(i=1)^k x_i^2, V = sum_(i=1)^k y_i^2$, נרצה למצוא מינימום/מקסימום של $f(x_1, ..., x_k, y_1, ..., y_k) = sum_(i=1)^k x_i y_i$.\
  נסמן את האילוצים שלנו, $g = U, h = V$, ולפי משפט כופלי לגראנז'
  $ gradient f = lambda gradient g + mu gradient h $
  נחשב
  $
    gradient f = (y_1, ..., y_k, x_1, ..., x_k) \
    gradient g = 2(x_1, ..., x_k, underbrace(0"," ..."," 0, "פעמים" k)) \
    gradient h = 2(underbrace(0"," ..."," 0, "פעמים" k), y_1, ..., y_k)
  $
  אז יש לנו
  $
    gradient f = lambda gradient g + mu gradient h => (y_1, ..., y_k, x_1, ..., x_k) = 2lambda(y_1, ..., y_k) + 2 mu(0, ..., 0, y_1, ..., y_k)
  $
  וישר נקבל שמתקיים
  $ y_i = 2 lambda x_i, space x_i = 2 mu y_i $
  זאת־אומרת
  $ sum_(i=1)^k y_i^2 = sum_(i=1)^k 4lambda^2x_i^2 => 4 lambda^2 U = V $
  ולכן
  $ lambda = plus.minus 1 / 2 sqrt(V / U) $
  ונקבל
  $ y_i = 2 lambda x_i => plus.minus sqrt(V / U) x_i $
  ועכשיו נקבל
  $
    sum_(i=1)^k (x_i y_i) <= sum_(i=1)^k (x_i dot.op sqrt(V / U) x_i)= sqrt(V / U) dot.op U = sqrt(V / U dot.op U^2) = sqrt(U V) = (sum_(i=1)^k x_i^2)^(1 / 2) dot.op (sum_(i=1)^k y_i^2)^(1 / 2)
  $
  וזה בידיוק אי־שיוויון קושי־שוורץ.
]

#question()
תהיי $A subset.eq RR^3$ קבוצת אוסף הפתרונות של מערכת המשוואות
$ cases(F_1 (x,y,z)=sin(x y) + x^2z-y^3=1, F_2 (x,y,z) space e^(y z) + x y^2 + z^3=2) $

#subquestion()
נראה כי קיימת סביבה פתוחה $U subset.eq RR^3$ של $(1,0,1) in A$ שבה לכל $(x,y,z) in U inter A$ ניתן לבטא כל שני משתנים כפונקציה של המשתנה השלישי.

#proof[
  ראשית, אכן $(1,0,1) in A$ כי $sin(0)+1-0=1, e^(0)+0+1 = 2$.\
  נגדיר $F : RR^3 arrow.r RR^2$ על־ידי $F(x,y,z) = vec(F_1 (x","y","z), F_2 (x","y","z))$.\
  מתקיים $F(1,0,1)=(1,2)$ ו־$F$ גזירה קורדינאטה קורדינאטה מאריתמטיקה של פונקציות גזירות (ואף גזירה ברציפות כי כל הגורמים בכל קורדינאטה גזירים ברציפות), אז נחשב
  $
    (partial F_1) / (partial x) = y cos(x y)+2x z => (partial F_1) / (partial x) bar_((1,0,1)) = 2 \
    (partial F_1) / (partial y) = x cos(x y) -3y^2 => (partial F_1) / (partial y) bar_((1,0,1))=1 \
    (partial F_1) / (partial z) = x^2 => (partial F_1) / (partial z) bar_((1,0,1)) = 1 \
    (partial F_2) / (partial x) = y^2 => (partial F_2) / (partial x) bar_((1,0,1)) = 0 \
    (partial F_2) / (partial y) = z e^(y z) + 2y x => (partial F_2) / (partial y) bar_((1,0,1))=1 \
    (partial F_2) / (partial z) = y e^(y z) + 3z^2 => (partial F_2) / (partial z) bar_((1,0,1)) = 3 \
  $
  כמובן כל הנגזרות החלקיות רציפות ולכן $F in C^1$, ומתקיים
  $
    D F_((x,y,z)) = mat((partial F_1) / (partial x), (partial F_1) / (partial y), (partial F_1) / (partial z); (partial F_2) / (partial x), (partial F_2) / (partial y), (partial F_2) / (partial z)) => D F_((1,0,1)) = mat(2, 1, 1; 0, 1, 3)
  $
  נשים לב שהדרגה מלאה כי השורות בבירור בלתי־תלויות לינארית (דרגה מלאה לכן דטרמיננטה לא אפס).\
  קיבלנו שכל התנאים של משפט הפונקציה הסתומה מתקיימים, ולכן קיימת סביבה פתוחה $U in RR^3$ סביב $(1,0,1)$ המקיימת
  $
    A inter U = {(x,y,z) in U bar F_1 (x,y,z) = 1, F_2 (x,y,z) = 2}
  $ מתנהג כקו גובה (כפי שיונתן אמר בתרגול), ולכל $(x,y,z) in A inter U$ משפט הפונקציה הסתומה אומר שקיימת סביבה של הנקודה כך שנוכל לרשום
  $ cases((x,y) = h(z), (x,z) = g(y), (y,z) = f(x)) $
]
#pagebreak()
#subquestion()
נחשב את $(d y) / (d x) (1,0,1), (d z) / (d y) (1,0,1)$.
#solution[
  נגזור את $F_1 (x, y(x), z(x)) = 1$ ביחס ל־$x$, אז
  $
    d / (d x) [sin(x y) + x^2 z - y^3] = 0 =>_("כלל השרשרת") cos(x y)(y + x dot.op (d y) / (d x)) + 2x z + x^2 dot.op (d z) / ( d x) - 3y^2 dot.op (d y) / (d x) = 0 \
    =>bar_((1,0,1)) (d y) / (d x) + 2 + (d z) / (d x)
  $
  באותו אופן נגזור את $F_2 (x,y(x),z(x))$ ביחס ל־$x$, אז
  $
    d / (d x) [ e^(y z) + x y^2 + z^3] = 0 =>_("כלל השרשרת") e^(y z)(z dot.op (d y) / (d x) + y dot.op (d z) / (d x)) + y^2 + 2x y dot.op (d y) / (d x) + 3z^2 dot.op (d z) / (d x) \
    =>bar_((1,0,1)) (d y) / (d x) + 3 (d z) / (d x)
  $
  שניהם שווים לאפס, אז$ (d y) / (d x) + 2 + (d z) / (d x) = (d y) / (d x) + 3 (d z) / (d x) => (d z) / (d x) = 1 $
  ואז
  $ (d y) / (d x) + 2 + (d z) / (d x) =>_((d z) / (d x)=1) (d y) / (d x) = -3 $
  נשאר לחשב את $(d z) / (d y)(1,0,1)$, נגזור את $F_2 (x(y), y, z(y))$ לפי $y$ ונקבל
  $
    d / (d y)[e^(y z)+x y^2+z^3]=0 =>_("כלל השרשרת") e^(y z)(z + y dot.op (d z) / (d y))+(d x) / (d y)y^2+2 x y + 3z^2 dot.op (d z) / (d y)
    \ =>bar_((1,0,1)) 1(1+0)+0+0+3dot.op 1^2 dot.op (d z) / (d y) = 0 => (d z) / (d y) = -1 / 3
  $
]

#question()
תהיי $B subset.eq RR^k$ פתוחה ו־$f, g_1, ..., g_n : B arrow.r RR$ גזירות ברציפות עבור $n+1<=k$. נגדיר
$ A = { x in B bar g_1 (x) = ... = g_n (x) = 0 } $
נניח בנוסף כי לכל $a in A$ מתקיים ש-$gradient g_1 (a), ..., gradient g_n (a) in RR^k$ הם בלתי־תלויים לינארית.\
נגדיר פונקציה $cal(L) : RR^n times B arrow.r RR$ הנקראת *לגראנז'יאן* באמצעות
$ cal(L)(lambda, x) = f(x) - sum_(i=1)^n (lambda_i g_i (x)) $

#subquestion()
נוכיח כי $cal(L)$ גזירה ברציפות ואם $a in A$ היא נקודת קיצון מקומי של $f|_A$ אז קיים $lambda in RR^n$ כך שיתקיים $D cal(L)_((lambda, a)) = 0$.

#proof[
  בבירור $cal(L)$ גזירה ברציפות מאריתמטיקה של פונקציות גזירות ברציפות (סכום ומכפלה בסקלר), ומכללי גזירה
  $
    gradient cal(L)_((lambda, x)) = vec(gradient_lambda cal(L), gradient_x cal(L)) = vec(-g_1 (x), dots.v, -g_n (x), gradient f(x) - sum_(i=1)^n lambda_i gradient g_i (x))
  $
  שכמובן רציפים קורדינאטה־קורדינאטה כסכום ומכפלה בסקלר של פונקציות רציפות.\
  נניח כי $a in A$ נקודת קיצון מקומי של $f|_A$ אז מתקיים $gradient f|_a = 0$ ואם נציב במה שמצאנו נקבל
  $
    0 = D cal(L)_((lambda, a)) = vec(g_1 (0) = 0, dots.v, g_n (0) = 0, gradient f(a) - sum_(i=1)^n lambda_i gradient g_i (a) = -sum_(i=1)^n lambda_i gradient g_i (a))
  $
  כעת, נטען כעת שלכל $v in RR^k$ שמתקיים $gradient g_i (a) dot.op v = 0$ לכל $i in [n]$ נקבל ש־$gradient f(a) dot.op v = 0$ כי מהגדרת $A$ אנחנו יכולים "לזוז" רק בכיוונים שמשיקים ל־$a$ אחרת נשבור את ההגבלה שלנו של $A$ אבל אם $a$ היא נקודה קריטית, זה גם אומר שהיא שבפרט $gradient f(a)$ אורתוגונלי לכל וקטור כיוון כזה.\
  במילים אחרות זה אומר שקיימים $lambda_1, ... , lambda_n$ כך שמתקיים
  $ gradient f(a) = sum_(i=1)^n lambda_i gradient g_i (a) $
  (כי אם $V = { v in RR^k bar gradient g_i (a) dot.op v = 0 space forall i}$ אז $V^bot = { gradient g_1 (a), ..., gradient g_n (a)}$ מהאורתוגונליות שראינו במטלות קודמות ולכן נקבל $gradient f(a) in V^bot$ וזה בידיוק מה שרצינו להראות).
]

#subquestion()
נניח מעתה כי $f, g_1, ..., g_n$ גזירות פעמיים ברציפות.

#sub_subquestion()
נוכיח כי $cal(L)$ גזירה פעמיים ברציפות ונחשב את ההסיאן שלה.

#proof[
  מההנחה שלנו, $H f$ (מטריצת ההסיאן של $f$ קיימת) וגם לכל $i in [n]$ קיימת $H g_i$.\
  נשים לב שההסיאן שמתקבל הוא מצורה של מטריצות בלוקים
  $
    H cal(L)_((lambda, x)) = mat((partial^2 cal(L)) / (partial lambda_i^2), (partial^2 cal(L)) / (partial lambda_i lambda x_i); (partial^2 cal(L)) / (partial x_i partial lambda_i), (partial^2 cal(L)) / (partial^2 x_i)) = mat(0_(n times n), - gradient g(x)^T; -gradient g(x), H f(x) - sum_(i=1)^n lambda_i H g_i (x)) =_("סימון") mat(0, G^T; G, C)
  $
  כאשר הטרנספוס נועד להעברה למימדים הנכונים עבור מטריצת ההסיאן (מוקטור עמודה לשורה במקומות הנכונים).
]

#pagebreak()

#sub_subquestion()
נראה כי ההסיאן $H cal(L)_((lambda, x))$ בהכרח אינו חיובי או שלילי בהחלט לכל $(lambda, x) in RR^n times B$.

#proof[
  מטרצה $M$ היא חיובית לחלוטין אם לכל $v!=0$ וקטור מתקיים $v^T M v>0$ ושלילית לחלוטין אם $v^T M v < 0$.\
  מספיק שנסתכל על $n=1$ וניקח את ניקח $(0, x) in RR times B$ ונקבל
  $ (0, x) mat(0, G^T; G, C) vec(0, x)=C x^2 $
  שיכולה להיות אי־שלילית אם $H f (x) - sum_(i=1)^n lambda_i H g_i (x) < 0$ וחיובית אם זה גם חיובי.
]
