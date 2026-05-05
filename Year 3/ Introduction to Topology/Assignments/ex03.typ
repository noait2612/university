#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: article_he.with(
  title: [ פתרון מטלה 03 --- מבוא לטופולוגיה, 80516 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#question()
יהיו $X,Y$ מרחבים טופולוגיים. אם $X$ ו־$Y$ הומיאמורפיים נסמן זאת ב־$X tilde.equiv Y$.

#subquestion()
תהיי $X$ קבוצה ויהי $(Y, tau_Y)$ מרחב טופולוגי.\
תהיי $f:X arrow Y$ פונקציה ו־$tau_X = f^*tau_Y$ הטופולוגיה המושרית על $X$ דרך $f$.\
יהי $(Z, tau_Z)$ מרחב טופולוגי נוסף ותהיי $g:(Z, tau_Z) arrow (X, f^*tau_Y)$ פונקציה.\
נוכיח ש־$g$ רציפה אם ורק אם $f compose g : (Z, tau_Z) arrow (Y, tau_Y)$ רציפה.

#proof[
  $<==$ \
  $==>$
]

#subquestion()
#proof[]

#subquestion()
#proof[

]

#question()
תהיי $(X, <=)$ קבוצת סדורה קווית ותהיי $tau = ordTopology(tau)$ טופולוגיית הסדר על $X$.\
נראה שהפונקציה $min:X times X arrow X$ הנתונה על־ידי
$ min(x_1, x_2) = mycases(x_1, x_1 <= x_2, x_2, x_2 <=x_1) $
רציפה.

#proof[
  נשים לב שהבסיס של $tau$ הוא אוסף כל הקטעים הפתוחים
  $ (a,b) = {x in X bar a<x<b} $
  נעזר בהנחייה ונגדיר
  $
    C_1 = {(x_1, x_2) in X times X bar x_1 <= x_2} \
    C_2 = {(x_1, x_2) in X times X bar x_2 <= x_1}
  $
  נראה ש־$C_1, C_2$ סגורות שמכסות את $X$.\
  בשביל זה נראה ש־$C_1$ סגורה כלומר ש־$C_1^c = {(x_1, x_2) bar x_1 > x_2}$ היא איחוד כל המלבנים הפתוחים מהצורה
  + $(x,infinity) times (-infinity, x)$ עבור $x in X$
  + $(x,infinity) times (-infinity,y)$ עבור $x, y in X$ עם $x<y$ ושאין $z in X$ המקיים $x<z<y$
  יהי $(x_1, x_2) in C_1^c$ כלומר $x_1 > x_2$, אנחנו רוצים מלבן פתוח $U times V$ כך שמתקיים
  $ (x_1, x_2) in U times V subset.eq {(y_1, y_2) bar y_1 > y_2} $
  נחלק לשני מקרים
  + אם קיים $x_1 > z > x_2$ אז נוכל להגדיר $U=(z,infinity), V = (-infinity, z)$ ונקבל $x_1 in U, x_2 in V$.\
    לכל $(y_1, y_2) in U times V$ מתקיים $y_1 > z$ וגם $z>y_2$ ולכן מטרנזטיביות $y_1 > y_2$ ו־$U times V subset.eq C_1^c$
  + אם לא קיים $z$ כך ש־$x_1 > z > x_2$ אז נגדיר $U=(x_2, infinity), V = (-infinity, x_1)$ ונקבל $x_1 in U, x_2 in V$.\
    מההנחה, לכל $(y_1, y_2) in U times V$ מתקיים ש־$y_1 in (x_2, infinity)$ כלומר $y_1 > x_2$ ומההנחה שלנו מכיוון שאין $z$ בין ל־$x_1, x_2$ נובע כי $y_1 >= x_2$ ומהלך זהה נקבל גם$y_2 < x_2$ ובסך־הכל $y_1 >= x_1 > x_2 >= y_2$ ולכן מטרנזטיביות $y_1 > y_2$ כלומר $U times V subset.eq C_1^c$.
  אז $C_1^c$ היא איחוד כל המלבנים הפתוחים ואיחוד של פתוחות הוא פתוח ולכן $C_1^c$ פתוחה ו־$C_1$ היא קבוצה סגורה וממהלך זהה נקבל שגם $C_2$ סגורה.\
  נשאר להראות ש־$C_1, C_2$ מכסות את $X$ ולכן נשתמש בהדבקה סגורה: \
  מהגדרת הסדר הקווי נובע שלכל זוג מתקיים $x_1 <= x_2$ או $x_2 <= x_2$ ולכן $X times X = C_1 union C_2$ וזה לא איחוד זר כי $C_1 inter C_2 = {(x_1, x_2) bar x_1 = x_2}$.\
  נגדיר $f_1 : C_1 arrow X, f_2 : C_2 arrow X$ על־ידי
  $ f_1 (x_1, x_2) = x_1 wide f_2 (x_1, x_2) = x_2 $
  במילים אחרות $f_1, f_2$  הן פונקציות ההטלה ולכן הן פונקציות רציפות ובפרט עבור כל $x_1 in C_1 inter C_2$ מתקיים ש־$f_1, f_2$ מזדהות.\
  נשים לב ש־$min(x, y)|_(C_2) = f_2$ וכן $min(x, y)|_(C_1) = f_1$ ולכן מהדבקה סגורה נובע ש־$min(x, y)$ רציפה על כל המרחב.
]

#question()
#subquestion()
נראה שאם $X_1 tilde.equiv Y_1$ ו־$X_2 tilde.equiv Y_2$ אזי $X_1 times X_2 tilde.equiv Y_1 times Y_2$.

#proof[
  מכך ש־$X_1 tilde.equiv Y_1$ אז קיימת $f:X_1 arrow Y_1$ שהיא הומיאומורפיזם כלומר חד־חד ערכית, על ורציפה עם $f^(-1)$ רציפה ובאופן דומה גם קיימת \
  $g:X_2 arrow Y_2$ שהיא הומיאומורפיזם.\
  נגדיר $h: X_1 times X_2 arrow Y_1 times Y_2$ על־ידי $h(x_1,x_2) = (f(x_1), g(x_2))$ ונראה פורמלית ש־$h$ אכן הומיאומורפיזם:
  + חד־חד ערכיות:
    $
      h(x_1, x_2) = h(x^prime_1 x^prime_2) <==> (f(x_1), g(x_2)) = (f(x^prime_1), g(x^prime_2)) <==> f(x_1) = f(x^prime_1) and g(x_2) = g(x^prime_2)
    $
    אבל $f,g$ חד־חד ערכיות ולכן $x_1 = x^prime_1, x_2 = x^prime_2$.
  + על:
    יהי $(y_1, y_2) in Y_1 times Y_2$ ומכך ש־$f,g$ הן על קיימים $x_1 in X_1, x_2 in X_2$ כך ש־$y_1 = f(x_1), y_2 = g(x_2)$ ולכן $h(x_1, x_2) = (y_1,y_2)$
  + רציפות: ראינו שבמכפלה של מרחבים טופולוגיים העתקה היא רציפה אם בכל קורדינאטה שלה היא רציפה ואכן $f,g$ רציפות
  + הופכית רציפה
    $ h^(-1)(y_1, y_2) = (f^(-1)(y_1), g^(-1)(y_2)) $
    וזאת רציפה באותו אופן בכל קורדינאטה כי $f^(-1), g^(-1)$ רציפות.
  אז $h$ היא הומיאומורפיזם ו־$X_1 times X_2 tilde.equiv Y_1 times Y_2$.
]

#subquestion()
ניתן דוגמה מרחבים $X,Y$ ולפונקציה $f:X arrow Y$ רציפה, חד־חד ערכית ועל אבל כך ש־$f^(-1)$ לא רציפה.

#proof[
  ניקח $X=[0,1)$ ו־$Y=S^1 subset.eq RR^2$ ונגדיר $f:[0,1) arrow RR^2$ על־ידי $f(t)=(cos(2pi t), sin(2pi t))$ והיא רציפה בכל קורדינאטה ולכן $f$ רציפה.\
  בנוסף, מכך ש־$t in [0,1)$ נובע מהגדרת מעגל היחידה ש־$f$ היא פונקציה על והיא חד־חד ערכית מהמחזוריות של $cos(2pi t), sin(2pi t)$ בקטע זה.\
  נשים לב ש־$f^(-1)$ לא רציפה בנקודה $(1,0)$ שכן אם נתקרב אליה על המעגל מצד אחד $t arrow 0$ ומצד שני $t arrow 1$ ו־$1 in.not [0,1)$.
]

#question()

#question()

#question()
נוכיח ש־${(x,y) in RR^2 bar x^2+y^2<=1} tilde.equiv {(x,y) in RR^2 bar max(abs(x), abs(y))<=1}$
כאשר הטופולוגיה על כל אחת מהקבוצות היא הטופולוגיה המושרית מ־$RR^2$.

#proof[
  עלינו למצוא פונקציה שהיא הומיאומורפיזם.\
  נגדיר
  $
    D = {(x,y) in RR^2 bar x^2+y^2<=1} \
    S = {(x,y) in RR^2 bar max{abs(x), abs(y)}<=1}
  $
  כאשר $D$ דיסק היחידה הסגור ו־$D$ ריבוע היחידה הסגור, אנחנו צריכים לבנות $f:D arrow S$ שהיא הומיאומורפיזם, כלומר $f$ צריכה לשמור את המרחק של נקודה מהראשית פר כל נורמה ובפרט שתשמור על זווית.\
  ניקח $v=(x,y) in RR^2$ ו־$norm(v)_2=sqrt(x^2+y^2)$ כלומר
  $ D = {v in RR^2 bar norm(v)_2 <=1} $
  ו־$norm(v)_infinity = max(abs(x), abs(y))$ כלומר
  $ S={v in RR^2 bar norm(v)_infinity <=1} $
  טבעי להגדיר אם־כך
  $ f(v)= mycases(norm(v)_2 / norm(v)_infinity v, v!= (0,0), (0,0), v = (0,0)) $
  היא מוגדרת היטב: לכל $v!=(0,0) in D$ מתקיים $norm(v)_2 <=1$ ואכן
  $
    (star) space norm(f(v))_infinity = norm(norm(v)_2 / norm(v)_infinity v)_infinity = norm(v)_2 / norm(v)_infinity norm(v)_infinity = norm(v)_2
  $
  כלומר $f(v) in S$.\
  כדי להראות שהיא חד־חד ערכית ועל, נגדיר את ההופכית שלה ישירות $g:S arrow D$ על־ידי
  $ g(w) = mycases(norm(v)_infinity / norm(v)_2 w, w!= (0,0), (0,0), w = (0,0)) $
  כדי להראות שהיא הופכית צריך להראות ש־$g(f(v))=v$ לכל $v!=(0,0)$ ו־$f(g(w))=w$ לכל $w!=(0,0)$ (בראשית זה טריוויאלי).\
  נסמן $w=f(v)=norm(v)_2 / norm(v)_infinity v$ ומ־$(star)$ נובע ש־$norm(w)_infinity = norm(v)_2$  אז רק נשאר לחשב את $norm(w)_2$
  $
    norm(w)_2 = norm(norm(v)_2 / norm(v)_infinity v)_2 = norm(v)_2 / norm(v)_infinity norm(v)_2 = norm(v)_2^2 / norm(v)_infinity
  $
  אז
  $
    g(w)=norm(w)_infinity / norm(w)_2 w = norm(v)_2 / (norm(v)_2^2 / norm(v)_infinity) (norm(v)_2 / norm(v)_infinity v) = (norm(v)_2 norm(v)_infinity)/norm(v)_2^2 norm(v)_2 / norm(v)_infinity v = v
  $
  כלומר אכן $g(f(v))=v$ ומהסימטרייה של ההגדרות שלנו נקבל שגם $f(g(w))=w$ ולכן $f$ היא העתקה חד־חד ערכית ועל ו־$g=f^(-1)$.\
  נוכיח רציפות עבור $f$, הרציפות עבור $g$ זהה: ברור שעבור $v!=(0,0)$ יש לנו רציפות כי העתקות הנורמות הן רציפות ולכן גם מנה שלהן רציפה וגם כפל בסקלר הוא רציף ולכן $f$ רציפה על $D without {(0,0)}$.\
  נשאר להראות רציפות בראשית: מ־$(star)$ מתקיים $norm(f(v))_infinity = norm(v)_2$ לכל $v != (0,0)$ אז כאשר $v arrow (0,0)$ גם $norm(v)_2 arrow 0$ כלומר $norm(f(v))_infinity arrow 0$ כלומר $f(v) arrow (0,0)$ ולכן $f$ רציפה בראשית.\
  אז $f$ רציפה, חד־חד ערכית ועל עם הופכית רציפה ולכן היא הומיאומורפיזם ונקבל ש־${(x,y) in RR^2 bar x^2+y^2<=1} tilde.equiv {(x,y) in RR^2 bar max(abs(x), abs(y))<=1}$
]
