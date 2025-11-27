#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 04 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
עבור $i in {1,2}$, תהיי $Omega_i subset RR$ ותהיי $PP_i$ פונקציית הסתברות בדידה על $Omega_i$ ותהיי $X_i : Omega_i arrow.r RR$ פונקציית הזהות, כלומר $X_i (omega)=omega$.\
נראה כי הבאים שקולים
+ $X_1=^d X_2$
+ $S subset Omega_1 inter Omega_2$ קבוצה בת־מנייה או סופית המקיימת $S = supp(P_1)=supp(P_2)$ ולכל $x in S$ מתקיים $PP_1 ({x}) = PP_2 ({x})$

#proof[\
  נניח את $(1)$ ונראה $1 ==> 2$:\
  מהגדרת שיוויון בהתפלגות, מתקיים $PP_1 = PP_2$.\
  נגדיר $S = supp(PP_1) = supp(PP_2)$ ומהיות $PP_1, PP_2$ פונקציות הסתברות בדידות, ראינו בהרצאה (וטענה 1.12 בספר) שהתומך שלהן הוא בן־מנייה.\
  מהיות $S subset.eq Omega_1, Omega_2$ בפרט נובע $S subset.eq Omega_1 inter Omega_2$ ו־$S$ בת־מנייה ומתקיים מהיות $X_i$ פונקציית הזהות
  $
    P_1 (X_1 = x) = PP({y in S bar y in X^(-1)_1 (x)})=PP({y in S bar x=y}) = PP_1 (x) \
    P_2 (X_2 = x) = PP({y in S bar y in X^(-1)_2 (x)})=PP({y in S bar x=y}) = PP_2 (x)
  $
  $==>$ נניח את $(2)$ ונראה $2 ==> 1$:\
  נשים לב שראינו מקודם שלכל $x in S$ מתקיים $PP_1 (X_1=x)=PP_1 (x)$ וגם $PP_2 (X_2=x)=PP_2(x)$ ולכן מספיק שנראה לכל $x in RR$ מתקיים $PP_1 (x)=PP_2 (x)$.\
  אם $x in RR without S$ אזי $P_1 (x) = 0 = P_2 (x)$ מהגדרת התומך ומההנחה לכל $x in S$ מתקיים $PP_1 (x) = PP_2 (x)$ ולכן נובע ישירות $X_1=^d X_2$.
]

#question()
#subquestion()
נוכיח שאם $f:RR arrow.r RR$ פונקציה חד־חד ערכית, אזי $X=^d Y$ אם ורק אם $f(X)=^d f(Y)$.

#proof[
  הכיוון שאם $X=^Y$ אז $f(X)=^d f(Y)$ הוכח בכיתה לכל $f in cal(F)_(RR arrow.r RR)$, אז נוכיח רק את הכיוון השני.\
  יהי $x in RR$, אם קיים $y in RR$ כך ש־$x = f(y)$ אז $ PP(f(X)=f(y))=PP(f(Y)=f(y)) ==> PP(X=x)=PP(Y=x) $
  מהחד־חד ערכיות.\
  אם לא קיים $y in RR$ כזה, מתקיים $A = {omega in Omega bar omega=X^(-1)(f^(1)(x))}=emptyset$ כלומר $PP(X=x)=PP(emptyset)=0$.
]

#subquestion()
נפריך את הטענה אם $X=^d Y$ אזי $PP(X=Y)>0$.

#proof[
  ניקח את מרחב ההסתברות של הטלת מטבע הוגן פעם אחת ונגדיר
  $ X(omega) = mycases(1, omega = H, 0, omega = T), space Y(omega)=mycases(1, omega=T, 0, omega=H) $
  בעצם הפונקציות המציינות של עץ ופלי בהתאמה.\
  $ PP(X=1)=PP({H})=1/2, space PP(X=0)=PP({T})=1/2, space PP(Y=1)=PP({T})=1/2, space PP(Y=0)=PP({H})=1/2 $
  כלומר לכל $k in {0,1}$ מתקיים $PP(X=k)=PP(Y=k)$ ולכן $X=^d Y$.\
  מצד שני, מתקיים
  $ PP(X=Y) = PP({omega in Omega bar X(omega)=Y(omega)}) = PP(emptyset)=0 $
]

#subquestion()
נסתור את הטענה שאם $X=^d Y$ וגם $X,Y$ בלתי־תלויים אזי $PP(X=Y)>0$.

#proof[
  ניקח מרחב הסתברות של הטלת שתי קוביות הוגנות ונגדיר את המשנים המקריים
  $ X(n,m)=n, space Y(n,m)=m+6 $
  ומתקיים
  $
    PP(X)= abs({(x,m) bar m in [6]})/36 = 6/36 = 1/6 \
    PP(Y=y) = abs({n, y-6} bar n in [6])/36 = 6/36 = 1/6
  $
  נשים לב שהם בלתי־תלויים שכן
  $ PP(X=x, Y=y) = PP((x,y-6)) = 1/36 = 1/6 dot.op 1/6 = PP(X=x)PP(Y=y) $
  וכן $X=^d Y$,  מצד שני
  $ PP(X=Y)=PP({omega in Omega bar X(omega)=Y(omega)}) = PP({1,2,3,4,5,6} inter {7,8,9,10,11,12}) = PP(emptyset)=0 $
]

#pagebreak()

#subquestion()
נוכיח שאם $X$ בלתי־תלוי בעצמו אז קיים $c in RR$ שעבורו $PP(X=C)=1$.

#proof[
  תהיינה $A,B subset.eq RR$,  מהנתון על אי־תלות מתקיים
  $ PP(X in A, X in B) = PP(X in A) PP(X in B) $
  נבחר $A=B={x}$ יחידון, מתקיים
  $ PP(X=x, X=x) = PP(X=x) = PP(X=x)^2 $
  כלומר $p_x = p_x^2 <==> p_x in {0,1}$
  אבל
  $ sum_(x in RR) PP(X=x) = 1 $
  ואמרנו $PP(X=x)=0$ או $PP(X=x)=1$ ולכן קיים בידיוק $x in RR$ יחיד עבורו מתקיים $PP(X=c)=1$ (במילים אחרות, $X =^(a.s.) c$).
]

#subquestion()
נוכיח שאם $X eq.def X^2$ אז קיים $p in [0,1]$ שעבורו $X~Ber(p)$.

#proof[
  מתקיים
  $ PP(X=x)=PP(X^2=x) <==> PP({omega in Omega bar X(omega)=x})=PP({omega in Omega bar X^2 (omega = x)}) $
  עבור $x in {0,1}$ מתקיים $X(omega)=X^2 (omega)$ ואם $x in.not {0,1}$ מתקיים
  $ PP(X=x)=PP(X = sqrt(x))= PP(X = root(4, x)) dots.h.c $
  אם $PP(X=x)!=0$ אז $PP(Omega)=infinity$ בסתירה להגדרת פונקציית ההסתברות ולכן $PP(X=x)=0$, ולכן גם $PP(X=0)+PP(X=1)=1$ ולכן קיים $p in [0,1]$ כך ש־$X~Ber(p)$.
]

#question()
יהיו $X,Y,Z$ משתנים מקריים המקיימים $X=^(a.s) Y$.

#subquestion()
נראה כי לכל פונקציה $f:RR arrow.r RR$ מתקיים $f(X)=^(a.s.) f(Y)$.

#proof[
  מכך שמתקיים $X =^(a.s.) Y$ נובע שמתקיים $PP(X=Y)=PP({omega in X(omega)=Y(omega)})=1$, כלומר $PP(X!=Y)=0$ מהגדרת המשלים.\
  נסמן
  $ N colon.eq {omega in Omega bar X(omega)!=Y(omega)} $
  נרצה להראות ש־$PP(f(X)!=f(y))=0$, אז נגדיר
  $ N_f colon.eq {omega in Omega bar f(X(omega))!=f(Y(omega))} $
  אם $omega in N$, מתקיים $X(omega)!=Y(omega)$ ויכול להיות $f(X(omega))!= f(Y(omega))$ ויכול להיות $f(X(omega))!=f(Y(omega))$.\
  אם $omega in.not N$ מתקיים $X(omega)=Y(omega)$ כמספרים ממשיים ולכן מהגדרת הפונקציה נובע שמתקיים בהכרח $f(X(omega))=f(Y(omega))$, כלומר אם $omega in.not N$ אז בהכרח $omega in.not N_f$.\
  כלומר בהכרח מתקיים $N_f subset.eq N$ וממונוטוניות פונקציית ההסתברות מתקיים $PP(N_f)<=PP(N)=0$.
]

#subquestion()
נוכיח שאם $Z =^(a.s.) Y$ אז $X =^(a.s.) Z$.

#proof[
  נרצה להראות שאם $PP(X!=Y)=0$ וגם $PP(Y!=Z)=0$ אזי $PP(X!=Z)=0$, בדומה לסעיף הקודם נגדיר
  $
    N_(X,Y) colon.eq {omega in Omega bar X(omega)!=Y(omega)} \
    N_(Y,Z) colon.eq {omega in Omega bar Y(omega)!=Z(omega)}
  $
  נסתכל על $N = N_(X,Y) union N_(Y,Z)$ כלומר
  $ N = {omega in Omega bar X(omega)!=Y(omega) or Y(omega)!=Z(omega) } $
  מחסם האיחוד מתקיים
  $ 0<=_"הסתברות אי־שלילית" PP(N) = PP(N_(X,Y) union N_(Y,Z))<= PP(N_(X,Y))+PP(N_(Y,Z)) = 0+0 = 0 $
  אז $PP(N)=0$.\
  נסתכל על $N^c$: אם $omega in N^c$ אזי $omega in.not N_(X,Y), N_(Y,Z)$ ולכן $X(omega)=Y(omega)$ וכן $Y(omega)=Z(omega)$, אבל כפונקציות מעל הממשיים יש לנו טרנזטיביות כלומר $X(omega)=Z(omega)$ וזה גורר שעבור הקבוצה $ N_(X,Z) colon.eq {omega in Omega bar X(omega)!=Z(omega)} $  מתקיים $N_(X,Z) subset.eq N$ ושוב ממונוטוניות פונקציית ההסתברות מתקיים $PP(N_(X,Z)) <= PP(N)=0$ כלומר $PP(X!=Z)=0$ ולכן $X =^(a.s.) Z$.
]

#question()
ניתן דוגמה למרחב הסתברות, למשתנים מקריים עליו $X,Y$ ולפונקציה $f:RR arrow.r RR$ כך שיתקיים
$ f(X) =^(a.s.) f(Y), space X eq.not^(a.s.) Y, space f(X)!=f(Y) $

#solution[
  נגדיר $Omega=[6]$ מרחב ההסתברות של הטלת קובייה *לא הוגנת* כך ש־$p(1)=0, p(n)=1/5$ לכל $n in {2,3,4,5,6}$.\
  נגדיר את המשתנים המקריים
  $ X={(1,1), (2,2),(3,3),(4,4),(5,6),(6,5)}, space Y = {(1,-1), (2,2), (3,3), (4,4), (5,5), (6,6)} $
  מתקיים
  $ PP(X=Y) = PP({omega in Omega bar X(omega)=Y(omega)}) = p(2)+p(3)+p(4) = 3/5 != 1 ==> X !=^(a.s.) Y $
  נגדיר
  $ f(y) = mycases(6, y=5, y, y!=5) $
  ולכן
  $ f(X) = {(1,1), (2,2),(3,3),(4,4),(6,6)} != {(1,-1), (2,2), (3,3), (4,4), (5,6) (6,6)} = f(Y) $
  אבל מתקיים
  $ PP(X=Y)=p(2)=p(3)=p(4)+p(5)+p(6) = 1 ==> f(X) =^(a.s.) f(Y) $
]

#question()
מטילים שלוש קוביות הוגנות ונסמן ב־$X_i$ את המשתנה המקרי שמחזיר את התוצאה בקוביה ה־$i$.\
נגדיר את הוקטור המקרי $X=(X_1,X_2,X_3)$ ונסמן ב־$S subset.eq RR^3$ את הקבוצה $S = {(a,a+1,a+2) bar a in RR}$ ונחשב את ההסתברות למאורע $X in S$.

#solution[
  נשים לב
  $ S = {(1,2,3), (2,3,4), (3,4,5), (4,5,6)} $
  ולכן
  $ PP_X (S) = sum_(i=1)^4 1/6 dot.op 1/6 dot.op 1/6 dot.op 4 dot.op 1/6^3 = 1/54 $
  זה פשוט נובע מהסתברות אחידה יחד עם חישוב של הוקטור בהתאם למרחב הסתברות שלנו (כל שאר המאורעות הם עם הסתברות $0$).
]

#question()
נתאר את ההתפלגות המשותפת של שני משתנים מקריים $X_1 ~ Ber(1/2), X_2 ~ Ber(1/2)$ כך שמכפלתם מקיימת $X_1X_2~Ber(p)$ ונראה שהתפלגות זו נקבעת ביחיות על־ידי הפרמטר $p in [0,1/2]$.\
נקבע עבור אילו ערכי $p$ המשתנים $X_1, X_2$ שווי התפלגות? בלתי־תלויים? שווים כמעט־תמיד? שונים כמעט־תמיד?

#proof[
  מהיות $X_1 ~ Ber(1/2), X_2 ~ Ber(1/2)$ אז $supp(X_1)=supp(X_2) = {0,1}$ ובפרט מתקיים
  $ PP(X_1 = 1, X_2 = 1) = PP(X_1 X_2 = 1) =_(X_1X_2~Ber(p)) p $
  ובאותו אופן
  $ PP(X_1 = 1, X_2 = 0) = PP(X_1=0, X_2 = 1) = PP(X_1)-PP(X_1=1, X_2=1)=1/2-p $
  מהיות $PP({0,1}) = 1$ נשאר
  $ PP(X_1 = 0, X_2 = 0) = 1-PP(X_1 = 1, X_2 = 1)- PP(X_1 = 1, X_2 = 0) - PP(X_1=0, X_2 = 1) = 1 - p-2(1/2-p)=p $
  נקבע עבור אילו ערכי $p$ מתקיים הנדרש:
  + $X_1, X_2$ שווי התפלגות – הם תמיד שווי התפלגות כי שניהם מתפלגים ברנולי $1/2$
  + $X_1, X_2$ בלתי־תלויים: אם לכל $S,T in cal(F)_RR$ מתקיים $PP(X in S, Y in T)=PP(X in S)PP(Y in T)$. ממה שמצאנו לעיל מתקיים
    $ PP(X_1=1, X_2=0) = PP(X_1=0, X_2=1) = 1/2- p, space PP(X_1=1, X_2=1)=p, space PP(X_1=0, X_2=0)=p $
    כלומר השיוויון להגדרת אי־תלות מתקיים אם ורק אם מערכת המשוואות הבאה תתקיים
    $
      cases(
        PP(X_1=1)PP(X_2=0)=PP(X_1=1)PP(X_2=0)=1/2-p,
        PP(X_1=0)PP(X_2=1)=PP(X_1=0)PP(X_2=1)=1/2-p,
        PP(X_1=1, X_2=1)=PP(X_1=1)PP(X_2)=p,
        PP(X_1=0, X_2=0)=PP(X_1=0)PP(X_2=0)=p
      )
    $
    וחישוב ישיר מראה $p=1/4$ שכן $X_1 ~ Ber(1/2), X_2 ~ Ber(1/2)$
  + שווים כמעט־תמיד – נגיד ש־$X =^(a.s.) Y$ אם מתקיים $PP(X=Y)=PP({omega in Omega bar X(omega)=Y(omega)})=1$.\
    אז נניח שהם שווים כמעט־תמיד ולכן מהגדרת התומך
    $ PP(X=Y) = PP(X_1=1, X_2=1) = PP(X_1=1) = 1/2 $
    כלומר הם שווים כמעט־תמיד אם ורק אם $p=1/2$.
  + שונים כמעט־תמיד – נגיד ש–$X,Y$ שונים כמעט־תמיד אם קבוצת הנקודות בהן הם שווים היא ממידה אפס, כלומר $ PP(X!=Y)=PP({omega in Omega bar X(omega)!=Y(omega)})=1 $
    או באופן שקול
    $ PP(X=Y)= PP({omega in Omega bar X(omega)=Y(omega)})=0 $
    כלומר שונים כמעט תמיד אם ורק אם $p=1/2$
]

#question()
יהי $(Omega, cal(F), PP)$ מרחב הסתברות ו־$X:Omega arrow.r RR$ וקטור מקרי.

#subquestion()
נפריך את הטענה שאם $(Omega, cal(F), PP)$ אחיד אז $X$ מתפלג אחיד על תת־קבוצה סופית של $RR$.

#proof[
  ניקח את $Omega = {omega_1, omega_2, omega_3, omega_4}$ מרחב אחיד ולכן לכל $i in [4]$ מתקיים $PP({omega_i})=1/4$.\
  נגדיר $X: Omega arrow.r RR$ על־ידי $X(omega_1)=0, X(omega_2)=0, X(omega_3)=0,X(omega_4)=1$ והתחום של $X = {0,1} subset.eq RR$ סופית.
  אבל
  $
    PP(X=0) = PP({omega_1, omega_2, omega_3}) = 3/4, \
    PP(X=1) = PP({omega_4})=1/4
  $
  כלומר $X$ לא מתפלג אחיד.
]

#subquestion()
נפריך את הטענה שאם $X$ מתפלג אחיד על תת־קבוצה כלשהי של $RR$ אזי $(Omega, cal(F), PP)$ אחיד.

#proof[
  ניקח $Omega = {omega_1, omega_2, omega_3}$ ונגדיר
  $ PP({omega_1}) = 1/2, PP({omega_2})=PP({omega_3})=1/4 $
  ונגדיר $X: Omega arrow.r RR$ על־ידי $X(omega_1)=0, X(omega_2)=X(omega_3)=1$ כאשר הטווח הוא שוב ${0,1}$.\
  אז
  $
    PP(X=0)=PP({omega in Omega bar X(omega)=0})=PP({omega_1})=1/2 \
    PP(X=1) = PP({omega in Omega bar X(omega)=1}) = PP({omega_2, omega_3}) = PP({omega_2})+PP({omega_3})=1/2
  $
  כלומר $X$ מתפלג אחיד אבל המרחב לא.
]
