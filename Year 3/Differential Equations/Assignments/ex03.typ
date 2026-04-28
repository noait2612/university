#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהי $I subset RR$ קטע פתוח המכיל את $0$ ו־$g:I arrow RR^n, A: I arrow M_n (RR)$ פונקציות רציפות.\
נוכיח כי לכל $x_0$ קיים פיתרון יחיד $x$ אשר מוגדר על כל $I$ לבעיית תנאי ההתחלה
$ cases(x'(t)=A(t)x(t)+g(t), x(0)=x_0) $

#proof[
  נגדיר
  $ x(t)=x_0 + integral_0^t A(s) x(s) + g(s) dif s = x_0 + integral_0^t A(s)x(s) dif s + integral_0^t g(s) dif s $
  נבחין כי הפונקציה
  $ f(t,x) = A(t)x + g(t) $
  היא רציפה ב־$t$ מאריתמטיקה והיא ליפשיצית כי לכל $x,y in RR^n$ מתקיים
  $ norm(f(t,x)-f(t,y))=norm(A(t)(x-y))<=norm(A(t))norm(x-y) $
  ולכן לפי משפט פיקארד קיים פיתרון יחיד מקומי בסביבה של $0$ (#todo אולי צריך הסבר טוב יותר).\
  נניח ש־$x : (alpha, beta) arrow RR^n$ הוא הפיתרון המקסימלי כך ש־$0 in (alpha, beta) subset I$ ונראה ש־$(alpha, beta)=I$: \
  מאי־שיוויון הממוצע האינטגרלי מתקיים  $ norm(x(t))<=norm(x_0)+integral_0^t norm(A(s))norm(x(s)) dif s + integral_0^t norm(g(s)) dif s $
  ובפרט זה מתקיים לכל קטע קומפקטי $[a,b] subset I$ ומכך ש־$A, g$ פונקציות רציפות נובע שקיימים $M,N>0$ כך שמתקיים לכל $t in [a,b]$
  $ norm(A(t))<=M, space norm(g(t))<=N $
  ולכן
  $ norm(x(t))<=norm(x_0)+M integral_0^t norm(x(s)) dif s + N abs(t) $
  מהלמה של גרונוול שהוכחנו בתרגיל הקודם מתקיים
  $ norm(x(t))<=(norm(x_0)+N abs(t))e^(M abs(t)) $
  ולכן נובע ש־$x(t)$ חסומה על כל תת־קבוצה קומפקטית של $I$ ומהטריכוטומיה של זרימות שדה של ליפשיץ מקומי נקבל שלא ייתכן שהפונקציה מתפוצצת (מתבדרת) ולכן הפיתרון המקסימלי מקיים $(alpha,beta)=I$.\
  אם $x_1, x_2$ הם שני פיתרונות אז נגדיר $y=x_1-x_2$ ולכן
  $ cases(y'(t) = A(t)y(t), y(0)=0) $
  ושוב אם נפעיל את הלמה של גרונוול נקבל $norm(y(t))=0$ ולכן $y(t)=0$ והפיתרון הוא יחידי.
]

#question()
יהי $alpha in RR$ ונתבונן בבעיית תנאי ההתחלה
$ cases(x' = alpha x - x^3, x(0)=x_0) $

#subquestion()
נוכיח שאם $alpha>0$ אז קיימים בידיוק שלושה פתרונות קבועים לבעיה ושאם $alpha<=0$ קיים רק פיתרון קבוע אחד לבעיה.

#proof[]

#subquestion()
נוכיח שכל פיתרון לבעיה הוא פונקציה מונוטונית.

#proof[]

#subquestion()
נמצא עבור אילו $(x_0, alpha) in RR^2$ לפתרון לבעיה יש נקודת פיתול.

#proof[]

#question()
יהיו $t_0, alpha > 0$ ונתבונן בבעיית תנאי ההתחלה
$ cases(x'/(1+x^2) + x/t = 1, x(t_0) = a) $

#subquestion()
ננמק מדוע קיים לבעיה פיתרון יחיד בסביבה של $t_0$.

#proof[]

#subquestion()
נסמן את התחום ההגדרה של הפיתרןו $x$ לבעיה ב־$J=(T_minus, T_plus)$ ונוכיח כי לכל $t in (t_0, T_plus)$ מתקיים $x(t)>0$.

#proof[]

#subquestion()
נוכיח כי קיים $T_0 in (T_minus, T_plus)$ כך שמתקיים $x(T_0)<=T_0$.

#proof[]

#subquestion()
נוכיח כי לכל $t in (T_0, T_plus)$ מתקיים $x(t)<=t$ ונסיק כי $T_plus = infinity$.

#proof[]

#subquestion()
נוכיח כי
$ limsup_(t arrow infinity) (x(t))/t = 1 $

#proof[]

#subquestion()
נוכיח כי $ lim_(t arrow infinity) (x(t))/t = 1 $

#proof[]

#question()
תהיי $F:RR^n arrow RR^n$ ליפשיץ מקומית ונניח בנוסף שקיים $C>0$ כך שלכל $x in RR^n$ מתקיים
$ norm(F(x))<=C(norm(x)+1) $
נתבונן בבעיית תנאי ההתחלה
$ cases(x' = F compose x, x(0)=x_0) $
נוכיח כי הפיתרון לבעיה מוגדר בכל $RR$.

#proof[
  נעזר ברמז ונגדיר
  $ x(t)=x_0 + integral_0^t F(x(s)) dif s wide v(t)=e^(-C t) integral_0^t F(x(s)) dif s $
  מהנתון ומאי־שיוויון הממוצע האינטגרלי מתקיים
  $ norm(v(t))<=e^(-C t) integral_0^t norm(F(x(s))) dif s <= C e^(-C t) integral_0^t (norm(x(s))+1) dif s $
  מהבנייה מתקיים
  $ norm(x(s))<=norm(x_0)+integral_0^s norm(F(x(p))) dif p <= norm(x_0) + C integral_0^c (norm(x(p))+1) dif p $
  ושוב מהלמה של גרונוול נקבל
  $ norm(x(t))<=(norm(x_0)+C t)e^(C t) $
  אז $x(t)$ גדל בקצב שהוא לכל היותר אקספוננציאלי ולכן
  $ norm(F(x(s)))<=C((norm(x_0)+ C s)e^(C s)+1) $
  כלומר
  $ norm(v(t))<=e^(-C t) integral_0^t C((norm(x_0)+C s)e^(C s)+1) dif s $
  ומתקיים
  $ e^(-C t)e^(C s)=e^(-C (t-s))<=1 $
  שכן $0<=s<=t$ ולכן האינטגרל נשאר חסום על מקטעים סופיים כלומר קיים $K$ קבוע כלשהו עבורו
  $ norm(v(t))<=K(1+t) $
  אז
  $ x(t)=x_0 + e^(C t) v(t) $
  ונקבל
  $ norm(x(t))<= norm(x_0) + e^(C t)norm(v(t)) $
  ומכך ש־$v(t)$ גדל לכל היותר בצורה לינארית, $x(t)$ נשאר סופי עבור $t$ סופי.\
  ושוב מהטריכוטומיה של זרימות של שדה ליפשיץ מקומי מכך ש־$norm(x(t))$ סופי לכל $t$ אין לנו התבדרות ולכן הפיתרון נכון לכל $t>=0$.\
  בשביל כל $RR$, תהליך דומה עבור המשוואה
  $ y'(t)=-F(y(t)) $
  נקבל את אותה תוצאה ולכן הפיתרון קיים גם עבור $t<=0$ ולכן הפיתרון קיים לכל $RR$.
]
