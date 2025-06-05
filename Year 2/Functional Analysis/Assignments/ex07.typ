#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 07 --- אנליזה פונקציונלית, 80417 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#let span = math.op("Span")

#question()
ניזכר כי עבורה מטריצה מרוכבת $A^* = overline(A^t), A in M_n (CC)$. נגדיר על המרחב $M_n (CC)$ את הפונקציה הבינארית $angle.l A, B angle.r = tr(A^*B)$.

#subquestion()
נראה כי $(M_n (CC), angle.l dot.op, dot.op angle.r)$ הוא מרחב מכפלה פנימית.

#proof[
  נראה שמתקיימות ארבע התכונות של מכפלה פנימית:
  + אדיטיביות ברכיב הראשון
    $
      forall A,B,C in M_n (CC) : angle.l A+B, C angle.r = tr((A+B)^*C)=tr(A^*C + B^*C)=_("עקבה היא העתקה לינארית") tr(A^*C) + tr(B^*C)=angle.l A,C angle.r + angle.l B,C angle.r
    $
  + הומוגניות ברכיב הראשון
    $
      forall A,B in M_n (CC), forall lambda in RR: angle.l lambda A, B angle.r = tr(lambda A^*B)=_(tr(alpha A) = alpha tr(A)) lambda tr(A^*B)=lambda angle.l A, B angle.r
    $
  + הרמיטיות
    $
      forall A,B in M_n (CC): angle.l A,B angle.r = tr(A^*B)=tr(overline(A^t)B)=tr(overline(A)B^t)=tr(B^t overline(A))=overline(tr(overline(B^t overline(A))))=overline(angle.l B"," A angle.r)
    $
  + חיוביות לחלוטין
    $
      forall M in M_n (CC), angle.l M, M angle.r = tr(M^*M)=tr(overline(M^t)M)=sum_(l=1)^n sum_(k=1)^n overline(m_(l,k)) m_(l,k)=sum_(l=1)^n sum_(k=1)^n norm(m_(l,k))^2 >=0 \
      angle.l M, M angle.r = 0 <==> sum_(l=1)^n sum_(k=1)^n norm(m_(l,k))^2 =0 <==> norm(m_(l,k))=0 <==> M = 0
    $
  קיימנו את כל התנאים למכפלה פנימית ולכן $(M_n (CC), angle.l dot.op, dot.op angle.r)$ הוא מרחב מכפלה פנימית.
]

#subquestion()
נסיק כי אם $A,B$ מטריצות מרוכבות מאותו סדר אזי $abs(tr(A^*B))^2 <= tr(A^*A) dot.op tr(B^*B)$.

#proof[
  נגדיר $norm(A) = sqrt(angle.l A"," A angle.r)$ ומאי־שיוויון קושי־שוורץ נקבל
  $ abs(angle.l A"," B angle.r) <= norm(A) dot.op norm(B) => abs(tr(A^*B))<= sqrt(tr(A^*A) dot.op tr(B^*B)) $
  זאת־אומרת, $abs(tr(A^*B))^2 <= tr(A^*A) dot.op tr(B^*B)$, כנדרש.
]

#question()
יהי $H$ מרחב מכפלה פנימית ותהיי ${e_n}_(n=1)^infinity$ מערכת אורתונורמלית ב־$H$. נסמן $M =span{e_n}_(n=1)^infinity$.\
נראה כי $x in overline(M)$ אם ורק אם $x = sum_(n=1)^infinity angle.l e_n, x angle.r e_n$.

#proof[
  במילים אחרות אנחנו מראים שזו מערכת שלמה (לפי התנאים השקולים למערכת שלמה שראינו בהרצאה).\
  $<==$ נניח כי $x in overline(M)$ ונרצה להראות שמתקיים $x = sum_(n=1)^infinity angle.l e_n, x angle.r e_n$.\
  מכך ש־$x in overline(M)$ נובע כי קיימת $(x_n)_(n=1)^infinity subset.eq M$ כך ש־$x_n stretch(arrow.r)_(n arrow.r infinity) x$.\
  לכל $n in NN$ קיים $N in NN$ כך שלכל $1<=i<=N$ קיים $alpha_i^n$ כך שמתקיים $x_n = sum_(i=1)^N alpha_i^n e_i$ ובפרט $alpha_i^n = angle.l e_n, x_i angle.r$.\
  עכשיו, מתקיים גם $ angle.l e_n, x angle.r = lim_(k arrow.r infinity) angle.l e_n, x_k angle.r $
  (כי $x_n arrow.r x$), ולכן נקבל בסך־הכל
  $ x = sum_(n=1)^infinity angle.l e_n, x angle.r e_n $
  $==>$ נניח כי $x = sum_(n=1)^infinity angle.l e_n, x angle.r e_n$ ונרצה להראות ש־$x in overline(M)$.\
  נגדיר לכל $N in NN$
  $ x_N = sum_(n=1)^N angle.l e_n, x angle.r e_n $
  ברור כי כל $x_N in M$ כצירוף לינארי סופי של איברי $M$, עלינו להראות שמתקיים
  $
    x_N stretch(arrow.r)_(N arrow.r infinity): norm(x-x_N)^2 = norm(sum_(n=N+1)^infinity angle.l e_n"," x angle.r e_n)^2
  $
  מאי־שיוויון בסל נובע (כי ${e_n}$ ממערכת אורתונורמלית)
  $ sum_(k=1)^infinity abs(angle.l x"," e_k angle.r)^2<=norm(x)^2 $
  ולכן כאשר $N arrow.r infinity$ מתקיים $sum_(n=N+1)^infinity abs(angle.l e_n"," x angle.r)^2 arrow.r 0$, ולכן $norm(x-x_N)^2 stretch(arrow.r)_(N arrow.r infinity) 0$ משמע $x_n arrow.r x$ ולכן $x in overline(M)$.
]

#question()
יהי $[a,b] subset.eq RR$, נוכיח שלא קיימת מערכת אורתוגונלית של פונקציות רציפות חיוביות למרחב $C[a,b]$ עם המכפלה הפנימית
$ angle.l f,g angle.r = integral_a^b f(x)g(x)d x $
במילים אחרות, אם ${f_n}_(n=1)^infinity$ מערכת אורתוגונלית ב־$C[a,b]$ אז קיים $n in NN$ וקיים $x in [a,b]$ כך שמתקיים $f_n (x) = 0$.

#proof[
  ראשית, מהיות $f,g$ פונקציות רציפות וחיוביות נובע כי קיים $M in RR$ כך שמתקיים $f(x), g(x) <=M$ לכל $x in [a,b]$, אז ממונוטוניות האינטגרל
  $
    0<=angle.l f,g angle.r = integral_a^b f(x)g(x)d x<= integral_a^b f(M)g(M)d x = underbrace(f(M), >0)underbrace(g(M), >0)underbrace((b-a), >0) >_("מכפלה של ערכים חיוביים") 0
  $
  אבל $angle.l f,g angle.r != 0$ (גם עבור $f=g$) אז לא יכולה להיות סדרת פונקציות אורתוגונליות כאלה.
]

#question()
יהי $[a,b] subset.eq RR$ קטע. ניזכר במערכת ${p_n}_(n=0)^infinity$ של פולינומים אורתוגונליים מהתרגול. כבר הראינו שהשורשים של כל $p_n$ הם ממשיים.

#subquestion()
נוכיח שלכל $n in NN$ לפולינום $p_n$ יש $n$ שורשים פשוטים (ריבוי אחד). כלומר, שהפולינום $p_n$ לא מתחלק בפולינומים מהצורה $(x-alpha)^2$.

#proof[
  נעזר ברמז ונכתוב $p_n = product(x-alpha_k)^beta_k$ כאשר $alpha_k$ ממשיים שונים.\
  נניח כי לא כל השורשים פשוטים, ולכן קיים $l <= k$ כך ש־$B_l > 1$, אז נגדיר
  $ q_n (x) = (x-alpha_l)^(beta_l-2) product_(k=1,k!=l)^n (x-alpha_k) $
  זה פולינום לאחר חילוק ב־$(x-alpha_l)^2$, היות ו־$beta_l>=2$ זה עדיין פולינום וכמובן מתקיים $deg(q_n) < deg(p_n)$, לכן בפרט מתקיים $angle.l p_n, q_n angle.r = 0$, אבל מנגד
  $ q_n (x) p_n (x) = (x-alpha_l)^(2beta_l - 2)product_(k=1,k!=l)^n (x-alpha_k) $
  כל הפולינום הם לא פשוטים במכפלה ובפרט ריבועיים, ולכן
  $ angle.l p_n, q_n angle.r = integral_a^b p_n (x)q_n (x)d x > 0 $
  אבל $angle.l p_n, q_n angle.r = 0$ וזאת סתירה.
]

#subquestion()
נוכיח שלכל $n in NN$ כל השורשים של $p_n$ שייכים לקטע $(a,b)$.

#proof[
  נניח ש־$alpha_k$ השורשים של $p_n$ עבור $1<=k<=n$, באינדוקציה על $n$:\
  עבור $n=0$ הטענה נכונה באופן טריוויאלי, נניח כי הטענה נכונה עבור $n in NN$, משמע $alpha_k in (a,b)$ לכל $1<=k<n$.\
  נניח בשלילה כי $alpha_n in.not (a,b)$ וללא הגבלת הכלליות $alpha_n > b$ ולכן $x-alpha_n$ חיובי לחלוטין (אפשר להניח כי אם $alpha_j in.not (a,b)$ אז הפונקציה $x-alpha_j$ לא מחליפה סימן בקטע $(a,b)$).
  אז נגדיר
  $ q_n (x) = product_(k=1)^(n-1) (x-alpha_k) $
  ולכן
  $
    angle.l p_n "," q_n angle.r = integral_a^b p_n (x)q_n (x)d x = integral_a^b (x-alpha_n)product_(k=1)^(n-1) (x-alpha_k)^2 > 0
  $
  שכן הפונקציה רציפה ואי־שלילית ולכן חיובית, אבל $deg(q_n)<deg(p_n)$ ולכן בהכרח $angle.l p_n, q_n angle.r = 0$ וזאת סתירה.
]
