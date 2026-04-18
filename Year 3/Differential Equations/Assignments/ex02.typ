#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 02 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
נוכיח את אי־שיוויון המשולש האינטגרלי: אם $f:Q arrow RR^n$ אינטגרבילית אזי
$ norm(integral_Q f(x) dif x)_2 <= integral_Q norm(f(x))_2 dif x $

#proof[
  $f$ אינטגרבילית ולכן היא אינטגרבילית קורדינאטה־קורדינאטה, נגדיר $v=integral_Q f(x) dif x$ זה וקטור.\
  אם $v=0$ אז אי־השיוויון טריוויאלי, אחרת נגדיר $u = v/norm(v)_2$ ואז $norm(u)_2 = 1$.\
  מהגדרת המכפלה הפנימית
  $ norm(v)_2 = u dot.op v = u dot.op integral_Q f(x) dif x = integral_Q u dot.op f(x) dif x $
  ומאי־שיוויון קושי־שוורץ נקבל ישירות
  $ u dot.op f(x) <= norm(u)_2 dot.op norm(f)_2 = norm(f)_2 $
  כלומר
  $ norm(v)_2 = integral_Q u dot.op f(x) dif x <= integral_Q norm(f)_2 dif x $
  ולכן
  $ norm(integral_Q f(x) dif x)_2 <= integral_Q norm(f(x))_2 dif x $
  אפשר להראות גם עם סכומי רימן: $f$ אינטגרבילית קורדינאטה־קורדינאטה על תיבה $Q$ ולכן יש חלוקה של $Q$ לתיבות קטנות $Q_i$ ונבחר $x_i in Q_i$ אז נגדיר את הוקטור
  $ S = sum_(i=1)^N f(x_i) abs(Q_i) $
  ומאי־שיוויון קושי־שוורץ
  $ norm(S)_2 <= sum_(i=1)^N norm(f(x_i) abs(Q_i))_2 = sum_(i=1)^N abs(Q_i) norm(f(x_i))_2 $
  ובפרט בלקיחת גבולות מהגדרת סכומי רימן
  $
    integral_Q f(x) dif x = lim_(N arrow infinity) sum_(i=1)^N f(x_i) abs(Q_i) <= lim_(N arrow infinity) sum_(i=1)^N norm(f(x_i))_2 abs(Q_i) = integral_Q norm(f(x))_2 dif x
  $
]

#question()
יהי $delta>0$ ו־$a,u : [0, delta) arrow RR$ כך ש־$a$ רציפה ו־$u$ גזירה ברציפות.\
נניח כי לכל $t in (0,delta)$ מתקיים
$ u'(t)<=a(t) u(t) $

#subquestion()
נוכיח כי $v(t)=e^(integral_0^t a(s) dif s)$ היא פיתרון לבעיה
$ cases(v'(t) = a(t)v(t), v(0)=1) $

#proof[
  נסמן $g(t) = integral_0^t a(s) dif s$ ונגזור את $v(t)$ לפי כלל־שרשרת
  $ v'(t) = e^(g(t))g'(t) = e^g(t) dot.op a(t) = a(t) v(t) $
  ואכן מתקיים
  $ v(0)=e^(integral_0^0 a(s) dif s) = e^0 = 1 $
]

#subquestion()
נוכיח את הלמה גרונוול: לכל $t in [0, delta)$ מתקים $u(t)<=u(0)v(t)$.

#proof[
  נעזר ברמז ונסתכל על $w(t)=u(t)/v(t)$ ונראה שהיא מונוטונית יורדת.\
  נגזור ונקבל עם הסעיף הקודם
  $ w'(t) = (u'(t)v(t)-u(t)v'(t))/v(t)^2 = (v(t)(u'(t)-a(t)u(t)))/v(t)^2 = (u'(t)-a(t)u(t))/v(t) $
  ומהנתון $u'(t)<=a(t)u(t)$ נסיק כי $u'(t)-a(t)u(t)<=0$ ולכן $w'(t)<=0$ ונובע מכך ש־$w(t)$ היא מונוטונית יורדת.\
  ומתקיים
  $ w(0)=u(0)/v(0) = u(0)/1 = u(0) $
  ולכן נובע ש־$w(t)<=u(0)$ כלומר $u(t)/v(t) <= u(0)$ שזה בעצם $u(t)<=u(0)v(t)$, כנדרש.
]

#question()
#subquestion()
תהיי $U subset RR^n$ פתוחה ו־$F: U arrow RR^n$ גזירה ברציפות. נוכיח כי $F$ היא ליפשיץ מקומית.

#proof[
  עלינו להראות שלכל $K subset U$ קומפקטית יש קבוע $0<L_K$ כך ש־$f|_K$ היא $L_k$־ליפשיץ.\
  יהי $x_0 in U$ ומכיוון ש־$U$ פתוחה יש $r>0$ כך ש־$B_r (x_0) subset U$ ומכך ש־$F in C^1$ נובע כי $D F$ חסומה על $overline(B_r (x_0))$ (כי פונקציה רציפה על קבוצה קומפקטית היא חסומה) ולכן קיים $M>0$ כך ש־$norm(D F(x))<=M$ לכל $x in B_r (x_0)$.\
  יהיו $x,y in B_r (x_0)$ ונגדיר $gamma(t)=y+t(x-y)$ עבור $t in [0,1]$ ומתקיים
  $ F(x)-F(y)= integral_0^1 D F(gamma(t))(x-y) dif t $
  בפרט אם ניקח נורמה ונשלב עם שאלה $1$ והחסם שמצאנו נקבל
  $ norm(F(x)-F(y))<=integral_0^1 norm(D F(gamma(t))) norm(x-y) dif t <= integral_0^1 M norm(x-y) dif t = M norm(x-y) $
  זה נכון לכל $x_0 in U$ ולכן $F$ ליפשיץ מקומית.
]

#subquestion()
נקבע האם קיימת סביבה פתוחה של $0$ בה הפונקציה $F(x)=1/(1-x^2)$ היא ליפשיץ.

#proof[
  בהמשך לסעיף הקודם, נגזור
  $ F'(x) = (2x)/(1-x^2)^2 $
  וכמובן ש־$F'(x)$ רציפה בראשית מאריתמטיקה של גבולות.\
  יש לנו נקודות סינגולריות ב־$plus.minus 1$ ולכן נסתכל על $[-r, r]$ עבור $r<1$ וגם המונה וגם המכנה הן פונקציות רציפות ועל־כן חסומות ולכן קיים \
  $M>0$ כך ש־$abs(F'(x))<=M$ לכל $x in [-r, r]$ ומהסעיף הקודם נסיק ש־$F$ ליפשיץ מקומית על $[-r,r]$.
]

#subquestion()
נקבע האם קיימת סביבה פתוחה של $0$ בה הפונקציה $F(x)=abs(x)^(1/3)$ היא ליפשיץ.

#proof[
  נגזור ונקבל
  $ F'(x) = 1/3 abs(x)^(-2/3) dot.op sign(x) $
  אבל
  $ abs(F'(x))=1/3 abs(x)^(-2/3) stretch(arrow)_(x arrow 0) infinity $
  כלומר הנגזרת בכלל לא חסומה בקרבת הראשית ולכן בפרט לא ליפשיץ מקומית באף סביבה של הראשית.
]

#question()
נמצא את הסדרה של איטרציות פיקארד עבור בעיית תנאי ההתחלה
$ cases(x' = x, x(0) = 1) $
ונמצא מה הקשר בין $x(t)=e^t$ לסדרה שהגדרנו.

#solution[
  נגדיר $y_0 (t) = 1$ ונגדיר את האופרטור על פונקציות רציפות
  $ K x (t) = 1+ integral_0^t x(s) dif s $
  ונפעיל איטרציות של האופרטור על $y_0$
  $ y_1 = K y_0 (t) = 1+ integral_0^t 1 dif s = 1+t $
  נפעיל שוב את האופרטור
  $ y_2 (t) = K y_1 (t) = 1 + integral_0^t 1+s dif s = 1 + integral_0^t 1 dif s + integral_0^t s dif s = 1+t+t^2/2 $
  ושוב
  $ y_3 (t) = K y_3 (t) = 1 + integral_0^t 1+s+s^2/2 dif s = 1+t+t^2/2+t^3/6 $
  באינדוקציה נקבל
  $ y_n (t) = K^n y_0 (t) = sum_(k=0)^n t^k/k! stretch(arrow)_(n arrow infinity) e^t $
  והאיטרציות פיקארד האלו בעצם מביאות את טור טיילור של אקספוננט ואכן $e^t$ הוא פיתרון למשוואה כי $(e^x)'=e^x$ ו־$e^0 = 1$.
]

#question()
יהיו $I subset RR, U subset RR^n$ כך ש־$U$ פתוחה ו־$I$ קטע פתוח ו־$x_0 in U$.\
תהיי $F: U times I arrow RR^n$ כך שלכל $K subset U$ קומפקטית קיים $C_k$ כך שלכל $x,y in K$ ולכל $t in I$ מתקיים
$ norm(F(x,t) - F(y,t))_2 <= C_k norm(x-y)_2 $
נוכיח כי קיים פתרון יחיד לבעיית תנאי ההתחלה
$ cases(x'(t) = F(x(t) comma t), x(0)=x_0) $

#proof[
  ראשית כמובן נובע ש־$F$ היא ליפשיץ מקומית ולכן מכך ש־$U$ פתוחה ו־$x_0 in U$ נבחר כדור $K = overline(B_r (x_0)) subset U$.\
  אנחנו מחפשים פיתרון בקבוצה
  $ X = {x in C([-h,h], RR^n) bar x(t) in K} $
  נגדיר מבעיית ההתחלה את האופרטור
  $ (T x)(t) = x_0 + integral_0^t F(x(s), s) dif s $
  מתנאי ליפשיץ מקומית נקבל לכל $x,y in X$
  $
    norm((T x)(t) - (T y)(t))_2 & = norm(integral_0^t F(x(s), s)-F(y(s), s) dif s)_2 \
                                & <= integral_0^t norm(F(x(s),s)-F(y(s), s))_2 dif s \
                                & <= integral_0^t C_k norm(x(s)-x(y))_2 dif s \
                                & <= C_k abs(t) dot.op norm(x-y)_infinity
  $
  ולכן בלקיחת סופרמום
  $ norm(T x - T y)_infinity <= C_k h norm(x-y)_infinity $
  אז אם נבחר $C_k h < 1$ נקבל ש־$T$ העתקה מכווצת והמרחב הוא מרחב שלם (כי $C([-h,h], RR^n)$ עם נורמת סופרמום הוא מרחב שלם ו־$X$ שלנו הוא תת־קבוצה סגורה מבנייה מהיות $K$ קומפקטית ותת־קבוצה סגורה של מרחב שלם היא שלמה).\
  אז אנחנו עומדים בתנאי משפט העתקה מכווצת ולכן יש $x(t)$ כך ש־$T x = x$ כלומר $x$ נקודת שבת יחידה של $T$.\
  נשאר להראות שזה פותר:
  $ x(0)=x_0 + integral_0^0 F(x(s), s) dif s = x_0 $
  ונגזור (מהמשפט היסודי)
  $ dif/(dif t) integral_0^t F(x(s), s) dif s = F(x(t), t) ==> x'(t) = F(x(t), t) $
]
