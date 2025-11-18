#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 03 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#let diam = math.op("diam")

#question()
נראה כי ההעתקה $z mapsto ((1+z)/(1-z))^2$ ו־$z mapsto i (1-z^2)/(1+z^2)$ ממפות את החצי העליון של הדיסק לחצי מישור העליון.

#proof[
  קודם כל נכתוב מפורשות את התחומים הנדרשים
  $ DD^plus = {z in CC bar abs(z)<=1 "and" im(z)>=0}, space H^plus = {w in CC bar im(w)>0} $
  השפה של $DD^plus$ הם כל ה־$z in CC$ המקיימים $abs(z)=1$ או $im(z)=0$, נצטרך לכתוב את $partial DD^plus$ מפורשות ולכן ננתח את התנאים האלו, כלומר נרצה לכתוב פרמטריזציה של $z=e^(i theta)$ ולמצוא תנאים מגבילים על $theta$.\
  התנאי $abs(z)=1$ עם $im(z)>=0$ אומר כי $abs(e^(i theta)) = 1$ ולכן $e^(i theta)=1$ או $e^(i theta)=-1$ ואנחנו יודעים שתנאים אלו מתקיימים אם $0<theta<pi$.\
  כמו־כן, עם נוסחת אויילר ניתן לראות כי מתקיים $im(z)>=0$:
  $
    z = e^(i 0) = cos(0) + i sin(0) = 1 ==> im(z)=0, \
    z = e^(i pi) = cos(pi) + i sin(pi) = -1 + 0 = -1 ==> im(z)=0, \
    z = e^(i pi/2) = cos(pi/2) + i sin(pi/2) = 0 + i ==> im(z)=1
  $
  התנאי $abs(z)<=1$ עם $im(z)=0$ זו בעצם פונקציה לינארית ממשית עם $z=x$ עבור $-1<=x<=1$.\
  נסמן את התנאי $abs(z)=1 and im(z)>=0$ ב־$A$ ואת התנאי $abs(z)<=1 and im(z)=0$ ב־$B$.\
  נסמן את ההעתקה $z mapsto ((1+z)/(1-z))^2$ על־ידי $f(z)$ ונבחין שזו הרכבה של העתקת מוביוס עם הפונקציה של ההעלאה בריבוע.\
  נכתוב $w_1 = (1+z)/(1-z)$ עבור $z=e^(i theta)$  ונחשב בהתאם לשני המקרים שהגדרנו מקודם
  $
    w_1 = (1+z)/(1-z) = (1+e^(i theta))/(1-e^(i theta)) = (e^((i theta)/2)(e^(-(i theta)/2)+e^((i theta)/2)))/(e^((i theta)/2)(e^(-(i theta)/2)-e^((i theta)/2))) = (e^(-(i theta)/2)(e^((i theta)/2)+e^(-(i theta)/2)))/(e^(-(i theta)/2)(e^((i theta)/2)-e^(-(i theta)/2)))
  $
  נעדיף את הנוסחה השנייה שכן בתרגול שראינו שמתקיים
  $
    (e^(i z)-e^(-i z))/(2i) = sin(z), space (e^(i z)+e^(- i z))/(2i) = cos(z) ==> w_1 = (2cos(z/2))/(2 i sin(z/2))= cos(z/2)/(i sin(z/2))
  $
  תחת מקרה $A$, כמובן שהביטוי מוגדר היטב (אין חלוקה ב־$0$) וגם מתקיים ש־$re(w_1)=0$ כלומר $w_1$ הוא מהצורה $i b$ עבור $b in RR$.\
  כלומר, $w_1^2 = f(z) = -b^2$, כלומר כל הציר המדומה ממופה אל הציר הממשי השלילי.\
  תחת המקרה $B$, $-1<z<1$ ולכן $w_1 = (1+z)/(1-z) in RR^plus$ ולכן גם $w_1^2 = f(z) in RR^plus$ כלומר שוב מופנו לחלק הממשי רק שהפעם לחלק החיובי.\
  כלומר $partial DD$ ממופה על־ידי $f$ אל כל הישר הממשי.\
  נרצה לראות מה קורה בנקודות הפנימיות כדי לנתח לאן כל $DD$ נשלח. ניקח $z_0 = i/2$ ולכן
  $ f(z_0) = ((1+i/2)/(1-i/2))^2 = ((2+i)/(2-i))^2 = (2+i)^2/(2-i)^2 = (3+4i)/(3-4i) $
  לא עוזר לנו כל־כך, נחשב בדרך אחרת
  $ (2+i)/(2-i)=((2+i)(2+i))/((2-i)(2+i))=(3+4i)/5 = 3/5 + (4i)/5 ==> ((2+i)/(2-i))^2 = ((3+4i)/5)^2 = (-7+24i)/25 $
  אז $im(z) = 24/25 >=0$, ולכן ראינו שנקודה פנימית נשלחת ל־$H^plus$ ונטען שזה מספיק כדי להראות ש־$f$ ממפה את החצי העליון של הדיסק לחצי מישור העליון: $f$ רציפה כהרכבה של פונקציות רציפות. ניקח $z_0$ נקודה בחצי הדיסק העליון ונבנה מסילה אל $z_1$ בחצי הדיסק העליון ונניח\
  $w_0 = f(z_0)$ ממפה לחצי המישור העליון ונניח בשלילה ש־$w_1 = f(z_1)$ נשלחת לחצי המישור התחתון אז מרציפות $f$ עם המסילה הרציפה שיצרנו נקבל מסילה בין $w_0$ לבין $w_1$, אבל אז המסילה הזאת בהכרח עוברת בשפה כלומר יש $z_2$ כך ש־$f(z_2)$ היא נקודה על הציר הממשי והמקור שלה הוא נקודה פנימית בחצי הדיסק העליון אבל אמרנו שרק נקודות על השפה של החצי דיסק העליון יכולות לשלוח לציר הממשי, ו־$z_2$ היא פנימית אז זאת כמובן סתירה.\
  #colbreak()
  נשאר לעשות את אותו התהליך עבור ההעתקה $z mapsto i (1-z^2)/(1+z^2)$, נפרק אותה לשלוש העתקות שונות
  $ z mapsto_(T_1) z^2 =u mapsto_(T_2) (1-u)/(1+u) = w mapsto_(T_3) i w $
  כלומר שרשור העתקות החזקה, העתקת מוביוס ומכפלה ב־$i$.  ננתח כל העתקה בנפרד:\
  ההעתקה $T_1 (z) = z^2 = u$ לוקחת $z in DD^plus$ ושולחת אותו אל $DD$ דיסק היחידה המלא שכן אם $abs(z)<1$ אז $abs(z^2)<1$, כלומר נקודות פנימיות בחצי הדיסק העליון נשלחות לנקודות פנימיות בדיסק היחידה המלא ואם $z$ בשפה אז $u=e^(i 2 theta)$ מזהות דה־מואבר ולכן עבור $0<theta<pi$ אנחנו נשלחים למעגל היחידה ואם $-1<x<1$ אז אנחנו נשלחים לקטע $[0,1)$.\
  כלומר, ההעתקה $T_1$ שולחת את חצי הדיסק העליון אל דיסק היחידה.\
  נסתכל כעת על $T_2 (u) = (1-u)/(1+u)=w'$ זו בעצם שוב העתקת מוביוס.\
  אם נסתכל על הנקודות שעל מעגל היחידה (השפה של דיסק היחידה) אז $abs(u)=1$ולכן $u overline(u) = abs(u)=1$, ונשים לב שמתקיים
  $
    overline((1-u)/(1+u)) = (1-overline(u))/(1+overline(u)) = (1-1/u)/(1+1/u) = (u-1)/(u+1) ==> (u-1)/(u+1) = (-(1-u))/(1+u)
  $
  אז אם נסמן $w' = (1-u)/(1+u)$ קיבלנו שמתקיים $overline(w') = -w'$, וזה בהכרח אומר ש־$w'$ הוא מהצורה $w' = i b$ עבור $b in RR$, כלומר מעגל היחידה נשלח בידיוק אל הציר המדומה ובגלל ש־$re(w')=0$ זה נשלח לרביע הימני של חצי המישור העליון.\
  שוב מאותם טיעוני רציפות אם נסתכל על $u=0$  נשים לב שמ־$w'=1$ ינבע שנקודות פנימיות נשלחות לחצי המישור העליון כי $re(u)>0$, כלומר נשלח לרביע הימני בחצי המישור העליון.\
  נשארה ההעתקה האחרונה, $T_3 (w') = i w'=w$.\
  ניזכר שאם כופלים ב־$i$ מספר מרוכב אנחנו מסתובבים בפועל על הציר $90$ מעלות *נגד* כיוון השעון ולכן זה לוקח ערכים מהרבע הימני של החצי מישור העליון בו $re(w')>0$ אל החצי מישור העליון בו $im(w)>0$ ובנקודות קצה בהן $re(w')=0$ אנחנו נשלחים בידיוק לציר הממשי בו $im(w)=0$.\
  זה בידיוק אומר ש־$g$ גם שולחת את חצי הדיסק העליון לחצי המישור העליון.
]

#question()

#subquestion()
_תזכורת (זהות אויילר)_: לכל $z in CC$ מתקיים
$ e^(i z) = cos(z) + i sin(z) $
נוכיח שלכל $z= a + i b in CC$ מתקיים $e^z = e^a (cos b + i sin(b))$ ובפרט $e^z!=0$ לכל $z in CC$.

#proof[
  $ e^z = e^(a + i b) =_"סעיף ב'" e^a dot.op e^(i b) =_"זהות אויילר" e^a dot.op (cos(b)+ i b) $
  מהיות $e^a>0$ לכל $a in RR$  כפונקציה ממשית וחיובית, מתקיים גם
  $ abs(e^z) = abs(e^a dot.op e^(i b)) =_((star)) abs(e^a) dot.op abs(e^i b) =_((star star)) abs(e^a) dot.op 1 > 0 $
  כאשר $(star)$ זה תרגיל בסיכום של עדי: לכל $w_1,w_2 in CC$ מתקיים  $abs(w_1 dot.op w_2) = abs(w_1) dot.op abs(w_2)$.\
  וזה נכון בגלל שאם נכתוב $w_1 = x_1 + i y_1, w_2 = x_2 + i y_2$ אז
  $
    w_1 dot.op w_2 =(x_1 + i y_1) dot.op (x_2 + i y_2) = (x_1 x_2-y_1y_2) + i (x_1y_2+y_1x_2) ==> abs(w_1 dot.op w_2) = sqrt((x_1x_2-y_1y_2)^2+(x_1y_2+y_1x_2)^2)
    \ = sqrt(x_1^2x_2^2-2x_1x_2y_1y_2+y_1^2y_2^2+x_1^2y_2^2+2x_1y_2y_1x_2+y_1^2x_2^2)=sqrt(x_1^2x_2^2+y_1^2y_2^2+x_1^2y_2^2+y_1^2x_2^2)
  $
  מצד שני
  $
    abs(w_1) dot.op abs(w_2) = sqrt(x_1^2+y_1^2) dot.op sqrt(x_2^2+y_2^2) = sqrt((x_1^2+y_1^2)(x_2^2+y_2^2)) = sqrt(x_1^2x_2^2+x_1^2y_2^2+y_1^2x_2^2+y_1^2y_2^2)
  $
  וזה מסיים ו־ $(star star)$ נובע מהחישוב
  $
    abs(e^(i b)) = abs(cos(b) + i sin(b)) = sqrt((cos(b)+i sin(b)) dot.op overline(cos(b)+i sin(b)))=sqrt((cos(b)+i sin(b))((cos(b)-i sin(b)))) \
    = sqrt(cos^2(b)+sin^2(b))= sqrt(1)=1
  $
]

#subquestion()
נוכיח שלכל $z,w in CC$ מתקיים $e^(z+w) = e^z dot.op e^w$.

#proof[
  יהיו $z,w in CC$. ראינו $ e^z = sum_(n=0)^infinity z^n/n! $
  ולכן מצד אחד
  $
    e^z dot.op e^w = (sum_(n=0)^infinity z^n/n!) dot.op (sum_(j=0)^infinity w^j/j!)=_"מכפלת קושי לטורים אינסופיים" sum_(k=0)^infinity c_k
  $
  כאשר
  $
    c_k = sum_(l=0)^k z^l/l! dot.op w^(k-l)/(k-l)! = sum_(l=0)^k 1/k! dot.op k!/(l!(k-l)!) z^l dot.op w^(k-l) =_"הבינום של ניוטון" 1/k! sum_(l=0)^k binom(k, l) z^l dot.op w^(k-l)= (z+w)^k/k!
  $
  כלומר
  $ e^z dot.op e^w = sum_(k=0)^infinity c_k = sum_(k=0)^infinity (z+w)^k/k! =_"הגדרה" e^(z+w) $
]

#subquestion()
נוכיח שמתקיים $sin(z)=0<==> z in {k dot.op pi bar k in ZZ}$.

#proof[
  ראינו שעבור $z in CC$ מתקיים
  $ sin(z) = (e^(i z)-e^(- i z))/(2i) $
  אז
  $
    (e^(i z)-e^(- i z))/(2i) = 0 <==> e^(i z)-e^(-i z) = 0 <==> e^(i z) = e^(-i z) <==>_(w = e^(i z)) w = w^(-1) = 1/w <==> w^2 = 1
  $
  כלומר $w = plus.minus 1$.\
  בהרצאה ראינו שמתקיים $e^i z = 1 <==> i z = 2 pi i ZZ$ כלומר $z = 2 pi ZZ$ וכן ראינו $e^(i z) = -1 <==> i z = i pi + 2pi i ZZ$ כלומר $z = pi + 2 pi ZZ$.\
  במקרה אחד קיבלנו לכל כפולה זוגית של $pi$ עם $ZZ$ ובמקרה השני קיבלנו לכל כפולה אי־זוגית של $pi$ עם $ZZ$, במילים אחרות $ sin(z)=0 <==> z in {2pi k bar k in ZZ} union {(2k+1) pi bar k in ZZ }= {k pi bar k in ZZ} $
]

#subquestion()
יהיו $z,w in CC$ ונוכיח שמתקיים $cos(z+w)=cos(z) cos(w)- sin(z) sin(w)$.

#proof[
  ראינו
  $ cos(z) = (e^(i z)+e^(-i z))/2, space sin(z) = (e^(i z)-e^(-i z))/(2i) $
  ולכן
  $
    cos(z+w) = (e^(i (z+w))+e^(-i (z+w)))/2 = (e^(i z+i w)+e^(-i z-i w))/2 =_"סעיף ב'" (e^(i z) e^(i w)+e^(-i z)e^(-i w))/2
  $
  מצד שני יש לנו
  $
    cos(z) cos(w)- sin(z) sin(w) = (e^(i z)+e^(-i z))/2(e^(i w)+e^(-i w))/2 - (e^(i z)-e^(-i z))/(2i)(e^(i w)-e^(-i w))/(2i) = \
    (e^(i z)e^(i w)+e^(i z)e^(-i w)+e^(-i z)e^(i w)+e^(-i z)e^(-i w))/4 + (e^(i z)e^(i w)-e^(i z)e^(-i w)-e^(-i z)e^(i w)+e^(-i z)e^(-i w))/4
    \ =(e^(i z)e^(i w)+cancel(e^(i z)e^(-i w))+cancel(e^(-i z)e^(i w))+e^(-i z)e^(-i w)+e^(i z)e^(i w)-cancel(e^(i z)e^(-i w))-cancel(e^(-i z)e^(i w))+e^(-i z)e^(-i w))/4 \
    = (2e^(i z)e^(i w)+2e^(-i z)e^(-i w))/4 = (e^(i z)e^(i w)+e^(-i z)e^(-i w))/2
  $
  כאשר האחרון שווה ל־$cos(z+w)$ לפי מה שמצאנו.
]

#subquestion()
יהיו $z,w in CC$ ונוכיח שמתקיים $sin(z+w)=sin(z)cos(w)+cos(z)sin(w)$.

#proof[
  ראינו
  $ sin(z) = (e^(i z)-e^(-i z))/(2i) $
  ולכן
  $
    sin(z+w) = (e^(i (z+w))-e^(-i (z+w)))/(2i) = (e^(i z + i w)-e^(-i z - i w))/(2i)=_"סעיף ב'" (e^(i z)e^(i w)-e^(-i z)e^(- i w))/(2i)
  $
  #colbreak()
  מצד שני יש לנו
  $
    sin(z)cos(w)+cos(z)sin(w) = (e^(i z)-e^(-i z))/(2i) (e^(i w)+e^(-i w))/2+(e^(i z)+e^(-i z))/2 (e^(i w)-e^(-i w))/(2i) \
    = (e^(i z)e^(i w)+cancel(e^(i z)e^(-i w))-cancel(e^(-i z)e^(i w))-e^(-i z)e^(-i w)+e^(i z)e^(i w)-cancel(e^(i z)e^(-i w))+cancel(e^(-i z)e^(i w))-e^(-i z)e^(-i w))/(4i) \
    = (2e^(i z)e^(i w)-2e^(-i z)e^(-i w))/(4i) = (e^(i z)e^(i w)-e^(-i z)e^(-i w))/(2i)
  $
  כאשר האחרון שווה ל־$sin(z+w)$ לפי מה שמצאנו.
]

#question()
_תזכורת_:   ראינו בהרצאה שהבאים מתקיימים
$
  cos(z) = (e^(i z)+e^(-i z))/2, space sin(z) = (e^(i z)-e^(-i z))/(2i), space cosh(z) = cos(i z) = (e^z+e^(-z))/2, space sinh(z)=-i sin(i z) = (e^z-e^(- z))/2
$
#subquestion()
נניח $z=a + i b$ ונוכיח שמתקיים $cos(z)=cos(a)cosh(b)-i sin(a)sinh(b)$

#proof[
  ראינו בהרצאה שהבאים מתקיימים
  $
    cos(z) = (e^(i z)+e^(-i z))/2, space sin(z) = (e^(i z)-e^(-i z))/(2i), space cosh(z) = cos(i z) = (e^z+e^(-z))/2, space sinh(z)=-i sin(i z) = (e^z-e^(- z))/2
  $
  מתקיים
  $ cos(z)=cos(a+i b) =_"שאלה 2 סעיף ד'" cos(a) cos(i b)- sin(a) sin(i b) $
  אבל מהגדרת הפונקציות ההיפרבוליות מתקיים
  $ cos(i b) = cosh(b), space sin(i b) =i sinh(b) $
  ולכן
  $ cos(z)=cos(a) cos(i b)- sin(a) sin(i b)=cos(a)cosh(b)-i sin(a)sinh(b) $
]

#subquestion()
נניח $z=a+i b$ ונוכיח שמתקיים $sin(z)=sin(a)cosh(b)+i cos(a)sinh(b)$.

#proof[
  באופן דומה לסעיף הקודם
  $
    sin(z)=sin(a + i b) =_"שאלה 2 סעיף ה'" sin(a)cos(i b)+cos(a)sin(i b) =_(cos(i b)=cosh(b) \ sin(i z)=sinh(z)/(-i)) sin(a)cosh(b) + cos(a)sinh(b)/(-i)
  $
  נשים לב שמתקיים
  $ 1/(-i) = 1/(-i) dot.op i/i = i/((-i) dot.op i) = i/1 = i $
  ולכן
  $ sin(z)=sin(a + i b) = sin(a)cosh(b) + cos(a)sinh(b)/(-i) = sin(a)cosh(b) + i cos(a)sinh(b) $
]

#subquestion()
לכל $z in CC$ נוכיח שמתקיים $cosh^2(z)-sinh^2(z)=1$.

#proof[
  יהי $z in CC$, מתקיים
  $
    cosh^2(z) - sinh^2(z) = ((e^z+e^(-z))/2)^2- ((e^z-e^(- z))/2)^2 = (e^z e^z+2e^z e^(-z)+e^(-z)e^(-z)-e^z e^z + 2e^(-z)e^z-e^(-z)e^(-z))/4 \
    = e^(-z)e^z =_"שאלה 2 סעיף ב'" e^(-z+z) = e^0 = 1
  $
]

#subquestion()
יהי $z = a + i b$ ונוכיח שמתקיים $abs(cos(z))^2=cos^2(a)+sinh^2(b)$.

#proof[
  יהי $CC in.rev z=a+ i b$,  בסעיף א' ראינו שמתקיים
  $ cos(z)=cos(a)cosh(b)-i sin(a)sinh(b) $
  נשתמש בזה
  $
    abs(cos(z))^2 = abs(cos(a)cosh(b)-i sin(a)sinh(b))^2 = (cos(a)cosh(b)-i sin(a)sinh(b)) dot.op overline(cos(a)cosh(b)-i sin(a)sinh(b)) \
    = (cos(a)cosh(b)-i sin(a)sinh(b)) dot.op (cos(a)cosh(b)+i sin(a)sinh(b)) \
    = cos^2(a)cosh^2(b)+sin^2(a)sinh^2(b)
  $
  בסעיף הקודם ראינו שמתקיים $cosh^2(z)-sinh^2(z)=1$ ולכן
  $
    cos^2(a)cosh^2(b)+sin^2(a)sinh^2(b)=cos^2(a)(1+sinh^2(b))+sin^2(a)sinh^2(b) \
    = cos^2(a)+cos^2(a)sinh^2(b)+sin^2(a)sinh^2(a) = cos^2(a) + sinh^2(b)(cos^2(a)+sin^2(a)) \
    = cos^2(a) + sinh^2(b)
  $
  כאשר $cos^2(a)+sin^2(a)=1$ זו זהות ידועה אבל נוכיח אותה כמו בסעיף הקודם:
  $
    ((e^(i z)+e^(-i z))/2)^2+((e^(i z)-e^(-i z))/(2i))^2 = (e^(i z)e^(i z)+2e^(i z)e^(-i z)+e^(-i z)e^(-i z))/4 - (e^(i z)e^(i z)-2e^(i z)e^(-i z)+e^(-i z)e^(-i z))/4 \
    = (4e^(i z)e^(-i z))/4 = e^(i z)e^(-i z) =_"שאלה 2 סעיף ב'" = e^(i z - i z) = e^0 =1
  $
]

#subquestion()
יהי $z= a + i b$ ונוכיח שמתקיים $abs(sin(z))^2=sin^2(a)+sinh^2(b)$.

#proof[
  יהי $CC in.rev z=a+ i b$,  בסעיף ב' ראינו שמתקיים
  $ sin(z)=sin(a)cosh(b)+i cos(a)sinh(b) $
  נשתמש בזה ונפעל כמו בסעיף הקודם
  $
    abs(sin(z))^2 = abs(sin(a)cosh(b)+i cos(a)sinh(b))^2 = (sin(a)cosh(b)+i cos(a)sinh(b)) dot.op overline((sin(a)cosh(b)+i cos(a)sinh(b))) \
    (sin(a)cosh(b)+i cos(a)sinh(b)) dot.op (sin(a)cosh(b)-i cos(a)sinh(b)) = sin^2(a)cosh^2(b)+cos^2(a)sinh^2(b) \
    = sin^2(a)(1+sinh^2(b))+cos^2(a)sinh^2(b) = sin^2(a) + sin^2(a)sinh^2(b)+cos^2(a)sinh^2(b) \
    = sin^2(a) + sinh^2(b)(sin^2(a)+cos^2(a)) = sin^2(a) + sinh^2(b)
  $
]

#question()
#subquestion()
תהיי $gamma = {t e^(i (3pi)/4) bar t in [0,infinity)}$. נבנה ונתאר ענף של הארגומנט עבור $G = CC without gamma$.

#solution[
  נתחיל מלהוכיח טענה שמופיעה בסיכומי הרצאות של עדי: לכל $z,w$ מתקיים $Arg(z w) = (Arg(z) + Arg(w)) (mod 2pi)$: \
  נסמן $z=r_1e^(i theta_1), w=r_2e^(i theta_2)$ ולכן $z w = r_1 r_2 e^(i (theta_1+theta_2)$, מתקיים
  $
    Arg(z) = theta_1 + 2pi k space (k in ZZ) \
    Arg(w) = theta_2 + 2 pi k space (k in ZZ) \
    Arg(z w) = theta_1 + theta_2 + 2pi k space (k in ZZ)
  $
  כלומר
  $ Arg(z w) = theta_1 + theta_2 = Arg(z)+Arg(w) (mod 2pi) $
  כעת ניזכר בהגדרה של הענף שראינו בתרגול: אנחנו מגדירים ענף של ארגומנט להיות כל פונקציה $alpha(z)$ שרציפה מעל התחום שלנו ומקיימת שלכל $z$ בתחום מתקיים $alpha(z) in {Arg(z)+2pi dot.op k bar k in ZZ}$.\
  אנחנו יודעים שהארגומנט רציף ב־$CC without (-infinity, 0]$ וש־$Arg : CC without {0} arrow.r [-pi, pi)$.\
  בנתונים שלנו מתקיים ש"הרמנו" את החלק הלא רציף ב־$pi/4$ וזה עכשיו הישר שלנו של האי־רציפות שלנו ולכן אנחנו בפועל רוצים להזיז את הקו אי־הגדרה גם בפונקציית הארגומנט שלנו.\
  לכן נגדיר את הענף
  $ alpha(z) = Arg(z dot.op e^(-(pi i)/4)) +pi/4 $
  עשינו את ההזה מבפנים כדי לתקן את האי־רציפות וההוספה של ה־$pi/4$ נועדה כדי לתקן את הזווית (כדי לקבל את הזווית האמיתית ולא הערך המוזז).\
  מהטענה שהוכחנו לעיל, קיבלנו את התנאי השני של הענף ונשאר רק להראות רציפות:\
  אבל זה רציף כי הרכבנו פונקציה רציפה ($Arg$ רציף ב־$CC without (-infinity, 0]$) והזזה זו פעולה רציפה ולכן מהגדרה $alpha$ רציפה ב־$CC without e^(-(pi i)/4) (-infinity, 0]$.\
  תוסיפי ציור להמחשה.
  #todo
]

#subquestion()
יהי $0 in K subset CC$ חסומה עם $0 in.not partial K$.\
נבנה ענף של הארגומנט עבור $G=K-diam(K)={z-diam(K) bar z in K}$ כאשר $diam(K)=sup_(x,y in K) abs(x-y)$.

#solution[
  במילים אחרות, יש לנו צורה חסומה שאיננה כוללת את $0$ (כי הזזתי את הקוטר, ו־$0$ היה בפנים).\
  ניזכר שהארגומנט רציף על $CC without (-infinity, 0]$ ונטען שהפעם הארגומנט איננו רציף ב־$[0,infinity)$.\
  יהי $x in [0,infinity)$ ונראה ש־$x in.not G$: נשים לב שזה שקול ללהגיד
  $ x in.not G = K -diam(K) <==> x + diam(K) in.not K <==> forall x in [diam(K),infinity), x in.not K $
  ידוע כי $0 in K$ ולכן בהכרח $0+diam(K) in.not K$.\
  נניח בשלילה ש־$x in K$ ולכן $0, x in K$ ובפרט $x=abs(x-0)<=diam(K)$, אבל $diam(K)<=x$ ולכן $x=diam(K)$.\
  ידוע כי $0 in K^circle.small.stroked$ ולכן קיים $epsilon>0$ כך ש־$B(0, epsilon) subset.eq K$ ולכן $epsilon/2 in K$ כמספר מרוכב.\
  כעת, $epsilon/2, x in K$ ומטיעון דומה נקבל $x=diam(K)-epsilon$  וזו סתירה!\
  לכן $[0,infinity) inter G = emptyset$ ולכן מספיק שנמצא ענף לארגומנט בתחום $CC without [0,infinity)$.\
  אם נסתכל על זה על הצירים, זה כמו לזוז בזווית של $pi$, כלומר
  $ alpha(z)=Arg(-z)+pi $
  משיקולים של הסעיף הקודם נקבל שאכן $alpha$ ענף בתחום ולכן $alpha' = alpha harpoon.tr G$ ענף רציף של הארגומנט ב־$G$.
  #todo
]

#subquestion()
יהי $0 in K subset CC$ חסומה עם $0 in.not partial K$ ו־$theta in (-pi, pi]$. \
נבנה ענף של הארגומנט עבור $G_theta = K + e^(i theta) dot.op diam(K)$.

#solution[
  נראה שהפעם אם $x in e^(i theta)[0,infinity)$ אז $x in.not G$:\
  נשים לב שהטענה שקולה לטענה ש־$x e^(i theta) in.not e^(i theta) G$ אבל ככה נקבל $K$ כמו בסעיף ב' וכן $x e^(i theta) in [0,infinity)$ ולכן הטענה נובעת ונסיק שוב \
  ש־$G inter e^(i theta) [0,infinity) = emptyset$.\
  נשים לב שהפעם אנחנו מחפשים
  $ e^(pi i) mapsto e^(theta i) = e^(pi i - (pi-theta)i) = e^(pi i) dot.op e^(-(pi-theta)i) $
  כלומר
  $ alpha(z) = Arg(e^((theta-pi)i) z) + (pi-theta) $
  בהתאם לשיקולים בסעיפים הקודמים מצאנו ענף ובשל שיקולי הזזה $alpha$ רציף ב־$CC without e^(i theta)[0,infinity)$ אבל $G subset.eq CC without e^( i theta)[0,infinity)$ ולכן $alpha harpoon.tr G$ רציף וענף.
  #todo
]

#question()
#todo
