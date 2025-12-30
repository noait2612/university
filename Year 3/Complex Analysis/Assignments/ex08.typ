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
  אז אם נבחר $abs(h)<delta$, לכל $w$ על הקטע $[z,z+h]$, $abs(w-z)<abs(h)$ ונקבל
  $
    abs(1/h integral_([z,z+h]) (f(w)-f(z)) dif w) <= 1/abs(h) dot.op epsilon dot.op L([z,z+h]) = (epsilon dot.op abs(h))/abs(h) = epsilon
  $
  כלומר כאשר $h arrow.r 0$ הגבול שואף ל־$0$, כלומר בידיוק מתקיים $F'(z)=f(z)$ לכל $z$ ולכן $F$ גזירה במובן המורכב.\
  בנוסף, $F$ היא גזירה במובן במובן המורכב בכל נקודה בכדור ולכן היא הולומורפית.
]

#question()

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
