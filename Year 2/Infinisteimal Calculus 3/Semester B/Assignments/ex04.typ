#import "../../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- חשבון אינפיניטסימלי 3, 80415 ],
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
נסמן ב־$I$ את קטע היחידה $I = [0,1]$.\ נגיד שמרחב מטרי $(X,d)$ הוא קשיר מסילתית אם לכל $x_0, x_1 in X$ קיימת מסילה $gamma: I arrow.r X$ כך ש־$gamma(0)=x_0, gamma(1)=x_1$.

#subquestion()
נוכיח כי אם $f: X arrow.r Y$ פונקציה רציפה ועל כך ש־$X$ קשיר מסילתית אז גם גם $Y$ קשיר מסילתית.
#proof[
  תהיינה $y_1, y_2 in f(X)$ ולכן קיימים $x_1, x_2$ כך שמתקיים $f(x_1)=y_1, space f(x_2)=y_2$.\
  $X$ קשיר מסילתית ולכן קיימת מסילה $gamma : [0,1] arrow.r X$ כך שמתקיים $gamma(0)=x_1, space gamma(1) = x_2$.\
  נסתכל על ההרכבה $phi = f compose gamma : [0,1] arrow.r f(X)$ שרציפה מהרכבת פונקציות רציפות.\
  בפרט, מתקיים $phi(0)=y_1$ ו־$phi(1) = y_2$ ולכן $f(X)$ קשירה מסילתית.
]

#subquestion()
נוכיח כי אם $f : X arrow.r Y$ פונקציה רציפה, חד־חד ערכית ועל כך ש־$X$ קומפקטי אזי $f$ היא הומיאומורפיזם.
#proof[
  עלינו להראות ש־$f$ על ו־$f^(-1)$ רציפה.\
  נצמצם את $f$ להיות $f : X arrow.r f(X) harpoon.tr Y$. היות ו־$X$ קומפקטי ו־$f$ רציפה, ולכן $f(X) subset.eq Y$ קבוצה קומפקטית, ולכן סגורה וחסומה.\
  בפרט, נובע כי $f$ היא פונקציה חד־חד ערכית ועל.\
  $f(X) subset.eq Y$ היא קבוצה קומפקטית ולכן סגורה וחסומה ו־$X$ קבוצה סגורה (כי $X$ קומפקטי) ולפי התנאים השקולים לרחציפות נובע כי $f^(-1)$ היא פונקציה רציפה (כאשר $f^(-1) : f(X) arrow.r X$ והמקור של קבוצה סגורה בפונקציה רציפה היא קבוצה סגורה).\
  מצאנו ש־$f$ חד־חד ערכית, על, רציפה ו־$f^(-1)$ רציפה ולכן $f$ הומיאומורפיזם (כמובן שקיים שיכון $g : f(X) arrow.r Y$ כך ש־$g compose f = f$ כאשר מסתכלים על $f : X arrow.r Y$).
]

#subquestion()
נוכיח כי אם $gamma : I arrow.r I^2$ מסילה ממלאת שטח (כלומר על) אז היא אינה חד־חד ערכית.
#proof[
  נעזר ברמז, נראה תחילה כי $I without {1/2}$ אינה קשירה מסילתית: נסתכל על $x_1 = 1/4, x_2 = 3/4 in I$, ונניח כי $I without {1/2}$ הוא קשיר מסליתית.\
  אז קיימת $gamma : I arrow.r I without {1/2}$ מ־$1/4$ ל־$3/4$.\
  $gamma$ רציפה והיא ממקטע למקטע ולכן התמונה שלה היא גם מקטע ולכן קיים $s in I$ כך שמתקיים $gamma(s)=1/2$ (גם ממשפט ערך הביניים),\ אבל $1/2 in.not I without {1/2}$ וזו סתירה ולכן $I without {1/2}$ אינה קשירה מסילתית.\
  תהיי $(x,y) in I^2$ ונראה כי $I^2 without {(x,y)}$ קשירה מסילתית:
  יהיו $p, q in I^2 without {(x,y)}$ ונראה שקיימת מסילה רציפה $gamma : [0,1] arrow.r I^2 without {(x,y)}$ כך שמתקיים
  $ gamma(0) = p, gamma(1)=q $
  נגדיר קו ישר בין $p$ לבין $q$
  $ ell(t) = (1-t)p + t q, t in [0,1] $
  אם $(x, y) in.not im(ell)$ אזי $ell(t) in I^2 without {(x,y)}$ וסיימנו.\
  לכן נניח כי $(x, y) in im(ell)$. יהי $epsilon > 0$ ונגדיר $r = (x, y + epsilon)$ כאשר $epsilon$ קטן דיו כך ש־$r!=p, r!=q$.\
  נגדייר את המסילה $gamma:[0,1] arrow.r I^2 without {(x,y)}$ על־ידי
  $ gamma(t) = mycases((1-2t)p + 2t r, 0<=t<=1/2, (1-2(t--1/2))r+2(t-1/2)q, 1/2<=t<=1) $
  זאת אומרת, עבור $t in [0, 1/2]$ אני זזה בצורה לינארית מ־$p$ ל־$r$ ועבור $t in [1/2, 1]$ אני זזה בצורה לינארית מ־$r$ ל־$q$, וככה אני לא עוברת בנקודה $(x, y)$ ו־$gamma(t) in I^2 without {(x,y)}$ לכל $t in [0,1]$.\
  נשאר רק להראות ש־$gamma$ רציפה: $gamma$ רציפה בכל $0<= t < 1/2$ ובכל $1/2 < t <= 1$ כהרכבה של פונקציות רציפות ולכן נשאר לראות שהיא רציפה ב־$1/2$. נשים לב שמתקיים:
  $ lim_(t arrow.r frac(1, 2)^(minus)) gamma(t) = r = lim_(t arrow.r frac(1, 2)^(plus)) gamma(t) $
  מצאנו כי בין כל $p, q in RR^2 without {(x,y)}$ קיימת מסילה, ולכן $I^2 without {(x,y)}$ קשירה מסילתית.\
  כעת, נניח בשלילה כי $gamma$ כן חד־חד ערכית. היות ו־$gamma$ רציפה, חד־חד ערכית ועל נובע כי $I$ ו־$I^2$ איזומורפיים אחד לשני ונסמן $gamma(1/2) = (x_0,y_0)$.\
  בפרט, גם $gamma : I without {1/2} arrow.r I^2 without {(x_0,y_0)}$ היא חד־חד ערכית ועל, שכן הורדנו את המקור ואת התמונה של המקור ובכך שימרנו את האיזומורפיזם (אך לא בהכרח את הרציפות).\
  אבל $I without 1/2$ לא קשירה מסילתית לפי מה שהראינו לעיל ו־$I^2 without {(x_0, y_0)}$ כן קשירה מסילתית וזו סתירה: המרחבים לא יכולים להיות הומיאמורפים אם הם לא משמרים תכונות טופולוגיות (כפי שראינו בתרגול 3).\
  קיבלנו סתירה להנחה כי $gamma$ חד־חד ערכית ולכן $gamma$ לא חד־חד ערכית, כנדרש.

]

#question()
יהי $(X,d)$ מרחב מטרי חסום לחלוטין.

#subquestion()
נראה כי קיימת תת־קבוצה $A subset.eq X$ צפופה ובת־מנייה.
#proof[
  מהיות $X$ מרחב מטרי חסום לחלוטין זה בפרט אומר כי $A subset.eq X$ (שכן אם אפשר לכסות את המרחב כולו על־ידי $epsilon$־רשת סופית, בפרט אפשר תת־קבוצה).\
  לכן, נובע שלכל $n in NN$ קיימת $D_n$ קבוצה סופית כך ש־$display(X subset.eq union.big_(x in D_n) B_(1/n) (x))$ ותהיי $display(D = union.big_(n=1)^infinity D_n)$.\
  $D$ בת־מנייה כאיחוד בן־מנייה של קבוצות סופיות ולכן נשאר רק להראת ש־$D$ צפופה: יהיו $epsilon >0$ ו־$B_epsilon (y) in X$ כדור פתוח. \
  יהי $n in NN$ כך שמתקיים $1/n < epsilon$ ולכן $display(y in X subset.eq union.big_(x in D_n) B_(1/n) (x))$.\
  לכן קיים $x in D_n subset.eq D$ כך שמתקיים $y in B_(1/n) (x)$ משמע $d(x,y)<1/n<epsilon$ ולכן $x in B_epsilon (y)$ ולכן $D$ צפופה ו־$D subset.eq X$ בת־מנייה וצפופה.
]

#subquestion()
נוכיח כי ההשלמה $(hat(X), hat(d))$ היא קומפקטית.
#proof[
  ראשית, אנחנו יודעים שבמרחבים מטריים קומפקטיות וקומפקטיות סדרתית שקולות.\
  שנית, אנחנו יודעים שמרחב מטרי הוא קומפקטי סדרתית אם ורק אם הוא שלם וחסום לחלוטין.\
  כעת, אנחנו יודעים שההשלמה $(hat(x), hat(d))$ היא מרחב שלם ואם נראה שהוא גם חסום לחלוטין אז מהטענה לעיל נקבל את הקומפקטיות:\
  יהי $epsilon > 0$, $X$ מרחב מטרי חסום לחלוטין ולכן $display(X subset.eq union.big_(i=1)^N B_(epsilon/2) (x_i))$
  כאשר $x_1, ..., x_n$ זה בעצם $epsilon/2$־רשת.\
  נסתכל על ההעתקה $i: X arrow.r hat(X)$ האיזומטריה שנובעת מההשלמה.\
  ידוע כי $i(X)$ צפופה ב־$hat(X)$ ולכן לכל $y in hat(X)$ ו־$delta>0$ קיים $x in X$ כך שמתקיים $d(x,y) < delta$.\
  יהי $y in hat(X)$ בפרט הטענה לעיל נכונה עבור $delta = epsilon/2$ ולכן קיים $x in X$ כך שמתקיים $d(x,y) < delta = epsilon/2$.\
  היות ו־$x in X$ נובע מכך ש־$X$ מרחב מטרי חסום לחלוטין שקיים $x_i$ מהכיסוי לעיל כך שמתקיים $d(x,x_i) < epsilon/2$, מאי־שיוויון המשולש נקבל
  $ d(y, x_i) <= d(y, x) + d(x, x_i) < epsilon / 2 + epsilon / 2 = epsilon $
  משמע עבור $epsilon>0$ מתקיים $display(hat(X) subset.eq union.big_(i=1)^N B_epsilon (x_i))$ ולכן $hat(X)$ מרחב מטרי חסום לחלוטין גם־כן.\
  $hat(X)$ חסום לחלוטין ושלם ולכן קומפקטי סדרתית ועל־כן קומפקטי.
]

#question()
תהיי $gamma : I arrow.r X$ מסילה במרחב מטרי $(X,d)$ ונסמן את תמונתה ב־$C = gamma(I)$.\
נוכיח כי לכל פונקציה רציפה $f : C arrow.r RR$ ו־$t in [f(a), f(b)]$ עבור $a,b in C$, קיים $c in C$ כך שמתקיים $f(c)=t$.
#proof[
  תהיי $f : C arrow.r RR$ רציפה ונסתכל על ההרכבה (הרציפה, כי מסילה היא רציפה) $h = f compose gamma : I arrow.r RR$.\
  מהגדרת המסילה $gamma$ מתקיים $h(0) = f(gamma(0)), h(1) = f(gamma(1))$ .\
  היות ו־$a, b in C$ נובע כי קיימים $i_a, i_b$ כך שמתקיים $gamma(i_a) = a, gamma(i_b) = b$, ולכן
  $ h(i_a) = f(gamma(i_a)) = f(a), h(i_b) = f(gamma(i_b)) = f(b) $
  היות ו־$h$ רציפה ו־$t in [h(i_a), h(i_b)]$ ממשפט ערך הביניים לפונקציות רציפות נובע שקיים $s in [i_a, i_b]$ כך ש־$h(s)=t$, ולכן אם נבחר $c = gamma(s) in C$ נקבל $f(c) = t$, כנדרש.
]

#question()
תהיי $A in M_(m times n) (RR)$ עבור $n,m>=1$.

#subquestion()
נוכיח כי $norm(A)_F = sqrt(tr(A^t A))$ כאשר $norm(dot.op)_F$ היא הנורמה האוקלידית תחת הזיהוי $M_(m times n) (RR) tilde.eq.rev RR^(n m)$.
#proof[
  $A in M_(m times n) (RR)$ ולכן $A^t in M_(n times m) (RR)$ ו־$A^t A in M_(n times n) (RR)$. מהגדרת העקבה מתקיים
  $ tr(A^t A) = sum_(i=1)^n (A^t A)_(i i) =_((1)) sum_(i=1)^n sum_(k=1)^m A_(k i)^2 $
  כאשר $(1)$ נובע מהיות $display((A^t A)_(i i) = sum_(k=1)^m A_(k i)^2)$
  לפי מה שראינו בתרגול
  $ norm(A)_F = sqrt(sum_(i=1)^m sum_(j=1)^n abs(A_(i j))^2) $
  ואכן
  $
    norm(A)_F = sqrt(sum_(i=1)^m sum_(j=1)^n abs(A_(i j))^2) = sqrt(tr (A^t A)) = sqrt(sum_(i=1)^n sum_(k=1)^m A_(k i)^2)
  $
]

#subquestion()
נוכיח כי לכל שתי מטריצות אורתוגונליות $P in M_(n times n) (RR)$ ו־$Q in M_(m times m) (RR)$ מתקיים כי
$ norm(Q A P)_F = norm(A)_F, norm(Q A P)_"op" = norm(A)_"op" $
#proof[
  נתחיל מלהראות את $norm(Q A P)_F = norm(A)_F$, נשים לב שמתקיים מסעיף א'
  $
    norm(Q A P)_F = sqrt(tr((Q A P)^t (Q A P)))=sqrt(tr((P^t A^t Q^t)(Q A P)))=sqrt(tr(P^t A^t A P))=_((1))sqrt(tr(P^(-1) A^t A P)) =_((2)) sqrt(tr(A^t A)) = norm(A)_F
  $
  כאשר $(1)$ נובע מהיות $P$ מטריצה אורתוגונלית ולכן הפיכה ו־$(2)$ נובע מהיות המטריצה $A^t A$ מטריצה ריבועית ומהזהות
  $ tr(P^(-1)(A P)) = tr((A P)P^(-1)) = tr(A) $
  כאשר $(1)$ נובע מהיות המטריצה $A^t A$ מטריצה ריבועית ומהיות $P$ מטריצה אורתוגונלית ולכן הפיכה.\
  נעבור להוכחת $norm(Q A P)_"op" = norm(A)_"op"$. נשים לב שכמעט מאותם שיקולים בהוכחה לעיל מתקיים $ norm(Q A P)_"op" = sqrt(lambda_max ((Q A P)^t (Q A P) )) = sqrt(lambda_max ((P^t A^t Q^t)(Q A P)))) = sqrt(lambda_max (P^t A^t A P)) =_((1)) sqrt(lambda_max (P^(-1) A^t A P)) \
  =_((2)) sqrt(lambda_max (A^t A)) = norm(A)_"op" $
  כאשר $(1)$ זה כמו במקרה הקודם ו־$(2)$ נובע מהיות המטריצות $M = P^(-1) A^t A P$ והמטריצה $B = A^t A$ מטריצות דומות ולכן בפרט יש להן את אותן ערכים העצמיים.
]
#pagebreak()

#subquestion()
נוכיח כי אם $A in M_(n times n) (RR)$ מטריצה סימטרית אז $norm(A)_"op" = lambda_max (A)$.
#proof[
  $A$ סימטרית ולכן $A^t = A$ ובפרט $A^t A = A A = A^2$.\
  $A$ סימטרית ולכן נורמלית, לכסינה אורתוגונלית ועוד הרבה תכונות יפות. ממשפט הפירוק הספקטרלי (עבור מטריצות הרמיטיות ממשיות), קיימות מטריצה אורתוגונלית ממשית $Q$ ומטריצה אלכסונית ממשית $D$ כך שמתקיים
  $ A = Q D Q^t $
  ולכן
  $ A^2 = (Q D Q^t)(Q D Q^t) = Q D Q^t Q D Q^t =_((1)) Q D^2 Q^t $
  כאשר $(1)$ נובע מהיות $Q$ מטריצה אורתוגונלית ולכן $Q Q^t = Q^t Q = I$.\
  היות ו־$D$ היא המטריצה האלכסונית הממשית המכילה את הערכיים העצמיים (הממשים, כי $A$ סימטרית) של $A$ אז $D^2$ מכילה את הערכיים העצמיים בריבוע של $A$.\
  במילים אחרות, עבור מטריצה סימטרית הערכיים העצמיים של $A^2$ הם ריבוע הערכיים העצמיים של $A$.\
  נסמן ב־$lambda_(A_max) = max { abs(lambda_1), abs(lambda_2), ..., abs(lambda_n) )}$ את הערך העצמי הגדול ביותר (בערך מוחלט) של $A$, ולכן $lambda_(A^2_max) = lambda_(A_max)^2$.\
  נזכיר $norm(A)_"op" = sqrt(lambda_max (A^t A))$ ולכן במקרה שלנו מתקיים
  $ norm(A)_"op" = sqrt(lambda_(A^2_max)) = sqrt(lambda_(A_max)^2) = lambda_(A_max) = lambda_max (A) $
]

#subquestion()
נוכיח כי לכל $B in M_(n times k) (RR)$ מתקיים כי
$ norm(A B)_F <= norm(A)_"op" norm(B)_F <= norm(A)_F norm(B)_F $
#proof[
  נשים לב – $A B in M_(m times k) (RR)$, ואנחנו מדברים על נורמות ולכן רק מספרים אי־שליליים (ובפרט חיוביים כי ב־$0$ הטענה טריוויאלית), אז נוכל להעלות בריבוע כדי להיפטר מהשורש וזה לא ישפיע על התוצאה.\
  נראה תחילה שמתקיים $norm(A B)_F <= norm(A)_F norm(B)_F$:
  $
    norm(A B)_F^2 = sum_(i=1)^m sum_(j=1)^k abs((A B)_(i j))^2 = sum_(i=1)^m sum_(j=1)^k abs(sum_(k=1)^n a_(i k) b_(k j)) &<=_((1))
    sum_(i=1)^m sum_(j=1)^k (sum_(k=1)^n abs(a_(i k))^2 sum_(k=1)^n abs(b_(k j))^2) \
    &= sum_(i=1)^m sum_(j=1)^k (sum_(k,l=1)^n abs(a_(i k))^2 abs(b_(l j))^2)\
    &= sum_(i=1)^m sum_(j=1)^k abs(a_(i k))^2 sum_(l=1)^n sum_(j=1)^k abs(b_(l j))^2 \
    &= norm(A)_F^2 norm(B)_F^2
  $
  כאשר $(1)$ נובע מאי־שיוויון קושי־שוורץ, ולכן $norm(A B)_F <= norm(A)_F norm(B)_F$.\
  בתרגול ראינו שמתקיים
  $ norm(A)_"op" <= norm(A)_F <= sqrt(n) norm(A)_"op" $
  אז בפרט יתקיים
  $ norm(A)_"op" norm(B)_F <= norm(A)_F norm(B)_F $
  נשאר רק להראות שמתקיים גם
  $norm(A B)_F <= norm(A)_"op" norm(B)_F$.\
  ניזכר בהגדרה של כפל מטריצות ונסמן $B = [b_1, b_2, ..., b_k] in RR^(n times k)$ וקטורי העמודה של $B$, ולכן $A B = [A b_1 A b_2 ...A b_k]$.

  #colbreak()

  ולכן $ norm(A B)_F^2 = sum_(j=1)^k norm(A b_j)_2^2 $
  זה נובע מסעיף א' ומהסתכלות על וקטורי עמודה וגם זה די מהגדרת נורמת פרובניוס.\
  במטלה 1 ראינו שמתקיים $norm(A b_j)_2 <= norm(A)_"op" norm(b_j)_2$ ולכן בפרט מתקיים $norm(A b_j)^2 <= norm(A)_"op"^2 norm(b_j)_2^2$ ולכן
  $
    norm(A B)_F^2 = sum_(j=1)^k norm(A b_j)_2^2 <= norm(A)_"op"^2 sum_(j=1)^k norm(b_j)_2^2 = norm(A)_"op"^2 norm(B)_F^2
  $
  ולכן קיבלנו גם שמתקיים $norm(A B)_F <= norm(A)_"op" norm(B)_F$.\
  בסך־הכל ראינו שמתקיים $norm(A B)_F <= norm(A)_"op" norm(B)_F <= norm(A)_F norm(B)_F$.
]

#question()
תהיי $A in M_(2 times 2) (RR)$ המטריצה הבאה
$ A = mat(2, 3 ; 0, -2) $

#subquestion()
נחשב את $norm(A)_F$ ואת $norm(A)_"op"$
#solution[
  $
    norm(A)_F = sqrt( sum_(i=1)^2 sum_(j=1)^2 abs(A_(i j))^2)=sqrt(abs(A_ (1 1))^2 + (A_ (1 2))^2 + (A_ (2 1))^2 + (A_ (2 2))^2)= sqrt(4 + 9 + 0 + 4) = sqrt(17)
  $
  עבור הנורמה האופרטורית, ניזכר כי $norm(A)_"op" = sqrt(lambda_max (A^t A))$, כאשר $lambda_max = max {abs(lambda_1), abs(lambda_2)}$, כאשר $lambda_1, lambda_2$ הם הערכים העצמיים של $A^t A$.
  $ A^t A = mat(2,0 ; 3, -2) mat(2,3 ; 0, -2) = mat(4, 6; 6, 13) $
  זוהי מטריצה סימטרית ולכן כל ערכייה העצמיים ממשיים, נמצא אותם:
  $
    det mat(delim: "[", 4-lambda, 6; 6, 13-lambda) = (4-lambda)(13-lambda)-36 = 52-17lambda+lambda^2-36 = lambda^2-17lambda+16 => (lambda-1)(lambda-16) = 0
  $
  ולכן $lambda = 1, lambda = 16$ הם ערכיים עצמיים של $A^t A$ ולכן $lambda_max = 16$ ונקבל $norm(A)_"op" = sqrt(lambda_max (A^t A)) = sqrt(16) =4$.
]

#subquestion()
נראה כי $A$ לכסינה אך $lambda_max (A) < norm(A)_"op"$.
#proof[
  נראה כי $A$ לכסינה, נמצא ערכים עצמיים:
  $ det mat(delim: "[", lambda - 2, -3; 0, lambda+2 ) = (lambda-2)(lambda+2) $
  מצאנו של־$A$ יש שני ערכים עצמיים שונים ($lambda = plus.minus 2$) והיא ממימד $2$ ולכן $A$ לכסינה ואכן מתקיים
  $ lambda_max (A) = max {2, -2} = 2 <_((1)) 4 = norm(A)_"op" $
  כאשר $(1)$ נובע מסעיף א'.
]
