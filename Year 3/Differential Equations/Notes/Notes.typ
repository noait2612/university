#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *


#show: thmbox-init()

#show: article_he.with(
  title: [ משוואות דיפרנציאליות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 2)

= משוואות דיפרנציאליות רגילות
== תלות בתנאי ההתחלה
_תזכורת:_ ראינו שאם $U subset.eq RR^n$ פתוחה ו־$F : U arrow RR$ ליפשיץ מקומית אזי לכל $p in U$ יש $delta>0$ כך שלבעיה $ (star) space cases(x'(t) = F(x(t)), x(0)=p) $
יש פיתרון יחיד בקטע $(-delta, delta)$.\
את הקיום הראנו באמצעות משפט פיאנו ואת היחידות הראנו באמצעות למה.

#definition("הפיתרון המקסימלי")[
  בתנאים אלו נגדיר $ J_p^* colon.eq {t in RR bar "Exists solution for the problem" (star) "on a segment that contains" t} $
  ו־$J_p^*$ היינו קטע (כי אם $t$ נמצא בו ו־$0$ נמצא בו אז כל נקודה בין $0$ ל־$t$ נמצא בו כי זה מכיל את הקטע).\
  הפיתרון שמוגדר על $J_p^*$ הוא יחיד (מהלמה שהוכחנו) ופיתרון זה נקרא *הפיתרון המקסימלי לבעיית ההתחלה*.\
]
#theorem("טריכוטומיה של זרימות של שדה ליפשיץ מקומי")[
  תהיי $U in RR^n$ פתוחה, תהיי $p in U$ ו־$F: U arrow RR^n$ ליפשיץ מקומית.\
  נסמן $X:J_p^* arrow U$ הפיתרון המקסימלי לבעיית ההתחלה
  $ cases(x'(t) = F(x(t)), x(0)=p) $
  אזי עבור $T in boundary(J_p^*) without {plus.minus infinity}$ מתקיים אחד משני המקרים הבאים
  + $display(liminf_( t arrow T) dist(x(t), boundary(U))=0)$
  + $display(limsup_(t arrow T) norm(x(t))=infinity)$
]
#proof[
  נניח ש־$sup J_p^* = T < infinity, space liminf_(t arrow T) dist(x(t), boundary(U))>0$ וש־$limsup_(t arrow T) norm(x(t))<infinity$.\
  כלומר, הקבוצה (התמונה של המסילה) $x([0,T))$ חסומה ומוכלת בקבוצה הסגורה $ A_(epsilon_0) colon.eq {x bar dist(x, boundary(U) >= epsilon_0/2)} $ לאיזשהו $epsilon_0 > 0$.\
  ניקח סדרה $0<t_k < T$ כך ש־$t_k stretch(arrow)_(k arrow infinity) T$ ונבחין ש־$x_(t_k)$ כולם שייכים לקבוצה $A_(epsilon_0)$ וגם לקבוצה החסומה $x([0, T))$.\
  נפעיל את (ההוכחה של) משפט פיאנו  עם $x_(t_k)$ כנקודת התחלה עם אותו $0<delta$ לכולם שכן $delta$ תלוי ברדיוס בכדור שניתן לקחת סביב $x_(t_k)$ ובחסם על $norm(F bar_B)$ אבל את הרדיוס והחסם על הנורמה ניתן לבחור באופן אחיד (כי $F$ רציפה ולכן חסומה וזה חוסם את כל הנקודות).\
  יהי $K$ כך ש־$T<t_K + delta$ ונקבל סתירה לכך ש־$T=sup J_p^*$ כי ממשפט פיאנו הפיתרון מוגדר מעבר ל־$T$.\
  משיקולי סימטריה ההוכחה למקרה השני זהה.
]
#proposition[בתנאי המשפט, נניח שאנחנו יודעים שקיימת קבוצה קומפקטית $K subset.eq U$ ו־$T>0$ ($T<0$ עובד באופן דומה) כך שלכל $0<t<T$ מתקיים
  + אם $t in J_p^*$ אז $x_p (t) in K$ אזי $[0, T) subset.eq J_p^*$
]
#proof[
  אם $T > 0 sup J_p^*$ אז נסמן $T > tau = sup J_p^*$ ונקבל ש־$x([0, tau)) subset.eq K$ אבל אז לא קרה אף אחד מהדברים (לא התפוצצנו ולא נגענו בשפה) בסתירה לכך ש־$tau < T != infinity$.
]
#definition[
  נגדיר
  $ Omega colon.eq {(p, t) bar p in U, t in J_p^*} subset.eq RR^(n+1) $
  לכל $(p,t) in Omega$ נגדיר את $Phi(p, t)=x_p (t) = phi_t (p)$ היכן ש־$x_p (t)$ פיתרון ל־$x'_p (t) = F(x_p (t))$ ו־$x_p (0) = p$.
]

#theorem[
  הקבוצה $Omega$ היא קבוצה פתוחה וההעתקה $Phi : Omega arrow U$ היא רציפה ($F$ כמובן ליפשיץ מקומית).
]
#proof[
  תהיי $(p, t_0) in Omega$, נרצה להראות ש־$Omega$ מכילה סביבה של $(p, t_0)$ וש־$Phi$ רציפה שם.\
  ניקח $t_0 >= 0$ (לשלילי אותו הדבר אבל אנחנו אנשים חיוביים) ותהיי $ C colon.eq {Phi(p, t) bar 0<=t<=t_0} subset.eq U $
  זאת קבוצה סגורה וחסומה ולכן קומפקטית יש לה מרחק חיובי מהשפה (כלומר, קיים $r>0$ כך ש־$0<4r<dist(C, boundary(U))$).\
  נסמן
  $
    M colon.eq sup{norm(F(x)) bar dist(x, C) <= 4r} \
    L colon.eq Lip F|_(dist(x, C)<=4r)
  $
  #lemma[תהיי $q in U$ כך ש־$norm(q-p)<=r e^(-L t_0)$ אזי לכל $0<=t<=t_0$ כך ש־$(q, t) in Omega$ מתקיים
    $ norm(Phi(p, t) - Phi(q, t))<=2e^(L t)norm(p-q)<=2r $
  ]
  #proof[
    נסמן $x_p (t), x_q (t)$ להיות הפתרונות המתאימים.\
    נניח שקיים $0<=t <=t_0$ כך ש־$(q,t) in Omega$ אבל $norm(x_p (t) - x_q (t))>=2e^(L t) norm(p-q)$.\
    ברור כי $q!=p$ ונסמן $ tau colon.eq inf{t in [0, t_0] bar (q, t) in Omega, space norm(x_p (t) - x_q (t))>=2e^(L t) norm(p-q)} $
    אז $0<tau<=t_0$ (מהרציפות), $(q, tau) in Omega$ וכן $norm(x_p (tau)-x_q (tau))=2e^(L tau) norm(p-q)$.\
    יתרה מזאת, לכל $t in [0,tau]$
    $ norm(x_p (t) - x_q (t))<=2e^(L t)norm(p-q)<=2r $
    לכן $x_p (t), x_q (t)$ לכל $t in [0, tau]$ מוכל בקבוצה $ {x in RR^n bar dist(x, C)<=2r} $
    ולכן $F$ ליפשיץ שם עם קבוע $L$ ובפרט לכל $t in [0, tau]$ $ norm(F(x_p (t))-F(x_q (t)))<=L norm(x_p (t) - x_q (t)) $
    ומכאן
    $ dif/(dif t) norm(x_p (t) - x_q (t))=2L norm(x_p (t) - x_q (t))^2 $
    ולכן הפונקציה $t mapsto e^(-2L t) norm(x_p (t) - x_q (t))^2$ מונוטונית יורדת בקטע $[0,tau]$ ומכאן נקבל
    $ 2 norm(p-q) <= e^(-L tau) norm(x_p (tau) - x_q (tau)) <= norm(p-q) $
    וזאת סתירה.
  ]
  #end_of_lecture("4 – 20/04")
]

כל מה שעובר פה הוא קצת חוזר על מה שהיה בהרצאה הקודמת אז תסדרי את זה...\
_תזכורת:_ $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ ליפשיץ מקומית כך שעבור $p in U$
$ cases(x'_p (t) = F(x_p (t)), x_p (0) = p) $
הגדרנו
$ Omega = {(p,t) bar t in J_p^*, space p in U} $
כאשר הגדרנו את $J_p^*$ תחום ההגדרה של הפיתרון המקסימלי ל־$F$.\
והגדרנו $Phi : Omega arrow U$ על־ידי $Phi(p, t) = x_p (t) = phi_t p)$ וראינו משפט שאומר ש־$Omega$ קבוצה פתוחה ו־$Phi$ העתקה רציפה.\
כלומר, לכל $(p, t_0)$ יש סביבה קטנה שמוכלת ב־$Omega$ ולכל $(q,t)$  בסביבה הזו מתקיים ש־$Phi(q, t)$ קרוב ל־$phi(p, t_0)$.

#proof[
  יהי $t_0 >=0$, נגדיר $C={Phi(p, t) bar 0<=t<=t_0}$ וקיים $r>0$ כך ש־$dist(C, boundary(U))>4r$ ולכן נגדיר קבוצה קומפקטית \
  $tilde(C) = {x in U bar dist(x, C) <= 4r}$ וניקח
  $ M = sup{norm(F(x)) bar x in tilde(C)} $
  ו־$L$ הקבוע ליפשיץ של $F$ על $tilde(C)$.
]
#lemma("תזכורת")[תהיי $q in U$ כך ש־$norm(q-p)<=r e^(-L t_0)$ אזי לכל $0<=t<=t_0$ כך ש־$(q, t) in Omega$ מתקיים
  $ norm(Phi(p, t) - Phi(q, t))<=2e^(L t)norm(p-q)<=2r $
]

#lemma[
  תהיי $q$ כזו ש־$norm(p-q)<=r e^(-L t_0)$, אם $(q,t) in Omega$ ו־$0<=t<=t_0+r/M$ אזי $Phi(q, t) in tilde(C)$.
]
#proof[
  בשלילה נניח שיש $0<=t<=t_0 + r/M$ כך ש־$(q,t) in Omega$ אבל $dist(Phi(q, t), C)>4r$ ומהלמה הקודמת ל־$0<=t<=t_0$ מתקיים $dist(Phi(q, t), C)<=2r$ ולכן עבור $t$ כזה מהנחת השלילה בהכרח מתקיים $t_0 < r$ ובפרט $(q, t_0) in Omega$.\
  נסמן $tau = inf{t_0 <= t<= t_0 + r/M bar (q, t) in Omega, space dist(q, C)>4r}$.\
  אבל $t_0 <= tau <= t_0 + r/M$ ו־$dist(Phi(q, tau), C) = 4r$ ויתר על־כן לכל $t_0 <= t<=tau$ מתקיים $dist((q,t), C)<=4r$ ובפרט לכל $0<=t<=tau$ מתקיים $norm(F(Phi((q,t))))<=M$ ונשים לב $ dist(Phi(q, tau), C)<=norm(Phi(q, tau) - Phi(q, t_0))+dist(Phi(q, t_0), C)<=M dot.op (tau - t_0) + 2r <= M dot.op r/M + 2r = 3r $
  וזאת כמובן סתירה.
  #remark[ $(q,t) in Omega <==> t in J_q^*$]
]
#lemma[
  נניח ש־$norm(p-q)<=r e^(-L t_0)$ ו־$0<=t<=t_0+r/M$ אזי $(q,t) in Omega$ ומתקיים
  $ norm(Phi(q, t_0)-Phi(q, t))<=2e^(L t_0)norm(p-q)+M norm(t_0 - t) $
  הלמה הזאת מסיימת את ההוכחה עבור $t_0 >=0$.\
  ראשית ברור מכאן ש־$Omega$ פתוחה וכן ש־$Phi$ רציפה עבור $t_0 > 0$ ובמקרה $t_0 = 0$ מקבלים סביבה ימנית ב־$t$ והרציפות היא רציפות מימין ב־$t$.\
  ומהוכחה דומה עבור $t_0 <= 0$ נקבל רציפות משמאל וזה מסיים את ההוכחה.
]
#proof[
  הראינו שבתנאים הנתונים לכל $t$ שעבורו $(q,t) in Omega$ מתקיים $dist(Phi(q, t), C)<=4r$ ולכן לכל $0<=t<=t_0 + r/M$ כזה, $(q,t) in Omega$ כי אחרת היה $0<=t_0 <= t_0 + r/M$ שעבורו הפתרון מגיע לשפה של $U$ או מתפוצץ אבל זה לא ייתכן.\
  כעת, כדי לקבל את האי־שיוויון נכתוב
  $
    norm(Phi(p, t_0)-Phi(q, t))<= norm(Phi(p, t_0)-Phi(q, t_0))+norm(Phi(q, t_0)-Phi(q, t)) <= underbrace(2e^(L t_0) norm(p-q), "Lemma 1") + underbrace(M abs(t-t_0), Phi(q, t) in tilde(C))
  $
]

נשים לב
$ x'_p (t) = (partial Phi(, p, t))/(partial t) = F compose Phi(p, t) = F(x_p (t)) $
מה לגבי הגזירה של $Phi$ לפי מיקום? \
*אם* $Phi$ גזירה לפי המיקום (נסמן את הנגזרת ב־$D Phi$), בזמן $0$ היא הזהות על כל $U$ ולכן $Phi$ אכן גזירה ומתקיים $D Phi (p, 0) = Id$ ולכן
$ partial/(partial t) D Phi = D(partial/(partial t) Phi) = D(F compose Phi)=D F(Phi(p, t))D Phi(p, t) $
אז אם $F$ לא גזירה אין על מה לדבר!
#theorem[
  תהיי $U subset.eq RR^n$ פתוחה ו־$p in U$ עם $F:U arrow RR^n$ גזירה ברציפות ובפרט ליפשיץ מקומית.\
  יהי $x_p$ הפיתרון המקסימלי לבעיית התחחלה $cases(x'(t)=F(x(t)), x(0)=p)$ ויהי $M(t)$ הפיתרון המקסימלי לבעיית ההתחלה $cases(M'(t)=D F(x(t))M(t), M(0) = Id)$.\
  אזי לכל $T in I_p^*$, $phi_T$ גזירה ב־$p$ והדיפרנציאל שלה נתון על־ידי $D phi_T (p) = M(t)$.
]
#remark[יהי $I subset.eq RR$ קטע פתוח שמכיל את $0$ ותהיי $A : I arrow RR^(n times n)$ פונקציה רציפה (למרחב המטריצות) אזי לבעיית ההתחלה $cases(M'(t)=A(t)M(t), M(0)=Id)$
  קיים פיתרון על כל הקטע $I$ (ראינו/נראה את זה בתרגיל עד־כדי המעבר מוקטור למטריצה שאת זה עושים בקלות כי המטריצה היא אוסף של $n$ וקטורי עמודות).
]
#proof[
  צריך להראות שאם אנחנו מסתכלים על
  $ phi_T (q) = phi_T (p) + M(t)(q-p)+o(norm(q-p)) $
  נסמן $x_q (t) = phi_t (q), x_p (t) = phi_t (p)$ ונסמן $u(t)=x_q (t) - x_p (t) - M_t (q-p)$.\
  יהי $epsilon > 0$, צריך להראות שקיים $delta>0$ כך שלכל $q$ עם $0<norm(q-p)<delta$ מתקיים $norm(u(t))<epsilon norm(q-p)$.\
  נגדיר $ K colon.eq sup_(t in [0,T]) normop(M(t)) wide L colon.eq sup_(t in [0,T]) normop(D F(x_p (t))) $
  ונבחר $eta>0$ כך ש־$eta dot.op K dot.op t dot.op e^((L+eta)T)<epsilon$.\
  $D F$ רציפה ולכן יש $r>0$ כך שלכל $0<=t<=T$ ולכל $z in B_r (x_p (t))$ מתקיים $normop(D F(z)-D F(x_p (t)))<eta$ ולכן עבור $z$ כאלה $ norm(F(z)-F(x_p (t))-D F(x_p (t))(z-x_p (t)))<eta norm(z-x_p (t)) $
  הסבר: עד היום תמיד הסכמנו שאם $normop(D G) < M$ אז $norm(G(z)-G(w))<=M norm(z-w)$ על המסלול בין $z$ ל־$w$ (טריק אינטגרציה).\
  אז עבור $t, p$ נתונים נגדיר $G(z)=F(z)-D F (x_p (t)) z$ ומכללי גזירה
  $ D G(z)= D F (z)-D F(x_p (t)) $
  ולכן
  $ norm(D G(z)) = norm(D F (z) - D F (x_p (t)))<eta $
  ולכן
  $ norm(G(z)-G(x_p (t)))<eta norm(z-x_p (t)) $
  אז אם נציב
  $ norm(F(z)-D F (x_p (t)) z - F(x_p (t))+D F(x_p (t))x_p (t))=norm(F(z)-F(x_p (t))-D F(x_p (t))(z-x_p (t))) $
  מרציפות בתנאי ההתחלה קיים $delta>0$ כך שלכל $q$ עם $norm(p-q)<delta$ ולכל $0<=t<=T$ מתקיים $norm(x_p (t) - x_q (t))<r$ ולכן מצאנו $delta$.\
]
#end_of_lecture("5 – 27/04")

#theorem[$U subset.eq RR^n$ פתוחה, $p in U$ ו־$F : U arrow RR^n$ גזירה ברציפות.\
  אז לכל $T in J_p^*$, $phi_T (dot.op) space$ גזירה ב־$p$ והדיפרנציאל שלה מקיים $D phi_T (p) = M(t)$ היכן ש־$M$ מקיימת
  $ M'(t)=D F(x_p (t))M(t), space M(0)= Id $
]
#proof[
  נניח ש־$T>0$ (כי אם $T=0$ אז זו הזהות ולכן גזירה ועבור $T<0$ זה תהליך דומה) ולכל $q in U$ נגדיר
  $ u(t) = x_q (t) - x_p (t) - M(t)(q-p) $
  צריך להוכיח שלכל $epsilon > 0$ קיים $delta>0$ כך שאם $norm(q-p)<delta$ אז $norm(u(T))<=epsilon norm(q-p)$.\
  יהי $epsilon > 0$ ונסמן $L = sup_(t in [0,T]) norm(D F(x_p (t))), space K = sup_(t in [0,T]) norm(M(t))$ וקיימת $eta>0$ כך שמתקיים $eta K T e^(T(L + eta)) < epsilon$.\
  קיים $r>0$ כך שלכל $t in [0,T]$ ולכל $z$ כך ש־$norm(z-x_p (t))<r$ מתקיים
  $ norm(F(z)-F(x_p (t))- D F(x_p (t))(z-x_p (t)))<eta norm(z-x_p (t)) $
  מרציפות הזרימה בתנאי ההתחלה (מה שאמרנו ש־$Phi(p, t)=x_p (t)$ רציפה במשפט הקודם) קיים $delta>0$ כך שאם $norm(q-p)<delta$ אז \
  $norm(x_q (t) - x_p (t))<r$ לכל $t in [0,T]$.\
  צריך להעריך את $u(T)$: אם $norm(u(T))=0$ סיימנו, אחרת נסמן $tau = sup {0<=t<=T bar u(t)=0}$ וכמובן $u(tau)=0$ והוא הזמן האחרון שבו $u$ מקבלת את הערך אפס ו־$0<=tau < T$ והיא כמובן לא קבוצה ריקה אז על הקטע $(tau, T]$, הפונקציה $norm(u(t))=sqrt(chevron.l u(t) comma u(t) chevron.r)$ מקיימת
  $ dif/(dif t) norm(u(t)) = (chevron.l u(t), u'(t) chevron.r)/norm(u(t)) <=_"אי־שיוויון קושי־שוורץ" norm(u'(t)) $
  נחשב
  $
    u'(t) = x'_q (t) - x'_p (t) - M'(t)(q-p) = F(x_q (t))-F(x_p (t))-D F(x_p (t)) M(t)(q-p) \
    = F(x_q (t)) - F(x_p (t))- D F(x_p (t))(x_q (t)- x_p (t))+D F(x_p (t))u(t)
  $
  נשים לב שממה שמצאנו לעיל והבחירה שלנו של $q$
  $ norm(F(x_q (t)) - F(x_p (t))-D F(x_q (t) - x_p (t)))< eta norm(x_q (t) - x_p (t)) $
  אז
  $
    norm(u'(t))<= eta norm(x_q (t) - x_p (t))+ L norm(u(t)) = eta norm(u(t)+M(t)(q-p))+L norm(u(t)) \
    <=_"אי-שיוויון המשולש" (eta+L) norm(u(t))+eta norm(M(t))(q-p) <= eta K norm(q-p)+(L + eta)norm(u(t))
  $
  בפרט
  $ (star) space dif/(dif t) norm(u(t))<=eta K norm(q-p)+(L + eta)norm(u(t)) $
  מאותו טריק של מרוכבות על נגזרת של אקספוננט
  $
    dif/(dif t) (e^(-t(L+eta)) norm(u(t)))= e^(-t(L+eta))(-(L+eta)norm(u(t))+dif/(dif t) norm(u(t))) <=_((star)) eta K underbrace(e^(-t(L+eta)), <= 1))norm(q-p) <= eta K norm(q-p)
  $
  אבל האחרון זה נגזרת של פונקציה לינארית $dif/(dif t) (eta K norm(q-p)t)$.\
  ולכן הפונקציה $e^(-t(L+eta))norm(u(t))-eta K t norm(q-p)$ היא מונוטונית יורדת באינטרוול $(tau, T]$ כי הנגזרת קטנה מאפס (מהצבה) ונקבל $ e^(T (L+eta))norm(u(T))-eta K T norm(q-p)<=e^(-tau(L+eta))underbrace(norm(u(tau)), =0)-eta K tau norm(q-p) = -eta K tau norm(q-p)<=0 $
  ובסך־הכל
  $ norm(u(T)) <= e^(T(L+eta)) eta K T norm(q-p) < epsilon norm(q-p) $
]
#end_of_lecture("6 – 28/04")

= משוואות לינאריות

נניח שאנחנו יודעים לפתור את המשוואה
$ (star) space x^prime (t) = A(t) x(t) $
ויש לנו את המשוואה הלא הומגנית
$ (star star) space x^prime(t) = A(t) x(t) + g(t) $
כאשר $A(t)$ היא $n times n$.\
יהיו ${x_1 (t), x_2 (t), dots.h, space x_n (t)}$ בסיס למרחב הפתרונות של $(star)$.\
הרעיון הוא לכתוב פיתרון כללי למשוואה לא הומוגנית $(star star)$ וצריך להראות שלכל $x_i (t)$ עם מתקדמים שמשתנים בזמן. כלומר, נכתוב את $y$ פיתרון ל־$(star star)$ כ־$y(t) = sum_(j=1)^n alpha_j (t) x_j (t)$.\
נסמן ב־$pi(t)$ את המטריצה שעמודותיה הן $x_1 (t), x_2 (t), dots.h, x_n (t)$ והיא נקראית לרוב *המטריצה היסודית / מטריצת פתרונות יסודית*.\
נשים לב ש־$sum_(j=1)^n alpha_j (t) x_j (t) = pi(t) alpha(t)$ כאשר $alpha(t) = vec(alpha_1 (t), dots.v, alpha_n (t))$.\
אם $y(t) = pi(t) alpha(t)$ פותר את $(star star)$ אז $y(0)=pi(0)alpha(0)$ אז $y(t)$ מקיים
$ y^prime (t) = A(t) y(t) + g(t) $
אבל גם
$ y^prime (t) = (pi(t) alpha(t))^prime = pi^prime (t) alpha(t) + pi(t) alpha^prime (t) $
אבל $pi^prime (t)$ מקיימת את המשוואה ההומוגנית ולכן
$ y^prime (t) = A(t) pi(t) alpha(t) + pi(t) alpha^prime (t) $
כלומר
$
  cancel(A(t) y(t)) + g(t) = y^prime (t) = A(t) underbrace(pi(t) alpha(t), = y(t)) + pi(t) alpha^prime (t) = cancel(A(t) y(t)) + pi(t) alpha^prime (t)
$
לכן קיבלנו שתנאי הכרחי על $alpha$ היינו
$ pi(t)alpha^prime (t) = g(t) ==> alpha^prime (t) pi(t)^(-1) g(t) $
ו־$pi$ הפיכה כי היא בסיס למרחב הפתרונות (זוהי מטריצה רגולרית).\
אם כך, מהמשפט היסודי $ alpha(t) = alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s $
זה תנאי הכרחי, צריך לראות אם זה אכן פיתרון.

#theorem[
  יהיו $A : I arrow RR^(n times n)$ רציפה ו־$g: I arrow RR^n$ רציפה כאשר $I subset.eq RR$ קטע.\
  נסמן ב־$pi(t)$ את מטריצת הפתרונות היסודית למשוואה $x^prime (t) = A(t)x(t)$.\
  אזי פונקציה $y(t)=pi(t)(alpha(0)+integral_0^t pi(s)^(-1) g(s) dif s)$ פותרת את המשוואה $y^prime (t) = A(t)x(t)+g(t)$ עם תנאי ההתחלה $y(0)=pi(0)alpha(0)$.
]
#proof[
  נגזור
  $
    y^prime (t) & = [pi(t)(alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s)]^prime \
                & = pi^(prime) (t) (alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s) + pi(t) pi(t)^(-1)g(t) \
                & = A(t) pi(t) (alpha(0) + integral_0^t pi(s)^(-1) g(s) dif s) + g(t) \
                & = A(t) y(t) + g(t)
  $
]

אם $A$ פונקציה קבועה כלומר $A(t)=A$ ו־$x_i (0) = "e"_i$ (הבסיס הסטנדרטי ב־$0$) אז $pi(t) = e^(A t)$ ונקבל
$ y(t)= e^(t A) y_0 + integral_0^t e^((t -s)A) g(s) dif s $
זה נקרא *עיקרון דוהמל*.

= התנהגות לוקלית, התנהגות גלובלית ויציבות
לאורך פרק זה יש לנו $U subset.eq RR^n$ פתוחה ו־$F: U arrow RR^n$ גזירה ברציפות והסימון הרגיל של $Phi(p, t) = phi_t (p)=x_p (t)$ היא הנקודה בה נמצא הפיתרון של $x^prime = F(x)$ עם תנאי התחלה $p$ לאחר זמן $t$.

#theorem[
  תהיי $p in U$ ונניח ש־$F(p)!=0$.\
  אזי קיימות קבוצות פתוחות $p in U_0 subset.eq U_1 subset.eq U$, $V$ פתוחה ב־$RR^n$ כך ש־$0 in V subset.eq RR^n$ והעתקה חד־חד ערכית ועל, גזירה ברציפות ושגם ההופכית שלה היא גזירה ברציפות $alpha:U_1 arrow V$ ו־$delta>0$ כך ש־$alpha(p)=0$ ולכל $x in U_0$ ו־$t in (-delta, delta)$ מתקיים
  $phi_t (x) in U_1$ ו־$alpha(phi_t (x))=alpha(x)+(t, 0, dots.h, 0)$.
]

#proof[
  בלי הגבלת הכלליות נניח ש־$p=0$ ונתבונן בנגזרות החלקיות של $Phi(t, x)$ בנקודה $p=0, t=0$
  $ (partial Phi)/(partial t) |_((0,0)) = F(0) != 0 wide (partial Phi)/(partial x_i) |_((0,0)) = "e"_i $
  היות ש־$F(0)!=0$ ניתן לבחור $n-1$ איברים מאיברי $("e"_1, dots.h, "e"_n)$ ונסמנם $"e"_(i_1), dots.h, "e"_(i_(n-1))$ כך ש־$(F(0), "e"_(i_1), dots.h, e_(i_(n-1)))$ זה בסיס.\
  נניח בלי הגבלת הכלליות ש־$(F(0), "e"_i, dots.h, "e"_(n-1))$ זה בסיס.\
  נגדיר העתקה $beta: RR^n"סביבת 0 ב־" arrow RR^n$ על־ידי $beta(t, x_1, dots.h, x_(n-1))=phi_t (x_1, x_2, dots.h, x_(n-1), 0)$.\
  ממשפט הפונקציה ההפוכה יש סביבה $p in U_1$ וסביבה $0 in V$ כך ש־$beta: V arrow U_1$ היא דיפאומורפיזם גזיר ברציפות ונגדיר $alpha=beta^(-1)$.\
  קיימת סביבה פתוחה $p in U_0 subset.eq U_1$ ו־$delta>0$ כך שלכל $x in U_0$ ו־$t in (-delta, delta)$ מתקיים $phi_t (x) in U_1$.\
  נשאר לבדוק: יהי $x in U_0$ אז יש $s, y_1, y_2, dots.h, y_(n-1)$ כך ש־$x=beta(s, y_1, dots.h, y_(n-1))$ לכומר $x=phi_s (y_1, dots.h, y_(n-1), 0)$ ואז עבור $abs(t)<delta$ מתקיים $phi_t (x) in U_1$ ולכן
  $
    alpha(phi_t (x)) & = alpha(phi_t (phi_s (y_1, dots.h, y_(n-1), 0))) \
                     & = alpha(phi_(t+s) (y_1, dots.h, y_(n-1), 0)) \
                     & = alpha(beta(t+s, y_1, dots.h, y_(n-1))) \
                     & = (s, y_1, dots.h, y_(n-1))+(t, 0, dots.h, 0) \
                     & = alpha(x) + (t, 0, dots.h, 0)
  $
]

#definition[נקודת שיווי משקל][
  הנקודה $p in U$ נקראת *נקודת שיווי משקל* (לפעמיים נקודת שבת) אם $F(p)=0$.\
]
#definition[נקודת שיווי משקל יציבה][
  נקודת שיווי משקל $p$ תקרא *נקודת שיווי משקל יציבה* אם לכל $epsilon > 0$ יש $delta>0$ כך שלכל $q in B_delta (p)$ ולכל $t>0$ מתקיים $phi_t (q) in B_epsilon (p)$.
]
#definition[נקודת שיווי משקל יציבה אסימפטוטית][
  נקודת שיווי משקל $p$ תקרא *נקודת שיווי משקל אסימפטוטית* אם $p$ יציבה וקיימת גם $eta>0$ כך שלכל $q in B_eta (p)$ מתקיים $display(lim_(t arrow infinity) phi_t (q) = p)$.
]
#theorem[הקריטריון הלינארי ליציבות אסימפטוטית][
  תהיי $p in U$ נקודת שיווי משקל של $F$ ונניח שלכל ערך עצמי של $D F(p)$ יש חלק ממשי שלילי. אזי $p$ יציבה אסימפטוטית.
]<linear-criterion-for-asymptotic-stability>
#lemma[
  תהיי $A in CC^(n times n)$ מטריצה עם קבוצת ערכים עצמיים $Lambda subset.eq CC$ ונניח ש־$max_(lambda in Lambda) re(lambda)<0$.\
  אזי לכל $0<alpha<min_(lambda in Lambda) abs(re(lambda))$ יש $C>0$ כך שלכל $t>=0$ מתקיים
  $ norm(exp(t A))_p <= C e^(-t alpha) $
  בפרט
  $ lim_(t arrow infinity) exp(t A)=0 $
]<lemma_before_linear_criterion_for_asymptotic_stability>
#proof[
  נניח ש־$J = P A P^(-1)$ צורת ז'ורדן של $A$.\
  נשים לב ש־$J + alpha I$ היא מטריצה בצורדת ז'ורדן שכל שלכל ערכייה העצמיים חלק ממשי שלילי.\
  לכן עבור $t>=0$ הערכים של $exp(t (J + alpha I))$ הם פולינומים ב־$t$ כפול אקספוננט עם מעריך שלילי ב־$t$ ולכן קיים $C^prime > 0$ כך שמתקיים $ sup_(t >=0) normop(exp(t(J + alpha I))) <= C^prime $
  לכן
  $
    normop(exp(t A)) & = normop(P exp(t J) P^(-1)) \
                     & <= normop(P) normop(P^(-1)) normop(exp(t J)) \
                     & = normop(P)normop(P^(-1))normop(exp(t J + t alpha I - t alpha I)) \
                     & = normop(P)normop(P^(-1))normop(exp(t(J + alpha I))) dot.op e^(-t alpha) <= C dot.op e^(-t alpha)
  $
]
#end_of_lecture("9 – 11/05")

#proof[@lemma_before_linear_criterion_for_asymptotic_stability, הקריטריון הלינארי ליציבות אסימפטוטית][
  כזכור לכל $t in I_p$, $phi_t (x)$ גזירה ב־$p$ ו־$D phi)t (p)$ מקיימת
  $
    (star) space dif/(dif t) [D phi_t (p)] = (D phi_t (p))^prime = D F (phi_t (p)) D phi_t (p) \
    D phi_0 (o) = id
  $
  כאשר קראנו ל־$D phi_t (p) = M$ בעבר.\
  אבל $p$ נקודת שיווי משקל כלומר $F(p)=0$ ולכן $phi_t (p) = p$ לכל $t$ ומכאן נובע ש־$(star)$ היא משוואה לינארית במקדמים קבועים ולכן $M^prime = D F (p) M$.\
  ולכן $ D phi_t (p) = exp(t D F (p)) $
  בפרט מ@lemma_before_linear_criterion_for_asymptotic_stability נובע ש־$normop(exp(t D F(p))) stretch(arrow)_(t arrow infinity) 0$ ולכן יש $T > 0$ שעבורו
  $ normop(exp(T D F(p)))< 1/4 $
  יהי $epsilon > 0$ וקיימת $delta > 0$ כך שלכל $q in B_delta (p)$ ולכן $t in [0,T]$ מתקיים $phi_t (q) in B_epsilon (p)$ (מתלות רציפה בתנאי ההתחלה).\
  בנוסף מהקירוב הלינארי
  $ phi_T (q) = phi_T (p) + D phi_T (p) (q-p) $
  ולכן על־ידי הקטנה של $delta$ אם צריך נוכל להניח שהמחובר $o(p-q)$ לא עולה על $1/4 normop(p-q)$.\
  כלמר
  $ normop(phi_T (q) - phi_T (p)) <= normop(q-p)/2 $
  בפרט $phi_T (q) in B_delta (p)$ שכן $phi_T (p) = p$ ושוב לכל $0<= t<=T$ מתקיים $phi_(T+t) (q) in B_epsilon (p)$ (שוב מהרציפות בתנאי ההתחלה).\
  באיטרציה
  $ normop(phi_(k T) (q) - p)<= 2^(-k) norm(q-p) $
  ולכן $t in [0,T]$ ולכל $k in NN$ מתקיים $phi_(k T + t) (q) in B_epsilon (p)$ כלומר לכל $t > 0$ $phi_t (q) in B_epsilon (p)$ וזו בידיוק ההגדרה של יציבות.\
  נשאר להראות יציבות אסימפטוטית: קיבלנו ש־$phi_(k T) (q) stretch(arrow)_(k arrow infinity) p$ לכל $q in B_delta (p)$.\
  שוב מאותה תלות רציפה בתנאי התחלה נקבל $lim_(t arrow infinity) phi_t (q) = p$ שכן לכל $epsilon^prime > 0$ יש $delta^prime > 0$ כך שאם $y in B_(delta^prime) (p)$ אז לכל $t in [0,T]$ נקבל $ normop(phi_t (y) - p)<epsilon^prime $
]

#definition[פונקציית ליאפונוב][
  יהי $p in B subset.eq U$ כדור.\
  נאמר ש־$L : B arrow RR$ גזירה ברציפות היא *פונקציית ליאפונוב* ל־$F$ בנקודה $p$ אם $chevron.l gradient L, F(x) chevron.r <= 0$ לכל $x in B$ ול־$L$ יש מינימום חזק / מינימום ממש ב־$p$ (כלומר $L(p) <= L(x)$ לכל $x in B$ עם שיוויון אם ורק אם $x=p$).\
  נאמר ש־$L$ היא *פונקציית ליאפונוב חזקה* אם היא פונקציית ליאפונוב ומתקיים בנוסף $chevron.l gradient L(x), F(x) chevron.r < 0$ לכל $x!=p$.
]
#theorem[משפט ליאפונוב][
  תהיי $p in U$ נקודת שיווי משקל של $F$. אם ל־$F$ יש פונקציית ליאפונוב ב־$p$ אז $p$ יציבה.\
  אם ל־$F$ יש פונקציית ליאפונוב חזקה ב־$p$ אז $p$ יציבה אסימפטוטית.
]
#end_of_lecture("10 – 12/05")

#proof[
  נוכיח ראשית שאם יש פונקציית ליאפונוב אז יש לנו יציבות.\
  יהי $r>0$ ו־$L in C^1 (B_r (x_0))$ פונקציית ליאפונוב.\
  נשיב לב שלכל $p in B_r (x_0)$ אם נסתכל על המסילה $x_p$ ונרכיב עליה את הפונקציה $L(x_p (t))$ היא פונקציה יורדת מהגדרת פונקציית ליאפונוב היא יורדת כל זמן שהיא מוגדרת מכלל השרשרת
  $ dif/(dif t) (L(x_p (t))) = (x^prime_p (t), gradient L(x_p (t)))=(F(x_p (t)), L(x_p (t)))<0 $
  יהי $r>epsilon>0$ ומתכונה $(2)$ של פונקציית ליאפונוב ($L(x_0) <= L(x)$) נקבל ש־$display(L(x_0) < min_(x in boundary(B_epsilon (x_0))) L(x))$.\
  לכן קיים $delta > 0$ כך ש־$display(max_(x in B_delta (x_0)) < min_(x in boundary(B_epsilon (x_0))) L(x))$.\
  כעת, אם $p in B_delta (x_0)$ מתקיים שאם יש $t>0$ שעבורו $x_p (t) in.not B_epsilon (x_0)$ אז קיים $t_star$ כך ש־$x_p (t_star) in boundary(B_epsilon (x_0))$ אבל אז $L(x_p (t_star)) > L(x_p (0)) = L(p)$ בסתירה למונוטוניות.\
  כעת נראה ליאפונוב חזקה גורר יציבות אסימפטוטית.\
  יהי $0<R<r$ ומכך שזו פונקציית ליאפונוב חזקה נובע שיש $eta>0$ כך שלכל $p in B_eta (x_0)$ כך ש־$x_p (t) in B_R (x_0)$ לכל $t>=0$.\
  נרצה להראות שלכל $p in B_eta (x_0)$ מתקיים ש־$x_p (t) arrow x_0$. נניח שלא ככה, כלומר יש $p in B_eta (x_0)$ ויש $epsilon > 0$ וסדרת זמנים $t_k arrow infinity$ כך ש־$d(x_p (t_k), x_0) >= epsilon$.\
  נסמן ב־$M = max_(x in B_R (x_0)) norm(F(x))$ ונסמן $C=max {chevron.l gradient L(x), F(x) chevron.r bar epsilon/2 <= norm(x-x_0)<=R}$ ונבחין ש־$0>C$ (מהאי־שיוויון החזק).\
  נשים לב שאם $norm(x_p (t) -x_0)>epsilon$ אז לכל $t<=s<=t+epsilon/(2M)$ מתקיים ש־$norm(x_p (s)-x_0)>=epsilon/2$ שכן
  $ norm(integral_t^s x^prime_p (u) dif u)<= M abs(s-t)<=epsilon/2 $
  כעת נניח על־ידי צמצום לתת־סדרה (אם צריך) ש־$epsilon/(2M) < abs(t_(k+1)-t_k)$ ונחשב את $L(x_p (t))$ עבור $t>0$
  $
    L(x_p (t)) & = L(p) + integral_0^t (L (x_p (s)))^prime dif s \
    & = L(p) + integral_0^t chevron.l gradient L(x_p (s)), F(x_p (s)) chevron.r dif s \
    &<= L(p) + sum_(k=1)^(n bar t_(n+1) <=t) integral_(t_k)^(t_(k+1)) chevron.l gradient L(x_p (s)), F(x_p (s)) chevron.r dif s \
    &<= L(p) + sum_(k=1)^(n bar t_(n+1) <=t) integral_(t_k)^(t_k + epsilon/(2M)) chevron.l gradient L(x_p (s)), F(x_p (s)) chevron.l dif s \
    &= L(p) + sum_(k=1)^(n bar t_(n+1) <=t) C dot.op epsilon/(2M) stretch(arrow)_(t arrow infinity) - infinity
  $
  אבל זאת סתירה כי $L$ חסומה ב־$closure(B_R (x_0))$ לכן לכל $p in B_eta (x_0)$ מתקיים $x_p (t) stretch(arrow)_(t arrow infinity) x_0$.
]

#example[
  נניח ש־$H:U arrow RR$ גזירה ברציפות (כרגיל $U$ פתוחה) ו־$J$ מטריצה אנטי־סימטרית ($J^t = - J$) ונגדיר $F= J gradient H$ אז $H$ פונקציית ליאפונוב (לא חזקה) עבור $F$ היכן ש־$x_0$ היא נקודת מינימום של $H$ (ברור שאם $x_0$ מינימום (חזקה) של $H$ אז $F(x_0) = 0$).\
  $H$ פונקציית ליאפונוב שכן
  $
    chevron.l F, gradient H chevron.r & = chevron.l J gradient H, gradient H chevron.r \
                                      & = chevron.l gradient H, J^t gradient H chevron.r \
                                      & = chevron.l J^t gradient H, gradient H chevron.r \
                                      & = - chevron.l J gradient H, gradient H chevron.r = 0
  $
  אם $x_0$ נקודת שיווי משקל יציבה, האם ייתכן ש־$x_0$ נקודת שיווי משקל יציבה אסימפטוטית? לא ייתכן דבר כזה.\
  כי $chevron.l F, gradient H chevron.r=0$ אומר ש־$H$ נשארת קבועה לאורך המסלולים (זה בעצם קווי גובה) למה? כי
  $ dif/(dif t) H(x_p (t)) = chevron.l gradient H, x^prime_p (t) chevron.r = chevron.l gradient H, F chevron.r = 0 $
]

#example[
  נסמן ב־$f$ את הכוח, אז החוק השני של ניוטון: $f = m a$ ומיריעות אנחנו יודעים שהפוטנציאל הוא $- gradient V = f = m a$.\
  נסמן את המיקום ב־$q$ והתנע זה $p=dif/(dif t) m q = m dif/(dif t) q$.\
  בהינתן $N$ גופים תלת מימדיים יש $3N$ קורדינאטות מיקומים ו־$3N$ קורדינאטות של תנעים $x=(q_1, dots.h, q_(3n), p_1, dots.h, p_(3n))$.\
  אז $ dif/(dif t) p_i = (-gradient V)_i = - (partial V)/(partial q_i) $
  אבל $ dif/(dif t) q_i = p_i / m = partial/(partial p_i) ((p_i^2)/(2m)) $
  נסכום
  $
    H = underbrace(sum_(i=1)^(3N) (p_i^2)/(2m), "אנרגיה קינטית") + underbrace(V(q_1, dots.h q_(3N)), "אנרגיה פוטנציאלית")
  $
  ולכן
  $ dif/(dif t) p_i = - (partial H)/(partial q_i), quad (dif q_i)/(dif t) = (partial H)/(partial p_i) $
  כלומר
  $
    dif/(dif t) vec(q_1, q_2, dots.v, q_(3N), p_1, p_2, dots.v, p_(3N)) = underbrace(mat(0, 3N I; - I_n, 0), 6N times 6N) vec((partial H)/(partial q_1), (partial H)/(partial q_2), dots.v, (partial H)/(partial q_(3N)), (partial H)/(partial p_1), dots.v, (partial H)/(partial p_(3N)))
  $
  המסקנה מהכתיבה הזו היא שתחת כוח משמר (שתלוי רק במיקום) נובע ש־$H$ קבועה לאורך המסילות – כלומר $H$ קבועה בזמן במערכת ו־$H$ נקראת האנרגיה של המערכת ו־$H$ נקראת המילטוניאן.
]

#theorem[הקריטריון הלינארי לאי־יציבות][
  תהיי $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ שדה גזיר ברציפות ו־$x_o in U$ נקודת שיווי משקל.\
  אם ל־$D F(x_0)$ יש ערך עצמי עם חלק ממשי חיובי אז $x_0$ לא יציבה.
]

#proof[
  נוכיח את המשפט תחת ההנחה שלכל הערכים העצמיים של $A colon.eq D F(x_0)$ יש חלק ממשי שאינו אפס כלומר אין ל־$A$ ערכים עצמיים עם חלק ממשי אפס.\
  נסמן $H_plus$ יהיה תת־המרחב של $RR^n$ הנפרש על־ידי הוקטורים העצמיים (המוכללים אם צריך) עם ערך עצמי שלו חלק ממשי גדול מאפס ו־$H_minus$ וכן הלאה עם ערך עצמי שלו חלק ממשי קטן מאפס ומההנחה $RR^n = H_plus plus.o H_minus$ ונסמן ב־$pi_plus.minus$ את ההטלות המתאימות לסכום הישר (ההנחה של המשפט אומר ש־$H_plus != {0}$).\
  #end_of_lecture("11 – 18/05")
  נניח ש־$x_0 = 0$ ונניח בשלילה ש־$0$ יציבה, כלומר: לכל לכל $epsilon > 0$ יש $delta>0$ כך שאם $p in B_delta (0)$ אז $x_p (t) in B_epsilon (0)$.\
  נגדיר את הפונקציה $g(x)=F(x)-A x$ כך שיתקיים
  $ x^prime (t) = F(x(t)) = A x(t) + g(x(t)) $
  לכן ניתן לכתוב את הפתרון למשוואה באופן הבא
  $ (star star) space x(t) = e^(t A) x(0) + integral_0^t e^((t-s)A) g(x(s)) dif s $
  להמשך ההוכחה אנחנו צריכים שתי למות
  #lemma[
    קיים $R>0$ כך שאם $x:[0,infinity) arrow B_R (0)$ פותרת את המשוואה $x^prime (t) = F(x(t))$ אז
    $
      x(t)=e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s) A) pi_minus g(x(s)) dif s - integral_t^infinity e^((t-s)A) pi_plus + g(x(s)) dif s
    $
  ]<first-lemma-for-the-linear-criterion-for-instable>
  #proof[@first-lemma-for-the-linear-criterion-for-instable][
    נשים לב
    $ F(x) = F(0) + A(x+ o(norm(x))) $
    ולכן מכך ש־$F(0) = 0$
    $ g(x) =F(x) - A x = o(norm(x)) $
    בפרט, יש $R>0$ כך שלכל $x in RR$ מתקיים $norm(g(x))<=norm(x)$ ובנוסף
    $ pi_plus.minus e^(t A) = e^(t A) pi plus.minus $
    נכפול את $(star star)$ ב־$e^(t A)$ ונפעיל את $pi_plus$ ונקבל (כי $pi_plus$ זו העתקה לינארית וגם אינטגרל הוא לינארי)
    $
      (star star star) space e^(-t A) pi_plus x(t) = pi_plus (x(0)) + integral_0^t e^(-s A) pi_plus g(x(s)) dif s ==> pi_plus (x(0)) = - integral_0^infinity e^(-s A) pi_plus + g(x(s)) dif s
    $
    נרצה להראת את החץ מימין: קיים קבוע $C>0$ כך שאם $0<mu<min { abs(re(lambda)) bar A "ערך עצמי של" lambda}$ ואז
    $ normop(pi_plus.minus) <= C $
    אז לכל $t>0$
    $ norm(e^(t A) pi_minus x) <= C e^(- mu t) norm(x) $
    ולכל $t<0$
    $
      norm(e^(t A) pi_plus x) <= C e^(-mu abs(t)) norm(x)
    $
    לכן אם $x(t) in B_r (0)$ לכל $t<0$ נובע
    $ norm(e^(-t A) pi_plus (x(t)))<= C^2 e^(-pi t) R stretch(arrow)_(t arrow infinity) 0 $
    בנוסף לכל $s>0$
    $ norm(g(x(s)))<=norm(x(s)) $
    ולכן
    $ norm(e^(-s A) + pi_plus g(x(s)))<= C^2 e^(-s mu) R $
    וזה אינטגרבילי ב־$s$ ולכן ניתן ל־$t$ לשאוף לאינסוף ב־$(star star star)$ ונקבל
    $ pi_plus (x(0)) = - integral_0^infinity e^(-s A) pi_plus g(x(s)) dif s $
    נתבונן
    $ x(t)=e^(t A) x(0) + integral_0^t e^((t-s) A) g(x(s)) dif s $
    ונקבל
    $
      x(t) = e^(t A) pi_plus (x(0)) + e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s)A) pi_minus g(x(s)) dif s + integral_0^t e^((t-s)A) pi_plus g(x(s)) dif s \
      = e^(t A) pi_minus (x(0)) + integral_0^t e^((t-s)A) pi_minus g(X(s)) dif s - integral_t^infinity e^((t-s)A) pi_plus g(x(s)) dif s
    $
  ]

  #lemma[
    קיים $R>R_0 > 0$ מהלמטה הקודמת כך שאם $x,y : [0,infinity) arrow B_(R_0) (0)$ הם פתרונות ל־$x^prime = F(x)$ כך ש־$pi_minus (x(0)) = pi_minus (y(0))$ אז $x(t)=y(t)$ לכל $t$.
  ]<second-lemma-for-the-linear-criterion-for-instable>

  #proof[@second-lemma-for-the-linear-criterion-for-instable][
    לכל $epsilon > 0$ קיים $R>R_0 > 0$ ($R$ מהלמה הקודמת) כך שלכל $z_1, z_2 in B_(R_0) (0)$ מתקיים
    $ norm(g(z_1) - g(z_2)) < epsilon norm(z_1 - z_2) $
    זה נובע מהגזירות ברציפות של $F$ : כי לכל $z_1, z_2$ מתקיים
    $
      F(z_2) = F(z_1) + D F(z_1)(z_2 - z_1) + o(norm(z_2-z_1)) = F(z_1) + A(z_2 -z_1) + (D F(z_1) - A)(z_2 - z_1) + o(norm(z_2 - z_1))
    $
    לכן
    $ g(z_2) - g(z_1) = (D F(z_1)-A)(z_2 - z_1) + o(norm(z_2 - z_1)) $
    #end_of_lecture("12 – 19/05")
    נקבע $R_0 = R_0 (epsilon)$ עבור $epsilon=epsilon(C, mu)$ עבור $mu$ מהלמה הקודמת שנגדיר בהמשך.
    נניח ש־$x,y$ פתרונות עם $pi_minus (y(0))=pi_minus (x(0))$ כך ש־$x!=y$ ל־$t>0$ ו־$x(t), y(t) in B_(R_0) (0)$ ונסמן
    $ d = sup_(t in [0,infinity)) norm(x(t)-y(t)) $
    היות ש־$R>R_0$ ו־$x(t), y(t) in B_R (0)$ ל־$t>0$ ובפרט המסקנה של הלמה הקודמת נכונה עבורם. כלומר
    $
      x(t)=e^(t A) pi_minus (x(0))+integral_0^t e^((t-s)A)pi_minus (g(x(s))) dif s - integral_t^infinity e^((t-s) A) pi_plus (g(x(s))) dif s
    $
    וכנל עבור $y$.\
    לכן
    $
      norm(x(t)-y(t)) &= norm(integral_0^t e^((t-s) A) pi_minus (g(x(s))-g(y(s))) dif s - integral_t^infinity e^((t-s)A) pi_plus (g(x(s))-g(y(s))) dif s) \
      &<= integral_0^t norm(e^((t-s)A) pi_minus (g(x(s))-g(y(s))))+integral_t^infinity norm(e^((t-s)A) pi_plus (g(x(s))-g(y(s))))
      \ &<= integral_0^t C e^(-(t-s)mu) norm(g(x(s))-g(y(s)) dif s) + integral_t^infinity C e^((t-s)mu)norm(g(x(s))-g(y(s))) dif s \
      &<= epsilon integral_0^t C e^(-(t-s)mu) norm(x(s)-y(s)) dif s + epsilon integral_t^infinity C e^((t-s)mu) norm(x(s)-y(s)) dif s \
      &<= 2epsilon C d (integral_0^t e^(-s mu) dif s + integral_t^infinity e^(-s mu) dif s) \
      &= 2 epsilon C d integral_0^infinity e^(-s mu) dif s \
      &= (2epsilon C d)/mu
    $
    כאשר אי־השיוויון השני נובע מהלמה הקודמת.\
    אז נבחר $epsilon = mu/(4C)$ ונקבל לעיל $d/2$ אבל זו סתירה כי $d$ זה אומר ש־$d=0$ (נזכר ש־$norm(x(t)-y(t))=d$).
  ]
  נבחין שההוכחה של @second-lemma-for-the-linear-criterion-for-instable מראה שיציבות היא בלתי אפשרית.
  שכן, אם $x_0$ נקודה יציבה אז קיימת $eta>0$ כך שלכל $p in B_eta (0)$ מתקיים $x_p (t) in B_(R_0) (0)$ לכל $t>0$.\
  בפרט, קיימים $x!=y$ כמו בלמה עם $pi_minus (x) = pi_minus (y)$ ולכן $x(0)=y(0)$.
]

= מערכות שטורם־ליוביל
מוטיבציה: מה המשוואה שמתארת את התזוזה של מיתר? היא נתונה על־ידי $u=(x,t)$ ומתקיים
$ 1/c^2 (partial^2 u)/(partial t^2) = (partial^2 u)/(partial x^2) $
$c$ הוא קבוע פיזיקלי ועבורנו הוא $1$.\
נניח שניתן לכתוב פתרון $u$ בצורה $u(x,t) = phi(x)psi(t)$ אז
$
  (partial^2 u)/(partial t^2) = phi(x) psi^prime.double (t) wide (partial^2 u)/(partial x^2) = phi^prime.double (x) psi (t) \
  ==> phi(x) psi^prime.double (t) = phi^prime.double (x) psi(t) <==> (psi^prime.double (t))/psi(t) = (phi^prime.double (t))/phi(t) = lambda
$
כלומר $psi^prime.double (t) = lambda psi(t)$ וגם $phi^prime.double (x) = lambda phi(x)$.\
מה התנאים הטבעיים שהמיתר מספר לנו?
$ forall t, space u(0,t) = u(pi,t)=0 $
אז
$
  u(x, 0) = f(x) \
  (partial u)/(partial t) (x,0) = g(x)
$
התנאי שלנו של $phi(0)=phi(pi)=0$ זה לא תנאי התחלתי זה תנאי שפה.\
אז אם נסתכל על המערכת $phi^prime.double (x) = lambda phi(x)$ אז עבור $lambda>0$ הפתרונות הם צירוף לינארי של $e^(plus.minus sqrt(lambda)x)$ אבל זה כמובן לא ייתכן, $lambda=0$ זה פיתרון טריוויאלי ואם $lambda<0$ נסמן $lambda=-m^2$ ונקבל
$ phi(x) = A_m cos(m x) + B_m sin(m x) $
אבל $phi(0)=0$ ולכן $A_m = 0$ אבל גם $phi(pi)=0$ אז $m in ZZ$ ולכן $phi_m (x) = B_m sin (m x)$.
#end_of_lecture("13 – 25/05")
