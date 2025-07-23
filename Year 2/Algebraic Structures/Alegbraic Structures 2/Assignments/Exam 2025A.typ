#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- פתרון מבחן מועד א' 2025 ], signature: [#align(center)[#image(
      "../../../../src/duck.png",
      width: 30%,
      fit: "contain",
    )]])

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let char = math.op("char")
#let im = math.op("Im")
#let ker = math.op("ker")
#let Perm = math.op("Perm")
#let deg = math.op("deg")
#let Span = math.op("Span")
#let Hom = math.op("Hom")
#let End = math.op("End")
#let cont = math.op("cont")
#let Frac = math.op("Frac")
#let Aut = math.op("Aut")
#let Id = math.op("Id")
#let Fr = math.op("Fr")
#let Gal = math.op("Gal")
#let gal = math.op("gal")
#let Tr = math.op("Tr")
#let Res = math.op("Res")
#let scr(it) = text(features: ("ss01",), box($cal(it)$))

#question()
נניח כי $L slash K$ הרחבה סופית ונניח בנוסף שההרחבה פרידה (ספרבילית). אז היא פרימיטיבית (קיים $alpha in L$ כך ש־$L=K(alpha)$ ו־$alpha$ נקרא *איבר פרימיטיבי*).

#proof[

]

#question()
תהיי $L slash K$ הרחבת גלואה סופית ונסמן $G = Gal(L slash K)$.\
אזי ההעתקות $scr(G)(F) = Gal(L slash F), scr(F)(H) =L^H$ הפוכות אחת לשנייה ומשרות התאמה חד־חד ערכית ועל בין שדות ביניים $L slash F slash K$ לתתי־חבורות $1<=H<=G$.

#proof[

]

#question()
בכל סעיף נקבע האם הטענה נכונה או לא נכונה וננמק לספורט.

#subquestion()
#proof[]

#subquestion()
#proof[]

#subquestion()
#proof[]

#subquestion()
#proof[]

#subquestion()
#proof[]

#question()
נמצא את כל תתי־ההרחבות הריבועיות של $QQ(xi_12) slash QQ$ ונציגן בצורה של $QQ(sqrt(d)) slash QQ$.

#solution[
  צריך לעשות את האלגוריתם מתרגול $7$.
  #todo.
]

#question()
נחשב את סכום החזקות השלישיות של הפולינום $x^3-x+1$.

#solution[
  נסמן ב־$r_1, r_2, r_3$ את השורשים של הפולינום ואנחנו רוצים לחשב את $r_1^3+r_2^3+r_3^3$.\
  באופן כללי, לכל $i in {1,2,3}$ מתקיים $r_i^3 = r_i - 1$, אז $r_1^3+r_2^3+r_3^3 = r_1+r_2+r_3 - 3$ ונטען שהתשובה היא $-3$:\
  נחשב
  $
    (x-r_1)(x-r_2)(x-r_3) = x^3-x^2r_3-x^2r_1+x r_1r_3-x^2r_2+x r_2 r_3+r_1r_2r_3x-r_1r_2r_3 \
    = x^3-x^2(r_1+r_2+r_3) + x r_1r_2r_3 - r_1r_2r_3
  $
  נסמן ב־$a,b,c,d$ את המקדמים של הפולינום שלנו $a x^3 + b x^2 + c x + d$ ובמקרה שלנו $a=1, b=0, c=-1, d=1$, ולכן עם השורשים לעיל זה אמור להתאים למקדמים של הפולינום כמובן, אז
  $ a = 1, b = (r_1 + r_2+ r_3) = 0, c = r_1 r_2 r_3 = 1, c = - r_1 r_2 r_3 = -1 $
  ולכן
  $ r_1^3+r_2^3+r_3^3 = r_1+r_2+r_3 - 3 = -3 $
]


#question()
יהי $f$ פולינום אי־פריק מעל שדה $K$ ויהי $L$ שדה הפיצול שלו. נניח ש־$G=op("Gal")(L slash K)$ היא אבלית ונוכיח שכל שורש של $f$ יוצר $L$.

#proof[
  נניח שלא ככה, ולכן עבור $alpha$ שורש של $f$ מתקיים $E = K(alpha)$ ו־$E subset.neq L$ ונשים לב ש־$[K(alpha) : K] = deg(f)$.\
  מהתאמת גלואה, יש התאמה חד־חד ערכית ועל בין $H<=op("Gal")(L slash K)$ לבין שדות ביניים $K subset.eq E subset.eq L$.\
  היות ו־$G$ אבלית, נובע כי כל תת־חבורה שלה היא נורמלית ולכן בפרט $H = op("Gal")(L slash K(alpha))={sigma in op("Gal")(L slash K) bar sigma(alpha)=alpha}$ זאת־אומרת, $K(alpha)=L^H$ ובגלל שכל תת־חבורה אבלית היא נורמלית
  $ K(sigma(alpha)) = L^H = L^(op("Gal")(L slash K(sigma(alpha))))=L^(sigma H sigma^(-1))=L^H = K(alpha) $
  זה בידיוק אומר שכל השורשים של $f$ יוצרים את אותו שדה ביניים $K(alpha)$, אבל זה בידיוק ההגדרה של שדה פיצול ושדה פיצול יחיד עד־כדי איזומורפיזם ולכן $L subset.eq K(alpha)$ זאת־אומרת $L=K(alpha)$ בסתירה להנחה.
]


#question()
נמצא את הפולינום המינימלי של $sqrt(3)+sqrt(5)$ מעל $QQ$, נראה שהוא אי־פריק מעל $QQ$, אי־פריק מעל $ZZ[t]$ שנהיה פריק מודלו $p$ לכל $p$ ראשוני.

#proof[
  נסמן $alpha = sqrt(3) + sqrt(5)$, אז
  $
    alpha=sqrt(3)+sqrt(5) <==> alpha^2 = 3+2 sqrt(3) sqrt(5) + 5 <==> alpha^2-8 = 2 sqrt(3) sqrt(5) <==> alpha^4-16alpha^2+64=60 <==> alpha^4-16alpha^2+4
  $
  נשתמש בשיטה של "Rational root theorem" ממטלה $2$:
  #remark(
    "תזכורת – Rational root theorem",
  )[$f in QQ[x]$ עם מקדמים שלמים ונסמן $f(x)=a_n x^n + dots.h.c + a_1 x + a_0$.\
    אם $r/s in QQ$ שורש של $f$ אז $s divides a_n, r divides a_0$]
  במקרה שלנו $s=1$ ו־$r= plus.minus 1, plus.minus 2, plus.minus 4$, הצבה קצרה מביאה לנו שכל תוצאה לא מניבה $0$ ולכן אין שורש מעל $QQ$ וזה אומר שאין גורם לינארי (זה בעצם אומר שאין פיצול למכפלה של $f = g h$ כאשר $deg(g)=1, deg(h)=3$ או ההפך).\
  נשאר לבחון האם יש פיצול למכפלה של $f = g h$ עם $deg(g)=deg(h)=2$, אז נניח בשלילה שהוא פריק, ולכן
  $
    alpha^4-16alpha^2+4 = (alpha^2 + a alpha + b)(alpha^2 + c alpha + d)=alpha^4 + c alpha^3 + d alpha^2 + a alpha^3 + a c alpha^2 + a d alpha + b alpha^2 + b c alpha + b d =
    \ alpha^4 + alpha^3 (c+a)+alpha^2(d+a c+b) + alpha(a d + b c) + b d
  $
  אז $c+a = 0 => a = -c$ וכן $b d = 4$ ולכן $ a d + b c = 0 <==> -c d + b c = 0 <==> b c = c d space (2) $ וכן
  $ d + a c + b = -16 <==> d - c^2 + b = -16 $
  מ־$(2)$ יש $2$ אופציות, או ש־$c=0$ או ש־$c!=0$.\
  אם $c!=0$ אז נחלק את $(2)$ בו ונקבל $b = d$ ולכן מכך ש־$b d = 4$ אז $b = plus.minus 2$ אבל אז למשוואה $d + a c + b = -16$ אין פיתרון כי או ש־$-4 = -16$ או ש־$4=-16$ וכמובן שניהם לא נכונים.\
  אז $c=0$, ולכן
  $d + b = -16$ וגם $b d = 4$, אבל גם פה נובע ש־$b=d = plus.minus 2$ ושוב אין פיתרון ולכן ההנחה בשלילה לא נכונה והפולינום אי־פריק מעל $QQ$.\
  עכשיו, נזכר בלמה השנייה של גאוס: $f$ פולינום אי־פריק ב־$ZZ[alpha]$ אם ורק אם $f$ פרימיטיבי ואי־פריק ב־$QQ[alpha]$, ונשים לב שאכן הפולינום שלנו הוא פרימטיבי כי
  $ op("cont")(alpha^4-16alpha^2+4) = op("cont")(1,-16,4) = gcd(1, -16, 4) = 1 $
  ולכן הפולינום הוא פרימיטיבי ועל־כן אי־פריק מעל $ZZ[alpha]$ מהלמה השנייה של גאוס.\
  נשאר רק להראות שהוא פריק מודלו $p$ לכל מודולו $p$: נסמן $y=alpha^2$ אז $alpha^4-16alpha^2+4 mapsto y^2 - 16y+7$ ומתקיים $ Delta = ((-16)^2 - 4(1))4 = 256-16=240 $
  #todo?
]
