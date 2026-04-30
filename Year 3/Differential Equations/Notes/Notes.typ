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
