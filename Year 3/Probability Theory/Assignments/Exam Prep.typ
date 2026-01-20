#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן --- משפטים והוכחות נבחרים --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#theorem(
  "רציפות פונקציית ההסתברות",
)[יהי $(Omega, cal(F), PP)$ מרחב הסתברות ותהיי ${A_n}_(n in NN)$ סדרה עולה של מאורעות. אז מתקיים
  $ PP(union.big_(n in NN) A_n) = lim_(n arrow.r infinity) PP(A_n) $
]
#proof[
  נקבע $B_1 = A_1$ ולכל $n>1$ נגדיר $B_n = A_n without A_(n-1)$ ואלו בהכרח מאורעות זרים:\
  כי אם $m<n$ אז לכל $omega in B_n$ מתקיים $omega in.not A_(n-1)$ ולכן מתקיים $omega in.not A_m supset B_m$.\
  מצד שני, באינדוקציה
  $ (star) space union.big.dot_(k in [n]) B_k = union.big_(k in [n]) A_k = A_n $
  עבור $A_1 = B_1$ הטענה מיידית, נניח כי היא מתקיימת עבור $n>=1$ ונקבל
  $
    union.big.dot_(k in [n+1]) B_k = (union.big.dot_(k in [n]) B_k) union.big B_(n+1) =_"הנחת האינדוקציה" A_n union.big (A_(n+1) without A_n) =_(A_n subset A_(n+1)) A_(n+1)
  $
  ולכן
  $ (star star) space union.big_(k in NN) B_k = union.big_(k in NN) A_k $
  אם־כך מסכימות נקבל
  $
    PP(union.big_(k in NN) A_k) =_((star star)) PP(union.big.dot_(k in NN) B_k)=_"סכימות" sum_(k=1)^infinity PP(B_k) =_"הגדרת הטור" lim_(n arrow.r infinity) sum_(k in [n]) PP(B_k)=_"סכימות" lim_(n arrow.r infinity) PP(union.big.dot_(k in [n]) B_k) =_((star)) lim_(n arrow.r infinity) PP(A_n)
  $
]

#pagebreak()

#theorem("אי־שיוויון בול")[
  #theorem("אי־שיוויון בול למספר מאורעות")[
    לכל $m in NN$ ולכל סדרה של $m$ מאורעות ${A_n}_(n in [m])$ במרחב הסתברות $(Omega, cal(F), PP)$ מתקיים
    $ PP(union.big_( n in [m]) A_n) <= sum_(n in [m]) PP(A_n) $
  ]
  #proof[
    באינדוקציה על $m$, עבור $m=2$ בסיס האינדוקציה: יהיו $A,B$ מאורעות כנ"ל אז $A union B = A union.dot (B without A)$ ולכן
    $
      PP(A union B) =_("סכימות פונקציית ההסתברות" \ "למאורעות זרים") PP(A) + PP(B without A)<=_("מונוטוניות פונקציית ההסתברות") PP(A) + PP(B)
    $
    כעת נניח את נכונות הטענה עבור $m$ ונוכיחה עבור $m+1$: יהיו $A_1, dots.h, A_(m+1)$ מאורעות ונפעיל את הטענה עבור שני מאורעות $union_(i=1)^m A_i, A_(m+1)$ ונקבל
    $
      PP(union.big_(i=1)^(m+1) A_i)<=PP(union.big_(i=1)^m A_i) + PP(A_(m+1)) <=_("הנחת האינדוקציה") sum_(i=1)^(m+1) PP(A_i)
    $
    עבור מאורעות יורדים, נשתמש בהיות המשלים שלהם מאורעות עולים.
  ]
  #theorem("אי־שיוויון בול לסדרת מאורעות")[לכל סדרת מאורעות ${A_n}_(n in NN)$ במרחב הסתברות $(Omega, cal(F), PP)$ מתקיים
    $ PP(union.big_(n in NN) A_n)<=sum_(n in NN) PP(A_n) $
  ]
  #proof[
    נגדיר $B_k = union_(k in [n]) A_k$ וזו סדרת מאורעות עולה המקיימת $union_(n in NN) B_n = union_(n in NN) A_n$, אז
    $
      PP(union.big_(n in NN) A_n)=PP(union.big_(n in NN) B_n) =_"רציפות פונקציית ההסתברות" lim_(n arrow.r infinity) PP(union.big_(k in [n]) A_k)<=_"אי־שיוויון בול" lim_(n arrow.r infinity) sum_(k=1)^n PP(A_k) = sum_(k=1)^infinity PP(A_k)
    $
  ]
]

#pagebreak()

#theorem("נוסחת ההסתברות השלמה במונחי הסתברות מותנית")[
  תהיי $cal(A)$ חלוקה בת־מנייה של מרחב הסתברות $(Omega, cal(F), PP)$. אז לכל מאורע $B$ מתקיים
  $
    PP(B) = sum_(A in cal(A) \
    PP(A) > 0) PP(B bar A) PP(A)
  $
]
#proof[
  נתזכר את כלל השרשרת: יהיו $A,B$ מאורעות במרחב ההסתברות כך שמתקיים $PP(B)>0$, אז
  $ PP(A bar B) PP(B) = PP(A inter B) $
  נשתמש בנוסחת ההסתברות השלמה ונקבל
  $
    PP(B) = sum_(A in cal(A)) PP(A inter B) = sum_(A in cal(A) \ PP(A) > 0) PP(A inter B) + sum_(A in cal(A) \ PP(A) = 0) PP(A inter B) =_"כלל השרשרת" sum_(A in cal(A) \ PP(A) > 0) PP(B bar A)PP(A) + sum_(A in cal(A) \ PP(A) = 0) 0 = sum_(A in cal(A) \ PP(A) > 0) PP(B bar A) PP(A)
  $
]

#pagebreak()

#theorem("כלל בייס")[יהי $(Omega, cal(F), PP)$ מרחב הסתברות ויהיו $A,B$ שני מאורעות בעלי הסתברות חיובית, אזי
  $ PP(A bar B) PP(B) = PP(B bar A) PP(A) $
  או בניסוח אחר
  $ PP(A bar B) = PP(B bar A) PP(A)/PP(B) $]
#proof[
  $ PP(B) PP(A bar B) = (PP(B) PP(A inter B))/PP(B) = PP(A inter B) = (PP(A) PP(A inter B))/PP(A) = PP(B bar A) PP(A) $
]

#pagebreak()

#theorem("לקט תכונות של אי־תלות")[]
#proof[]

#pagebreak()

#theorem("שוויון כמעט־תמיד גורר שיוויון התפלגויות")[
  יהיו $X,Y$ משתנים מקריים על מרחב הסתברות $(Omega,cal(F), PP)$. אם $X=^(a.s) Y$ אז $X=^d Y$.\
  _תזכורת_:\
  $
    PP(X=Y) = PP({omega bar X(omega)=Y(omega)})=1 ==> X=^(a.s) Y \
    PP_X = PP_Y ==> X=^d Y
  $
]
#proof[
  אם $X=^(a.s) Y$ אז לכל $S in cal(F)_RR$ מתקיים לפי מונוטוניות $PP(X in S, Y in.not S) <= PP(X!=Y)=0$ ובדומה $PP(X in.not S, Y in S) = 0$, אז
  $
    PP_X (s) = PP(X in S) = PP(X in S, Y in S) + PP(X in S, Y in.not S)= PP(X in S, Y in S) + PP(X in.not S, Y in S) = PP(Y in S) = PP_Y (S)
  $
]

#pagebreak()

#theorem(
  "שיוויון התפלגויות נשמר תחת הפעלת פונקציה",
)[יהיו $X,Y$ משתנים מקריים בדידים ושווי התפלגות (לאו דווקא על אותו מרחב הסתברות) ותהיי $f in cal(F)_(RR arrow.r RR)$ אזי $f(X)=^d f(Y)$.]
#proof[תהיי $S subset RR$ אזי
  $ PP_(f(X)) (S) = PP(f(X) = S) = PP(X in f^(-1)(S))=_(X=^d Y) PP(Y in f^(-1)(S)) = PP(f(Y) in S) = PP_(f(Y)) (S) $]

#pagebreak()

#theorem(
  "שיוויון כמעט־תמיד נשמר תחת הפעלת פונקציה",
)[יהיו $X,Y$ משתנים מקריים בדידים המקיימים $X=^(a.s) Y$ ותהיי $f in cal(F)_(RR arrow.r RR)$ אזי $f(X)=^(a.s) f(Y)$.]
#proof[

  מכך שמתקיים $X =^(a.s.) Y$ נובע שמתקיים $PP(X=Y)=PP({omega in X(omega)=Y(omega)})=1$, כלומר $PP(X!=Y)=0$ מהגדרת המשלים.\
  נסמן
  $ N colon.eq {omega in Omega bar X(omega)!=Y(omega)} $
  נרצה להראות ש־$PP(f(X)!=f(y))=0$, אז נגדיר
  $ N_f colon.eq {omega in Omega bar f(X(omega))!=f(Y(omega))} $
  אם $omega in N$, מתקיים $X(omega)!=Y(omega)$ ויכול להיות $f(X(omega))!= f(Y(omega))$ ויכול להיות $f(X(omega))!=f(Y(omega))$.\
  אם $omega in.not N$ מתקיים $X(omega)=Y(omega)$ כמספרים ממשיים ולכן מהגדרת הפונקציה נובע שמתקיים בהכרח $f(X(omega))=f(Y(omega))$, כלומר אם  \ $omega in.not N$ אז בהכרח $omega in.not N_f$.\
  כלומר בהכרח מתקיים $N_f subset.eq N$ וממונוטוניות פונקציית ההסתברות מתקיים $PP(N_f)<=PP(N)=0$.
]

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
