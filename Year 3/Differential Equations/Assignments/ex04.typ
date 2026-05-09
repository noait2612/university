#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 04 --- משוואות דיפרנציאליות, 80320 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
תהיי $U subset RR^n$ פתוחה, $F:U times RR^n arrow RR^n$ ליפשיץ מקומית ונקבע $x_0 in U$.\
נגדיר ב־$x_0$ את הפונקציה $x_a : I arrow U$ שהיא הפיתרון המקסימלי לבעיית תנאי ההתחלה
$ cases(x^prime (t) = F(x(t), a), x(0)=x_0) $
נוכיח שהפונקציה $(a,t) mapsto x_a (t)$ מוגדרת בקבוצה פתוחה של $RR^(m+1)$ ושהיא רציפה.

#proof[
  בהינתן $a in RR^n$ נגדיר $y_a (t) = (x_a (t), a)$ ונמצא משוואה דיפרנציאלית ש־$y_a$ פותרת.\
  נגזור לפי $t$ ונקבל
  $ dif/(dif t) (x_a (t), a) = (x^prime_a (t), 0) = (F(x_a (t), a), 0) $
  נגדיר $tilde(F) : U times RR^m arrow RR^n times RR_m$ על־ידי
  $ tilde(F)(x,a) = (F(x,a), 0) $
  ומכך ש־$F$ ליפשיץ מקומית גם $tilde(F)$ ליפשיץ מקומי ומתקיים
  $ y^prime_a (t) = tilde(F)(y_a (t)) $
  ועבור $t=0$ מתקיים
  $ y_a (0) = (x_a (0), a) = (x_0, a) $
  אז ממשפט הרציפות ביחס לתנאי ההתחלה אם נסתכל על $Phi(t, y_0)$ המוגדרת על־ידי $tilde(F)$ היא פונקציה רציפה והתחום שלה $Omega$ היא פתוחה ב־$RR times (U times RR^m)$ ומתקיים
  $ y_a (t) = Phi(t, (x_0, a)) $
  אז אם נסתכל על $psi:RR^(m+1) arrow RR times U times RR^m$ המוגדרת על־ידי
  $ psi(t, a) = (t, (x_0, a)) $
  זו פונקציה רציפה ומכך ש־$psi$ רציפה ו־$Omega$ פתוחה אז גם $psi^(-1)(Omega)$ פתוחה ב־$RR^(m+1)$.\
  אז הפונקציה $(a,t) mapsto y_a (t) = Phi(t, (x_0, a))$ מוגדרת על קבוצה פתוחה ורציפה שם כהרכבת פונקציות רציפות ו־$x_a (t)$ זו ההטלה של $y_a (t)$ על ה־$n$ קורדינאטות ראשונות וגם הטלה זו פונקציה רציפה ולכן $(a,t) mapsto x_a (t)$ על קבוצה פתוחה ב־$RR^(m+1)$ היא רציפה.
]

#question()
תהיי $U subset RR^n$ פתוחה ותהיי $F:U arrow RR^n$ גזירה פעמיים ברציפות.\
נקבע $x_0 in U$ ונתבונן בבעיית תנאי ההתחלה
$ cases(x^prime (t) = F(x(t)), x(0)=x_0) $
נסמן ב־$Omega$ את תחום ההגדרה של הזרימה הנוצרת על־ידי $F$.\
נניח כי $(t_0, x_0) in Omega$ ונוכיח כי $phi_(t_0)$ גזירה ברציפות (ביחס למשתנה $x$ בנקודה $x_0$).

#proof[
  נקבע $x_0 in U$ ונסמן ב־$x(t)$ את הפיתרון לבעיה הנתונה ו־$M(t)= D_(x_0) phi_t (x_0)$.\
  מתקיים ש־$phi_(x_0) (t) = x(t)$ מהגדרה ואם נגזור לפי זמן נקבל
  $ dif/(dif t) x(t) = x^prime (t) = F(x(t)) $
  נרצה לגזור לפי $x_0$.\
  נשים לב שמתקיים
  $ dif/(dif t) M(t) = dif/(dif t) D_(x_0) phi_t (x_0) = dif/(dif t) D_(x_0) x(t) $
  ו־$F$ גזירה פעמיים ולכן ניתן להחליף בין סדר הנגזרות ונקבל
  $ dif/(dif t) D_(x_0) x(t) = D_(x_0) (dif/(dif t) x(t)) = D_(x_0) (x^prime (t)) = D_(x_0) (F(x(t))) $
  ומכלל השרשרת נקבל
  $ D_(x_0) (F(x(t))) = D F (x(t)) dot.op underbrace(D_(x_0) x(t), = M(t)) $
  מהיות $D_(x_0) phi_t (x_0) = D_(x_0) x(t) = M(t)$ נקבל
  $ D_(x_0) F(x(t)) = D F (x(t)) dot.op M(t) $
  ובסך־הכל $M^prime (t) = D F (x(t)) dot.op M(t)$.\
  בנוסף מכיוון שלכל $x_0 in U$ מתקיים $x(0)=phi_0 (x_0) = x_0$ זאת פונקציית הזהות ומאחר ש־$M(0)=D_(x_0) phi_0 (x_0)$ נקבל ש־$M(0) = D_(x_0) Id (x_0) = I_n$.\
  מאחר ש־$y(t)=(x(t), M(t))$ נובע $ y^prime (t) = (x^prime (t), M^prime (t)) = (F(x(t), D F (x(t)) dot.op M(t))) $
  אז אם נגדיר
  $ G(x,M) = (F(x), D F(x) M) $
  נקבל
  $ G(y(t)) = G(x(t), M(t)) = (F(x(t)), D F(x(t)) dot.op M(t)) = y^prime (t) $
  וקיבלנו את המערכת
  $ cases(y^prime (t) = G(y(t)), y(0)=G(y(0))=(x_0, I)) $
  עבור מערכת זאת מתקיים $y(t)=(x(t), M(t))$ כאשר $M(t) = D_(x_0) phi_t (x_0)$ ומהמשפט אודות רציפות ביחס לתנאי ההתחלה נובע ש־$y(t)$ תלוי ברציפות ב־$x_0$ ובפרט $M(t)$ תלוי ברציפות ב־$x_0$ ולכן $D_(x_0) phi_t (x_0)$ רציפה ב־$x_0$ ו־$phi_t (x_0)$ גזירה ברציפות במשתנה במשתנה $x_0$.
]

#question()
#subquestion()
נניח כי $A,B in M_n (RR)$ ונגדיר $F(x)=A x, G(x) = B x$ ונבין מה ההעתקה $[F,G]$ עושה.

#proof[
  מהגדרת סוגרי לי
  $
    [F,G] = D_x G dot.op F(x) - D_x F dot.op G(x) = D_x (B x) dot.op A x - D_x (A x) dot.op B x = B A x - A B x = (B A - A B)x
  $
  זה בעצם ההעתקת הקומוטטור שראינו במבנים.
]

#subquestion()
נניח כי $F,G$ שדות וקטוריים גזירים ונוכיח כי $[F,G]=-[G,F]$.

#proof[
  מתקיים
  $
    [F,G](x) = D_x G dot.op F(x) - D_x F dot.op G(x) \
    [G,F](x) = D_x F dot.op G(x) - D_x G dot.op F(x) = -(D_x G dot.op F(x) - D_x F dot.op G(x))
  $
  כנדרש.
]

#subquestion()
נניח כי $F_1, F_2, F_3$ שדות וקטורים גזירים פעמיים. נוכיח את זהות יעקובי
$ [F_1, [F_2, F_3]]+[F_3,[F_1, F_2]]+[F_2, [F_3, F_1]] = 0 $

#proof[
  נבחן את המחובר הראשון
  $
    [F_1, [F_2, F_3]] = D([F_2, F_3]) F_1 - D F_1 ([F_2, F_3]) \
    [F_2, F_3] = D F_3 F_2 - D F_2 F_3
  $
  מנגזרת מכפלה נקבל
  $
    D(D F_3 F_2)F_1 = D^2 F_3 (F_1, F_2) + D F_3 (D F_2 F_1) \
    D(D F_2 F_3)F_1 = D^2 F_2 (F_1, F_3) + D F_2 (D F_3 F_1)
  $
  כלומר
  $ D([F_2, F_3])F_1 = D^2 F_3 (F_1, F_2) + D F_3 (D F_2 F_1)- D^2F_2 (F_1, F_3) - D F_2 (D F_3 F_1) $
  ולכן
  $
    [F_1, [F_2, F_3]]=D^2 F_3 (F_1, F_2)-D^2 F_2 (F_1, F_3)+ D F_3 (D F_2 F_1) - D F_2 (D F_3 F_1)-D F_1 (D F_3 F_2) + D F_1 (D F_2 F_3)
  $
  מהמחזוריות של האינדקסים
  $
    [F_3, [F_1, F_2]] = D^2 F_2 (F_3, F_1) - D^2 F_1 (F_3, F_2)+ D F_2 (D F_1 F_3) - D F_1 (D F_2 F_3)- D F_3 (D F_2 F_1) + D F_3 (D F_1 F_2) \
    [F_2, [F_3, F_1]] = D^2 F_1 (F_2, F_3) - D^2 F_3 (F_2, F_1)+D F_1 (D F_3 F_2) - D F_3 (D F_1 F_2)- D F_2 (D F_1 F_3) + D F_2 (D F_3 F_1)
  $
  עכשיו נעבור לחישוב הסכום.\
  כל איבר מהצורה $D F_i (D F_j F_k)$ מופיע פעם אחת עם סימן $plus$ ופעם אחת עם סימן $minus$ ולכן הם מתבטלים ונישאר עם המחוברים הבאים
  $
    D^2 F_3 (F_1, F_2) - D^2 F_3 (F_2, F_1) + D^2 F_2 (F_3, F_1) - D^2 F_2 (F_1, F_3) + D^2 F_1 (F_2, F_3)-D^2 F_1 (F_3, F_2)
  $
  מכיוון שהם שדות וקטוריים שגזירים פעמיים נקבל $D^2 F_i (u,v) = D^2 F_i (v,u)$ כלומר כל הצמדים שיש לנו מבטלים את עצמם וקיבלנו סכום $0$.
]

#pagebreak()

#subquestion()
נניח כי $F,G:RR^n arrow RR^n$ שדות גזירים ברציפות ונסמן $Phi(t, x)=phi_t (x)$ הזרימה הנוצרת על־ידי $F$ וב־$Psi(t, x) = psi_t (x)$ הזרימה הנוצרת על־ידי $G$.\
נניח כי $Psi, Phi$ מוגדרות היטב בכל $RR^(n+1)$.
נוכיח כי הזרימות של $F,G$ מתחלפות, כלומר מתקיים $phi_t compose psi_s = psi_s compose phi_t$ אם ורק אם $[F,G]=0$ זהותית.

#proof[
  נשים לב
  $ dif/(dif t) phi_t (x) = F(phi_t (x)) wide dif/(dif s) psi_s (x) = G(psi_s (x)) $
  $<==$ נניח שהן מתחלפות לכל $s,t,x$ .\
  נרצה לגזור ביחס ל־$t$. מכיוון ש־$phi_t$ היא הזרימה של $F$
  $
    partial/(partial t) phi_t (y) = F(phi_t (y)) ==>_(y = psi_s (x)) partial/(partial t) phi_t (psi_s (x)) = F(phi_t (psi_s (x)))
  $
  עבור $psi_s (phi_t (x))$ נצטרך להשתמש בכלל שרשרת ולקבל
  $
    partial/(partial t) psi_s (phi_t (x)) = D psi_s (phi_t (x)) dot.op dif/(dif t) phi_t (x) = D psi_s (phi_t (x))F(phi_t (x))
  $
  וקיבלנו
  $ F(phi_t (psi_s (x))) = D psi_s (phi_t (x))F(phi_t (x)) $
  עבור $t=0$ מתקבל $phi_0 (x) = x$ ולכן
  $ F(psi_s (x)) = D psi_s (x) F(x) $
  נגזור שוב (כי גזיר ברציפות) הפעם ביחס ל־$s$ ונקבל אז מצד אחד
  $ dif/(dif s) (F(psi_s (x)))|_(s=0) = D F(x) G(x) $
  שכן
  $ dif/(dif s) (psi_s (x))|_(s=0) = G(x) $
  מצד שני, מכיוון ש־$F(x)$ קבועה ביחס ל־$s$ נקבל
  $ dif/(dif s) (D psi_s (x) F(x))|_(s=0) = (dif/(dif s) (D psi_s (x))|_(s=0)) F(x) $
  אבל
  $ dif/(dif s) (D psi_s (x))|_(s=0) = D G(x) $
  ולכן
  $ dif/(dif s) (D psi_s (x) F(x))|_(s=0) = D G(x) F(x) $
  כלומר $D F(x) G(x) = D G(x) F(x)$ ולכן $[F,G]=0$, כנדרש.\
  $==>$ נניח ש־$[F,G]=0$ כלומר $D psi_s (y) F(y) = F(psi_s) (y)$.\
  נקבע $x$ ונגדיר
  $ u(t,s) = phi_t (psi_s (x)) wide v(t,s) = psi_s (phi_t (x)) $
  נרצה להראות ש־$u(t,s)=v(t,s)$. \
  נקבע $s$ ונגדיר
  $ u_s (t) = phi_t (psi_s (x)) wide w_s (t) = psi_s (phi_t (x)) $
  אז
  $
    dif/(dif t) u_s (t) = F(u_s (t)) wide dif/(dif t) w_s (t) = D psi_s (phi_t (x)) F(phi_t (x))=F(psi_s (phi_t (x)))=F(w_s (t))
  $
  ומיחידות הפיתרון נובע ש־$u_s (t) = w_s (t)$ כלומר $phi_t (psi_s (x))=phi_s (phi_t (x))$.
]

#subquestion()
נסיק כי הזרימות של המשוואות $x^prime = A x$ ו־$x^prime = B x$ מתחלפות אם ורק אם $A B = B A$.

#proof[
  זו מסקנה ישירה של הסעיף הקודם וסעיף א' שכן בסעיף א' ראינו שמתקיים
  $ [F,G](x) = (A B - B A)x $
  מהסעיף הקודם הזרימות מתחלפות אם ורק אם $[F,G](x)=0$ כלומר $[F,G](x) = 0 <==> A B = B A$ כלומר זה מתקיים אם ורק אם $A B, B A$ מתחלפות.
]

#question()
יהי $F:RR^n arrow RR^n$ שדה וקטור גזיר ברציפות ונסמן $phi_t (x)$ הזרימה הנוצרת על־ידי $F$ ונניח שהיא מוגדרת בכל $RR^(n+1)$.

#subquestion()
נוכיח כי לכל $x in RR^n$ ולכל $t,s in RR$ מתקיים
$ phi_(t+s) (x) = phi_t (phi_s (x))= phi_s (phi_t (x)) $

#proof[
  נקבע $x in RR^n$ ו־$s in RR$ ונגדיר
  $
    gamma_1 (t) = phi_(t+s) (x) \
    gamma_2 (t) = phi_t (phi_s (x))
  $
  מתקיים מהגדרה
  $ dif/(dif t) phi_t (y) = F(phi_t (y)) $
  ולכן
  $
    dot(gamma_1) (t) = dif/(dif t) phi_(t+s) (x) = F(phi_(t+s) (x)) = F(gamma_1 (t)) \
    dot(gamma_2) (t) = dif/(dif t) phi_t (phi_s (x)) = F(phi_t (phi_s (x))) = F(gamma_2 (t))
  $
  נבחן מה קורה בתנאי ההתחלה $t=0$
  $
    gamma_1 (0) = phi_(0+s) (x) = phi_s (x) \
    gamma_2 (0) = phi_0 (phi_s (x)) = phi_s (x)
  $
  כי $phi_0$ היא הזהות.\
  כלומר שתי העקומות מקיימות את אותה מערכת משוואות עם אותו תנאי התחלה, אבל $F$ גזיר ברציפות ולכן באופן מקומי יש לנו נתאי ליפשיץ וממשפט קיום והיחידות של פיקארד נקבל שיש פיתרון יחיד לבעיית ההתחלה ולכן $gamma_1 (t) = gamma_2 (t)$ לכל $t in RR$, כלומר
  $ phi_(t+s) (x) = phi_t (phi_s (x)) $
  כדי לסיים נשתמש בעובדה שמתקיים $s+t=t+s$ ולכן
  $ phi_(t+s) (x) = phi_(s+t) (x) = phi_s (phi_t (x)) $
]

#subquestion()
נוכיח כי לכל $t in RR$ הפונקציה $phi_t$ היא דיפאומורפיזם.

#proof[
  מהשיוויון בסעיף הקודם נוכל להסיק
  $
    phi_t (phi_(-t) (x)) = phi_(t+(-t)) (x) = phi_0 (x) = x \
    phi_(-t) (phi_t (x)) = phi_(-t + t) (x) = phi_0 (x) = x
  $
  כלומר ההרכבה משני הצדדים מביאה לנו את פונקציית הזהות ולכן יש ל־$phi_t$ הופכית הנתונה על־ידי $phi_t^(-1) = phi_(-t)$ ולכן $phi_t$ היא חד־חד ערכית ועל.\
  מכיוון ש־$F$ גזירה ברציפות אז ממסקנה מהתרגול גם הזרימה הנוצרת על־ידי $F$ היא גזירה ברציפות ולכן $phi_t$ גזירה ברציפות וגם $phi_(-t)$ היא זרימה של $F$ רק לזמן $-t$ ולכן מאותה מסקנה גם $phi_(-t)$ גזירה ברציפות ובסך־הכל נקבל ש־$phi_t$ היא העתקה הפיכה שהיא וההופכית שלה רציפות ולכן דיפאומורפיזם.
]
