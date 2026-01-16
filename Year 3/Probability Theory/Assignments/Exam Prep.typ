#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן --- משפטים והוכחות נבחרים --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#theorem("אי־שיוויון בול")[]
#proof[]

#pagebreak()

#theorem("רציפות פונקציית ההסתברות")[]
#proof[]

#pagebreak()

#theorem("נוסחת ההסתברות השלמה במונחי הסתברות מותנית")[]
#proof[]

#pagebreak()

#theorem("כלל בייס")[]
#proof[]

#pagebreak()

#theorem("לקט תכונות של אי־תלות")[]
#proof[]

#pagebreak()

#theorem("שוויון כמעט־תמיד גורר שיוויון התפלגויות")[]
#proof[]

#pagebreak()

#theorem("שיוויון התפלגויות נשמר תחת הפעלת פונקציה")[]
#proof[]

#pagebreak()

#theorem("הצלחה ראשונה בסדרת ניסויי ברנולי בלתי־תלויים מתפלג גיאומטרי")[]
#proof[]

#pagebreak()

#theorem("חוסר זיכרון של התפלגות גיאומטרית")[]
#proof[]

#pagebreak()

#theorem("סכום משתנים ברנולי בלתי־תלויים מתפלג בינומית")[]
#proof[]

#pagebreak()

#theorem("חיבור משתנים מקריים בינומיים בלתי־תלויים")[]
#proof[]

#pagebreak()

#theorem("פואסון כגבול של בינומי במובן הנקודתי")[]
#proof[]

#pagebreak()

#theorem("נוסחת התוחלת השלמה")[
  תהיי $cal(A)$ חלוקה בת־מנייה של מרחב הסתברות $(Omega, cal(F), PP)$ ויהי $X$ משתנה מקרי בעל תוחלת סופית על מרחב זה. אז
  $ EE(X)=sum_(A in cal(A)) EE(X bb(1)_(A)) $
]
#proof[
  נוכיח עבור $X$ בדיד: $cal(A)$ חלוקה ולכן $sum_(A in cal(A)) bb(1)_(A)=bb(1)_(Omega)=1$ ולכן גם $sum_(A in cal(A)) X bb(1)_(A)=X$ ונחשב
  $
    EE(X)=EE(sum_(A in cal(A)) X bb(1)_(A))=_"הגדרת התוחלת" sum_(x in RR) x PP(sum_(A in cal(A)) X bb(1)_(A))=_"הסתברות שלמה" sum_(x in RR) x sum_(A in cal(A)) PP(X bb(1)_(A)=x) \
    =_("שינוי סדר סכימה" \ "בטור מתכנס בהחלט") sum_(A in cal(A)) sum_(x in RR) x PP(X bb(1)_(A)=x)=_"הגדרת התוחלת" sum_(A in cal(A)) EE(X bb(1)_(A))
  $
  כאשר השיוויון של הסתברות שלמה נובע מכך שלכל $x!=0$
  $ union.big.dot_(A in cal(A)) {X bb(1)_(A)=x}=union.big.dot_(A in cal(A))({X=x} inter A)={X=x} $
]

#pagebreak()

#theorem("נוסחת סכום לשונות")[לכל אוסף $(X_k)_(k in [n])$ של משתנים מקריים מתקיים
  $ Var(sum_(i=1)^n X_k) = sum_(ell, k<=n) Cov(X_k, X_ell)=sum_(k<=n) Var(X_k)+2sum_(k<ell<=n) Cov(X_k, X_ell) $
  בכל מקרה בו אגף ימין מוגדר היטב.\
  _תזכורת_:
  $
    Var(X) colon.eq EE((X-EE(X))^2)=EE(X^2)-EE(X)^2 \
    Cov(X, Y) colon.eq EE((X-EE(X))(Y-EE(Y)))=EE(X Y)-EE(X)EE(Y)
  $
]
#proof[
  נמרכז את המשתנים המקריים ${X_k}$ על־ידי $overline(X_k)=X_k - EE(X_k)$ ולכן
  $
    EE(overline(X_k))=0 \
    Var(overline(X_k))=EE(overline(X_k)^2) \
    Cov(overline(X_k), overline(X_ell))=EE(overline(X_k)overline(X_ell))
  $
  מתקיים
  $
    Var(sum_(k=1)^n overline(X_k)) =_("אדישות להזזות") Var(sum_(k=1)^n overline(X_k)-sum_(k=1)^n EE(X_k))= Var(sum_(k=1)^n X_k)
  $
  ונקבל אם־כך
  $
    Var(sum_(k=1)^n overline(X_k))=EE((sum_(k=1)^n overline(X_k))^2)=EE(sum_(k=1)^n sum_(ell=1)^n overline(X_k) overline(X_ell))=_"לינאריות" sum_(k=1)^n sum_(ell=1)^n EE(overline(X_k) overline(X_ell)) = sum_(k=1)^n sum_(ell=1)^n Cov(X_k, X_ell) \
    =sum_(k, ell <=n) Cov(X_k, X_ell)
  $
  והשיוויון הימני נובע מהיות $Cov(X, X)=Var(X)$ והכנסה של ערכים אלו בסכום.
]

#pagebreak()

#theorem("אי־שיוויון מרקוב")[יהי $X$ משתנה מקרי אי־שלילי (כלומר $X>=^(a.s) 0$) בעל תוחלת סופית. אזי לכל $a>0$ מתקיים
  $ PP(X>=a)<=EE(X)/a $
]
#proof[
  נפעיל את נוסחת התוחלת השלמה על החלוקה ${{X<0}, {X in [0, a)}, {a<=X}}$ ונקבל
  $ EE(X)=EE(X bb(1)_(X<0))+EE(X bb(1)_(X in [0,a)))+EE(X bb(1)_(X>=a)) $
  $X$ הוא אי־שלילי ולכל $b in RR$ מתקיים $X bb(1)_(X>=b) >=^(a.s) b bb(1)_(X>=b)$ והרי
  $ X bb(1)_(X<0) =^(a.s) 0 wide X bb(1)_(X in [0,a)) >=^(a.s) 0 wide X bb(1)_(X>=a) >=^(a.s) a bb(1)_(X>=a) $
  וממונוטוניות התוחלת נקבל
  $
    EE(X)=EE(X bb(1)_(X<0))+EE(X bb(1)_(X in [0,a)))+EE(X bb(1)_(X>=a)) >= 0+0 + a EE(bb(1)_(X>=a))=a PP(X>=a) \
    ==> PP(X>=a) <= EE(X)/a
  $
]

#pagebreak()

#theorem("אי־שיוויון צ'בישב")[יהי $X$ משתנה מקרי בעל שונות סופית. אז לכל $a>0$ מתקיים
  $ PP(abs(X-EE(X))>=a)<=Var(X)/a^2 $
]
#proof[
  נגדיר משתנה חדש $Y=(X-EE(X))^2$ וזה משתנה מקרי אי־שלילי המקיים $EE(Y)=Var(X)$.\
  לכן לפי אי־שיוויון מרקוב לכל $b>0$ מתקיים
  $ PP(Y>=b)<=EE(Y)/b = Var(X)/b $
  נשים לב ${abs(X-EE(X))>=a}={(X-EE(X))^2 >= a^2}$ ולכן בבחירת $b=a^2$ נקבל
  $ PP(abs(X-EE(X))>=a)=PP((X-EE(X))^2 >= a^2)= PP(Y>=a^2)<=Var(X)/a^2 $
]

#pagebreak()

#theorem("אי־שיוויון צ'רנוף")[
  יהי $X$ משתנה מקרי בעל מומנט מעריכי. אזי לכל $t>0$ עבורו $M_X (t)$ מוגדרת ולכל $a in RR$ מתקיים
  $ PP(X>=a)<=M_X (t) e^(-t a) $
  _תזכורת_: יהי $X$ משתנה מקרי. הפונקציה הממשית $M_X (t)$ הנתונה על־ידי
  $ M_X (t) colon.eq EE(e^(t X)) $
  לכל $t$ עבורו התוחלת מוגדרת נקרא הפונקציה היוצרת מומנטים של $X$.
]
#proof[
  נשתמש באי־שיוויון מרקוב בשביל המשתנה המקרי החיובי $e^(t X)$ ונקבל
  $ PP(X>=a)=PP(e^(t X)>=e^(t a))<=_"אי־שיוויון מרקוב" EE(e^(t X))/e^(t a) = M_X (t) e^(-t a) $
]

#pagebreak()

#theorem("אי־שיוויון הופדינג")[
  יהיו ${X_k}_(k in [n])$ משתנים מקריים בלתי־תלויים ובעלי תוחלת אפס אשר מקיימים $abs(X_k)<=^(a.s) 1$ לכל $k in [n]$ אז
  $ forall d>0, space (sum_(k in [n]) X_k >=d)<=exp(-d^2/(2n)) $
]
#theorem("כפליות פונקציה יוצרת מומנטים עבור סכום משתנים מקריים בלתי־תלויים")[
  יהיו $X$ ו־$Y$ משתנים מקריים בלתי־תלויים, אז
  $ M_(X+Y) (t) = M_X (t) M_Y (t) $
  בתחום שבו $M_X (t), M_Y (t)$ שתיהן מוגדרות.
]
#proof[
  היות ואי־תלות נשמרת תחת הפעלת פונקצייה נובע כי $e^(t Y), e^(t X)$ משתנים מקרים בלתי־תלויים. אז מכפליות התוחלת למשתנים בלתי־תלויים
  $ EE(e^(t(X+Y)))=EE(e^(t X) e^(t Y))= EE(e^(t X))EE(e^(t Y)) $
]
#theorem("הלמה של הופדינג")[
  יהי $X$ משתנה מקרי המקיים $abs(X)<=^(a.s) 1$ וכן $EE(X)=1$. אז לכל $t in RR$ מתקיים
  $ EE(e^(t X))<= exp(t^2/2) $
]
#proof[
  נקבע את $t$ ונסמן ב־$L(x)$ את הפונקציה
  $ L(x) = (e^t+e^(-t))/2 + x (e^t-e^(-t))/2 $
  הפונקציה $e^(t x)$ כפונקציה של $x$ היא בעלת נגזרת שנייה חיובית ולכן קמורה, אז לכל $x in [-1, 1]$ מתקיים $e^(t x)<=L(x)$.\
  ממונוטוניות ולינאריות התוחלת נקבל
  $ EE(e^(t X))<=EE(L(X))=(e^t+e^(-t))/2 + EE(X) (e^t-e^(-t))/2=_(EE(X)=0) (e^t+e^(-t))/2 $
  לכל $t in RR$ מתקיים $(e^t+e^(-t))/2 <= e^(t^2/2)$ וזה נובע מטור טיילור
  $
    (e^t+e(-t))/2 = 1/2 sum_(n=0)^infinity (t^n+(-t)^n)/n! = sum_(m=0)^infinity t^(2m)/(2m)! <= sum_(m=0)^infinity t^(2m)/(2^m m)! = sum_(m=0)^infinity (t^2/2)^m/(m!) = e^(t^2/2)
  $
]
#proof[
  אם־כך, נסמן $X = sum_(k in [n]) X_k$ ומתקיים מהטענות לעיל
  $ M_X (t) = product_(k in [n]) M_(X_k) (t) <= product_(k in [n]) exp(t^2/2) = exp((n t^2)/2) $
  מאי־שיוויון צ'רנוף לכל $t>0$
  $ PP(X>=d)<=exp((n t^2)/2 - t d) $
  כדי למצוא $t$ שימעזר את החסם נגזור את המעריך ונשווה לאפס
  $ dif/(dif t) ((n t^2)/2 - t d) = n t - d = 0 ==> t = d/n $
  נקבל
  $ PP(X>=d)<=exp((n (d/n)^2)/2 - (d/n) d) = exp(-d^2/(2n)) $
]

#pagebreak()

#theorem("הלמה של פאטו")[
  תהיי ${A_n}_(n in NN)$ סדרת מאורעות. אז
  $
    PP({A_i, a.e.})=PP(liminf_(n arrow.r infinity) A_n)<=liminf_(n arrow.r infinity) PP(A_n) \
    PP({A_i, i.o.})=PP(limsup_(n arrow.r infinity) A_n)>=limsup_(n arrow,r infinity) PP(A_n)
  $
]
#proof[
  ראשית נראה כי הטענה השנייה נובעת מנכונות הטענה הראשונה:
  $
    PP({A_i, i.o.})=_({A_i, i.o.}^c = {A_i^c, a.e.}) 1-PP({A_i^c, a.e.})>=_"חלק ראשון" 1-liminf_(n arrow.r infinity) PP(A_n^c)=1-liminf_(n arrow.r infinity) (1-PP(A_n))=limsup_(n arrow.r infinity) PP(A_n)
  $
  $
    liminf_(n arrow.r infinity) PP(A_n)=lim_(n arrow.r infinity) inf_(i>n) PP(A_i) >= lim_(n arrow.r infinity) PP(inter.big_(i>n) A_i)=_("רציפות פונקציית ההסתברות" \
    "למאורעות עולים") PP(union.big_(n in NN) inter.big_(i>n) A_i)=PP({A_i, a.e.})
  $
]

#pagebreak()

#theorem("הלמה הראשונה של בורל־קנטלי")[
  תהיי $A_i$ סדרת מאורעות. אם $sum_(i=1)^infinity PP(A_i)<infinity$ אז $PP(A_i, i.o.)=0$.
]
#proof[
  $
    PP(A_i, i.o.)=_("רציפות פונקציית ההסתברות" \
    "למאורעות עולים") lim_(n arrow.r infinity) PP(union.big_(i=n)^infinity A_i) <=_"אי־שיוויון בול" lim_(n arrow.r infinity) sum_(i=n)^infinity PP(A_i) =0
  $
  כאשר השיוויון האחרון נובע מכך ש־$sum_(i=1)^infinity PP(A_i) < infinity$ אם ורק אם $lim_(n arrow.r infinity) sum_(i=n)^infinity PP(A_i)=0$.
]

#pagebreak()

#theorem("הלמה השנייה של בורל־קנטלי")[
  תהיי $A_i$ סדרת מאורעות בלתי־תלויים. אם $sum_(i=1)^infinity A_i = infinity$ אז $PP(A_i, i.o.)=1$.
]
#proof[
  $
    PP(A_i, i.o.)=1-PP(A_i^c, a.e.)=1-PP(union.big_(m=1)^infinity inter.big_(i=m)^infinity A_i^c)=_("רציפות פונקציית ההסתברות" \
    "למאורעות עולים") 1-lim_(m arrow.r infinity) PP(inter.big_(i=m)^infinity A_i^c)
  $
  אז מספיק שנראה שלכל $m in NN$ מתקיים $PP(inter.big_(i=m)^infinity A_i^c)=0$ ואכן מהאי־תלות
  $
    PP(inter.big_(i=m)^infinity A_i^c)=_("רציפות פונקציית ההסתברות" \
    "למאורעות עולים") lim_(n arrow.r infinity) PP(inter.big_(i=m)^n A_i^c)=lim_(n arrow.r infinity) product_(i=m)^n (1-PP(A_i))<=lim_(n arrow.r infinity) exp(-sum_(i=m)^n PP(A_i))=0
  $
  כאשר האי־שיוויון נובע מכך ש־$1+x<=e^x$ לכל $x$ והשיוויון נובע מכך ש־$sum_(i=1)^infinity PP(A_i)=infinity ==> sum_(i=m)^infinity PP(A_i)=infinity$ לכל $m$.
]

#pagebreak()

#theorem("החוק החלש של המספרים הגדולים")[]
#proof[]

#pagebreak()

#theorem("החוק החזק של המספרים הגדולים")[]
#proof[]
