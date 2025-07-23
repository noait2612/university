#import "../../../../src/article.typ": *
#show: article.with(title: [ מבנים אלגבריים 2, 80446 --- פתרון מבחן מועד ב' 2021 ], signature: [#align(center)[#image(
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
השדה $CC$ סגור אלגברית.

#proof[
  נזכר בשתי טענות:
  + לכל $f in RR[t]$ מדרגה אי־זוגית יש שורש ב־$RR$ – זה נובע ממשפט ערך הביניים: $f$   רציפה ומתקיים  $display(lim_(t arrow.r infinity) f(t) = infinity"," lim_(t arrow.r minus infinity) f(t) = -infinity)$ \
    ולכן בפרט יש שורש.
  + השדה $CC$ סגור להוצאת שורש
  כעת, נניח שלא כך ולכן יש $L slash CC$ הרחבה אלגברית ולכן גם $L slash RR$ אלגברית.\
  היות ו־$char(RR)=char(CC)=0$ נובע שכל פולינום אי־פריק הוא ספרבילי ולכן ההרחבה היא ספרבילית ולכן ניקח $L^(gal) slash RR$ ונגדיר \
  $G = Gal(L^(gal) slash RR)$.\
  ניקח $H<=G$ תת־חבורה $2$־סילו ולכן ${e}<=H<=G$ ונקבל שיש שדה ביניים $L^(gal) slash F slash RR$ כאשר $F=(L^(gal))^H$.\
  אז $[F:RR] = abs(G)/abs(H)$ מספר אי־זוגי, זה מכיוון ש־$H$ חבורת $2$־סילו ולכן לכל $alpha in F$ מתקיים $deg(f_(alpha slash RR))$ אי־זוגי, שכן $ deg(f_(alpha slash RR))=[RR(alpha) : RR] divides [F:RR] $
  לכל פולינום כזה יש שורש ב־$RR$ מהטענה הראשונה מתהזכורת ולכן יש ל־$f_(alpha)$ שורש ב־$RR$ ולכן $alpha in RR$ (אחרת, $f_(alpha)$ פריק בסתירה להנחה).\
  אז $F=RR, H=G$ ולכן $L^(gal) slash RR$ היא הרחבה מסדר זוגי $abs(G)=2^n$ ולכן יש סדרה
  $
    {e} = G_0 triangle.stroked.small.l G_1 triangle.stroked.small.l dots.h.c triangle.stroked.small.l G_n = G wide (abs(G_i)=2^i)
  $
  מהצד השני, מהתאמת גלואה קיבלנו
  $ K_n supset dots.h.c supset K_2 supset K_1 supset RR wide ([K_i : K_(i-1)] = 2) $
  נניח ש־$n<=2$ (בהכרח מתקיים $n>=1$ כי $CC subset L^(gal)$), אבל זו סתירה כי אז נקבל
  $ RR!= K_1 = RR(sqrt(a)) $
  אבל $a in RR$ ולכן בהכרח $a<0$ ואז $K_1 = CC$, אבל $C!=K_2 = CC(sqrt(a + b i))$ אבל זו סתירה לטענה השנייה מהתזכורת, ולכן בהכרח $n=1 => L = CC$ בסתירה לכך ש־$L$ לא טריוויאלית, כנדרש.
]

#question()
תהיי $L slash K$ הרחבת גלואה סופית ונסמן $G = Gal(L slash K)$.\
אזי ההעתקות $scr(G)(F) = Gal(L slash F), scr(F)(H) =L^H$ הפוכות אחת לשנייה ומשרות התאמה חד־חד ערכית ועל בין שדות ביניים $L slash F slash K$ לתתי־חבורות $1<=H<=G$.

#proof[
  נוכיח כי לכל שדה ביניים $L slash F slash K$ מתקיים $F=L^(Gal(L slash F))$.\
  ברור כי $F subset.eq L^(Gal(L slash F))$ כי $gal(L slash F)$ אלו האוטומורפיזמים שמקבעים את $F$.\
  ניקח $alpha in L slash F$ ולכן $alpha$ פריד מעל $F$ כי $L slash K$ פרידה (כי גלואה) ולכן $L slash F$ פרידה ו־$deg_s (alpha) > 1$ ולכן יש לו צמוד $alpha'$ מעל $F$ ולכן קיים \
  $sigma in Aut_F (overline(F))$ כך שיתקיים $sigma(alpha)=alpha'$.\
  מתקיים $sigma|_K = Id_K$ וגם $sigma(L)=L$ מהיות $L slash K$ נורמלית ולכן $sigma|_L in Gal(L slash F)$ כי הוא הזהות על $F$, אבל $sigma(alpha)!=alpha$ ולכן $alpha in L^(Gal(L slash F))$ ולכן קיבלנו שיוויון ומתקיים $F=L^(Gal(L slash F))$.\
  אז מתקיים
  $ scr(F)(scr(G)(F)) = scr(F)(Gal(L slash F)) = L^(Gal(L slash F)) = F => scr(F) compose scr(G) = Id $
  בכיוון השני, נזכר במשפט ארטין:
  #theorem(
    "משפט ארטין",
  )[$L$ שדה ו־$H<=Aut(L)$ חבורת אוטומורפיזמים סופית כלשהי ונסמן $F=L^H$. אז $L slash F$ הרחבת גלואה ו־$H=Gal(L slash F)$.]
  בכיוון השני, ניקח $H<=G$ תת־חבורה ולכן ממשפט ארטין (יחד עם הסופיות!) נקבל $ H = Gal(L slash L^H) = scr(G)(scr(F)(H)) => scr(G) compose scr(F) = Id $
  אז הוכחנו את ההתאמתה ונשאר להראות ש־$scr(G), scr(F)$ הופכות שיכונים:\
  נניח כי $H'<=H<=G$ תתי־חבורות של $G$ אז $scr(F)(H)=L^H$ אלו כל האיברים ב־$L$ שנשארים במקום על־ידי פעולת $H$, אבל $H' subset.eq H$ ולכן נובע כי אם איבר נשאר במקום על־ידי $H$ הוא ישאר במקום גם על־ידי $H'$ ולכן $scr(F)(H) subset.eq L^(H')= scr(F)(H')$.\
  ניקח שדות ביניים $L slash F slash F' slash K$ אז $scr(G)(F)=Gal(L slash F)$ אלו אוטומורפיזמים המשמרים את $F$ אבל $F' subset.eq F$ ולכן הם גם משמרים הכרח את $F'$, כלומר $scr(F) = Gal(L slash K) subset.eq Gal(L slash F') = scr(G)(F')$, כנדרש.
]

#question()
בכל סעיף נקבע האם הטענה נכונה או לא נכונה וננמק לספורט.

#subquestion()
כל אוטומורפיזם של שדה סופי הוא חזקה של פרובניוס.

#proof[
  הטענה *נכונה*.\
  זאת מכיוון שהפרובניוס יוצר את חבורת האוטומורפיזמים (כי $FF_p^times$ היא חבורה ציקלית ולכן היא נוצרת על־ידי איבר אחד, $g$, ואנחנו צריכים להעלות את $g$ לחזקה של $p$ כדי לקבל שוב את $g$, כי כל חזקה אחרת תמפה למספר כלשהו ומספר צריך למפות לעצמו, ולכן כל אוטומורפיזם צריך להעלות כל איבר בחזקה $j$ כאשר קיים $n in NN$ המקיים $j=n p$).
]

#subquestion()
תהיי $L slash K$ הרחבה סופית ויהי $overline)L)$ סגור אלגברי של $L$. אם שני איברים $alpha, beta in overline(L)$ צמודים מעל $K$ אז הם גם צמודים מעל $L$.

#proof[
  הטענה *לא נכונה*.\
  ניקח $K = RR, L = CC$, זו הרחבה אלגברית סופית כי $CC=RR(i)$.\
  אנחנו יודעים ש־$plus.minus i$ הם השורשים של הפולינום $x^2+1$ מעל $RR$ ולכן הם צמודים.\
  מצד שני, כל הצמדה היא טריוויאלית מעל $CC$ ולכן $plus.minus i$ לא צמודים מעל $CC$.\
  זאת בערך הטענה ההפוכה מהמועד א'.
]

#subquestion()
תהיי $E slash K$ הרחבת שדות ויהיו $L, F$ תתי־הרחבות כך ש־$E = L F$. אם $L slash K$ סופית אז $E slash F$ סופית.

#proof[
  הטענה *נכונה*.\
  $L slash K$ סופית ולכן לפי תנאים שקולים לסופיות $L slash K$ אלגברית וקיימים $alpha_1, dots.h.c, alpha_n$ אלגבריים מעל $K$ כך שמתקיים $L = K(alpha_1, dots.h.c, alpha_n)$.\
  אבל אז מהגדרת הקומפוזיטום, $E = F(alpha_1, dots.h.c, alpha_n)$ שאם הם אלגבריים מעל $K$ אז הם גם אלגבריים מעל $F$ וזה התנאי השקול שאומר ש־$E slash F$ סופית.
]

#subquestion()
לכל חבורה סופית $G$ ולכל ראשוני $p>0$ יש הרחבת גלואה $L slash K$ של שדות ממציין $p$ כך ש־$G tilde.eq Gal(L slash K)$.

#proof[
  לא יודעת?
]

#subquestion()
אם להרחבת גלואה סופית לא טריוויאלית $L slash K$ אין תתי־הרחבות $K subset.neq F subset.neq L$ אז $[L:K]$ ראשוני.

#proof[
  הטענה *נכונה*.\
  ראינו שמתקיים $abs(Gal(L slash K))=[L:K]$.\
  נניח שזה לא מספר ראשוני, אז קיים $p$ ראשוני ו־$n in NN$ כך שמתקיים $abs(Gal(L slash K))=[L:K]=n p$.\
  אז ל־$Gal(L slash K)$ יש תת־חבורה $H$ מגודל $p$. \
  ממשפט ארטין, $F = L^H$ נקבל ש־$L slash F$ גלואה ו־$[F:K]=p$, אבל זה אומר ש־$F slash K$ היא תת־הרחבה לא טריוויאלית ואמרנו שאין לה תתי־הרחבות לא טריוויאליות.
]

#question()
נמצא את שדה הפיצול של $t^8-1 in FF_7 [t]$ מעל $FF_7$.

#solution[
  אנחנו רוצים להרחיב את $FF_7$ כדי ששורש יחידה פרימיטיבי מסדר $8$ יהיה בו, אז חייב להתקיים ש־$8$ מחלק את הסדר של החבורה הכפלית שהיא מסדר $7^n-1$, אז נמצא את ה־$n$ המינימלי כך ש־$8 divides 7^n-1$
  $ 7^1-1 eq.triple_(mod 8) 6, space 7^2-1=48 eq.triple_(mod 8) 0 $
  ולכן שדה הפיצול הוא $FF_49$.
]

#question()
יהי $f(t) in K[t]$ פולינום ספרבילי ופריק ממעלה $4$ כך ששדה הפיצול שלו מקיים $[L:K]=4$.

#subquestion()
נמצא את $Gal(f)$.

#proof[
  $f$ פריק, ולכן קיימים $g,h$ כך שמתקיים $f=g h$, נשים לב שיש רק $2$ אופציות לקומבינציית דרגות: או שהדרגה של שניהם היא $2$ או של אחד מהם היא $1$ ושל השני $3$.\
  בלי הגבלת הכלליות, $deg(h)=3, deg(g)=1$ אבל אז $4 = [L:K] divides 6$ וזו כמובן סתירה ולכן $deg(f)=deg(g)=2$.\
  $g,h$ חייבים להיות אי־פריקים (אחרת דרגת ההרחבה תהיה קטנה מ־$2$).\
  אנחנו יודעים $Gal(f)=Gal(L slash K)<=S_4$ ו־$abs(Gal(f))=4$, יש ל־$S_4$ שתי תתי־חבורות מסדר $4$ והן $C_4, V$ כאשר $V$ חבורת קליין.\
  אבל $f = (t^2+a_1t + b_1)(t^2+a_2t+b_2)$ כאשר השורשים הם בלתי־תלויים ולכן כל פולינום כזה מביא לנו הרחבה מדרגה $2$ ולכן $Gal(f) = C_2 times C_2 = V$.
]

#subquestion()
נמצא דוגמה לפולינום כזה כאשר $K=FF_2 (x)$.

#proof[
  ניקח $(t^2+t+1)$ אנחנו יודעים שהוא אי־פריק מעל $FF_2 (x)$ כי אין לו שורש והוא ספרבילי כי $gcd(t^2+t+1, 2t+1) eq.triple_(mod 2) gcd(t^2+t+1, 1)=1$.
  וניקח $(t^2+t+x)$ שהוא אי־פריק כי אין לו שורש מעל $FF_2$ והוא גם ספרבילי כי $gcd(t^2+t+x, 2t+1) eq.triple_(mod 2) gcd(t^2+t+x, 1)=1$.
  אז $f(t) = (t^2+t+1)(t^2+t+x)$ מסיים.
]
