#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 01 --- תורת ההסתברות 1, 80420 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#show regex("\p{Hebrew}.+"): it => text(
  dir: rtl,
  font: "Libertinus Serif",
  lang: "he",
)[#it] // Dark Magic: https://github.com/typst/typst/issues/3695
#set math.cases(gap: 1em)

#question()
יהי $(Omega, cal(F), PP)$ מרחב הסתברות.

#subquestion()
נוכיח שאם $A subset.eq Omega$ מקיימת $PP(A)=0$ אז לכל $B subset.eq Omega$ מתקיים $PP(A union B) = PP(B)$.

#proof[
  תהיי $D = B without A$ ומתקיים $(A inter B) inter D = emptyset$ ולכן מתכונת הסכימות בת־מנייה של $PP$ מתקיים
  $ (star) space PP(D union (A inter B)) = PP(D) + PP(A inter B) $
  מהגדרת החיתוך ומתכונות פונקציית הסתברות נקבל
  $ 0<=P(A inter B) <= PP(A)=0 ==> P(A inter B) = 0 $
  ומ־$(star)$ נקבל $PP(D)=PP(B)$ ובסך־הכל
  $ PP(A union B) = PP(A union (B without A)) = PP(A union.dot D) =_"סכימות בת־מנייה" PP(A)+PP(D) = 0 + PP(D)=PP(B) $
]

#subquestion()
נפריך את הטענה שאם $A subset.neq B$ אזי $PP(A) < PP(B)$.

#proof[
  נגדיר $Omega = {1,2,3}$ כך שמתקיים $p(1) = p(2)=1/2, p(3) = 0$.\
  נסתכל על הקבוצות $B = {1,3}, A = {1}$ ואכן $A subset.neq B$ אבל $PP(A) = p(1) = 1/2 = PP(B) = 1/2$, בסתירה.
]

#subquestion()
נוכיח שלכל $A, B subset.eq Omega$ מתקיים $PP(A inter B)>= PP(A) ++ PP(B)-1$.

#proof[
  מתכונות פונקציית ההסתברות ועיקרון ההכלה וההדחה מתקיים
  $
    PP(A union B) = PP(A)+PP(B)-PP(A inter B) <==> PP(A inter B) = PP(A)-PP(B)-PP(A union B) >=_(forall X in cal(F), 1>=PP(X)) PP(A) + PP(B)- 1
  $
]

#subquestion()
יהיו $A,B subset.eq Omega$ ונוכיח שמתקיים
$ PP(A Delta B) = PP(A) + PP(B) - 2PP(A inter B) $

#proof[
  ניזכר בהגדרה
  $ A Delta B = (A union B) without (A inter B) = (A union B) inter (A inter B)^c $
  מתקיים
  $
    PP(A Delta B) & = PP((A union B) inter (A inter B)^c) \
                  & =_((1)) PP(A union B) + PP((A inter B)^c) - PP((A union B) union (A inter B)^c) \
                  & =_((2)) PP(A union B) + PP(Omega without (A inter B)) - PP(A union B union A^c union B^c) \
                  & = PP(A union B) + PP(Omega without (A inter B)) - PP(Omega) \
                  & =_((3)) PP(A union B) cancel(+ PP(Omega))-PP(A inter B) cancel(- 1) \
                  & =_((1)) PP(A) + PP(B) - 2 PP(A inter B)
  $
  כאשר $(1)$ נובע מהכלה והדחה, $(2)$ נובע מכללי דה־מורגן לקבוצות ו־$(3)$ נובע מתכונת המשלים של פונקציית הסתברות.
]

#question()
במסגרת ניסוי דו־שלבי, מוגרל בשלב הראשון מספר טבעי $n in NN$ על־פי פונקציית ההתפלגות הנקודתית $p(n)=2 dot.op 3^(-n)$.\
בשלב השני מוגרל מספר באקראי באופן אחיד מתוך $[2^n]$.

#subquestion()
נראה כי $p$ מקיימת את ההגדרה של פונקציית הסתברות נקודתית על $NN$.

#proof[
  נראה שכל התנאים מתקיימים.\
  אכן, לכל $n in NN$ מתקיים $p(n)=2 dot.op 3^(-n)>0$.\
  מהגדרת סכום גיאומטרי/הנדסי מתקיים
  $
    sum_(n=1)^infinity p(n) = sum_(n=1)^infinity 2 dot.op 3^(-n) = 2 sum_(n=1)^infinity 3^(-n) = 2 dot.op (1/3)/(1-1/3) = 2 dot.op 1/2 = 1
  $
  אז זו אכן פונקציית הסתברות נקודתית מעל $NN$.
]

#subquestion()
נחשב מה ההסתברות שהגורל בסוף השלב השני המספר $1$.

#solution[
  בעצם הניסוי הדו־שלבי שלנו מתואר על־ידי הזוגות $(n,k)$ כאשר $n in NN, k in {1,2, dots.h, 2^n}$.\
  בשלב הראשון אנחנו יודעים שההסתברות היא $2 dot.op 3^(-n)$ לקבל $n in NN$.\
  על־מנת לקבל $k in {1,2, dots.h, 2^n}$, נתון כי זה בהתפלגות אחידה.\
  כלומר ההסתברות לקבל את הזוג $(n,k)$ המתואר תהיה $display(2 dot.op 3^(-n) dot.op 1/2^n = 2/6^n)$.\
  כעת מבקשים מאיתנו למצוא את ההסתברות לקבל את אחד הצמדים
  $ (1,1), (2,1), (3,1), dots.h, (n,1) $
  מהיות כל המקרים זרים נוכל להשתמש בסכימות בת־מנייה ולקבל
  $
    sum_(n=1)^infinity P(n,1) = sum_(n=1)^infinity 2/6^n = 2 sum_(n=1)^infinity 1/6^n =_"סכום טור גיאומטרי/הנדסי" 2 dot.op (1/6)/(1-1/6) = 2 dot.op 1/5 = 2/5
  $
]

#question()
בכל סעיף, נבנה מרחב הסתברות אחיד המתאר נכונה את השאלה ונחשב את ההסתברות של המאורע המתואר.

#subquestion()
נתונים $5$ בני־אדם. נחשב מה ההסתברות שלפחות שניים מהם נולדו באותו החודש.

#solution[
  נסמן $Omega = [12]^5$ ל־$12$ חודשי השנה וחמשת בני־האדם.\
  ההסתברות היא אחידה ולכן נגדיר $PP=PP_p$ עבור $p:[12] arrow.r [0,1]$ פונקציית הסתברות נקודתית אחידה כך שלכל $omega in Omega$ מתקיים $p(omega)=1/12^5$.\
  לחישוב ההסתברות ששני בני־אדם חולקים חודש יום־הולדת נשתמש במשלים ולכן נשאל מה ההסתברות שאף־אחד מהם לא חולק יום־הולדת.\
  משיקולים קומבינטוריים ומהגדרת ההתפלגות האחידה ההסתברות מתקיים
  $ PP("לכולם יש חודשי לידה שונים") (12 dot.op 11 dot.op 10 dot.op 9 dot.op 8)/12^5 = 7920/2036 = 55/144 $
  נשאר להשתמש בהגדרת הסתברות המשלים ולקבל
  $ PP("לפחות שני בני־אדם חולקים יום־הולדת") = 1-PP("לכולם יש חודשי לידה שונים")=1-55/144 = 89/144 $
]

#subquestion()
$4$ בנים ו־$4$ בנות עומדים בשורה באופן מקרי. נחשב מה ההסתברות שיעמדו כך ש־$4$ הבנים יעמדו ב־$4$ המקומות הימניים ו־$4$ הבנות יעמדו ב־$4$ המקומות השמאליים.

#solution[
  נסמן $G = {G_1, G_2, G_3, G_4}, B = {B_1, B_2, B_3,B_4}$ ונגדיר $P = G union B$ כלומר $S$ הוא אוסף שמונת הבנים והבנות.\
  נגדיר $Omega = {(P_1, P_2, P_3, P_4, P_5, P_6, P_7, P_8) bar {P_1, dots.h, P_8} = S, P_i != P_j <==> i!=j}$ כלומר כל $omega in Omega$ הוא בעצם ה־$8$־יה הסדורה לסדר כלשהו של האוסף. \
  משיקולים קומבינטוריים מתקיים $abs(Omega) = 8!$.\
  כנתון ההסתברות היא אחידה ולכן נגדיר לכל $omega in Omega$ שמתקיים $P({omega}) = 1/abs(Omega) = 1/40320$.\
  המאורע שאנחנו מחפשים נסמן אותו ב־$E$ הוא המאורע שבו ארבעת הבנות תעמודנה בארבעת המקומות השמאליים וארבעת הבנים יעמדו בארבעת המקומות הימניים, כאשר לא אכפת לנו מהסידורים הפנימיים בין כל רביעייה.\
  כלומר יש לנו $4!=24$ אפשרויות סידור לארבעת הבנות ובאותו אופן גם $24$ אפשרויות לסידור ארבעת הבנים.\
  מההגדרת ההסתברות האחידה נקבל $display(P(E) = abs(E)/abs(Omega)) = 24^2/40320 = 1/70$.
]

#subquestion()
בוחרים באקראי ובאופן אחיד חלוקה של $12$ כדורים זהים בין $8$ תאים ממוספרים בהתפלגות אחידה. נחשב מה ההסתברות שאין תא ריק.

#solution[
  ראשית מרחב המדגם שלנו יהיה אוסף כל האפשרויות לחלוקה של 12 כדורים זהים ל־8 תאים ממוספרים וקומבינטורית מתקיים $ abs(Omega) = binom(12+8-1, 8-1) = binom(19, 7) = 19!/(7!12!) = (13 dot.op 14 dot.op 15 dot.op 16 dot.op 17 dot.op 18 dot.op 19)/(1 dot.op 2 dot.op 3 dot.op 4 dot.op 5 dot.op 6 dot.op 7) = 3 dot.op 4 dot.op 13 dot.op 17 dot.op 19 = 50388 $
  אנחנו מחפשים את ההסתברות שאין אף תא ריק, כלומר המאורע $E$ הוא המאורע שבכל תא יש לפחות כדור אחד. קומבינטורית, זה שקול למציאת פיתרון למשוואה
  $ x_1 + dots.h x_8 = 12, space x_i >=1 $
  במילים אחרות, נשאר לנו לחלק $4$ כדורים ל־$8$ התאים השונים ולכן שוב לפי בעיית המנייה הרביעית $ abs(E) = binom(4+8-1, 8-1) = binom(11, 7) = 11!/(4!7!) = 3 dot.op 10 dot.op 11 = 330 $
  שוב ההסתברות היא אחידה ולכן $ P(E)=abs(E)/abs(Omega) = 330/50388=55/8398 $
]

#subquestion()
מחלקים באקראי $12$ כדורים זהים בין $8$ תאים ממוספרים בזה אחר זה, כאשר לכל כדור נבחר תא באופן אקראי ואחיד. נחשב את ההסתברות שאין תא ריק.

#solution[
  בניגוד לסעיף הקודם, כאן אנחנו מחלקים בסדר סדרתי. כל אחד מ־$12$ הכדורים יכול להיות בכל אחת מה־$8$ תאים בצורה אחידה ולכן לפי בעיית המנייה הראשונה מתקיים $abs(Omega) = 8^12$.\
  אנחנו מחפשים את המאורע בו אין אף תא ריק, כלומר יש פונקציה על בין ה־$12$ כדורים לבין $8$ התאים.\
  נרצה להשתמש בעיקרון ההכלה וההדחה ונגדיר $E_i$ המאורע בו התא ה־$i$ הוא ריק עבור $i in [8]$.\
  אנחנו רוצים למצוא את $abs(E) abs(Omega)-abs(E_1 union dots.h union E_8)$ ולכן נשתמש במשלים ונחפש עם הכלה והדחה את $abs(E^c)$ שמתקיים
  $
    abs(E^c) = abs(E_1 union dots.h union E_8) = sum_(k=1)^8 sum_(I subset.eq [8], abs(I)=k) (-1)^(k+1) abs(inter.big_(i in I) E_i)
  $
  מספר הדרכים לבחור $k$ תאים ריקים הוא $binom(8, k)$ ואם $k$ תאים ריקים, אז ה־$12$ כדורים צריכים להתפזר בין ה־$8-k$ התאים הנותרים ולכן יש $(8-k)^12$ אפשרויות לחלוקה שלהם ולכן
  $ abs(E^c) = sum_(k=1)^8 (-1)^(k-1) binom(8, k)(8-k)^12 $
  מהגדרת המשלים מתקיים
  $ abs(E)=abs(Omega) - abs(E^c) $
  ובגלל שההסתברות אחידה מתקיים
  $ P(E) = abs(E)/abs(Omega) = (8^12 -sum_(k=1)^8 (-1)^(k-1) binom(8, k)(8-k)^12)/8^12 $
]

#question()
#subquestion()
נפריך את הטענה שקיים מרחב הסתברות $(Omega, cal(F), PP)$ עם $Omega=NN$ כך שלכל $A,B subset Omega$ סופיות ומאותו גודל יתקיים $PP(A)=PP(B)$.

#proof[
  נניח בשלילה שיש מרחב הסתברות כזה, ותהיינה $A,B subset Omega$ כך ש־$abs(A)=abs(B)<infinity$.\
  מההנחה, מתקיים $PP(A)=PP(B)$ בפרט, זה אומר שגם עבור $n!=m in NN$ מכך שמתקיים $abs({m})=abs({n})$ מתקיים $PP({m})=PP({n})$.\
  כלומר, לכל $n in NN$ יש בידיוק את אותה הסתברות, נסמן $p = PP({n})$.\
  היות $Omega=NN$ אז $NN$ הוא איחוד בן־מנייה זר של יחידונים $Omega = union.big_(n=1)^infinity {n}$ ומתכונת הסכימות בת־מנייה מתקיים
  $ 1 = PP(Omega) = sum_(n=1)^infinity PP({n}) = sum_(n=1)^infinity p $
  אם $p>0$ אז הטור מתבדר, אם $p=0$ נקבל סתירה ומהגדרת פונקציית ההסתברות לא ייתכן כי $p<0$, כלומר הטור בין כה וכה מתבדר ולא ייתכן שיהיה מרחב הסתברות כזה.
]

#subquestion()
יהי $(Omega, cal(F), PP)$ מרחב הסתברות בדיד כך ש־$abs(Omega)>2$ כך שלכל $A,B subset Omega$ המקיימות $abs(A)=abs(B)=2$ מתקיים $PP(A)=PP(B)$.\
נוכיח ש־$(Omega, cal(F), PP)$ הוא מרחב הסתברות אחיד.

#proof[
  נסמן ב־$p_i =PP({omega_i})$, ההסתברות של היחידות $omega_i in Omega$.\
  יהיו $omega_1, omega_2, omega_3, omega_4 in Omega$ ונגדיר את הקבוצות
  $ A = {omega_1, omega_2}, space B = {omega_3, omega_4}, space C = {omega_1, omega_3}, space D = {omega_2, omega_4} $
  מההנחה מתקיים
  $
    PP(A) = PP(B) ==> p_1 + p_2 = p_3 + p_4, \
    PP(C) = PP(D) ==> p_1 + p_3 = p_2 + p_4
  $
  מחיסור המשוואות נקבל
  $ p_1+p_2 - p_1 - p_3 = p_3 + p_4 - p_2 - p_4 <==> p_2-p_3 = p_3 - p_2 <==> 2p_2 = 2p_3 <==> p_2 = p_3 $
  נבחין שאם קיימים $i != j in [4]$ כך ש־$omega_i = omega_j$ (ויש לכל היותר זוג אחד כזה מפאת ההנחה $abs(Omega)>2$) זה לא משנה את התוצאה כלל.\
  כלומר, מצאנו שלכל $4$ איברים שרירותיים ב־$Omega$ יש את אותה הסתברות, וזה נכון לבחירה של כל $4$ איברים שרירותיים, כלומר לכל איבר ב־$Omega$ יש את אותה ההסתברות והמרחב הוא מרחב הסתברות אחיד.
]

#question()
בכל סעיף נבנה מרחב הסתברות $(Omega, cal(F), PP)$ עם שלושה מאורעות $A,B,C$ שונים כך שתנאי הסעיף יתקיימו.

#subquestion()
$PP(A) = PP(B) = PP(C) = 3/4$ וגם $PP(A inter B inter C) = 1/4$.

#solution[
  נגדיר $Omega = {(1,1,0), (1,0,1), (0,1,1), (1,1,1)}$ עם פונקציות הסתברות נקודתית אחידה, כלומר לכל $omega in Omega$, $PP({omega}) = 1/4$ ואכן $PP(Omega)=1$.\
  נגדיר
  $ A = {(1,1,0), (1,0,1), (1,1,1)}, space B = {(1,1,0), (0,1,1), (1,1,1)}, space C = {(1,0,0), (1,0,1), (1,1,1)} $
  אז מתקיים
  $
    PP(A) = 1-PP(A^c) = 1 - PP({0,1,1}) = 1-1/4 = 3/4 \
    PP(B) = 1-PP(B^c) = 1 - PP({1,0,1}) = 1-1/4 = 3/4 \
    PP(C) = 1-PP(C^c) = 1 - PP({1,1,0}) = 1-1/4 = 3/4
  $
  ומתקיים גם
  $ PP(A inter B inter C) = PP({1,1,1}) = 1/4 $
  וכל תנאי הסעיף מתקיימים.
]

#subquestion()
$PP(A)=PP(B)=PP(C)=3/4$ וגם $PP(A inter B inter C)=3/4$.

#solution[
  נגדיר $Omega = {omega_1, omega_2, omega_3, omega_4, omega_5}$ עם $cal(F)=cal(P)(Omega)$ כך שיתקיים $PP({omega_1}) = 3/4, PP({omega_2})=1/4, forall i in {3,4,5}, PP({omega_i}) = 0$.\
  אכן מתקיים $PP(Omega) = 1$ ונגדיר את הקבוצות $A = {omega_1, omega_3}, space B = {omega_1, omega_4}, space C = {omega_1, omega_5}$.\
  אכן מתקיים $PP(A) = PP({omega_1}) + PP({omega_3}) = 3/4$ ובאותו אופן $PP(B) = PP(C) = 3/4$.\
  נסתכל על $A inter B inter C = {omega_1}$ ולכן $PP(A inter B inter C) = PP({omega_1}) = 3/4$ וכל תנאי הסעיף מתקיימים.
]

#subquestion()
$PP(A)=PP(B)=PP(C)=3/4$ וגם $PP(A inter B inter C) = 1/2$.

#solution[
  ניקח מהסעיף הקודם $Omega = {omega_1, omega_2, omega_3, omega_4, omega_5}$ עם $cal(F) = cal(P)(Omega)$ רק שהפעם נגדיר
  $ PP({omega_1}) = 1/2, space forall i in {2,3,4,5}, PP({omega_i}) = 1/8 $
  אכן מתקיים $PP(Omega) = 1$ ונגדיר כעת
  $ A = {omega_1, omega_2, omega_3}, space B = {omega_1, omega_2, omega_4}, space C = {omega_1, omega_3, omega_4} $
  מתקיים מהגדרת פונקציית ההסתברות
  $ PP(A) = PP({omega_1}) + PP({omega_2}) + PP({omega_3}) = 1/2 + 1/8 +1/8 = 3/4 $
  ובאותו אופן $PP(B)=PP(C) = 3/4$.\
  עוד מתקיים $A inter B inter C = {omega_1}$ כלומר $PP(A inter B inter C) = PP({omega_1}) = 1/2$ וכל תנאי הסעיף מתקיימים.
]

#question()
תהיי $Omega$ קבוצה בת־מנייה ולא סופית. במקום לקחת את $cal(F)$ להיות אוסף כל התת־קבוצות של $Omega$, נגדיר את $cal(F)$ להיות אוסף תת־הקבוצות של $Omega$ שהן או סופיות או שהקבוצה המשלימה שלהן סופית.\
נגדיר $P : cal(F) arrow.r [0,1]$ על־ידי
$ P(A) = mycases(0, abs(A)<infinity, 1, abs(Omega without A) = abs(A^c) < infinity) $

#subquestion()
נראה כי האוסף $cal(F)$ סגור ללקיחת משלים ולאיחודים סופיים.

#proof[
  יהי $A in cal(F)$.\
  מהגדרת $cal(F)$ יש שני מקרים אפשריים או ש־$abs(A)<infinity$ ולכן $abs(A^c)<infinity$ או שמתקיים $abs(A^c)<infinity$ ולכן $abs(A)<infinity$ וקיבלנו סגירות למשלים.\
  תהיינה $A, B in cal(F)$ ונחלק למקרים:
  + אם $abs(A), abs(B) < infinity$ אזי בהכרח $abs(A union B) < infinity$ ולכן $A union B in cal(F)$
  + אם $abs(A), abs(B) = infinity$ אזי $A union B = (A^c inter B^c)^c$ אבל מהגדרת $cal(F)$ נובע ש־$abs(A^c), abs(B^c) < infinity$ ולכן בהכרח $abs(A^c inter B^c)<infinity$ אז שוב קיבלנו$A union B in cal(F)$
  + אם $abs(A), abs(B^c)<infinity$ (בלי הגבלת הכלליות) אזי $(A union B)^c = A^c inter B^c$ אבל $B^c$ סופית ולכן גם $abs(A^c inter B^c)<infinity$ ושוב $A union B in cal(F)$
  כיסינו את כל המקרים האפשריים לאיחוד זוגות ולכן $cal(F)$ סגורה לאיחודי זוגות.\
  כדי להוכיח סגירות למשלים סופי, נוכל להשתמש בטענה הזאת ולהוכיח באינדוקציה: נניח $(A_i)_(i=1)^ell subset.eq cal(F)$, בסיס האינדוקציה נובע ממה שראינו לעיל מהנחת האינדוקציה והבסיס הטענה נובעת.\
  ראינו ש־$cal(F)$ סגורה להשלמה ולאיחוד סופי וזה מסיים.
]

#subquestion()
נראה כי $P$ מקיימת $P(Omega)=1, P(emptyset)=0$ וסכימות סופית (כלומר אם $A_1, dots.h, A_k in cal(F)$ זרים בזוגות אזי $P(union.big_(i=1)^k A_i) = sum_(i=1)^k P(A_i)$).

#proof[
  ראשית, $abs(emptyset) < infinity$ ולכן מהגדרה $P$ מתקיים $P(emptyset)=0$.\
  שנית, $Omega^c = Omega without Omega = emptyset$ ולכן שוב מהנתון $P(Omega)=1$.\
  נשאר להראות אדיטיביות סופית. תהיינה $(A_i)_(i=1)^ell$ מאורעות זרים בזוגות וסופית.\
  נטען שלכל היותר יש $i in [ell]$ יחיד כך ש־$abs(A_i) = infinity$: נניח שלא ככה, ולכן יש $A_i, A_j$ כך שמתקיים $abs(A_i), abs(A_j) = infinity$ עבור $i, j in [ell]$ וכמובן זרים.\
  מההנחה נובע ש־$abs(A_i^c), abs(B_j^c) < infinity$ ולכן יש $a in.not A_i^c inter A_j^c$ ולכן $a in A_i, A_j$ אבל זו סתירה לזורתם.\
  כעת, נניח כי לכל $2<=i<=ell$, $abs(A_i) < infinity$ ו־$A_1$ ונחלק למקרים:
  + אם $abs(A_1) < infinity$ אז $union.big_(i=1)^ell A_i$ הוא איחוד סופי של עוצמות סופיות ולכן סופי גם־כן ומתקיים $P(union.big_(i=1)^ell A_i) = 0 = sum_(i=1)^ell P(A_i)$.
  + אם $abs(A_1) = infinity$ אזי האיחוד שלהן של הזנב הוא סופי ומתקיים $1 = P(union.big_(i=1)^ell A_i) = P(A_1) + sum_(i=2)^ell A_i = sum_(i=1)^ell A_i$
]

#subquestion()
נראה כי יש $A in cal(F)$ המקיימת $P(A)=1$ שהיא איחוד של $A_1, A_2, dots.h in cal(F)$ זרות בזוגות אם $P(A_n)=0$ לכל $n in NN$.\
נסיק כי $P$ אינה מקיימת סכימות בת־מנייה ונבחן האם התשובה לסעיף זה הייתה משתנה אילו $Omega$ הייתה הקטע $[0,1]$ (ולכן לא בת־מנייה).

#solution[
  מהנתון, $Omega$ היא בת־מנייה, כלומר $abs(Omega)=abs(NN)$ ולכן קיימת $f:NN arrow.r Omega$ שמעידה על־כך, כלומר $f$ חד־חד ערכית ועל.\
  נגדיר $(A_n)_(n=1)^infinity subset.eq cal(F)$ על־ידי $A_n = {f(n)}$ ומתקיים $union.big_(n in NN) A_n = f(NN) = Omega$
  אזי $P(union.big_(n=1)^infinity A_n) = P(Omega)=1$ אבל מצד שני לכל $n in NN$ מתקיים $P(A_n)=0$ כי $A_n$ הוא יחידון, כלומר סופית.
  זוהי סתירה ישירה לסיגמא־אדיטיביות כי כל יחידון $P(A_n)=0$ אבל איחודם איננו אפס.\
  נבחן מחדש את התשובה לסעיף לו $Omega = [0,1]$:\
  יהי $A in cal(F)$ כך ש־$P(A)=1$ כלומר $abs(Omega without A)<infinity$ ומשיקולי עוצמה נובע כי $abs(A)=2^(aleph_0)$.\
  אם $A_n in cal(F)$ ו־$P(A_n) = 0$ נובע כי $abs(A_n) < infinity$.\
  כעת, איחוד בן־מנייה של קבוצות סופיות הוא לכל היותר איחוד בן־מנייה ולכן $union.big_(n=1)^infinity A_n$ הוא איחוד בן־מנייה.\
  כעת, אם נניח שמתקיים $union.big_(n=1)^infinity A_n = A in cal(F)$ כך שמתקיים $P(A)=1$, היה נובע שבהכרח האיחוד הוא לא בן־מנייה, אבל אמרנו שהאיחוד הוא בן־מנייה ולכן זו סתירה.\
  כלומר, הדרישה של $Omega$ להיות בת־מנייה היא הכרחית לקיום תנאי הסעיף.
]
