#import "../../../src/article.typ": *
#show: article.with(
  title: [ הכנה למבחן --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)


#set heading(numbering: "1.1")
#outline(depth: 3)

#pagebreak()

= משפטים והוכחות
== שיטות בסיסיות
=== רציפות פונקציית ההסתברות (2.15)
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
  *מפתח להוכחה:*
  + מוכיחים הזרת מאורעות באינדוקציה
    $ B_1 = A_1, space B_n = A_n without A_(n-1) $
  + סכימות בת־מנייה של מאורעות זרים
  + הגדרת הגבול

]

#pagebreak()

=== אי־שיוויון בול (2.18)
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
  עבור מאורעות יורדים, נשתמש בהיות המשלים שלהם מאורעות עולים.\
  *מפתח להוכחה:* אינדוקציה שבבסיס משתמשים בהזרה ותכונות פונקציית ההסתברות.
]
#theorem("אי־שיוויון בול לסדרת מאורעות")[לכל סדרת מאורעות ${A_n}_(n in NN)$ במרחב הסתברות $(Omega, cal(F), PP)$ מתקיים
  $ PP(union.big_(n in NN) A_n)<=sum_(n in NN) PP(A_n) $
]
#proof[
  נגדיר $B_n = union.big_(k in [n]) A_k$ וזו סדרת מאורעות עולה המקיימת $union.big_(n in NN) B_n = union.big_(n in NN) A_n$, אז
  $
    PP(union.big_(n in NN) A_n)=PP(union.big_(n in NN) B_n) =_"רציפות פונקציית ההסתברות" lim_(n arrow.r infinity) PP(B_n) = lim_(n arrow.r infinity) PP(union.big_(k in [n]) A_k)<=_"אי־שיוויון בול" lim_(n arrow.r infinity) sum_(k=1)^n PP(A_k) = sum_(k=1)^infinity PP(A_k)
  $
  *מפתח להוכחה:* הגדרת $B_k = union.big_(k in [n]) A_k$, שימוש ברציפות פונקציית ההסתברות ובאי־שיוויון בול.
]

#pagebreak()

== עיקרון ההכלה והפרדה (2.19+2.21)
#theorem("עיקרון ההכלה לשניים ושלושה מאורעות")[
  יהי $(Omega,cal(F), PP)$ מרחב הסתברות.
  + יהיו $A,B$ מאורעות, אזי $PP(A union B)=PP(A)+PP(B)-PP(A inter B)$
  + יהיו $A,B,C$ מאורעות, אזי $ PP(A union B union C) = PP(A)+PP(B)+PP(C)-PP(A inter B) - PP(A inter C) - PP(B inter C) + PP(A inter B inter C) $
]

#proof[
  + לפי טריק ההזרה הקבוע
    $
      A union B = (A without B) union.dot (B without A) union.dot (A inter B), wide A = (A without B) union.dot (A inter B), wide B = (B without A) union.dot (A inter B)
    $
    ולכן מסכימות
    $
      PP(A union B) = PP(A without B) + PP(B without A)+PP(A inter B), wide PP(A)=PP(A without B)+PP(A inter B), wide PP(B) = PP(B without A) + PP(A inter B) \
      ==> PP(A union B) = PP(A)-PP(A inter B)+PP(B) - PP(A inter B) + PP(A inter B) = PP(A) + PP(B) - PP(A inter B)
    $
  + מהסעיף הקודם נובע
    $
      PP((A union B) union C)=PP(A union B) + PP(C) - PP((A union B) inter C) = PP(A) + PP(B) - PP(A inter B)+PP(C)-PP((A union B) inter C) \
    $
    וגם
    $
      PP((A union B) inter C) = PP((A inter C) union (B inter C)) = PP(A inter C)+PP(B inter C)-PP((A inter C) inter (B inter C))
    $
    אבל $(A inter C) inter (B inter C) = A inter B inter C$ ולכן בהצבה בביטוי לעיל מסיימת.
]
#remark[את הטענה הכללית (2.21) מוכיחים באינדוקציה וכאבי ראש של סימנים.]

#pagebreak()


== הסתברות מותנית
=== נוסחת ההסתברות השלמה במונחי הסתברות מותנית (3.18)
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
    PP(B) & = sum_(A in cal(A)) PP(A inter B) \
          & = sum_(A in cal(A) \ PP(A) > 0) PP(A inter B) + sum_(A in cal(A) \ PP(A) = 0) PP(A inter B) \
          & =_((star)) sum_(A in cal(A) \ PP(A) > 0) PP(B bar A)PP(A) + sum_(A in cal(A) \ PP(A) = 0) 0 \
          & = sum_(A in cal(A) \ PP(A) > 0) PP(B bar A) PP(A)
  $
  כאשר $(star)$ נובע מכלל השרשרת.\
  *מפתח להוכחה:* נוסחת ההסתברות השלמה וכלל השרשרת.
]

#pagebreak()

=== כלל בייס (3.20)
#theorem("כלל בייס")[יהי $(Omega, cal(F), PP)$ מרחב הסתברות ויהיו $A,B$ שני מאורעות בעלי הסתברות חיובית, אזי
  $ PP(A bar B) PP(B) = PP(B bar A) PP(A) $
  או בניסוח אחר
  $ PP(A bar B) = PP(B bar A) PP(A)/PP(B) $]
#proof[
  $ PP(B) PP(A bar B) = (PP(B) PP(A inter B))/PP(B) = PP(A inter B) = (PP(A) PP(A inter B))/PP(A) = PP(B bar A) PP(A) $
  *מפתח להוכחה:* לחשב כל פעם לבד לפי הגדרת ההסתברות המותנית.
]

#pagebreak()

=== תכונת משלים לאי־תלות של מאורע באוסף (3.39)
#theorem("תכונת משלים לאי־תלות של מאורע באוסף")[
  יהי $(Omega, cal(F), PP)$ מרחב הסתברות ויהיו $A, B_1, dots.h, B_k$ מאורעות כך ש־$A$ בלתי־תלוי באוסף ${B_1, dots.h, B_k}$. אזי $A$ בלתי־תלוי ב־${B_1, dots.h, B_k^c}$.
]

#proof[
  יהי $I subset [k]$. אם $k in.not I$ אז האי־תלות נובעת מתורשתיות תכונת האי־תלות.\
  אחרת, $I = J union.dot {k}$, מתקיים
  $
    A inter inter.big_(j in J) B_j inter B_k^c = (A inter inter.big_(j in J) B_j) without (A inter inter.big_(i in I) B_i) \
    inter.big_(j in J) B_i inter B_k^c = (inter.big_(j in J) B_j) without (inter.big_(i in I) B_i)
  $
  ומהאי־תלות בין $A$ ובין ${B_i}_(i in [k])$
  $
    PP(A inter inter.big_(j in J) B_j inter B_k^c) &= PP((A inter inter.big_(j in J) B_j) without (A inter inter.big_(i in I) B_i)) \
    &= PP(A inter inter.big_(j in J) B_j)-PP(A inter inter.big_(i in I) B_i) \
    &=_((star)) PP(A)PP(inter.big_(j in J) B_j)-PP(A)PP(A inter.big_(i in I) B_i) \
    &= PP(A)PP((inter.big_(j in J) B_j) without (inter.big_(i in J) B_i)) =PP(A)PP(inter.big_(j in J) B_i inter B_k^c)
  $
  כאשר $(star)$ נובע מהאי־תלות.\
  *מפתח להוכחה:*
  + לשים לב שמתקיים
    $ inter.big_(j in J) B_i inter B_k^c = (inter.big_(j in J) B_j) without (inter.big_(i in I) B_i) $
  + ולפרק בהתאם את ההסתברות $PP(A inter inter.big_(j in J) B_j inter B_k^c)$ ולהשתמש באי־תלות הידועה

]
#pagebreak()

== יחסים בין משתנים מקריים
=== אי־תלות נשמרת תחת הפעלת פונקציות (4.89)
#theorem("אי־תלות נשמרת תחת הפעלת פונקציות")[
  יהיו $X_1, dots.h, X_n$ וקטורים מקריים בלתי־תלויים כאשר $X_i$ הוא וקטור $d_i$־מימדי ותהיינה $f_i in cal(F)_(RR^(d_i) arrow.r RR^(s_i))$ עבור $s_i$ כלשהם. אזי $f_1 (X_1), dots.h, f_n (X_n)$ בלתי־תלויים
]
#proof[
  תהיינה $A_i in cal(F)_(RR^(s_i))$ עבור $i in [n]$, אזי
  $
    PP(forall i in [n], space f_i (X_i) in A_i) = PP(forall i in [n], space X_i in f_i^(-1)(A_i))=_"אי־תלות" product_(i in [n]) PP(X_i in f_i^(-1)(A_i))=product_(i in [n]) PP(f_i (X_i) in A_i)
  $
  *מפתח להוכחה:* עדיף להסתכל על המקורות  תחת הפונקציה ואז אפשר להשתמש באי־תלות.
]

#pagebreak()

=== שיוויון כמעט־תמיד גורר שיוויון התפלגויות (4.29)
#theorem("שוויון כמעט־תמיד גורר שיוויון התפלגויות")[
  יהיו $X,Y$ משתנים מקריים על מרחב הסתברות $(Omega,cal(F), PP)$. אם $X=^(a.s.) Y$ אז $X=^d Y$.\
  _תזכורת_:\
  $
    PP(X=Y) = PP({omega bar X(omega)=Y(omega)})=1 ==> X=^(a.s.) Y \
    PP_X = PP_Y ==> X=^d Y
  $
]
#proof[
  אם $X=^(a.s.) Y$ אז לכל $S in cal(F)_RR$ מתקיים לפי מונוטוניות $PP(X in S, Y in.not S) <= PP(X!=Y)=0$ ובדומה $PP(X in.not S, Y in S) = 0$, אז
  $
    PP_X (s) = PP(X in S) = PP(X in S, Y in S) + PP(X in S, Y in.not S)= PP(X in S, Y in S) + PP(X in.not S, Y in S) = PP(Y in S) = PP_Y (S)
  $
  *מפתח להוכחה:* משתמשים בהכלת מאורעות מההנחה.
]

#pagebreak()

=== שיוויון התפלגויות נשמר תחת הפעלת פונקציה (4.31)
#theorem(
  "שיוויון התפלגויות נשמר תחת הפעלת פונקציה",
)[יהיו $X,Y$ משתנים מקריים בדידים ושווי התפלגות (לאו דווקא על אותו מרחב הסתברות) ותהיי $f in cal(F)_(RR arrow.r RR)$ אזי $f(X)=^d f(Y)$.]
#proof[תהיי
  $S subset RR$ אזי
  $ PP_(f(X)) (S) = PP(f(X) = S) = PP(X in f^(-1)(S))=_(X=^d Y) PP(Y in f^(-1)(S)) = PP(f(Y) in S) = PP_(f(Y)) (S) $
  *מפתח להוכחה:* עדיף להסתכל על המקורות  תחת הפונקציה ואז אפשר להשתמש בשיוויון התפלגויות.
]

#pagebreak()

=== שיוויון כמעט־תמיד נשמר תחת הפעלת פונקציה
#theorem(
  "שיוויון כמעט־תמיד נשמר תחת הפעלת פונקציה",
)[יהיו $X,Y$ משתנים מקריים בדידים המקיימים $X=^(a.s.) Y$ ותהיי $f in cal(F)_(RR arrow.r RR)$ אזי $f(X)=^(a.s.) f(Y)$.]
#proof[

  מכך שמתקיים $X =^(a.s.) Y$ נובע שמתקיים $PP(X=Y)=PP({omega in X(omega)=Y(omega)})=1$, כלומר $PP(X!=Y)=0$ מהגדרת המשלים.\
  נסמן
  $ N colon.eq {omega in Omega bar X(omega)!=Y(omega)} $
  נרצה להראות ש־$PP(f(X)!=f(y))=0$, אז נגדיר
  $ N_f colon.eq {omega in Omega bar f(X(omega))!=f(Y(omega))} $
  אם $omega in N$, מתקיים $X(omega)!=Y(omega)$ ויכול להיות $f(X(omega))!= f(Y(omega))$ ויכול להיות $f(X(omega))!=f(Y(omega))$.\
  אם $omega in.not N$ מתקיים $X(omega)=Y(omega)$ כמספרים ממשיים ולכן מהגדרת הפונקציה נובע שמתקיים בהכרח $f(X(omega))=f(Y(omega))$, כלומר אם  \ $omega in.not N$ אז בהכרח $omega in.not N_f$.\
  כלומר בהכרח מתקיים $N_f subset.eq N$ וממונוטוניות פונקציית ההסתברות מתקיים $PP(N_f)<=PP(N)=0$.\
  *מפתח להוכחה:* מראים שקבוצת הנקודות שבהם המשתנים המקריים לאחר הפעלת הפונקציה לא זהים מוכלת בקבוצת האיברים שבהם המשתנים המקריים לא זהים ואז ממונוטוניות (מגדירים קבוצה ממידה אפס ומבינים מה נמצא בה אחרי הפעלת הפונקציה).
]

#pagebreak()
== משתנים מקריים בדידים
=== הצלחה ראשונה בסדרת ניסויי ברנולי בלתי־תלויים מתפלג גיאומטרי (4.101)
#theorem(
  "הצלחה ראשונה בסדרת ניסויי ברנולי בלתי־תלויים מתפלג גיאומטרי",
)[תהיי ${X_k}_(k in NN)$ סדרה אינסופית של משתנים מקריים בלתי־תלויים כאשר $X_k ~ Ber(p)$ לכל $k in NN$, נסמן
  $ X = min({k bar X_k = 1}) $
  אז $X~Geo(p)$
]
#proof[
  $X(omega)$ הוא האינדקס של המקום הראשון בסדרה $X_1 (omega), X_2 (omega), dots.h$ בו מופיע הערך $1$ ואם כל איברי הסדרה מתאפסים נסמן \
  $X(omega) = infinity$.\
  נשים לב
  $ {X=k} = {X_1 = 0, dots.h, X_(k-1) = 0, X_k = 1} $
  ולפי האי־תלות נקבל
  $ PP(X=k) = PP(X_1 = 0, dots.h, X_(k-1) = 0, X_k = 1) = (1-p)^(k-1) p $
  כלומר $X~Geo(p)$ כנדרש ונשים לב שלפי אבחנה שראינו על מכפלה אינסופית
  $ PP(X=infinity) = product_(k=1)^infinity (1-p) = lim_(k arrow.r infinity) (1-p)^k = 0 $
  *מפתח להוכחה:* כותבים ${X=k} = {X_1 = 0, dots.h, X_(k-1) = 0, X_k = 1}$ ומהאי־תלות ההוכחה כותבת את עצמה.
]

#pagebreak()

=== תיאור משתנה גיאומטרי במונחים של התפלגות שיורית (4.105)
#theorem("תיאור משתנה גיאומטרי במונחים של התפלגות שיורית")[
  משתנה מקרי שנתמך על הטבעיים מתפלג $Geo(p)$ אם ורק אם לכל $n in NN$ מתקיים
  $ PP(X>n) = (1-p)^n $
]

#proof[
  $<==$ $X~Geo(p)$ ולכן
  $
    PP(X>n) = sum_(k=n+1)^infinity PP(X=k) = sum_(k=n+1)^infinity (1-p)^(k-1) p = (1-p)^n p sum_(ell=0)^infinity (1-p)^ell =_"טור הנדסי" (1-p)^n
  $
  $==>$ לכל $n in NN$
  $ PP(X=n) = PP({X>n-1} without {X > n}) =_"ההנחה" (1-p)^(n-1) - (1-p)^n = (1-p)^(n-1) p $
  *מפתח להוכחה:* בכיוון הראשון לסדר אינדקס סכימה לטור הנדסי, בכיוון השני להשתמש בהכלת מאורעות כי זה על הטבעיים.
]

#pagebreak()

=== חוסר זיכרון של התפלגות גיאומטרית (4.107)
#theorem("חוסר זיכרון של התפלגות גיאומטרית")[
  #definition(
    "חוסר זיכרון לכישלון",
  )[משתנה מקרי $X$ בדיד שנתמך על $NN$ נקרא *חסר זיכרון לכישלון* אם $X$ ו־$X-1 bar X>1$ שווי התפלגות.\
    כלומר, אם לכל $n in NN$ מתקיים
    $ PP(X in S) = PP(X-1 in S bar X>1) $
    לכל $S in cal(F)_RR$.
  ]
  יהי $X$ משתנה מקרי הנתמך על $NN$ המקיים $PP(X=1)<1$, אזי $X$ חסר זיכרון לכשלונות אם ורק אם קיים $p in (0,1)$ כך ש־$X~Geo(p)$]
#proof[
  $==>$ נניח כי $X~Geo(p)$ ולכן לכל $n in NN$
  $
    PP(X-1=n bar X>1) =_("הסתברות מותנית" \ "והכלת מאורעות") PP(X=n+1)/PP(X>1) = ((1-p)^n p)/(1-p) = (1-p)^(n-1) p = PP(X=n)
  $
  $<==$ נניח כי $PP(X=n) = PP(X-1 = n bar X>1)$ לכל $n in NN$ ונסמן $p colon.eq PP(X=1)$ ולכן $1-p = PP(X>1)$, אז לכל $k>=1$
  $
    PP(X>k+1) =_("כלל השרשרת" \ "והכלת מאורעות") PP(X>k+1 bar X > 1)PP(X > 1) = PP(X-1 > k bar X>1)PP(X>1) =_"ההנחה" PP(X>k)(1-p)
  $
  נמשיך באינדוקציה ונקבל
  $ PP(X>k)=PP(X>k-1)(1-p) = dots.h.c = PP(X>1)(1-p)^(k-1) = (1-p)^k $
  שזו בידיוק ההגדרה של משתנה גיאומטרי במונחים של התפףלגות שיורית.\
  *מפתח להוכחה:*
  + בכיוון הראשון, הסתברות מותנית והכלת מאורעות כותב את ההוכחה
  + בכיוון השני
    + מפתחים עם כלל השרשרת והכלת מאורעות עם ההנחה
    + ממשיכים באינדוקציה
    + הגדרת משתנה גיאומטרי לפי התפלגות שיורית
]

#pagebreak()

=== סכום משתנים ברנולי בלתי־תלויים מתפלג בינומית (4.115)
#theorem(
  "סכום משתנים ברנולי בלתי־תלויים מתפלג בינומית",
)[יהיו ${X_i}_(i in [n])$ וקטור של משתני ברנולי עם הסתברות הצלחה $p$ בלתי־תלויים, אזי
  $ sum_(i in [n]) X_i ~ Bin(n, p) $
]
#proof[
  יהי $k in {0, dots.h, n}$ ונסמן $Y = sum_(i in [n]) X_i$.\
  נסמן ב־$A_k$ את אוסף הוקטורים ב־${0,1}^n$ שבהם בידיוק $k$ אחדות ו־$(n-k)$ אפסים, כלומר
  $ A_k colon.eq {(x_1, dots.h, x_n) in {0,1}^n bar sum_(i in [n]) x_i = k} $
  כך שמתקיים $abs(A_k) = binom(n, k)$ ונחשב
  $
    PP(Y=k) = sum_(x in A_k) PP(X=x) =_"אי־תלות" sum_(x in A_k) (product_(i in [n]) PP(X_i = x_i)) = binom(n, k) p^k (1-p)^(n-k)
  $
  *מפתח להוכחה:*
  + מגדירים $ A_k colon.eq {(x_1, dots.h, x_n) in {0,1}^n bar sum_(i in [n]) x_i = k} $
  + נוסחת ההסתברות השלמה על $A_k$ כחלוקה של המרחב
  + אי־תלות
]

#pagebreak()

=== חיבור משתנים מקריים בינומיים בלתי־תלויים (4.116)
#theorem("חיבור משתנים מקריים בינומיים בלתי־תלויים")[
  אם $X~ Bin(m, p)$ ו־$Y~ Bin(n, p)$ בלתי־תלויים אזי $ X+Y~Bin(m+n, p) $
]
#proof[
  יהיו $B_1, dots.h, B_(m+n)$ משתנים מקריים בלתי־תלויים המתפלגים ברנולי עם הסתברות הצלחה $p$, נסמן $ X'=sum_(k=1)^m B_k wide Y' = sum_(k=m+1)^(m+n) B_k $
  אז לפי הטענה על סכום משתנים מקריים בלתי־תלויים שמתפלגים ברנולי $p$ נקבל
  $ X' ~ Bin(m, p), wide Y'~Bin(n, p), wide X'+Y' ~ Bin(m+n, p) $
  כך שמתקיים
  $ X'=^d X wide Y'=^d Y $
  אלו פונקציות של קבוצות משתנים שונות באוסף של משתנים בלתי־תלויים ולכן $Y', X'$ הם גם בלתי־תלויים כלומר לכל $a,b in RR$ מתקיים
  $ PP(X' = a, Y' = b) = PP(X'=a)PP(Y'=b) = PP(X=a)PP(Y=b) = PP(X=a, Y=b) $
  כלומר ההתפלגות המשותפת של $X', Y'$ זהה לזו של $X, Y$,
  אבל שיוויון נשמר תחת הפעלת פונקציות ולכן
  $ X' + Y' =^d X+Y $
  *מפתח להוכחה:*
  + סכום משתנים מקריים ברנולי מתפלג בינומית
  + שיוויון התפלגויות
]

#pagebreak()

=== פואסון כגבול של בינומי במובן הנקודתי (4.126)
#theorem(
  "פואסון כגבול של בינומי במובן הנקודתי",
)[יהי $Y ~ Poi(lambda)$ עבור $lambda>=0$ ויהיו ${X_n}_(n in NN)$ משתנים מקריים כך שלכל $n>lambda$ מתקיים $X_n ~ Bin(n, lambda/n)$.\
  אזי לכל $k in NN_0$ מתקיים
  $ lim_(n arrow.r infinity) PP(X_n=k) = PP(Y=k) $]
#proof[
  עבור $k$ קבוע ו־$n$ שואף לאינסוף מתקיים
  $ binom(n, k) = (n dot.op (n-1) dot.op dots.h.c dot.op (n-k))/(k!) = (n^k (1+o(1)))/(k!) $
  וכן
  $
    lim_(n arrow.r infinity) (1-lambda/n)^(n-k) = lim_(n arrow.r infinity) (1-lambda/n) (1-lambda/n)^(-k) = e^(-lambda) dot.op 1
  $
  ונובע אם כך
  $
    lim_(n arrow.r infinity)PP(X_n= k) = lim_(n arrow.r infinity) binom(n, k) (lambda/n)^k (1-lambda/n)^(n-k) = lim_(n arrow.r infinity) (n^k (1+o(1)))/k! dot.op lambda^k/n^k dot.op e^(-lambda) = (e^(-lambda) lambda^k)/k! lim_(n arrow.r infinity) (n^k (1+o(1)))/n^k = PP(Y=k)
  $
  *מפתח להוכחה:*
  + חישוב גבול הכשלונות של $X_n$
  + הצבה בגבול המלא של ההסתברות
  + סידור טור יפה
]

#pagebreak()

=== סכום של משתנים מקריים פואסונים בלתי־תלויים (4.127)
#theorem("סכום של משתנים מקריים פואסונים בלתי־תלויים")[
  יהיו $X~Poi(lambda), Y~Poi(eta)$ בלתי־תלויים, אזי $X+Y~Poi(lambda+eta)$.
]

#proof[
  עבור $n in NN_0$, מנוסחת ההסתברות השלמה
  $
    PP(X+Y=n)=_"קונבולוציה" sum_(i in ZZ) PP(X=i)PP(Y=n-i)=_((star)) sum_(i=0)^n e^(-lambda)/i! (e^(-eta)eta^(n-i))/(n-i)! = e^(-lambda-eta)/n! sum_(i=0)^n binom(n, i)lambda^i eta^(n-i)=_((star star)) ((lambda+eta)^n e^(-lambda-eta))/n!
  $
  כאשר $(star)$ נובע מכך ששאר המחוברים מתאפסים ו־$(star star)$  זה נוסחת הבינום מה שמופיע בסכום.\
  *מפתח להוכחה:*
  + קונבולוציה
  + שינוי טור
  + בינום
]

#pagebreak()

== תוחלת
=== תוחלת של פונקציה על וקטור מקרי (5.3)
#theorem("תוחלת של פונקציה על וקטור מקרי")[
  יהי $X=(X_1, dots.h, X_d)$ וקטור מקרי דיד ותהיי $f in cal(F)_(RR^d arrow.r RR)$ פונקציה. אז המשתנה המקרי \
  $Y=f(X)$ מקיים
  $ EE(Y)=sum_(x in RR^d) f(x) PP(X=x) $
  אם טור זה מתכנס בהחלט ואחרת ל־$Y$ אין תוחלת סופית.
]

#proof[
  ראינו כי התפלגותו של $X$ היא פונקציית הסתברות בדידה על $RR^d$.\
  נגדיר $Z(x)=f(x)$ משתנה מקרי חדש ומתקיים $Y=^d Z$ ונוכל להפעיל את תוחלת של משתנה מקרי על מרחב הסתברות בדידה על המרחב $(RR^d, cal(F)_RR, PP_X)$ ולקבל
  $ EE(Z)=sum_(x in RR^d) Z(x)PP_X ({x}) = sum_(x in RR^d) f(x) PP(X=x) $
  בגלל שהתוחלת נקבעת לפי ההתפלגות, אז מכך ש־$Y=^d Z$ נובע כי $EE(Y)=EE(Z)$.\
  *מפתח להוכחה:*
  + $Z(x)=f(x)$ ו־$Z=^d Y$
  + תוחלת של משתנה מקרי על מרחב הסתברות בדידה
  + שימוש בשיוויון התפלגויות
]

#pagebreak()

=== נוסחת הזנב לחישוב תוחלת משתנה מקרי על הטבעיים (5.19)
#theorem("נוסחת הזנב לחישוב תוחלת משתנה מקרי על הטבעיים")[
  יהי $X$ משתנה מקרי הנתמך על $NN union {0}$, אזי $ EE(X)=sum_(n=1)^infinity PP(X>=n) $
]

#proof[
  נשים לב שכל המחוברים בסכום הבא הם אי־שליליים ולכן ניתן להפעיל עליהם את משפט פוביני, אז מהגדרת התוחלת
  $
    EE(X)=sum_(n=1)^infinity n PP(X=n) = sum_(n=1)^infinity sum_(k=1)^n PP(X=n) = sum_(k, n in NN\
    k<=n) PP(X=n) =_"פוביני" sum_(k=1)^infinity sum_(n=k)^infinity PP(X=n) = sum_(n=1)^infinity PP(X>=n)
  $
  *מפתח להוכחה:* להשתמש בהגדרת התוחלת ולהגיע לטור כפול כדי להשתמש במשפט פוביני.
]

#pagebreak()

=== כפליות התוחלת למשתנים בלתי־תלויים (5.15)
#theorem("כפליות התוחלת למשתנים בלתי־תלויים")[
  יהיו $X,Y$ משתנים מקריים בלתי־תלויים ובעלי תוחלת סופית, אזי
  $ EE(X Y) = EE(X) EE(Y) $
]

#proof[
  נבטא את התוחלת של $X Y$ לפי הנוסחה לתוחלת של וקטור מקרי על הוקטור $(X,Y)$
  $
    EE(X Y) = sum_(x in RR) sum_(y in RR) x y p_(x,y) (x,y) =_"אי־תלות" sum_(x in RR) sum_(y in RR) x y p_X (x) p_Y (y) = sum_(x in RR) x p_X (x) sum_(y in RR) y p_Y (y) = EE(X)EE(Y)
  $
]

#pagebreak()

=== נוסחת התוחלת השלמה (5.26)
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
  *מפתח להוכחה:*
  + בגלל שזוהי חלוקה, $X=sum_(A in cal(A)) X bb(1)_(A)$
  + לשחק עם השיוויונות לפי הגדרת התוחלת והסתברות שלמה
]

#pagebreak()

=== נוסחת התוחלת השלמה במונחי תוחלת מותנית (5.29)
#theorem("נוסחת התוחלת השלמה במונחי תוחלת מותנית")[
  תהיי $cal(A)$ חלוקה בת־מנייה של מרחב הסתברות $(Omega, cal(F), PP)$ ויהי $X$ משתנה מקרי בעל תוחלת סופית על מרחב זה. אז
  $
    EE(X)=sum_(A in cal(A) \
    PP(A) > 0) EE(X bar A)PP(A)
  $
]
#proof[
  נוכיח עבור $X$ בדיד: עבור $A in cal(A)$, אם $PP(A)=0$ אזי $EE(X bb(1)_A)=0$ ואם $PP(A)>0$ אז $EE(X bar A)PP(A)=EE(X bb(1)_A)$ ולכן מנוסחת התוחלת השלמה
  $
    EE(X)=sum_(A in cal(A)) EE(X bb(1)_A)=sum_(A in cal(A) \
    PP(A) > 0) EE(X bar A) PP(A)
  $
]

#pagebreak()

== שונות
=== חיבוריות השונות למשתנים מקריים בלתי־תלויים (6.5)
#theorem("חיבוריות השונות למשתנים מקריים בלתי־תלויים")[
  יהיו ${X_i}_(i in [n])$ משתנים מקריים בלתי־תלויים בעלי שונות סופית.\
  אזי $Y=sum_(i=1)^n X_i$ בעל שונות סופית ומתקיים
  $ Var(Y)=sum_(i=1)^n Var(X_i) $
]

#proof[
  באינדוקציה על $n$.\
  יהיו $X,Y$ משתנים מקריים בלתי־תלויים בעלי שונות סופית ונסתכל על המשתנה המקרי $X+Y$.\
  ראשית, מלינאריות התוחלת $EE(X+Y)=EE(X)+EE(Y)<infinity$ ולכן יש לו תוחלת סופית ונוכל לחשב לו שונות.\
  נגדיר
  $ overline(X) colon.eq X - EE(X), wide overline(Y) colon.eq Y - EE(Y) $
  ומלינאריות התוחלת מתקיים $EE(overline(X))=0 = EE(overline(Y))$.\
  היות ואי־תלות נשמרת תחת הפעלת פונקציות נובע כי $overline(X), overline(Y)$ בלתי־תלויים, אז
  $
    Var(overline(X)+overline(Y))= EE((overline(X)+overline(Y))^2)-underbrace(EE(overline(X)+overline(Y))^2, = 0) = EE(overline(X)^2+2overline(X)overline(Y)+overline(Y)^2) \
    =_("לינאריות התוחלת" \
    "וכפליות התוחלת לאי־תלות") EE(overline(X)^2)+2EE(overline(X))EE(overline(Y))+EE(overline(Y))^2 = EE(overline(X)^2)+EE(overline(Y)^2) = Var(overline(X))+Var(overline(Y))
  $
  המשך הטענה זה פשוט הנחת האינדוקציה ולעשות את בסיס האינדוקציה שוב בשביל צעד האינדוקציה.
]

#pagebreak()


=== נוסחת סכום לשונות (6.35)
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
  ולכן
  $
    Var(sum_(k=1)^n overline(X_k))=EE((sum_(k=1)^n overline(X_k))^2)=EE(sum_(k=1)^n sum_(ell=1)^n overline(X_k) overline(X_ell))=_"לינאריות" sum_(k=1)^n sum_(ell=1)^n EE(overline(X_k) overline(X_ell)) = sum_(k=1)^n sum_(ell=1)^n Cov(X_k, X_ell) \
    =sum_(k, ell <=n) Cov(X_k, X_ell)
  $
  והשיוויון הימני נובע מהיות $Cov(X, X)=Var(X)$ והכנסה של ערכים אלו בסכום.\
  *מפתח להוכחה:*
  + מרכוז על־ידי התוחלת
  + לרשום את *כל* מה שנובע מהמרכוז בהקשרי תוחלת ושונות
  + אדישות להזזות של השונות כדי להראות שהמשתנה המנורמל מספק אותנו
  + הגדרת השונות על המשתנה הממורכז עם הממצאים שלנו
]

#pagebreak()

== אי־שיוויונות הסתברותיים
=== אי־שיוויון מרקוב (5.38)
#theorem("אי־שיוויון מרקוב")[יהי $X$ משתנה מקרי אי־שלילי (כלומר $X>=^(a.s.) 0$) בעל תוחלת סופית. אזי לכל $a>0$ מתקיים
  $ PP(X>=a)<=EE(X)/a $
]
#proof[
  נפעיל את נוסחת התוחלת השלמה על החלוקה ${{X<0}, {X in [0, a)}, {a<=X}}$ ונקבל
  $ EE(X)=EE(X bb(1)_(X<0))+EE(X bb(1)_(X in [0,a)))+EE(X bb(1)_(X>=a)) $
  $X$ הוא אי־שלילי ולכל $b in RR$ מתקיים $X bb(1)_(X>=b) >=^(a.s.) b bb(1)_(X>=b)$ והרי
  $ X bb(1)_(X<0) =^(a.s.) 0 wide X bb(1)_(X in [0,a)) >=^(a.s.) 0 wide X bb(1)_(X>=a) >=^(a.s.) a bb(1)_(X>=a) $
  וממונוטוניות התוחלת נקבל
  $
    EE(X)=EE(X bb(1)_(X<0))+EE(X bb(1)_(X in [0,a)))+EE(X bb(1)_(X>=a)) >= 0+0 + a EE(bb(1)_(X>=a))=a PP(X>=a) \
    ==> PP(X>=a) <= EE(X)/a
  $
  *מפתח להוכחה:*
  + מסתכלים על החלוקה ${{a<=X}, {X<0}, {X in [0, a)}}$
  + נוסחת התוחלת השלמה
  + חסימה איבר איבר
  + מונוטוניות התוחלת
]

#pagebreak()

=== אי־שיוויון צ'בישב (6.9)
#theorem("אי־שיוויון צ'בישב")[יהי $X$ משתנה מקרי בעל שונות סופית. אז לכל $a>0$ מתקיים
  $ PP(abs(X-EE(X))>=a)<=Var(X)/a^2 $
]
#proof[
  נגדיר משתנה חדש $Y=(X-EE(X))^2$ וזה משתנה מקרי אי־שלילי המקיים $EE(Y)=Var(X)$.\
  לכן לפי אי־שיוויון מרקוב לכל $b>0$ מתקיים
  $ PP(Y>=b)<=EE(Y)/b = Var(X)/b $
  נשים לב ${abs(X-EE(X))>=a}={(X-EE(X))^2 >= a^2}$ ולכן בבחירת $b=a^2$ נקבל
  $ PP(abs(X-EE(X))>=a)=PP((X-EE(X))^2 >= a^2)= PP(Y>=a^2)<=Var(X)/a^2 $
  *מפתח להוכחה:*
  + הגדרת משתנה מקרי חדש  $Y=(X-EE(X))^2$
  + אי־שיוויון מרקוב
  + הכלת מאורעות ${abs(X-EE(X))>=a}={(X-EE(X))^2 >= a^2}$
  + שוב אי־שיוויון מרקוב

]

#pagebreak()

=== אי־שיוויון צ'רנוף (7.9)
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
  *מפתח להוכחה:*
  אי־שיוויון מרקוב (לציין שהמשתנה אי־שלילי ולכן הכיוון של אי־השיוויון נשמר).
]

#pagebreak()

=== אי־שיוויון הופדינג (7.17)
#theorem("אי־שיוויון הופדינג")[
  יהיו ${X_k}_(k in [n])$ משתנים מקריים בלתי־תלויים ובעלי תוחלת אפס אשר מקיימים $abs(X_k)<=^(a.s.) 1$ לכל $k in [n]$ אז
  $ forall d>0, space (sum_(k in [n]) X_k >=d)<=exp(-d^2/(2n)) $
]
#theorem("כפליות פונקציה יוצרת מומנטים עבור סכום משתנים מקריים בלתי־תלויים")[
  יהיו $X$ ו־$Y$ משתנים מקריים בלתי־תלויים, אז
  $ M_(X+Y) (t) = M_X (t) M_Y (t) wide ("לכל t עבורו שתיהן מוגדרות") $
]
#proof[
  נובע מכך שאי־תלות נשמרת תחת הפעלת פונקצייה ומכפליות התוחלת למשתנים בלתי־תלויים.
]
#theorem("הלמה של הופדינג")[
  יהי $X$ משתנה מקרי המקיים $abs(X)<=^(a.s.) 1$ וכן $EE(X)=0$. אז לכל $t in RR$ מתקיים
  $ EE(e^(t X))<= exp(t^2/2) $
]
#proof[
  נקבע את $t$ ונסמן ב־$L(x)$ את הפונקציה
  $ L(x) = (e^t+e^(-t))/2 + x (e^t-e^(-t))/2 $
  הפונקציה $e^(t x)$ היא בעלת נגזרת שנייה חיובית ולכן קמורה, אז לכל $x in [-1, 1]$ מתקיים $e^(t x)<=L(x)$, ממונוטוניות ולינאריות התוחלת נקבל
  $ EE(e^(t X))<=EE(L(X))=(e^t+e^(-t))/2 + EE(X) (e^t-e^(-t))/2=_(EE(X)=0) (e^t+e^(-t))/2 $
  לכל $t in RR$ מתקיים $(e^t+e^(-t))/2 <= e^(t^2/2)$ וזה נובע מטור טיילור
  $
    (e^t+e(-t))/2 = 1/2 sum_(n=0)^infinity (t^n+(-t)^n)/n! = sum_(m=0)^infinity t^(2m)/(2m)! <= sum_(m=0)^infinity t^(2m)/(2^m m)! = sum_(m=0)^infinity (t^2/2)^m/(m!) = e^(t^2/2)
  $
]
#proof[
  אם־כך, נסמן $X = sum_(k in [n]) X_k$ ומתקיים מהטענות לעיל
  $ M_X (t) = product_(k in [n]) M_(X_k) (t) <= product_(k in [n]) exp(t^2/2) = exp((n t^2)/2) $
  מאי־שיוויון צ'רנוף לכל $d>0$
  $ PP(X>=d)<=exp((n t^2)/2 - t d) $
  כדי למצוא $t$ שימעזר את החסם נגזור את המעריך ונשווה לאפס
  $ dif/(dif t) ((n t^2)/2 - t d) = n t - d = 0 ==> t = d/n $
  נקבל
  $ PP(X>=d)<=exp((n (d/n)^2)/2 - (d/n) d) = exp(-d^2/(2n)) $
  *מפתח להוכחה:*
  + כפליות הפונקציה יוצרת מומנטים למשתנים מקריים בלתי־תלויים
  + הלמה של הופדינג
  + אי־שיוויון צ'רנוף + גזירה למזעור של המעריך
]

#pagebreak()

== סדרות והתכנסויות
=== תנאי תוחלת ושונות להתכנסות לקבוע (6.19)
#theorem("תנאי תוחלת ושונות להתכנסות לקבוע")[
  תהיי $(X_n)_(n=1)^infinity$ סדרת משתנים מקריים המקיימת עבור $mu in RR$ כי $EE(X_n) arrow.r mu$ וכן $Var(X_n) arrow.r 0$. אזי
  $ X_n arrow.r^d mu $
]

#proof[
  יהי $epsilon > 0$, נראה כי $lim_(n arrow.r infinity) PP(abs(X_n-mu)<epsilon) = 1$ או באופן שקול $lim_(n arrow.r infinity) PP(abs(X_n-mu)>=epsilon)=0$:\
  מהיות $EE(X_n) arrow.r mu$, נבחר $n_0$ גדול מספיק כך שיתקיים לכל $n>n_0$ כי $abs(EE(X_n) - mu)<=epsilon/2$ וכן מאי־שיוויון המשולש
  $ abs(X_n -mu)<=abs(X_n - EE(X_n))+abs(EE(X_n)-mu) <= abs(X_n - EE(X_n)) + epsilon/2 $
  ולכן
  $ {abs(X_n - mu) >= epsilon} subset {abs(X_n - EE(X_n))+epsilon/2 >= epsilon} = {abs(X_n - EE(X_n))>=epsilon/2} $
  ומאי־שיוויון צ'בישב נקבל
  $
    lim_(n arrow.r infinity) PP(abs(X_n-mu)>=epsilon)<=lim_(n arrow.r infinity) PP(abs(X_n - EE(X_n))>=epsilon/2)<=_"אי־שיוויון צ'בישב" lim_(n arrow.r infinity) (4Var(X_n))/epsilon^2 = 0
  $
  *מפתח להוכחה:*
  + משתמשים בהתכנסות התוחלת
  + אי־שיויוון המשולש והכלת מאורעות
  + אי־שיוויון צ'בישב
]

#pagebreak()

=== הלמה של פאטו (10.4)
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
  *מפתח להוכחה:* רציפות פונקציית ההסתברות למאורעות עולים.
]

#pagebreak()

=== הלמה הראשונה של בורל־קנטלי (10.5)
#theorem("הלמה הראשונה של בורל־קנטלי")[
  תהיי $A_i$ סדרת מאורעות. אם $sum_(i=1)^infinity PP(A_i)<infinity$ אז $PP(A_i, i.o.)=0$.
]
#proof[
  $
    PP(A_i, i.o.)=_("רציפות פונקציית ההסתברות" \
    "למאורעות עולים") lim_(n arrow.r infinity) PP(union.big_(i=n)^infinity A_i) <=_"אי־שיוויון בול" lim_(n arrow.r infinity) sum_(i=n)^infinity PP(A_i) =0
  $
  כאשר השיוויון האחרון נובע מכך ש־$sum_(i=1)^infinity PP(A_i) < infinity$ אם ורק אם $lim_(n arrow.r infinity) sum_(i=n)^infinity PP(A_i)=0$.\
  *מפתח להוכחה:* רציפות פונקציית ההסתברות וחסם האיחוד (והניסוח ממידה יותר יפה/ברור).
]

#pagebreak()

=== הלמה השנייה של בורל־קנטלי (10.6)
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
  כאשר האי־שיוויון נובע מכך ש־$1+x<=e^x$ לכל $x$ והשיוויון נובע מכך ש־$sum_(i=1)^infinity PP(A_i)=infinity ==> sum_(i=m)^infinity PP(A_i)=infinity$ לכל $m$.\
  *מפתח להוכחה:*
  + משלים
  + רציפות פונקציית ההסתברות
  + לכל $x$ מתקיים $1+x<=e^x$
]

#pagebreak()

=== החוק החלש של המספרים הגדולים (6.21)
#theorem("החוק החלש של המספרים הגדולים")[
  תהיי $X_1, X_2, dots.h$ סדרת משתנים מקריים בלתי־תלויים, שווי התפלגות ובעלי תוחלת $mu$.\
  אם $Y_n = (sum_(i=1)^n X_i)/n$ אזי לכל $epsilon > 0$
  $ PP(abs(Y_n - mu)>=epsilon) stretch(arrow.r)_(n arrow.r infinity) 0 $
]
#proof[
  *הוכחה תחת הנחת קיום שונות:*
  $ EE(Y_n) = EE(sum_(i=1)^n X_i)/n =_"לינאריות התוחלת" (sum_(i=1)^n EE(X_i))/n = (n dot.op mu)/n = mu $
  ולכן
  $
    PP(abs(Y_n - mu)>=epsilon)<=_"צ'בישב" Var(Y_n)/epsilon^2 = Var((sum_(i=1)^n X_i)/n)/epsilon^2 =_"כיול ריבועי" Var(sum_(i=1)^n X_i)/(n^2 epsilon^2) =_"סכום שונות בלתי־תלויות" (n Var(X_1))/(n^2 epsilon^2) stretch(arrow.r)_(n arrow.r infinity) 0
  $
  *מפתח להוכחה:*
  + חישוב תוחלת של $Y_n$
  + אי־שיוויון צ'בישב
]
#remark[במילים אחרות, החוק החלש של המספרים הגדולים אומר
  $1/n sum_(i=1)^n X_i stretch(arrow.r)_(n arrow.r infinity)^(p) mu$.
]

#pagebreak()

=== החוק החזק של המספרים הגדולים (10.20)
#theorem("החוק החזק של המספרים הגדולים")[
  תהיי $X_1, X_2, dots.h$ סדרת משתנים מקריים בלתי־תלויים, שווי התפלגות עם $EE(X_n) = mu$ \
  ו־$abs(X_i)<=^(a.s.) M$ אזי
  $ (sum_(i=1)^n X_i)/n stretch(arrow.r)_(n arrow.r infinity)^(a.s.) mu $
]
#proof[
  נגדיר משתנים מקריים חדשים
  $ Y_n = (X_n - mu)/(2M) $
  תנאי אי־שיוויון הופדינג מתקיימים ולכן לכל $n$ ולכל $a>0$ נקבל
  $ PP(abs(sum_(i=1)^n Y_i)>= a)<=2 exp(-a^2/(2n)) $
  עבור $epsilon>0$ אם נציב $a=epsilon n$ נקבל
  $ PP(abs(1/n sum_(i=1)^n Y_i)>=epsilon)<=2 exp(-epsilon^2/2 n) $
  נסמן
  $ A_n^k colon.eq {abs(1/n sum_(i=1)^n Y_i)>=1/k} $
  ולכל $k in NN$ מתקיים $sum_(n=1)^infinity PP(A_n^k) < infinity$ ולכן לפי הלמה הראשונה של בורל־קנטלי נקבל
  $ PP(A_n^k n space i.o.) = 1-PP((A_n^k)^c n space a.e.) = 0 $
  אז
  $ PP(union.big_(k=1)^infinity A_n^k n space i.o.) = 0 $
  ובאופן שקול
  $ PP(inter.big_(k=1)^infinity (A_n^k)^c n space a.e.) = 1 $
  וזו ההגדרה של $1/n sum_(i=1)^n Y_i arrow.r^(a.s.) 0$ אבל $1/n sum_(i=1)^n Y_i arrow.r^(a.s.)$ אם ורק אם $1/n sum_(i=1)^n X_i arrow.r^(a.s.) mu$.\
  *מפתח להוכחה:*
  + מגדירים משתנה מקרי ממורכז
  + משתמשים באי־שיוויון הופדינג
  + $a=epsilon n$ עבור $epsilon>0$
  + $A_n^k colon.eq {abs(1/n sum_(i=1)^n Y_i)>=1/k}$
  + הלמה הראשונה של בורל־קנטלי
]

#pagebreak()

= מיפוי התכנסויות
== הגדרות
#definition("התכנסות כמעט־תמיד")[
  תהיי $(X_n)_(n=1)^infinity$ סדרת משתנים מקריים במרחב הסתברות $(Omega, cal(F), PP)$.\
  נאמר כי סדרה זו מתכנסת למשתנה המקרי $X$ *כמעט־תמיד* ונסמן $X_n arrow.r^(a.s.) X$ אם מתקיים
  $ PP(lim_(n arrow.r infinity) X_n (omega) = X(omega))=1 $
  באופן שקול
  $
    X_n arrow.r^(a.s.) X <==> forall epsilon > 0, space PP(lim_(n arrow.r infinity) abs(X_n-X)> epsilon)=0 <==> forall epsilon >0, space PP(abs(X_n-X)<=epsilon space a.e.) = 1
  $
]

#definition("התכנסות בהסתברות")[
  תהיי $(X_n)_(n=1)^infinity$ סדרת משתנים מקריים במרחב הסתברות $(Omega, cal(F), PP)$.\
  נאמר כי סדרה זו מתכנסת למשתנה המקרי $X$ *בהסתברות* ונסמן $X_n arrow.r^(p) X$ אם לכל $epsilon > 0$ מתקיים
  $ PP(lim_(n arrow.r infinity) abs(X_n (omega) - X(omega))<=epsilon)=1 $
  באופן שקול
  $ X_n arrow.r^(p) X <==> forall epsilon > 0, space PP(limsup_(n arrow.r infinity) abs(X_n-X)>epsilon) = 0 $
]

#definition("התכנסות בהתפלגות")[
  תהיי $(X_n)_(n=1)^infinity$ סדרת משתנים מקריים לא בהכרח על אותו מרחב הסתברות ויהי $X$ משתנה מקרי.\
  נאמר כי סדרה זו מתכנסת למשתנה המקרי $X$ *בהתפלגות* ונסמן $X_n arrow.r^d X$ אם לכל $a$ שהיא נקודת רציפות של $F_X$ מתקיים
  $ lim_(n arrow.r infinity) F_(X_n) (a) = F_X (a) $

  #definition("התכנסות בהתפלגות לקבוע")[
    תהיי $(X_n)_(n=1)^infinity$ סדרת משתנים מקריים במרחב הסתברות $(Omega, cal(F), PP)$.\
    נאמר כי סדרה זו *מתכנסת לקבוע* ונסמן $X_n arrow.r^(d) a$ אם לכל $epsilon > 0$ מתקיים
    $ lim_(n arrow.r infinity) PP(abs(X_n-a)<epsilon) = 1 $
  ]
]

#corollary[
  אם נסמן
  $ A_(n, epsilon) colon.eq {omega bar abs(X_n (omega) - X(omega))<epsilon} $
  מההגדרות
  $
    X_n arrow.r^(a.s.) X <==> forall epsilon > 0, space PP(liminf_(n arrow.r infinity) A_(n, epsilon)) = 1 \
    X_n arrow.r^p X <==> forall epsilon>0, space liminf_(n arrow.r infinity) PP(A_(n,epsilon)) = 1
  $
]

#corollary[
  אם לכל $epsilon > 0$ מתקיים $sum_(n=1)^infinity PP(abs(X_n-X)>epsilon) < infinity$ אזי $X_n arrow.r^(a.s.) X$.
]
== גרירות
#theorem("גרירות")[
  + התכנסות כמעט־תמיד גורר התכנסות בהסתברות
  + התכנסות בהסתברות גוררת התכנסות בהתפלגות
  + התכנסות בהתפלגות לקבוע גוררת התכנסות בהסתברות (ואז נוח לעבוד עם משפט 6.19)
]

#pagebreak()

#proof[
  + נסמן $A_n^k ={omega bar abs(X_n(omega)-X(omega))<=1/l}$ ולכן
    $ {X_n (omega) arrow.r X(omega)}=inter.big_(k=1)^infinity union.big_(m=1)^infinity inter.big_(n=m)^infinity A_n^k $
    כלומר $ X_n arrow.r^(a.s.) X ==> PP(union.big_(m=1)^infinity inter.big_(n=m)^infinity A_n^k)=PP(liminf_(n arrow.r infinity) A_n^k)=1 $
    אבל $X_n arrow.r^(p) X$ אומר שלכל $k in NN$
    $ lim_(n arrow.r infinity) PP(A_n^k)=1 $
    ומהלמה של פאטו
    $ 1 = PP(liminf_(n arrow.r infinity) A_n^k)<=liminf_(n arrow.r infinity) PP(A_n^k) = 1 $
  + תהיי $a$ נקודת רציפות של $F_X$ ויהי $epsilon > 0$.\
    $ PP(X_n <= a) = PP(X_n <= a, X<=a+epsilon)+PP(X_n <=a, X > a+epsilon)<=PP(X<=a+epsilon)+PP(abs(X-X_n)> epsilon) $
    כלומר $F_(X_n) (a) <=F_X (a+epsilon)+PP(abs(X-X_n)>epsilon)$ ובאופן דומה מקבלים גם
    $ PP(X<=a-epsilon)<=PP(X_n <=a)+PP(abs(X-X_n)>epsilon) $
    כלומר $F_X (a-epsilon)<=F_(X_n) (a)+PP(abs(X-X_n)>epsilon)$ ובסך־הכל
    $ F_X (a-epsilon)-PP(abs(X-X_n)>epsilon)<=F_(X_n) (a)<=F_X (a+epsilon)+PP(abs(X-X_n)>epsilon) $
    וכאשר $n arrow.r infinity$ נקבל מהתכנסות בהסתברות שלכל $epsilon > 0$
    $
      F_X (a-epsilon)<=liminf_(n arrow.r infinity) F_(X_n) (a)<=limsup_(n arrow.r infinity) F_(X_n) (a+epsilon)<= F_X (a+epsilon)
    $
    אבל $a$ נקודת רציפות ולכן $F_X (a) <= lim_(n arrow.r infinity) F_(X_n) (a) <= F_X (a)$.

  + תהיי $F_c$ פונקציית ההתפלגות המצטברת של המשתנה המקרי הקבוע $c$.\
    לכל $epsilon > 0$ מתקיים $F_c (c-epsilon)=0, F_c (c+epsilon)=1$.\
    אם $X_n arrow.r^(d) c$ אזי $F_(X_n) (c-epsilon) arrow.r 0, F_(X_n) (c+epsilon) arrow.r 1$, כלומר
    $ PP(abs(X_n-c)<=epsilon)>= F_(X_n) (c+epsilon)-F_(X_n) (c-epsilon) arrow.r 1 $
]

== כלים שימושים
+ הלמה השנייה של בורל־קנטלי טובה להפרכת התכנסות כמעט־תמיד
+ הלמה הראשונה של בורל־קנטלי טובה להוכחת התכנסות כמעט־תמיד

= משפט הגבול המרכזי
#theorem(
  "משפט הגבול המרכזי",
)[תהיי ${X_n}_(n in NN)$ סדרת משתנים מקריים בלתי־תלויים ושווי התפלגות בעלי תוחלת $0$ ושונות $1$. אזי
  $ 1/sqrt(n) sum_(i=1)^n X_i arrow.r^d Z $
  כאשר $Z ~ cal(N)(0,1)$.\
  באופן שקול, לכל $a in RR$ מתקיים
  $ PP(1/sqrt(n) sum_(i=1)^n X_i <=a)=1/sqrt(2pi) integral_(-infinity)^a e^(-x^2/2) dif x $
]
#remark[את לא מזהה את המשפט הזה אף־פעם, אבל הוא מופיע הרבה פעמים במקרה של "האם הגבול הזה קיים" ושאי־אפשר להשתמש באי־שיוונות המוכרים כי לא בטוח שהכיוון של אי־השיוויון נשמר / אין אי־שליליות / לא חסם הדוק מספיק וכד'.]

= סיכום תוצאות
== התפלגויות בדידות
#set table(stroke: (_, y) => if y > 0 { (top: 0.5pt) })
#table(
  columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  align: center,
  table.header([ $M_X (t)$ ], [ $Var(X)$ ], [ $EE(X)$ ], [ $PP(X=k)$ ], [  $ supp(X) $ ], [ Parameters ], [ $X~$ ]),
  [ $ (e^(n t)-e^(2t))/(n(1-e^t)) $ ],
  [ $ (n^2-1)/12 $ ],
  [ $ (n+1)/2 $ ],
  [ $ 1/n $ ],
  [ $ [n] $ ],
  [ $ n in NN $ ],
  [ $ Unif([n]) $ ],

  [ $ p e^t + (1-p) $ ],
  [ $ p(1-p) $ ],
  [ $ p $ ],
  [ $ mycases(p, k=1, 1-p, k=0) $ ],
  [ $ {0,1} $ ],
  [ $ 0<=p<=1 $ ],
  [ $ Ber(p) $ ],

  [ $ (p e^t + (1-p))^n $ ],
  [ $ n p(1-p) $ ],
  [ $ n p $ ],
  [ $ binom(n, k) (1-p)^(n-k) p^k $ ],
  [ $ NN union {0} $ ],
  [ $ n in NN, space 0<=p<=1 $ ],
  [ $ Bin(n, p) $ ],

  [ $ (p e^t)/(1-(1-p)e^t) $ ],
  [ $ (1-p)/p^2 $ ],
  [ $ 1/p $ ],
  [ $ (1-p)^(k-1)p $ ],
  [ $ NN $ ],
  [ $ 0<=p<=1 $ ],
  [ $ Geo(p) $ ],

  [ $ exp(lambda(e^t-1)) $ ],
  [ $ lambda $ ],
  [ $ lambda $ ],
  [ $ e^(-lambda) lambda^k/k! $ ],
  [ $ NN union {0} $ ],
  [ $ 0< lambda $ ],
  [ $ Poi(lambda) $ ],
)

== התפלגויות רציפות
#set table(stroke: (_, y) => if y > 0 { (top: 0.5pt) })


#table(
  columns: (1fr, 1fr, 1fr, 1.5fr, 1.5fr, 1fr, 1fr, 1fr),
  align: center,
  table.header(
    [ $M_X (t)$ ],
    [ $Var(X)$ ],
    [ $EE(X)$ ],
    [ $ F_X (t) $ ],
    [  $ f_X (t) $ ],
    [ $ supp(X) $ ],
    [ Parameters ],
    [ $X~$ ],
  ),
  [ $ mycases(e^(t b - e^(t a))/(t(b-a)), t !=0, 1, t = 0) $ ],
  [ $ (b-a)^2/12 $ ],
  [ $ (a+b)/2 $ ],
  [ $ mycases(0, t<a, (t-a)/(t-b), a<=t<b, 1, t>b) $ ],
  [ $ mycases(1/(b-a), t in [a,b], 0, "else") $ ],
  [ $ t in [a,b] $ ],
  [ $ a<=b $ ],
  [ $ Unif([a,b]) $ ],

  [ $ lambda/(lambda-t) $ ],
  [ $ 1/lambda^2 $ ],
  [ $ 1/lambda $ ],
  [ $ 1-e^(-lambda t) $ ],
  [ $ lambda e^(lambda t) $ ],
  [ $ 0<=t $ ],
  [ $ lambda>0 $ ],
  [ $ Exp(lambda) $ ],

  [ $ - $ ],
  [ $ 1 $ ],
  [ $ 0 $ ],
  [ $ Phi(t) $ ],
  [ $ 1/sqrt(2pi) exp(-t^2/2) $ ],
  [ $ RR $ ],
  [ $ - $ ],
  [ $ cal(N)(0,1) $ ],

  [ $ - $ ],
  [ $ sigma^2 $ ],
  [ $ mu $ ],
  [ $ Phi((s-mu)/sigma) $ ],
  [ $ 1/sqrt(2pi sigma^2) exp(-(t-mu)^2/(2 sigma^2)) $ ],
  [ $ RR $ ],
  [ $ sigma^2>=0 $ ],
  [ $ cal(N)(mu,sigma) $ ],
)

#pagebreak()
= הוכחות ממבחני עבר של אוהד
#set table(stroke: (_, y) => if y > 0 { (top: 0.5pt) })
#table(
  columns: (1fr, 1fr),
  align: right,
  table.header([ *מבחן* ], [ *משפט* ]),
  [ הסתברות למתמטיקאים 2019 סמסטר א' מועד א' ],
  [
    + שאלה 1
      + אי־שיוויון מרקוב
      + אי־שיוויון צ'רנוף
    + שאלה 2
      + הלמה הראשונה של בורל־קנטלי
      + הלמה השנייה של בורל־קנטלי
  ],

  [ הסתברות למתמטיקאים 2019 סמסטר א' מועד ב' ],
  [
    + שאלה 1
      + אי־שיוויון בול
      + הכלה והדחה לשלושה מאורעות
    + שאלה 2
      + להגדיר מרחב מדגם, פונקציית הסתברות בדידה, משתנה מקרי ותוחלת
      + חסימות השונות
  ],

  [ הסתברות למתמטיקאים 2018 סמסטר א' מועד א' ],
  [
    + אי־שיוויון בול
    + משהו מוזר
  ],

  [ הסתברות למתמטיקאים 2018 סמסטר א' מועד ב' ],
  [
    + להגדיר שונות משותפת ולהוכיח סכום שנויות
  ],

  [ הסתברות למדמ"ח 2025 סמסטר א' מועד א' ],
  [
    + הגדרת שיוויון התפלגויות
    + הגדרת שיוויון כמעט־תמיד
    + שיוויון כמעט־תמיד גורר שיוויון התפלגויות
    + שיוויון בהתפלגויות נשמר תחת הפעלת פונקציה
  ],

  [ הסתברות למדמ"ח 2025 סמסטר א' מועד ב' ],
  [
    + תכונות של נוסחת התוחלת השלמה עם הסתברות מותנית
  ],

  [ הסתברות למדמ"ח 2025 סמסטר א' מועד ג' ],
  [
    + נוסחת התוחלת השלמה עם הסתברות מותנית
    + נוסחת השונות לסכום
  ],

  [ הסתברות למדמ"ח 2024 סמסטר א' מועד א' ],
  [
    + סכום משתני ברנולי בלתי־תלויים מתפלג בינומית
    + תנאי תוחלת ושונות להתכנסות לקבוע
    + הגדרת התכנסות לקבוע
    + הוכחת החוק החלש של המספרים הגדולים
  ],

  [ הסתברות למדמ"ח 2024 סמסטר א' מועד ב' ],
  [
    + ניסוח והוכחה של אי־שיוויון מרקוב
    + ניסוח והוכחה של אי־שיוויון הופדינג ללא הלמה
  ],

  [ הסתברות למדמ"ח 2023 סמסטר א' מועד א' ],
  [
    + תוחלת של משתנה מקרי שנתמך על הטבעיים (עם פוביני)
  ],

  [ הסתברות למדמ"ח 2023 סמסטר א' מועד ב' ],
  [
    + אי־שיוויון מרקוב (בניסוח מוזר)
    + אי־שיוויון צ'בישב
    + אי־שיוויון צ'נרוף
  ],

  [ הסתברות למדמ"ח 2022 סמסטר א' מועד א' ],
  [
    + לינאריות התוחלת
    + חסימות השונות?
  ],

  [ הסתברות למדמ"ח 2022 סמסטר א' מועד ב' ],
  [
    + אי־שיוויון צ'בישב
    + אי־שיוויון צ'נרוף
  ],

  [ הסתברות למדמ"ח 2022 סמסטר א' מועד ג' ],
  [
    + אי־שיוויון בול עבור מספר סופי של מאורעות
  ],

  [ הסתברות למדמ"ח 2018 סמסטר א' מועד א' ],
  [
    + להגדיר שונות משותפת
    + נוסחת סכום שנויות לשני משתנים מקריים
  ],
)
