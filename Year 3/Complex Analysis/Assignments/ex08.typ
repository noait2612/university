#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 08 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
#subquestion()
עבור $z_0 in G$ התבוננו בכדור ברדיוס $r>0$ קטן מספיק כך ש־$B_r (z_0) subset.eq G$ והגדרנו
$ F(z) = integral_([z_0, z]) f(w) dif w $
נוכיח ש־$F$ אכן הולומורפית וש־$F'=f$ בכדור הזה.

#proof[
  יהי $z in B_r (z_0)$, עבור $h$ קטן דיו, $z+h in B_r (z_0)$ ובגלל ש־$B_r (z_0)$ זה כדור, נסתכל על המשולש שקודקודיו הם $z_0, z, z+h$ מוכל לחלוטין בכדור $B_r (z_0)$ וממשפט קושי למשולש ומלינאריות האינטגרל
  $ integral_([z_0, z]) f(w) dif w+integral_([z, z+h]) f(w) dif w+integral_([z+h, z_0]) f(w) dif w = 0 $
  ומהגדרת $F(z)$ נקבל
  $
    F(z+h)-F(z) = integral_([z,z+h]) f(w) dif w & <==> (F(z+h)-F(z))/h = 1/h integral_([z,z+h]) f(w) dif w \
                                                & <==> (F(z+h)-F(z))/h - f(z) = 1/h integral_([z,z+h]) (f(w) - f(z)) dif w
  $
  שכן
  $ integral_([z,z+h]) f(z) dif w = [f(z) dot.op w]_(w=z)^(w=z+h) = f(z) dot.op h $
  אבל $f$ הולומורפית ולכן רציפה ב־$z$ ולכן לכל $epsilon>0$ יש $delta>0$ כך שלכל $w$ המקיים $abs(w-z)<delta$ מתקיים $abs(f(w)-f(z))
  <epsilon$.\
  אז אם נבחר $abs(h)<delta$, לכל $w$ על הקטע $[z,z+h]$ מתקיים $abs(w-z)<abs(h)$ ונקבל
  $
    abs(1/h integral_([z,z+h]) (f(w)-f(z)) dif w) <= 1/abs(h) dot.op epsilon dot.op L([z,z+h]) = (epsilon dot.op abs(h))/abs(h) = epsilon
  $
  כלומר כאשר $h arrow.r 0$ הגבול שואף ל־$0$, כלומר בידיוק מתקיים $F'(z)=f(z)$ לכל $z$ ולכן $F$ גזירה במובן המורכב.\
  בנוסף, $F$ היא גזירה במובן במובן המורכב בכל נקודה בכדור ולכן היא הולומורפית.
]

#subquestion()
הפונקציה $F$ בסעיף הקודם הוגדרה רק בכדור $B_r (z_0)$ ותלויה בנקודה $z_0$ ונסביר למה זה אומר שיש פונקציה קדומה ל־$f$ בכל $G$.

#proof[
  נעזר ברמז.\
  אם לכל $triangle subset.eq G$ מתקיים $integral_(partial triangle) f(z) dif z = 0$ אז בפרט נובע שהאינטגרל יהיה 0 על כל קו פוליגונלי סגור $P$ כי כל פוליגון יכול להתפרק למספר סופי של משולשים כפי שראינו בהוכחה של משפט קושי אז
  $ integral_(partial P) f =_"לינאריות האינטגרל" sum integral_(partial triangle_j) f = 0 $
  אבל אם האינטגרל הוא אפס לכל קו פוליגוני סגור אז הוא אפס גם עבור מסילה סגורה ב־$C^1$ ממשפט הקירוב הפוליגונלי, כי כל עקומה כזאת ניתנת לקירוב על־ידי עקומות פוליגונליות בתחום ו־$f$ רציפה אז אינטגרלים על המסילות האלו מתכנסים לאינטגרל על העקומה המקורית, כלומר לכל $gamma$ עקומה גזירה למקוטעין וסגורה מתקיים
  $ integral_gamma f(z) dif z = 0 $
  בפרט נובע שאם $gamma_1, gamma_2$ שתיהן מסילות סגורות מ־$z_0$ ל־$z$ אז
  $ integral_(gamma_1) f(z) dif z = integral_(gamma_2) f(z) dif z $
  כי החיסור שלהן הוא עקומה סגורה ולכן
  $ integral_(gamma_1) f(z) dif z - integral_(gamma_2) f(z) dif z = integral_(gamma_1 - gamma_2) f(z) dif z = 0 $
  כלומר העקומות הן בלתי־תלויות.\
  אז נקבע $z_0 in G$ ולכל $z in G$ נגדיר
  $ F(z) colon.eq integral_gamma f(w) dif w $
  כאשר $gamma$ היא מסילה גזירה למקוטעין בין $z_0$ ל־$z$ ו־$F$ מוגדרת היטב (כי המסילות בלתי־תלויות ומוגדרת לכל $z in G$).\
  מהסעיף הקודם אנחנו מקבלים ש־$F'(z)=f(z)$ שכן עבור $z in G$ נבחר $r>0$ כך ש־$B_r (z) subset.eq G$ ונקבל עבור $h$ קטן דיו
  $ (F(z+h)-F(z))/h = 1/h integral_([z,z+h]) f(w) dif w stretch(arrow.r)_(h arrow.r 0) f(z) $
  שכן $f$ רציפה, ולכן $F'(z)=f(z)$.\
  כלומר ההגדרה הגלובאלית (ההפך מלוקאלית) שעשיינו ל־$F$ משתמשת בעובדה שהמסילות בלתי־תלויות כדי "להדביק" אותן מהמקרה הלוקאלי.\
  מותר לנו לעשות את המהלכים הללו כי $G$ הוא תחום ולכן קשיר.
]

#question()
בשאלה זו נחקור את שארית הטיילור של טורי טיילור מרוכבים.\
תהיי $f in Hol(B_r (z_0))$ ורציפה בשפה של הכדור ונסמן את שארית טור הטיילור מסדר $k$ סביב $z_0$ על־ידי
$ R_k (z) = f(z) - sum_(n=0)^k (f^(n) (z_0))/n! (z-z_0)^n = sum_(n=k+1)^infinity (f^(n) (z_0))/n! (z-z_0)^n $

#subquestion()
נוכיח שלכל $z in B_r (z_0), w in partial B_r (z_0)$ מתקיים
$ 1/(w-z) = 1/(w-z_0) sum_(n=0)^infinity ((z-z_0)/(w-z_0))^n $

#proof[
  ראשית מתקיים
  $ 1/(w-z) = 1/((w-z_0)-(z-z_0)) = 1/(w-z_0) dot.op 1/(1-(z-z_0)/(w-z_0)) space (star) $
  בנוסף מהיות $z in B_r (z_0), w in partial B_r (z_0)$ נובע כי
  $ abs((z-z_0)/(w-z_0)) = abs(z-z_0)/abs(w-z_0) < r/r = 1 $
  ולכן אם נגדיר $CC in.rev q colon.eq (z-z_0)/(w-z_0)$ נקבל כי $abs(q)<1$.\
  אבל אם $abs(q)<1$ אנחנו יודעים מטור הנדסי
  $ sum_(n=0)^infinity q^n = 1/(1-q) ==> 1/(1-(z-z_0)/(w-z_0)) = sum_(n=0)^infinity ((z-z_0)/(w-z_0))^n $
  אבל מ־$(star)$ נקבל בהצבה
  $ 1/(w-z) = 1/(w-z_0) sum_(n=0)^infinity ((z-z_0)/(w-z_0))^n $
]

#subquestion()
נוכיח כי לכל $z in B_r (z_0)$ מתקיים
$ R_k (z) = (z-z_0)^(k+1)/(2pi i) integral_gamma (f(w))/((w-z)(w-z_0)^(k+1)) dif w $
כאשר $gamma = partial B_r (z_0)$, חד־חד ערכית ומתקדמת נגד כיוון השעון.
#proof[
  ראשית, נתחיל מלהרחיב את התוצאה של הסעיף הקודם: \
  $
    1/(w-z) = 1/(w-z_0) sum_(n=0)^infinity ((z-z_0)/(w-z_0))^n = sum_(n=0)^infinity (z-z_0)^n/(w-z_0)^(n+1) = sum_(n=0)^k (z-z_0)^n/(w-z_0)^(n+1) + sum_(n=k+1)^infinity (z-z_0)^n/(w-z_0)^(n+1)
  $
  ונבחן את טור הזנב
  $
    sum_(n=k+1)^infinity (z-z_0)^n/(w-z_0)^(n+1) =_(m = n-(k+1)) (z-z_0)^(k+1)/(w-z_0)^(k+1) sum_(m=0)^infinity ((z-z_0)/(w-z_0))^m
  $
  אבל שוב כמו הסעיף הקודם בגלל שיש לנו טור הנדסי
  $ sum_(m=0)^infinity ((z-z_0)/(w-z_0))^m = 1/(1-(z-z_0)/(w-z_0)) = (w-z_0)/(w-z) $
  כלומר
  $
    sum_(n=k+1)^infinity (z-z_0)^n/(w-z_0)^(n+1) = (z-z_0)^(k+1)/(w-z_0)^(k+1) dot.op (w-z_0)/(w-z) = (z-z_0)^(k+1)/((w-z)(w-z_0)^(k+1))
  $
  ובסך־הכל
  $ 1/(w-z) = sum_(n=0)^k (z-z_0)^n/(w-z_0)^(n+1) + (z-z_0)^(k+1)/((w-z)(w-z_0)^(k+1)) $
  אבל מהסעיף הקודם אם נפרק לסכום של הטור וסכום של השארית
  $ 1/(w-z) = (z-z_0)^(k+1)/((w-z)(w-z_0)^(k+1)) + sum_(n=0)^k (z-z_0)^n/(w-z_0)^(n+1) $
  נסמן תוצאה זו ב־$(star)$.\
  כעת, לכל $z in B_r (z_0)$ מנוסחת האינטגרל של קושי מתקיים
  $
    f(z) = 1/(2pi i) integral_gamma (f(w))/(w-z) dif w = 1/(2pi i) integral_gamma f(w) dot.op 1/(w-z) dif w =_((star)) 1/(2pi i) integral_gamma f(w) dot.op ((z-z_0)^(k+1)/((w-z)(w-z_0)^(k+1)) + sum_(n=0)^k (z-z_0)^n/(w-z_0)^(n+1)) dif w \
    =_"לינארית האינטגרל" 1/(2pi i) integral_gamma f(w) sum_(n=0)^k (z-z_0)^n/(w-z_0)^(n+1) dif w + 1/(2pi i) integral_gamma f(w) (z-z_0)^(k+1)/((w-z)(w-z_0)^(k+1)) dif w \
    =_("הוצאת קבועים" \ "והטור מתכנס במידה שווה" \ (star)"הסבר למטה ב־") sum_(n=0)^k (z-z_0)^n 1/(2pi i) integral_gamma (f(w))/(w-z_0)^(n+1) dif w + (z-z_0)^(k+1)/(2pi i) integral_gamma (f(w))/((w-z)(w-z_0)^(k+1)) dif w
  $
  אבל מנוסחת האינטגרל של קושי אודות הנגזרת אנחנו יודעים שמתקיים
  $ 1/(2pi i) integral_gamma (f(w))/(w-z_0)^(n+1) dif w = (f^(n) (z_0))/n! $
  אבל זה בידיוק המחובר הראשון בסכום לעיל וזה בידיוק הפולינום טיילור מסדר $k$, אבל זה בידיוק אומר שכל השאר זה השארית, כלומר
  $ R_k (z) = (z-z_0)^(k+1)/(2pi i) integral_gamma (f(w))/((w-z)(w-z_0)^(k+1)) dif w $
  $(star)$ נסביר למה הטור $sum_(n=0)^infinity (z-z_0)^n/(w-z_0)^(n+1)$ מתכנס במידה שווה לכל $w in gamma$: \
  יהי $z in B_R (z_0)$ ונגדיר $rho colon.eq abs(z-z_0)<r$ ולכל $w in gamma = partial B_r (z_0)$ מתקיים $abs(w-z_0)=r$, אז
  $ abs((z-z_0)^n/(w-z_0)^(n+1)) = abs(z-z_0)^n/abs(w-z_0)^(n+1) = rho^n/r^(n+1) = 1/r (rho/r)^n $
  אבל אם נגדיר
  $ M_n colon.eq 1/r (rho/r)^n $ מהיות $rho < r$ נקבל
  $ sum_(n=0)^infinity M_n = 1/r sum_(n=0)^infinity (rho/r)^n < infinity $
  אבל זה בידיוק אומר ממבחן ה־$M$ של ויירשטראס שהטור שלנו מתכנס ומתכנס בהחלט לכל $w in gamma$, כלומר
  $ sum_(n=0)^infinity (z-z_0)^n/(w-z_0)^(n+1) < infinity $
  אבל בגלל שהטור מתכנס בהחלט על $gamma$ אפשר לשנות סדר סכימה ואינטגרציה, כלומר המעבר שעשינו מקודם חוקי.
]

#subquestion()
נסיק כי
$ abs(R_k (z))<= abs(z-z_0)^(k+1)/(r-abs(z-z_0)r^k) dot.op max_(abs(w-z_0)=r) abs(f(w)) $

#proof[
  $
    abs(R_k (z)) & =_"סעיף קודם" abs((z-z_0)^(k+1)/(2pi i) integral_gamma (f(w))/((w-z)(w-z_0)^(k+1)) dif w) \
    & = abs(z-z_0)^(k+1)/(2pi) abs(integral_gamma (f(w))/((w-z)(w-z_0)^(k+1)) dif w) \
    & <=_("ML") abs(z-z_0)^(k+1)/(2pi) underbrace(L(gamma), L(gamma) = L(partial B_r (z_0))=2pi r) dot.op max_(w in gamma) abs((f(w))/((w-z)(w-z_0)^(k+1))) \
    & = abs(z-z_0)^(k+1) r dot.op max_(w in gamma) abs(f(w))/(abs(w-z) dot.op abs(w-z_0)^(k+1)) \
    & <=_((star)) (r dot.op max_(w in gamma) abs(f(w))/abs(w-z)) (abs(z-z_0)/r)^(k+1) \
    & <=_((star star)) (r/(r-abs(z-z_0)) dot.op max_(abs(w-z_0)=r) abs(f(w)))(abs(z-z_0)/r)^(k+1)
  $
  כאשר ML זו טענה 4.12 בסיכומי הרצאות של עדי ו־$(star)$ נובע מהיות
  $ abs(w-z_0)=r ==> abs(w-z_0)^(k+1)=r^(k+1) $
  ולכן
  $
    abs(z-z_0)^(k+1) r dot.op max_(w in gamma) abs(f(w))/(abs(w-z) dot.op abs(w-z_0)^(k+1))=abs(z-z_0)^(k+1) r max_(w in gamma) abs(f(w))/(abs(w-z)r^(k+1)) = abs(z-z_0)^(k+1)/r^k max_(w in gamma) abs(f(w))/abs(w-z)
  $
  אחרון חביב $(star star)$ נובע מהיות
  $
    abs(w-z)=abs((w-z_0)-(z-z_0))>=abs(abs(w-z_0)-abs(z-z_0)) ==>_(abs(w-z_0)=r) abs(w-z) >= r-abs(z-z_0) ==> 1/abs(w-z)<=1/(r-abs(z-z_0))
  $
  ולכן אי־השיוויון הנדרש מתקיים.
]
#question()
תהיי ${f_k}_(k=1)^infinity$ סדרת פונקציות שלמות. נסמן ב־$a_n^k$ את המקדם ה־$n$ בפיתוח הטיילור של הפונקציה $f_k$ סביב הראשית, כלומר $f_k = sum_(n=0)^infinity a_n^k z^n$.

#subquestion()
נוכיח שאם $f_k$ מתכנסות במידה שווה מקומית לפונקציה $f$ אז $a_n^k arrow.r a_n$ כאשר $f = sum_(n=0)^infinity a_n z^n$.

#proof[
  תזכורת לעצמי: התכנסות במידה שווה מקומית משמע לכל נקודה יש סביבה שבה $f_k$ מתכנסת במידה שווה ל־$f$, כלומר לכל $R>0$
  $ overline(B_R (0)) = {z bar abs(z)<=R} $
  אז $f_k arrow.r f$ במידה שווה על $overline(B_R (0))$.\
  מנוסחת האינטגרל של קושי, לכל $R>0$ מתקיים
  $
    a_n^k = 1/(2pi i) integral_(abs(z)=R) (f_k (z))/z^(n+1) dif z, wide a_n = 1/(2pi i) integral_(abs(z)=R) (f(z))/z^(n+1) dif z
  $
  ונתבונן
  $
    a_n^k - a_n =1/(2pi i) integral_(abs(z)=R) (f_k (z))/z^(n+1) dif z - 1/(2pi i) integral_(abs(z)=R) (f(z))/z^(n+1) dif z = 1/(2pi i) integral_(abs(z)=R) (f_k (z) - f(z))/z^(n+1) dif z
  $
  אבל $abs(z)=R$ זה תחום קומפקטי, כלומר לכל $epsilon>0$ קיים $K$ כך שלכל $K<k$ ולכל $w$ על העיגול $abs(z)=R$ מתקיים
  $ abs(f_k (w)-f(w))<epsilon $
  אבל מאי־שיוויון ML שראינו בהרצאה (טענה 4.12 בסיכומי ההרצאה של עדי)
  $
    abs(a_n^k - a_n) <= 1/(2pi) dot.op max_(abs(z)=R) abs((f_k (z)-f(z))/(z^(n+1))) dot.op (2 pi R) = 1/(2pi) dot.op 1/R^(n+1) max_(abs(z)=R) abs(f_k (z) - f(z)) dot.op (2pi R) = 1/R^n max_(abs(z)=R) abs(f_k (z) - f(z))
  $
  אבל $f_k arrow.r f$ במידה שווה מקומית על $abs(z)<=R$, כלומר
  $ max_(abs(z)=R) abs(f_k (z) - f(z)) stretch(arrow.r)_(k arrow.r infinity) 0 $
  ובפרט נובע מכך שלכל $n in NN union {0}$ מתקיים
  $ abs(a_n^k - a_n) stretch(arrow.r)_(k arrow.r infinity) 0 $
  אז מאי־שיוויון המשולש (האינטגרלי/ערך מוחלט)
  $ abs(a_n^k - a_n) <= 1/(2pi) integral_(abs(z) = R) abs(f_k (z) - f(z))/abs(z^(n+1)) dif z $
]

#subquestion()
נביא דוגמה נגדית: אם $a_n^k arrow.r a_n$ אז $f_k$ לא מתכנסת במידה שווה מקומית לפונקציה $f=sum_(n=0)^infinity a_n z^n$ בתחום שבו הטור $sum_(n=0)^infinity a_n z^n$ מתכנס.

#proof[
  נגדיר
  $ f_k (z) colon.eq k z^k $
  אז פיתוח טיילור סביב הראשית יהיה
  $ f_k (z) = sum_(n=0)^infinity a_n^k z^n $
  כאשר
  $ a_n^k = mycases(k, n=k, 0, n!=k) $
  כלומר לכל $k>n$ ממתקיים $a_n^k=0$ כלומר $a_n^k stretch(arrow.r)_(k arrow.r infinity) 0$ ולכל $n in NN$ מתקיים $a_n=0$, כלומר
  $ sum_(n=0)^infinity a_n z^n = 0 $
  נסתכל על
  $ K colon.eq {z bar abs(z)<=1} $
  זו קבוצה קומפקטית כי סגורה וחסומה אבל
  $ sup_(abs(z)<=1) abs(f_k (z)) = sup_(abs(z)<=1) k abs(z)^k = k $
  כלומר
  $ sup_(abs(z)<=1) abs(f_k (z) - 0) = k stretch(arrow.r)_(k arrow.r infinity) infinity $
  אז $f_k$ לא מתכנסת במידה שווה על $K$ או בצורה מקומית באף סביבה של הראשית ולכן זו סתירה.
]

#question()
במשפט היחידות השני הנחנו שקיימת סדרה $z_n$ המתכנסת לנקודה $z_0 in G$.\
נקבע האם חשוב שהנקודה $z_0$ היא פנימית, כלומר נקבע האם המשפט ננכון כאשר $z_n$ מתכנסת לנקודה על השפה.

#proof[
  נטען כי $z_0$ חייבת להיות נקודה פנימית: נסתכל על התחום $G$ שהוא החצי מישור העליון כאשר $re(z)>0$ ונגדיר
  $ f(z) = sin(1/z) $
  זו פונקציה הולומורפית בחצי מישור העליון ומתקיים
  $ f(z) = 0 <==> 1/z = n pi $
  כלומר הסדרה $(z_n)_(n=1)^infinity$ הנתונה על־ידי $z_n = 1/(n pi)$ מקיימת ש־$(z_n)_(n=1)^infinity subset.eq G$.\
  מצד שני, $z_0 = lim_(n arrow.r infinity) z_n = 0$ ולכל $n in NN$ מתקיים $f(z_n) = 0$ אבל $f eq.triple.not 0$!\
  זאת לא סתירה למשפט כי $0$ היא נקודה סינגולרית עיקרית (לא סליקה ולא קוטב) של $f$ ולכן $f$ לא ניתנת להמשכה אנליטית בה.
]
