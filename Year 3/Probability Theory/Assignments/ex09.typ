#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 09 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
_תזכורת (חסם האיחוד)_: יהיו ${A_i}_(i in I) subset.eq cal(F)$ אוסף סופי או בן־מנייה של מאורעות, אזי
$ PP(union.big_(i in I) A_i) <= sum_(i in I) PP(A_i) $

#subquestion()
נוכיח שבמרחב הסתברות בדיד טענה דומה עובדת גם עבור אוסף אינסופי לא בן־מנייה של מאורעות.

#proof[
  יהי $(Omega, cal(F), PP)$ מרחב הסתברות בדיד ו־$Omega$ בת־מנייה.\
  במרחב זה מתקיים עבור $A in Omega$
  $ PP(A)=sum_(omega in A) PP({omega}), space p_omega colon.eq PP({omega}) $
  ראשית נוכיח כי $PP({w}>0)$ עבור כמות לכל היותר בת־מנייה של $omega in Omega$: לכל $n in NN$ נגדיר
  $ S_n colon.eq {omega in Omega bar p_omega >=1/n} $
  ונטען כי $S_n$ היא סופית, כי אחרת
  $ sum_(omega in S_n) p_omega >= sum_(omega in S_n) 1/n = infinity $
  אבל זו סתירה להיות $PP(Omega)=1$ ולכן $S_n$ סופית.\
  אז אם $p_omega > 0$, קיים $n in NN$ כך ש־$p_omega >=1/n$ ולכן
  $ Omega^plus colon.eq {omega bar p_omega > 0 } = union.big_(n=1)^infinity S_n $
  זה איחוד בן־מנייה של קבוצות סופיות ולכן בן־מנייה.\
  נשים לב שלכל $i$ מתקיים $A_i inter Omega^plus$ היא לכל היותר קבוצה בת־מנייה ולכן גם $union.big_(i in I) (A_i inter Omega^plus)$ היא קבוצה לכל היותר בת־מנייה, אז אם נגדיר
  $ I_0 colon.eq {i in I bar A_i inter Omega^plus != emptyset} $
  אז $I_0$ היא תת־קבוצה של קבוצה שלכל היותר בת־מנייה
  ולכן $I_0$ היא לכל היותר בת־מנייה ולכל $i in.not I_0$ מתקיים $PP(A_i) = 0$, אז
  $ PP(union.big_(i in I) A_i) = PP(union.big_(i in I_0) A_i) $
  כי הוצאנו מאורעות עם הסתברות אפס.\
  אבל $I_0$ היא לכל היותר בת־מנייה ולכן חסם האיחוד תקף עליה, כלומר
  $ PP(union.big_(i in I_0) A_i)<= sum_(i in I_0) PP(A_i) $
  ושוב בגלל שלכל $i in I_0$ מתקיים $PP(A_i)=0$
  $ sum_(i in I_0) PP(A_i) = sum_(i in I) PP(A_i) $
  כלומר
  $ PP(union.big_(i in I) A_i) <= sum_(i in I) PP(A_i) $
]

#subquestion()
נביא דוגמה למרחב הסתברות לא בדיד בו טענה דומה לא עובדת עבור אוסף אינסופי לא בן־מנייה של מאורעות.

#proof[
  (אני עושה במקביל תורת המידה אז ממש נדרשת דוגמה כזאת, סליחה).\
  ניקח $(Omega, cal(F), PP) = ([0,1], cal(B)([0,1]), lambda)$ כאשר $lambda$ היא מידת לבג.\
  זה מרחב הסתברות כי מידת לבג היא אי־שלילית כאורך של קטע, $ PP([0,1])=PP(Omega)=lambda([0,1])=1 $
  ואנחנו צריכים סכימות בת־מנייה לסדרת מאורעות זרים וזה מתקיים (בלי שנשתמש בכלים של מידה) כי האורך של סכום של קטעים זרים זה לזה ברמה הגיאומטרית תהיה פשוט סכום כל הקטעים.\
  אז זה אכן מרחב הסתברות והוא לא בדיד (אנחנו לא עומדים באיפיון מרחב הסתברות בדידה – לא קיימת קבוצה בת־מנייה כך שההסתברות נתמכת עליה).\
  לכל $x in [0,1]$ נגדיר $A_x colon.eq {x}$ ולכן ${A_x}_(x in [0,1])$ היא משפחה לא בת־מנייה וידוע כי
  $ PP(A_x) = lambda({x})=0 $
  אז
  $ sum_(x in [0,1]) PP(A_x) = 0 $
  כסכום של אפסים.\
  מצד שני,
  $ union.big_(x in [0,1]) A_x = union.big_(x in [0,1]) {x} = [0,1] $
  אבל
  $ PP(union.big_(x in [0,1]) A_x) = lambda([0,1]) = 1 != 0 =sum_(x in [0,1]) PP(A_x) $
  אז בפרט
  $ PP(union.big_(x in [0,1]) A_x) lt.eq.not sum_(x in [0,1]) PP(A_x) $
]
#question()
יהי $X~Unif([4,7])$ ונחשב את פונקציות ההתפלגות המצטברת ופונקציית הצפיפות של המשתנה המקרי $Y=X^2$.

#solution[
  ראינו בהרצאה שמתקיים עבור משתנה מקרי אחיד $Z~Unif([a,b])$ מתקיים
  $ f_Z (x) = (bb(1)_([a,b]) (x))/(b-a), wide F_Z (t) = mycases(0, t<a, (t-a)/(b-a), a<=t<=b, 1, t>b) $
  ולכן במקרה שלנו עבור $4<=x<=7$
  $ f_X (x)= 1/(7-4) = 1/3, wide F_X (t) = (t-4)/3 $
  מהיות $Y=X^2$ אז המינימום מתקבל ב־$Y =4^2=16$ והמקסימום מתקבל כאשר $Y=7^2=49$ ולכן $supp(Y)=[16,49]$.\
  בשביל פונקציית ההתפלגות המצטברת
  $ F_Y (y) = PP(Y<=y) = PP(X^2<=y) $
  מהיות $X~Unif([4,7])$ אז כל הערכים חיוביים ולכן ניתן לקחת מהם שורש, כלומר
  $ F_Y (y) = PP(X<=sqrt(y)) = F_X (sqrt(y)) = (sqrt(y)-4)/3 $
  כלומר
  $ F_Y (y) = mycases(0, y<16, (sqrt(y)-4)/3, 16<=y<=49, 1, y>49) $
  ופונקציית הצפיפות היא לפי אבחנה 8.14
  $
    f(y) = mycases(F'_Y (y), y"גזירה ב־" F_Y, 0, "אחרת") = mycases(1/3 dot.op 1/2 y^(-1/2), y"גזירה ב־" F_Y, 0, "אחרת") = mycases(1/(6sqrt(y)), y"גזירה ב־" F_Y, 0, "אחרת")
  $
]

#question()
יהי $X$ משתנה מקרי רציף בהחלט ותהיי $alpha>1$, נתון כי
$ F_X (t) = mycases(0, x<0, (1+x)^alpha-1, 0<=x<=beta, 1, beta<x) $
נמצא את $beta$ ונחשב את פונקציית הצפיפות של $X$.

#solution[
  מהיות $X$ משתנה מקרי רציף בהחלט ומתכונות פונקציית ההתפלגות המצטברת כמונוטונית עולה חלש ועולה מאפס לאחת מתקיים
  $ lim_(x arrow.r beta^minus) F_X (x) = F_X (beta) = 1 $
  (כי מהרציפות בהחלט היא רציפה גם מימין מהגדרת פונקציית ההתפלגות המצטברת ורציפה משמאל בזכות הרציפות בהחלט).\
  וכן
  $ F_X (beta) = (1+beta)^alpha-1 = 1 <==> (1+beta)^alpha=2 <==> 1+beta = 2^(1/alpha) <==> beta = 2^(1/alpha)-1 $
  ואכן מהיות $alpha>1$ נובע כי $0<1/alpha<1$ ולכן בפרט $2^(1/alpha)>1$ ולכן $x>=0$ וגם הרציפות נשמרת כי
  $ F_X (0) = (1+0)^alpha -1 =1 - 1 = 0 $ שתקין עבור $x<0$ ומשמר רציפות.\
  עבור פונקציית הצפיפות, שוב נשתמש באבחנה 8.14 שנגזרת של פונקציית ההסתברות המצטברת היא פונקציית צפיפות:
  $
    f(x) = mycases(F'_X (x), x"גזירה ב־" F_X, 0, "אחרת")=mycases(alpha(1+x)^(alpha-1), 0<=x<=2^(1/alpha)-1, 0, "אחרת")
  $
]

#question()
יהי $lambda>0$ ויהי $X~Exp(lambda)$

#subquestion()
נחשב את הפונקציה יוצרת מומנטים של $X$.

#solution[
  פונקציית הצפיפות של $X$ היינה
  $ f_X (t) = mycases(lambda e^(-lambda t), t>=0, 0, t<0) $
  ונחשב
  $
    M_X (t) = EE(e^(t X)) = integral_(-infinity)^infinity e^(t s) lambda e^(-lambda s) dif s =_((star)) lambda integral_0^infinity e^(s(t-lambda)) dif s = lim_(S arrow.r infinity) [lambda e^(s(t-lambda))/(t-lambda)]_(s=0)^(s=S)
  $
  כאשר $(star)$ נובע מהיות $f_X (t)$ אפסה לכל $t$ שלילי.\
  נשים לב שכאשר $S arrow.r infinity$ אם $t-lambda > 0$ אז יש לנו חזקה חיובית כלומר $e^S stretch(arrow.r)_(S arrow.r infinity) infinity$ והאינטגרל יתבדר.\
  אם $t-lambda <=0$ אז נקבל בחזקת אפס או בחזקה שקטנה מאחד לכן כאשר $S arrow.r infinity$ האינטגרל ייתכנס.\
  כלומר עבור $t<lambda$ נקבל
  $ M_X (t) = lambda/(lambda-t) $
]

#subquestion()
נוכיח כי $X$ חסר זיכרון, כלומר לכל $s, t> 0$ מתקיים $PP(X>s+t bar X>t)=PP(X>s)$.

#proof[
  בתרגול ראינו שמתקיים
  $
    (star) space F_X (t) = integral_(-infinity)^t f_X (s) dif s = integral_0^t lambda e^(-lambda s) dif s = [-e^(-lambda s)]_(s=0)^(s=t) = 1-e^(-lambda t)
  $
  ניזכר כי
  $ (star star) space F_X (t) = PP(X<=t) $
  ולכן מהגדרת ההסתברות המותנית
  $
    PP(X>s+t bar X>t) = PP(X>s+t, X>t)/PP(X>t) =_"הכלת מאורעות" PP(X>s+t)/PP(X>t) =_("עם משלים" (star star)) (1-F_X (s+t))/(1-F_X (t)) =_((star)) (1-(1-e^(-lambda(s+t))))/(1-(1-e^(-lambda t))) \
    = e^(-lambda(s+t))/e^(-lambda t) = e^(-lambda s) = 1-(1-e^(-lambda s)) =_((star)) 1-PP(X<=s) =_((star star)) PP(X>s)
  $
]

#question()
יהי $X$ משתנה מקרי בעל פונקציית התפלגות מצטברת
$ F_X (t) = mycases(0, t<0, t^2, 0<=t<=1, 1, t>1) $
נחשב את התוחלת והשונות של $X$.

#solution[
  ראשית נשים לב ש־$F_X (t)$ רציפה כי בנקודות האי־רציפות שלה, שהן ${0,1}$ הפונקציות מתלכדות בהגדרת הגבול.\
  אם־כך, אנחנו עומדים בתנאי אבחנה 8.14 – נגזרת פונקציית ההסתברות המצטברת היא פונקציית צפיפות ולכן
  $
    f_X (t) = mycases(F'_X (t), t"גזירה ב־" F_X, 0, "אחרת") = mycases(0, t<=0, 2t, 0<t<1, 0, t>=1) = mycases(2t, 0<t<1, 0, "אחרת")
  $
  נשים לב שב־$t=1$ שהיא נקודה חשודה לנקודת אי־רציפות הפונקציה לא גזירה כי הגבול של הנגזרת מצד אחד הוא $2$ ומצד שני הוא $1$ ולכן לא גזירה.\
  באינטגרל כמובן ניקח עם הקצוות מאי־רגישות האינטגרל לשינוי מספר סופי של נקודות ונקבל:
  $
    EE(X) = integral_(-infinity)^infinity t f_X (t) dif t =_((star)) integral_0^1 2t^2 dif t = [(2t^3)/3]_(t=0)^(t=1) = 2/3 \
  $
  כאשר $(star)$ נובע מהתחום של $f_X (t)$ שמצאנו לעיל.\
  עבור חישוב התוחלת עלינו לחשב $Var(X)=EE(X^2)$ ולכן נשתמש בטענה 8.31 – תוחלת פונקציה של משתנה מקרי: ניקח את $X$ המשתנה המקרי שלנו ואת $g(x) = x^2$, אז $Y=g(X)$ הוא משתנה מקרי המקיים
  $ EE(Y)=integral_(-infinity)^infinity g(t)f_X (t) dif t $
  והוא קיים אם ורק אם האינטגרל מתכנס בהחלט.\
  במקרה שלנו
  $
    Var(X)=EE(X^2)=integral_(-infinity)^infinity t^2 f_X (t) dif t = integral_0^1 2t^3 dif t = [(2t^4)/4]_(t=0)^(t=1)=1/2
  $
]

#question()
יהי $X~Unif([0,1])$ ונוכיח כי לכל $lambda>0$ מתקיים $-1/lambda log(X) ~ Exp(lambda)$.

#proof[
  ראשית
  $ F_X (t) = mycases(0, t<0, t, 0<=t<1, 1, t>1), space f_X (t) = mycases(1, 0<=t<1, 0, "אחרת") $
  תהיי $lambda>0$ ונגדיר $Y=-1/lambda log(X)$.\
  כאשר $x arrow.r 1$ נקבל $Y=-1/lambda log(1) = 0$ וכאשר $x arrow.r 0^plus$ נקבל $Y=-1/lambda log(0^plus) arrow.r infinity$ ולכן $supp(Y) = [0, infinity)$.\
  אנחנו רוצים למצוא את הפונקציית ההתפלגות המצטברת של $Y$ כאשר $y in supp(Y)$
  $
    F_Y (y) = PP(Y<=y)=PP(-1/lambda log(X)<=y) =_(lambda>0 \
    -lambda < 0) PP(log(X)>=-lambda y) =_((star)) PP(X >=e^(-lambda y))=1-PP(X<e^(-lambda y)) = 1-F_X (e^(-lambda y))
  $
  כאשר $(star)$ נובע מלהעלות ב־$e^x$ שהיא מונוטונית ולכן משמרת את הכיוון של האי־שיוויון.\
  אבל לכל $x in [0,1]$ מתקיים $F_X (x) = x$ ולכל השאר אפס ולכן
  $ F_Y (y) = 1-F_X (e^(-lambda y)) = 1-e^(-lambda y) $
  אבל זו בידיוק פונקציית ההתפלגות המצטברת של משתנה מקרי מעריכי כפי שראינו בתרגול ולכן $Y~Exp(lambda)$, כנדרש.
]

#question()
יהיו $X,Y,Z ~ Unif([0,1])$ משתנים מקריים אחידים בלתי־תלויים. נוכיח כי $(X Y)^Z ~ Unif([0,1])$.

#proof[
  נגדיר $W=(X Y)^Z$ ונבחין כי $X,Y<Z >^(a.s) 0$ ולכן ניתן לחשב
  $
    F_W (w) = PP((X Y)^Z <= w)=PP(X Y <= w^(1/Z)) =_((star)) integral_0^1 PP(X Y<=w^(1/z) bar Z = z) dot.op 1 dif z = integral_0^1 PP(X Y<=w^(1/z)) dif
  $
  כאשר $(star)$ נובע מנוסחת ההסתברות השלמה (אנלוגיה מתאימה לרציף כאינטגרל) ועם צמצום התחום של האינטגרל לאזורים שהפונקציה איננה אפס.\
  נבחין כי מהיות $X, Y in (0,1)$ נובע כי $w in (0,1)$ גם כן.\
  נסמן $k=w^(1/z)$ ואנחנו מחפשים את ההסתברות שמכפלה של שני משתנים מקריים בלתי־תלויים אחידים קטנה מ־$k$ ואם נסתכל על זה גיאומטרית זה בידיוק השטח מתחת לעקומה $y=k/x$ על ריבוע היחידה $[0,1] times [0,1]$ ולכן
  $ PP(X Y<=k) = integral_0^k 1 dif x + integral_k^1 k/x dif x $
  כאשר המחובר הראשון מכסה את הקטע בו $x<k$ ושם $y in [0,1]$ והמחובר השני הוא עבור $x>=k$ ששם $y<=k/x$, אז
  $
    PP(X Y<=k) = integral_0^k 1 dif x + integral_k^1 k/x dif x = k+[k ln(x)]_(x=k)^(x=1) = w^(1/z)-w^(1/z)ln(w^(1/z))=w^(1/z)-1/z w^(1/z) ln(w)
  $
  ולכן
  $
    F_W (w) = integral_0^1 w^(1/z)-1/z w^(1/z) ln(w) dif z =_((star star)) [z w^(1/z)]_(z=0)^(z=1) =_((star star star)) w
  $
  עבור $(star star)$ ידוע
  $ dif/(dif z) (z w^(1/z)) =_"נגזרת מכפלה" 1 dot.op w^(1/z) + z dot.op -1/z^2 w^(1/z) ln(w) $
  ועבור $(star star star)$ זה נובע מכך שכאשר $z=1 arrow.r 1 dot.op w^1 = w$ וכאשר $z arrow.r 0^plus$ מהיות $w in (0,1)$, $1/z arrow.r infinity$ ולכן $w^(1/z) arrow.r 0$.\
  כלומר מצאנו שלכל $w in (0,1)$ מתקיים $F_W (w) = w$ וזה בידיוק אומר ש־$W~Unif([0,1])$.
]

