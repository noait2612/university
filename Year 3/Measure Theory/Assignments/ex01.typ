#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 01 --- תורת המידה, 80517 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
תהיי $X$ קבוצה לא ריקה.

#subquestion()
תהיי $cal(A) subset.eq cal(P)(X)$ כך ש־$X in cal(A)$ ולכל $E_1, E_2 in cal(A)$ מתקיים $E_1 without E_2 in cal(A)$ $(star)$.\
נוכיח כי $cal(A)$ היא אלגברה על $X$.

#proof[
  כדי שנגיד ש־$cal(A)$ היא אלגברה על $X$ צריכים להתקיים הבאים:
  + $X in cal(A)$
  + $cal(A)$ סגורה תחת לקיחת משלים
  + $cal(A)$ סגורה תחת איחודים סופיים
  $X in cal(A)$ נתון, נבחן את שתי התכונות האחרות: \
  _סגורה תחת לקיחת משלים:_ יהי $E in cal(A)$ ונרצה להראות ש־$E^c in cal(A)$. היות ו־$X in cal(A)$ מהנתון $(star)$ נקבל שמתקיים $E^c = X without E in cal(A)$ וקיבלנו סגירות תחת לקיחת משלים.\
  _סגורה תחת איחודים סופיים:_ תהיינה $E_1, E_2 in cal(A)$ ונרצה להראות ש־$E_1 union E_2 in cal(A)$.\
  מכללי דה־מורגן מתקיים $E_1 union E_2 = (E_1^c inter E_2^c)^c$ וכן $E_1^c inter E_2^c = E_1^c without E_2$ מהגדרת החיתוך והמשלים.\
  ראינו ש־$cal(A)$ סגורה תחת לקיחת משלים ולכן $E_1^c in cal(A)$ ולפי $(star)$ מתקיים $E_1^c without E_2 in cal(A)$ וכן מתקיים גם $(E_1^c without E_2)^c in cal(A)$.\
  מכללי דה־מורגן שראינו לעיל מתקיים $E_1 union E_2 = (E_1^c inter E_2^c)^c = (E_1^c without E_2)^c$ וזה בידיוק אומר ש־$E_1 union E_2 in cal(A)$, כלומר $cal(A)$ סגורה תחת איחודים סופיים.\
  שלושת התנאים מתקיימים ולכן $cal(A)$ היא אלגברה.
]

#subquestion()
תהיינה $(cal(A)_n)_(n=1)^infinity$ אלגבראות על $X$ כך שלכל $n in NN$ מתקיים $cal(A)_n subset.eq cal(A)_(n+1)$.\
נוכיח שמתקיים $display(cal(A) = union.big_(n=1)^infinity cal(A)_n)$ היא אלגברה על $cal(A)$.

#proof[
  _$X in cal(A)$:_ היות ו־$cal(A)_1$ אלגברה על $X$ נובע כי $X in cal(A)_1$ ומכך ש־$cal(A)_1 subset.eq cal(A)=union.big_(n=1)^infinity cal(A)_n$ נובע כי $X in cal(A)$.\
  _סגירות תחת לקיחת משלים:_ יהי $E in cal(A)$, נרצה להראות ש־$E^c in cal(A)$.\
  מכך ש־$E in cal(A)$ נובע כי קיים $k in NN$ מינימלי כך ש־$E in cal(A)_k$.\
  $cal(A)_k$ היא אלגברה ולכן סגורה ללקיחת משלים ולכן $E^c in cal(A)_k$ ומכך ש־$cal(A)_k subset.eq cal(A)$ נובע כי $E^c in cal(A)$ וקיבלנו סגירות תחת לקיחת משלים.\
  _סגירות תחת איחודים סופיים:_ תהיינה $E_1, E_2 in cal(A)$ ולכן קיימים $n,m in NN$ כך שמתקיים ללא הגבלת הכלליות $E_1 in cal(A)_n, E_2 in cal(A)_m$.\
  נבחר $k = max(n, m)$ ולכן מהנתון על השרשרת העולה של הכלות נקבל ש־$E_1, E_2 in cal(A)_k$, אבל $cal(A)_k$ היא אלגברה ולכן סגורה תחת איחודים סופיים, כלומר $E_1 union E_2 in cal(A)_k$, אבל $cal(A)_k subset.eq cal(A)$ מהגדרת האיחוד ולכן $E_1 union E_2 in cal(A)$ וקיבלנו ש־$cal(A)$ סגורה תחת איחודים סופיים.\
  שלושת התנאים מתקיימים ולכן $cal(A)$ היא אלגברה.
]

#subquestion()
נראה כי הסעיף הקודם אינו נכון עבור $sigma$־אלגבראות. כלומר, נראה שאיחוד עולה של $sigma$־אלגבראות אינו בהכרח $sigma$־אלגברה.

#proof[
  #todo
]

#question()
נסמן ב־$cal(B)(RR)$ את *$sigma$־אלגברת בורל על $RR$*. תהיי $U subset.eq RR$ פתוחה.

#subquestion()
נראה כי $U$ ניתנת להצגה כאיחוד של אוסף של קטעים פתוחים זרים בזוגות.

#proof[
  #todo
]

#subquestion()
נראה כי $U$ היא איחוד של אוסף בן־מנייה של קטעים פתוחים זרים בזוגות.

#proof[
  #todo
]

#subquestion()
נסיק כי $cal(B)(RR)$ נוצרת על־ידי אוסף הקטעים הפתוחים ב־$RR$.

#proof[
  #todo
]

#subquestion()
הוכחתי.

#question()
תהיי $f: X_1 arrow.r X_2$ פונקציה בין שתי קבוצות ותהיי $cal(M)_2$, $sigma$־אלגברה על $X_2$. נוכיח
$ cal(M)_1 = {f^(-1)(A) bar A in cal(M)_2} $
היא $sigma$־אלגברה על $X_1$.

#proof[
  כדי להגיד ש־$cal(M)_1$ היא $sigma$־אלגברה, עלינו להראות שהבאים מתקיימים:
  + $X_1 in cal(M)_1$ – נתון ש־$cal(M)_2$ היא $sigma$־אלגברה על $X_2$ ולכן $X_2 in cal(M)_2$ ומהגדרת הפונקציה, $f^(-1)(X_2)=X_1$ ולכן $X_1 in cal(M)_2$.
  + $cal(M)_1$ סגורה תחת לקיחת משלים  – יהי $E in cal(M)_1$ ונרצה להראות ש־$E^c in cal(M)_1$. \
    $E in cal(M)_1$ כלומר קיים $A in cal(M)_2$ כך ש־$E = f^(-1)(A)$, מתקיים
    $ E = f^(-1)(A) <==> E^c = (f^(-1)(A))^c = X_1 without f^(-1)(A) $
    לכל $x in X_1$ מתקיימת שרשרת הגרירות הבאה
    $ x in X_1 without f^(-1)(A) <==> x in.not f^(-1)(A) <==> f(x) in.not A <==> f(x) in A^c <==> x in f^(-1)(A^c) $
    כלומר
    $ (star) space E^c = f^(-1)(A^c) $
    מהיות $cal(M)_2$ $sigma$־אלגברה נובע כי $A^c in cal(M)_2$ ויחד עם $(star)$ נובע $E^c in cal(M)_1$.
  + $cal(M)_1$ סגורה תחת איחודים בת־מנייה – תהיי ${E_n}_(n=1)^infinity subset.eq cal(M)_1$ ונרצה להראות ש־$union.big_(n=1)^infinity E_n in cal(M)_1$.\
    מכך ש־${E_n}_(n=1)^infinity subset.eq cal(M)_1$ נובע כי קיימים ${A_n}_(n=1)^infinity subset.eq cal(M)_2$ בהתאמה כך שלכל $n in NN$ מתקיים $f^(-1)(A_n) = E_n$.\
    מתקיים
    $ f^(-1)(union.big_(n=1)^infinity A_n) = union.big_(n=1)^infinity f^(-1)(A_n) $
    שכן לכל $x in X_1$ מתקיים
    $
      x in f^(-1)(union.big_(n=1)^infinity A_n) <==> f(x) in union.big_(n=1)^infinity A_n <==> exists n in NN, f(x) in A_n <==> exists n,x in f^(-1)(A_n) <==> x in union.big_(n=1)^infinity f^(-1)(A_n)
    $
    ובמקרה שלנו מתקיים
    $ union.big_(n=1)^infinity E_n = union.big_(n=1)^infinity f^(-1)(A_n) = f^(-1)(union.big_(n=1)^infinity A_n) $
    היות ו־$cal(M)_2$ היא $sigma$־אלגברה מתקיים $union.big_(n=1)^infinity A_n in cal(M)_2$ ולכן $f^(-1)(union.big_(n=1)^infinity A_n) in cal(M)_1$.
]

#question()
נניח כי $(X,d)$ מרחב מטרי כך שאוסף הקבוצות הפתוחות בו הוא גם $sigma$־אלגברה.\ נוכיח כי זה מרחב דיסקרטי.

#proof[
  נזכר
]

#question()
תהיי $X$ קבוצה ונניח ש־$cal(M)$ היא $sigma$־אלגברה על $X$ שאיננה סופית.

#subquestion()
נראה כי $cal(M)$ מכילה מספר אינסופי של קבוצות זרות.
#proof[
  מכך ש־$cal(M)$ אינסופית, קיים $A_1 in cal(M)$ כך ש־$A_1!=emptyset, A_1!=X$ ומהיות $cal(M)$ $sigma$־אלגברה, $A_1^c in cal(M)$ וכמובן $X in cal(M)$ וכן $emptyset in cal(M)$.\
  מאינסופיות $cal(M)$ נבנה כך סדרה $A_1, A_2, dots.h.c$ ונגדיר
  $
    B_1 = A_1, \
    B_2 = A_2 without A_1 = A_2 inter A_1^c =A_2 inter A_1^c =_"כללי דה־מורגן" (A_2^c union (A_1^c)^c)^c = (A_2^c union A_1)^c, \
    B_3 = A_3 without (A_1 union A_2) = A_3 without B_2, \
    dots.v
  $
  מהיות $cal(M)$ $sigma$־אלגברה, היא סגורה תחת לקיחת משלים כלומר $A_2^c in cal(M)$ ומסגירות תחת איחוד בן־מנייה (ולכן גם איחוד סופי), $A_2^c union A_1 in cal(M)$ ושוב מסגירות תחת משלים, $(A_2^c union A_1)^c in cal(M)$.\
  כלומר ${B_n}_(n=1)^infinity subset.eq cal(M)$ ומבנייה לכל $n,m in NN$ מתקיים $B_n inter B_m = emptyset$.\
  אם בשלילה נניח ש־$cal(M)$ לא מכילה מספר אינסופי של קבוצות זרות, היה נובע כי קיים $k in NN$ כך שלכל $NN in.rev K > k$ מתקיים $B_K = emptyset$, כלומר \
  $ B_K = A_K without (A_1 union dots.h.c union A_(K-1)) = emptyset ==> A_K subset.eq A_1 union dots.h.c union A_(K-1) $
  כלומר החל ממקום מסויים ${A_n}_(n=1)^infinity$ היא סדרה קבועה, דהיינו $cal(M)$ היא $sigma$־אלגברה סופית, בסתירה לנתון.

]

#subquestion()
נראה כי $cal(M)$ אינה בת־מנייה.

#proof[
  מהסעיף הקודם נובע שיש מספר אינסופי של קבוצות זרות, נגדירן ${A_n}_(n=1)^infinity subset.eq cal(M)$.\
  היות ו־$cal(M)$ $sigma$־אלגברה נובע שהיא סגורה תחת איחוד בן־מנייה, כלומר בהינתן $S subset.eq NN$ מתקיים $union.big_(n in S) A_n in cal(M)$ (גם אם $S = NN$).\
  מהזרות נובע כי כל אוסף איחודים שנבחר יהיה שונה מאיחוד אחר, ומטעמי עוצמה אנחנו יודעים שמתקיים $abs(cal(P)(NN)) = 2^(aleph_0)$, כלומר עוצמת תתי־הקבוצות של $NN$ היא איננה בת־מנייה ולכן בפרט מתקיים $abs(cal(M))>=2^(aleph_0)$, שכן יש לנו כמות לא בת־מנייה של איחודים נוספים שנוכל לעשות.\
]
