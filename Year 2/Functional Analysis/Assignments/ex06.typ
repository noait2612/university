#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 06 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695

#let span = math.op("Span")
#let lip = math.op("Lip")

#question()
יהי $1<=p<infinity$ ונגדיר את המרחב $ell^p$ להיות מרחב הסדרות הממשיות $(x_n)_(n=1)^infinity$ המקיימות $display(sum_(n=1)^infinity abs(x_n)^p < infinity)$ ונגדיר $norm(x)_p = display((sum_(n=1)^infinity abs(x_n)^p)^(1 / p))$, באינפי $3$ ראינו שזו נורמה על $ell^p$.
#subquestion()
נוכיח שאם $p!=2$ אז $norm(dot.op)_p$ אינה מושרית ממכפלה פנימית על $ell^p$.
#proof[
  נשים לב שההקבלה לטענה שאנחנו מתבקשים להוכיח היא שהנורמה על המרחב $(ell^p, norm(dot.op)_p)$ מושרית ממכפלה פנימית אם ורק אם $p=2$:\
  $<==$ נניח כי הנורמה על המרחב $(ell^p, norm(dot.op))$ מושרית ממכפלה פנימית ונראה כי $p=2$. \
  מהיות $ell^p$ מרחב נורמי, נובע משאלה $4$ כי הוא מושרה ממכפלה פנימית אם ורק אם הוא מקיים את כלל המקבילית. \
  לכן מספיק שניקח $x = (1, 0, 0), y=(0,1,0)$ ונשים לב שמתקיים $norm(x)=norm(y)=1$. מכלל המקבילית מתקיים:
  $
    norm(x+y)_p^2 + norm(x-y)_p^2 = 2 dot.op 2^(2 / p) = 4 = 2+2 = 2 norm(x)_p^(2 / p) + 2 norm(y)_p^(2 / p) <==> 2^(2 / p) = 2 <==> p=2
  $
  \
  $==>$ נניח כי $p=2$ ונראה כי הנורמה על המרחב $(ell^p, norm(dot.op))$ מושרית ממכפלה פנימית.
  יהיו $x = (x_n), y = (y_n) in ell^2$ ונגדיר $ angle.l x,y angle.r = sum_(n=1)^infinity x_n y_n $
  נראה כי זו אכן מכפלה פנימית:
  1. לינאריות ברחיב הראשון: יהיו $x,y,z in ell^2$ ו־$alpha in RR$, מתקיים:
  $
    angle.l alpha x+y,z angle.r = sum_(n=1)^infinity (alpha x_n + y_n)z_n = alpha sum_(n=1)^infinity x_n z_n + sum_(n+1)^infinity y_n z_n = alpha angle.l x, z angle.r + +angle.l y,z angle.r
  $
  2. סימטרייה: ישיר
  3. אי־שליליות:
    $ infinity > angle.l x,x angle.r = sum_(n=1)^infinity x_n^2 >= 0 $
    וכמובן $angle.l x,x angle.r = 0 <==> x=0$ והביטוי לעיל קטן מאינסוף כי אנחנו ב־$ell^2$. \
  ולכן זו אכן מכפלה פנימית, ולכן היא מקיימת את כלל המקבילית והנורמה:
  $
    norm(x)_2 = root(2, sum_(n=1)^infinity abs(x_n)^2) = root(2, angle.l x "," x angle.r)
  $ נורמה על $ell^2$ המושרית ממכפלה פנימית.
]

#subquestion()
נוכיח שנורמת $infinity$ על המרחב $C[a,b]$ אינה מושרת ממכפלה פנימית.
#proof[
  בלי הגבלת הכלליות נבחן את $C[0,1]$ (שאר המקרים יתקבלו על־ידי מתיחה והזזה של פונקציות).\
  נגדיר
  $ f(x)=x, g(x)=1-x $
  מתקיים
  $ norm(f)_infinity^2 = 1 = norm(g)_infinity^2 $
  וגם מתקיים
  $ f+g = x+1-x = 1, space f-g = x-1+x = 2x-1 $
  ואז
  $ norm(f+g)_infinity^2 = 1, space norm(f-g)_infinity^2 = 1 $
  אבל אם נורמת $infinity$ הייתה מושרית ממכפלה פנימית, היא הייתה מקיימת את תנאי המקבילית, אבל
  $ 2(norm(f)^2 + norm(y)^2) = 2(1+1) = 4 != 2 = 1+1 = norm(f+g)^2 + norm(f-g)^2 $
  ולכן נורמת $infinity$ על המרחב $C[0,1]$ לא מושרית ממכפלה פנימית.
]

#question()
יהי $(H, angle.l dot.op, dot.op angle.r)$ מרחב מכפלה פנימית ו־$x, (x_k)_(k=1)^infinity in H$.

#subquestion()
נראה כי אם $norm(x_k) arrow.r norm(x)$ וגם $angle.l x,x_k angle.r arrow.r angle.l x,x angle.r$ אז $x_k arrow.r x$.
#proof[
  מתקיים
  $
    norm(x-x_k) &=_("הגדרה") angle.l x-x_k, x - x_k angle.r \
    &=_("אדיטיביות") angle.l x-x_k, x angle.r + angle.l x-x_k, -x_k angle.r \
    &=_("הרמיטיות") overline(angle.l x"," x-x_k angle.r) + overline(angle.l -x_k"," x-x_k angle.r) \
    &=_("אדיטיביות") overline(angle.l x","x angle.r) + overline(angle.l x "," -x_k angle.r) - overline(angle.l x_k "," x angle.r)-overline(angle.l x_k "," -x_k angle.r) \
    &= norm(x)^2 - angle.l x_k, x angle.r - overline(angle.l x_k"," x angle.r) + norm(x_k)^2 \
    &=_(k arrow.r infinity ) norm(x)^2 - angle.l x, x angle.r - overline(angle.l x"," x angle.r) + norm(x)^2 \
    &= 0
  $
  ולכן $x_k arrow.r x$.
]

#subquestion()
תהיי $(e_k)_(k=1)^infinity$ מערכת אורתונורמלית. נראה כי הסדרה $y_k = angle.l e_k, x angle.r e_k$ מתכנסת.
#proof[
  מאי־שיוויון בסל נקבל
  $ norm(x) >= sum_(k=1)^infinity abs(angle.l e_k","x angle.r)^2 $
  טור ממשי מתכנס בהחלט אם (תנאי הכרחי אך לא מספיק) מתקיים $abs(angle.l e_k "," x angle.r)^2 arrow.r 0$ ולכן $angle.l e_k, x angle.r arrow.r 0$.\
  אז מתקיים $norm(y_k) = norm(angle.l e_k "," x angle.r dot.op e_k) = abs(angle.l e_k "," x angle.r) dot.op underbrace(norm(e_k), =1) arrow.r 0$.\
  אבל אז גם $angle.l y_k, 0 angle.r = 0$ לכל $k in NN$ מהומגניות המכפלה הפנימית ומסעיף א' נקבל $y_k arrow.r 0$.
]

#question()
נוכיח שהבסיס הסטנדרטי הוא מערכת אורתונורמלית שלמה ב־$ell^2$, כלומר קבוצת הסדרות $e_k$ ששוות ל־$1$ במקום ה־$k$ ו־$0$ אם אחרת.
#proof[
  לכל $n in NN$ מהגדרת הבסיס הסטנדרטי מתקיים
  $ norm(e_m) = sqrt(sum_(k=1)^infinity abs(e_n)_k^2)=sqrt(abs(1)^2)=1 $
  ולכל $n!=m$ מתקיים
  $ angle.l e_n, e_m angle.r = sum_(k=1)^infinity (e_n)_k overline((e_m)_k)=0 $
  שכן $e_n = (0, ..., 0, underbracket(1, n"המקום ה־"), 0, ..., 0), e_m = (0, ..., 0, underbracket(1, m"המקום ה־"), 0, ..., 0)$ ולכן זה אכן בסיס אורתונורמלי.\
  נשאר להראות שלמות; יהי $x = (x_1, x_2, ...) in ell^2$ נשים לב שזה שקול לביטוי $x = sum_(i=1)^infinity x_n e_n$, נראה שהטור מתכנס
  $ norm(x)^2 = sum_(n=1)^infinity norm(x_n e_n)^2 = sum_(n=1)^infinity abs(x_n)^2 $
  אבל $x in ell^2$ ולכן הסדרה מתכנסת ולכן הסדרה $sum_(n=1)^infinity (x_n e_n) arrow.r x$ בנורמת $ell^2$, בפרט זה אומר ש־$overline(span { e^k bar k in NN}) = ell^2$, וראינו שמערכת אורתונורמלית שלמה היא מערכת אורתונורמלית שהסגור של הספאן שלה הוא כל המרחב וזה מסיים.
]

#question()
יהי $(H, angle.l dot.op, dot.op angle.r)$ מרחב מכפלה פנימית.

#subquestion()
נראה כי נורמה שמושרית ממכפלה פנימית מקיימת את חוק המקבילית: לכל $x,y in H$ מתקיים
$ 2(norm(x)^2+norm(y)^2) = norm(x+y)^2+norm(x-y)^2 $
#proof[
  נניח כי הנורמה $norm(dot.op)$ מושרית ממכפלה פנימית ונראה כי היא מקיימת את כלל המקבילית.\
  מתקיים מהגדרה:
  $
    norm(x+y)^2 + norm(x-y)^2 = angle.l x+y, x+y angle.r + angle.l x-y, x-y angle.r \ = angle.l x,x angle.r + angle.l x,y angle.r + angle.l y,x angle.r + angle.l y,y angle.r + angle.l x,x angle.r - angle.l x,y angle.r - angle.l y,x angle.r + angle.l y,y angle.r = 2angle.l x,x angle.r + 2angle.l y,y angle.r \ = 2 norm(x)^2 + 2norm(y)^2
  $
]

#subquestion()
נוסחאות הפולריזציה.

#sub_subquestion()
נניח ש־$H$ מרחב מכפלה פנימית ממשי. נראה שלכל $x,y in H$ מתקיים
$ angle.l x, y angle.r = (norm(x+y)^2-norm(x-y)^2) / 4 $
#proof[
  מכיוון ש־$H$ מרחב מכפלה פנימית ממשי נובע $angle.l x,y angle.r = angle.l y,x angle.r$ ולכן מתקיים
  $
    norm(x+y)^2 - norm(x-y)^2 = norm(x)^2 + norm(y)^2 + 2 angle.l x,y angle.r - (norm(x)^2 + norm(y)^2 - 2 angle.l x, y angle.r) = 4 angle.l x,y angle.r => angle.l x,y angle.r = (norm(x+y)^2-norm(x-y)^2) / 4
  $
]
