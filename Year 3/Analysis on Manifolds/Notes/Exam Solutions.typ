#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: thmbox-init()
#show: article_he.with(
  title: [ פתרון מבחני עבר --- אנליזה על יריעות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 3)

= מועד א' 2022
== שאלה 1
נחשב את האינטגרל המשטחי $integral.double_Sigma y^2 z dif sigma$
כאשר $Sigma$ המשטח הנתון על־ידי
$ Sigma = {(x,y,z) bar x = sqrt(3)y + frac(sqrt(5), 2)z^2, -1 <= y<= 1, 0<=z<=1} $

#solution[
  נשים לב ש־$x$ נתון פה בצורה סתומה ולכן לפי טענה שראינו אלמנט השטח נתון על־ידי
  $ dif S = sqrt(1+(x_y)^2 + (x_z)^2) dif y dif z = sqrt(4+5z^2) dif y dif z $
  ואז כל שנשאר זה לחשב את האינטגרל הכפול
  $
    integral.double_Sigma y^2 z dif sigma = integral_0^1 integral_(-1)^1 y^2 z sqrt(4+5z^2) dif y dif z = integral_0^1 z sqrt(4+5z^2) [frac(y^3, 3)]_(y=-1)^(y=1) dif z = frac(2, 3) integral_0^1 z sqrt(4+5z^2) dif z
  $
  עם שיטת החלפת משתנה נחשב
  $
    integral z sqrt(4+5z^2) dif z =_(u = 4+5z^2 \
    dif u = 10 z dif z) frac(1, 10) integral sqrt(u) dif u = frac(1, 10) integral u^(-frac(1, 2)) dif u = frac(1, 10) dot.op (frac(2, 3)) u^(frac(3, 2)) = frac(1, 15) (4+5z^2)^(frac(3, 2))
  $
  ואז
  $ integral.double_Sigma y^2 z dif sigma = frac(1, 15)(4+5)^(frac(3, 2)) - frac(1, 15) 4^(frac(3, 2)) $
]

== שאלה 2
נחשב את השטח הכלוא בתוך הצורה $infinity$ ששפתה מתוארת על־ידי המסילה
$ gamma(t) = (sin(t), sin(t) cos(t)) $
עבור $0<=t<=2pi$.

#solution[
  באופן טבעי התשובה תצא אפס אם נעשה את האינטגרל על כל המסילה כי הצורות מנוגדות ולכן יש אוריינטציה מנוגדת, אז מספיק לקחת רק את הקטע $t in [0,pi]$ עד שם זה מוגדר היטב ופשוט להכפיל ב־$2$.
  בתנאי משפט גרין ראינו את הטענה
  $
    Area(Omega) = integral_boundary(Omega) x dif y = - integral_boundary(Omega) y dif x = frac(1, 2) integral_boundary(Omega) x dif y - y dif x
  $
  נסמן $ x(t) = sin(t) \
  x^prime (t) = cos(t) \
  y(t) = sin(t) cos(t) \
  y^prime (t) = cos^2(t) - sin^2 (t) = (x^prime (t))^2 - x(t)^2 $
  אז מהנימוק לעיל נוותר על לחלק בחצי ונקבל
  $
    integral_boundary(Omega) x dif y - y dif x = integral_boundary(Omega) sin(t)(cos^2 (t)-sin^2 (t))-(sin(t)cos(t))cos(t) dif t = integral_boundary(Omega) -sin^3(t) dif t = integral_0^pi -sin^3 (t) dif t \
    = integral_0^pi (1-cos^2 (t)) sin(t) dif t =_(u = cos(t) \
    dif t = - sin(t) dif t) integral_(-1)^1 u^2-1 dif u = [frac(u^3, 3) - u]_(u=-1)^(u=1) = [frac(cos^3 (t), 3) - cos(t)]_(t=0)^(t=pi) = -frac(1, 3) + 1 - frac(1, 3) + 1 = 4/3
  $
]

#pagebreak()

== שאלה 3
נחשב את האינטגרל הקווי $integral_gamma arrow(F) arrow(dif l)$ של השדה
$ F(x,y) = (x^2 y + sin(x) + y sin(x y), frac(x^3, 3) + x sin(x y)) $
לאורך המסילה
$ gamma(t) = (t cos(t), t sin(t)) $
עבור $0<=t<=4pi$

#solution[
  ראשית התחום שלנו הוא תחום טוב (תחום מלא ללא חורים) ובתחום טוב משמר מקומית אם ורק אם משמר ואכן $F$ משמר מקומית שכן לכל $x$ מתקיים
  לו היה $F$ משמר אז הוא בפרט היה משמר מקומית אבל ניתן לראות
  $ x^2+ sin(x y) + x y cos(x y) = x^2 + sin(x y) + x y cos(x y) $
  מטענה שראינו נובע שמתקיים
  $ integral_gamma arrow(F) arrow(dif l) = phi(gamma(b))-phi(gamma(a)) $
  כאשר $phi$ היא פונקציית הפוטנציאל של $arrow(F)$ ובמקרה שלנו
  $
    phi(x, y) & = integral frac(x^3, 3) + x sin(x y) dif y = integral frac(x^3, 3) dif y + integral x sin(x y) dif y \
              & = frac(x^3 y, 3) + C_1 + integral x sin(x y) dif y \
              & =_((star)) frac(x^3 y, 3) + C_1 (x) + integral sin(u) dif u \
              & = frac(x^3 y, 3) + C_1 (x) - cos(x y) + C_2 (x) \
              & = frac(x^3 y, 3) - cos(x y) + C(x)
  $
  כאשר $(star)$ זו ההחלפת משתנה $(u = x y, space y = frac(u, x), space dif u = x dif y$
  נגזור
  $
    frac(partial, partial x) frac(x^3 y, 3) - cos(x y) + C (x) = x^2 y + y sin(x y) + C^prime (x) = x^2 y + y sin(x y) + C^prime (x)
  $
  וממה ש־$F$ נתונה נקבל ש־$C^prime (x) = sin(x)$ כלומר $C(x) = - cos(x)$ ולכן
  $ phi(x, y) = frac(x^3 y, 3) - cos(x y) - cos(x) + K $
  ואז במקרה שלנו
  $ gamma(4pi) = (4pi, 0), quad gamma(pi) = (-pi, 0) $
  ולכן
  $ integral_gamma arrow(F) arrow(dif l) = phi(gamma(b))-phi(gamma(a)) = 0 - 0 - cos(4pi) + cos(-pi) = -2 $
]

#pagebreak()

== שאלה 4
נחשב את השטף של השדה
$ arrow(F)(x,y,z) = (-y, x, z) $
דרך המשטח הסגור $Sigma$ כלפי חוץ כאשר
$ Sigma = {(x,y,z) bar x^2+y^2 = cos^2 (z), -frac(pi, 2) <= z<= frac(pi, 2)} $

#solution[
  שטף אומר ישר משפט הדיבירגנץ' ומתקיים $divergence arrow(F) = 1$.
  נשים לב ש־$Sigma$ סגור וחסומה (סגור כי נתון, חום כי $-frac(pi, 2) <= z <= frac(pi, 2)$ ו־$r=abs(cos(z))$ שחסום) אז ממשפט הדיבירגנץ'
  $
    integral.double_Sigma chevron.l F, hat(n) chevron.r dif S = integral.triple_V gradient F dif V = integral.triple_V 1 dif V = Vol(V)
  $
  אז אם נעבור לקורדינאטות גליליות, $-frac(pi, 2) <= z <= frac(pi, 2)$ ו־$r = sqrt(x^2+y^2)$ מקיים $0<=r<=abs(cos(z))$ נקבל (גם $theta in [0,2pi]$ כי אנחנו הולכים על כל הציר)
  $
    integral_0^(2pi) integral_(-frac(pi, 2))^frac(pi, 2) integral_0^abs(cos(z)) r dif r dif z dif theta = pi integral_(-frac(pi, 2))^frac(pi, 2) cos^2(z) dif z = frac(pi, 2) integral_(frac(-pi, 2))^frac(pi, 2) 1+cos(2z) dif z = frac(pi, 2)( [z]_(z=-frac(pi, 2))^(z=frac(pi, 2)) + [frac(sin(2z), 2)]_(z=-frac(pi, 2))^(frac(pi, 2))) = frac(pi^2, 2)
  $
]

== שאלה 5
נחשב את האינטגרל הקווי $integral.cont_gamma arrow(F) arrow(dif l)$ כאשר
$ arrow(F)(x, y,z) = (sin(e^x^2) + y z, x cos(y), x z^2) $
ו־$gamma$ היא המסילה המחברת בקטעים את הנקודות
$ (0,0,0) arrow (0,2,0) arrow (2,2,2) arrow (2,0,2) arrow (0,0,0) $

#solution[
  המסילה $gamma$ היא מסילה סגורה שמורכבת מקטעי קו ישר ולכן לפי משפט סטוקס האינטגרל הקווי על מסילה סגורה שווה לאינטגרל המשטחי של $Curl$ של השדה על־פני כל המשטח $S$ שהמסילה הזו היא השפה שלו, כלומר
  $ integral.cont_gamma arrow(F) arrow(dif l) = integral.double_S chevron.l Curl(F), hat(n) chevron.r dif s $
  נשים לב
  $ Curl(F) = (0-0,y-z^2, cos(y)-z) $
  נשים לב שמניתוח של הנקודות $z=x$ תמיד ואז $ r(u,v)=(u,v,u), 0<=u<=2, 0<=v<=2 $
  אנחנו צריכים אלמנט נפח, אז נחשב את
  $ norm(r_u times r_v) = norm((1,0,1) times (0,1,0)) = norm((-1, 0, 1)) = sqrt(2) $
  כדי להשתמש במשפט סטוקס נחשב
  $ chevron.l Curl(F), hat(n) chevron.r = cos(v)-u $
  ממשפט סטוקס נקבל
  $
    integral.cont_gamma arrow(F) arrow(dif l) = integral_0^2 integral_0^2 cos(v) - u dif u dif v = 2cos(v)-2 dif v = [2sin(v)-2v]_(v=0)^(v=2)= 2sin(2)-4
  $
]

#pagebreak()

== שאלה 6
תהיי $f(x,y)$ פונקציה שכל נגזורתיה מסדר $2$ רציפות ונגדיר
$
  gamma_1 (t) = (t,0) \
  gamma_2 (t) = (t, frac(t^2, 2)) \
  gamma_3 (t) = (sin(t), 1-cos(t))
$
נגדיר
$ g_j (t) = f(gamma_j (t)) $


=== סעיף א'

לכל $1<=i<j<=3$ נקבע אם בהכרח מתקיים $g_i^prime (0) = g_j^prime (0)$.

#proof[
  נחשב ראשית נגזרות של $gamma_i (t)$
  $
    dot(gamma)_1 (t) = (1,0), space dot.double(gamma)_1 (t) = (0,0) \
    dot(gamma)_2 (t) = (1,t), space dot.double(gamma)_2 (t) = (0,1) \
    dot(gamma)_3 (t) = (cos(t),sin(t)), space dot.double(gamma)_3 (t) = (-sin(t),cos(t)) \
  $
  וניזכר בכלל שרשרת
  $ D(g compose f)_p = (D g)_(f(p)) dot.op (D f)_p $
  נשים לב שלכל $i in [3]$ מתקיים $D gamma_j (0) = (1,0)$ וגם $gamma_j (0) = (0,0)$ ולכן מכלל שרשרת הטענה נובעת.
]

=== סעיף ב'
לכל $1<=i<j<=3$ נקבע אם בהכרח מתקיים $g_i^prime.double (0) = g_j^prime.double (0)$.

#proof[
  לא בהכרח כי
  $ dot.double(gamma)_3 (0) = (0, 1) != dot.double(gamma)_2 (0) = (0,1) != dot.double(gamma)_1 (0) = (0,0) $
  וגם מתקיים
  $ dot(gamma)_3 (0) = (1, 0), space dot(gamma)_2 (0) = (1,0) $
  ברור כי $g_1^prime.double (0) = 0_V$ אז מספיק שההרכבה לא קבועה אפס וכבר נוכל לקבל סתירה.\
  אז אין הכרח.
]

= מועד ב' 2022
== שאלה 1
נחשב את השטח של המשטח $ r(theta, phi) = (cos(phi)sin(theta), sin(phi)sin(theta), cos(theta)) \
0<=theta<=2pi, quad 0<=phi<=frac(theta, 2) $

#solution[
  בקבוצה אמרו שצריך לשנות את התחום אבל אני אתעלם מזה.
  נחשב
  $
    r_phi = (-sin(phi)sin(theta), cos(phi)sin(theta),0 ) \
    r_theta = (cos(phi)cos(theta), sin(phi)cos(theta), -sin(theta))
  $
  אנחנו צריכים אלמנט נפח אז נחשב
  $
    norm(r_theta times r_phi) &= norm((sin^2(theta)cos(phi), sin^2(theta)sin(phi), cos^2(phi)sin(theta)cos(theta)+sin^2(phi)cos(theta)sin(theta))) \
    &=_((star))norm((sin^2(theta)cos(phi), sin^2(theta)sin(phi), sin(theta)cos(theta))) \
    &= sqrt(sin^4(theta)cos^2(phi)+sin^4(theta)sin^2(phi)+sin^2(theta)cos^2(theta)) \
    &=_((star star)) sqrt(sin^4(theta)(cos^2(phi)+sin^2(phi)) + sin^2(theta)cos^2(theta)) \
    &= sqrt(sin^2(theta)(sin^2(theta)+cos^2(theta))) \
    &=_((star star)) abs(sin(theta))
  $
  כאשר $(star)$ זה כי $ cos^2(phi)sin(theta)cos(theta)+sin^2(phi)cos(theta)sin(theta) =
  cos(theta)sin(theta)(underbrace(cos^2(phi) + sin^2(phi), =1)) = cos(theta)sin(theta) $
  ו־$(star star)$ מאותו השיקול ולבסוף
  $ dif S = abs(sin(theta)) dif theta dif phi $
  אם נוותר על הערך המוחלט אז הכל יתקזז מה שלא בא לנו (או שבאמת צדקו בקבוצה) אז לא נוותר על הערך המוחלט ונשאר לחשב
  $
    A = integral_0^(2pi) integral_0^frac(theta, 2) abs(sin(theta)) dif phi dif theta = integral_0^(2pi) abs(sin(theta)) frac(theta, 2) dif theta = integral_0^pi frac(theta, 2) sin(theta) dif theta - integral_pi^(2pi) frac(theta, 2) sin(theta) dif theta
  $
  מאינטגרציה בחלקים נקבל
  $ integral theta sin(theta) dif theta = sin(theta)-theta cos(theta) $
  ולכן
  $
    A = 1/2([sin(theta)-theta cos(theta)]_(theta=0)^(theta=pi)-[sin(theta)-theta cos(theta)]_(theta=pi)^(theta=2pi)) = 2pi
  $
]

== שאלה 2
נחשב  את האינטגרל הקווי $integral_gamma arrow(F) arrow(dif l)$ כאשר
$ arrow(F)(x,y) = (e^(sin(y)), x e^(sin(y)) cos(y) + 6x) $
ו־$gamma$ המסילה המחברת בין $(0,0)$ לבין $(1,0)$ על־ידי המסלול הבא: מהראשית הולכים ל־$(0,1)$ ואז ל־$(1,1)$ ואז יורדים ל־$(-1,0 )$ והולכים על הגרף של מעגל היחידה עד $(1,0)$ (כלומר על $x^2+y^2=1$)

#solution[
  נסמן $P=e^(sin(y)), Q = x e^(sin(y)) cos(y) + 6x$ ומתקיים
  $
    frac(partial P, partial y) = cos(y) e^(sin(y)) \
    frac(partial Q, partial x) = e^(sin(y)) cos(y) + 6
  $
  אז זה לא שדה משמר, ואי אפשר להשתמש במשפט סטוקס כי זו לא מסילה  סגורה ולכן גם לא במשפט גרין.\
  אבל נניח שהמסילה הייתה סגורה, אז היה אפשר להשתמש במשפט גרין וממה שמצאנו לעיל
  $ frac(partial Q, partial x) - frac(partial P, partial y) = 6 $
  ולכן ממשפט גרין בהתאמה למסילות נקבל
  $
    integral_gamma P dif x + Q dif y = integral_gamma frac(partial Q, partial x) - frac(partial P, partial y) dif x dif y = integral.double_D 6 dif x dif y = 6 Area(D)
  $
  נניח ואנחנו סוגרים את המסילה ללולאה סגורה בזה שאנחנו מחברים בין $(1,0)$ לראשית עם קו ישר לראשית אז $D$ היה ריבוע היחידה וחצי עיגול היחידה ואז
  $ Area(D)= 1 dot.op 1 + frac(pi, 2) $
  כלומר
  $ integral_gamma P dif x + Q dif y = 6 Area(D) = 6 + 3pi $
  אז בעצם
  $ integral_gamma + integral_gamma_"extra" = 6 + 3pi $
  אז רק נוריד את האינטגרל שהוספנו.\
  על ציר ה־$x$ מתקיים $y=0$ ולכן $dif y =0$ ועל ציר ה־$x$ מתקיים
  $
    P(x,0) = e^(sin(0)) = e^0 = 1 \
    Q(x,0) = 6x
  $
  ואז
  $ integral_gamma_"extra" P dif x + Q dif y = integral_1^0 1 dif x = -1 $
  אז
  $ integral_gamma = 6 + 3pi - integral_gamma_"extra" = 7 + 3pi $
]

== שאלה 3
יהי $arrow(F)(x,y) = (y^2-y, (x^3-x)cos(y^2))$ ויש את $gamma$ המסילה שמקיפה את ריבוע היחידה.\

=== סעיף א'
נחשב את $integral.cont_gamma arrow(F) arrow(dif l)$.

#solution[
  נסמן $P = y^2-y, Q = (x^3-x)cos(y^2)$ ונרצה להשתמש במשפט גרין
  $
    integral_boundary(Omega) arrow(F) arrow(dif l) = integral_Omega frac(partial Q, partial x) - frac(partial P, partial y) dif x dif y = integral_Omega (3x^2-1)cos(y^2)-2y + 1 dif x dif y
  $
  מלינאריות האינטגרל יש פה שני אינטגרלים כפולים שמחישוב זריז מפיקים 0.
]

=== סעיף ב'
נקבע האם $arrow(F)$ שדה משמר ב־$RR^2$.

#solution[
  $RR^2$ הוא תחום טוב ולכן הוא משמר אם ורק אם הוא משמר מקומית אז
  $ frac(partial P, partial y) = 2y - 1 != (3x^2-1)cos(y^2) = frac(partial Q, partial x) $
  אז לא משמר מקומית ובטח שלא משמר.
]

#pagebreak()

== שאלה 4
יהיו
$
  Sigma = {(x,y,z) bar x^2+y^2+z^2 = 1 , z>=sqrt(x^2+y^2)} \
  arrow(F)(x,y,z) = (frac(x^2, 2)+x y - 4x z + cos(z), -frac(y^2, 2) - x y + x^2 + z^3, 2z^2 + x)
$

נחשב את השטף של $arrow(F)$ דרך $Sigma$ כלפי מעלה.

#solution[
  ראשית אי־אפשר להשתמש ישירות במשפט הדיבירגנץ' כי $Sigma$ לא סגורה וחסומה ומתקיים $divergence F = 0$ ונשים לב ש־$Sigma$ לא סגורה.\
  אם נשווה בין שתי המשוואות השפה של המשטח תהיה
  $ z= sqrt(x^2+y^2) ==> z^2 = x^2+y^2 ==> z^2 + x^2+y^2 = 1 <==> 2z^2 = 1 <==> z = frac(1, sqrt(2)) $
  לקחנו שורש חיובי כי מדובר בגובה ולכן השפה היא מעגל ברדיוס $r=frac(1, sqrt(2))$ ובגובה $z=frac(1, sqrt(2))$ ולכן ניתן לחסום עם זה את $Sigma$ כי אם נגדיר
  $ D={(x,y,z) bar x^2+y^2 <=1 frac(1, 2), z = frac(1, sqrt(2))} $
  אז $Sigma union D$ כולא בתוכו את הנפח שאנחנו רוצים ואז ממשפט הדיבירגנץ'
  $
    integral.double_(Sigma union D) chevron.l F, hat(n) chevron.r dif sigma = integral.triple_V divergence F dif V = integral.triple_V 0 dif V = 0 ==>
    integral.double_Sigma chevron.l F, hat(n) chevron.r dif sigma = - integral.double_D chevron.l F, hat(n) chevron.r dif sigma
  $
  הנורמל שמצביע החוצה מהנפח $V$ הוא $hat(n)_D = (0,0,1)$ ואז
  $
    integral.double_D chevron.l F, (0, 0, 1) chevron.r dif sigma = integral.double_D (2z^2+x) dif S =_(z = frac(1, sqrt(2))) integral.double_D 1 dif S + integral.double_D x dif S
  $
  אבל $D$ סימטרית לחלוטין סביב ציר ה־$y$ ולכן האינטגרל של $x$ עליה מתאפס ולכן
  $ integral.double_D 1 dif S = Area(D) = pi r^2 = frac(pi, 2) $
  ולכן
  $ integral.double_Sigma chevron.l F, hat(n) chevron.r dif sigma = -frac(pi, 2) $
]

== שאלה 5
נחשב את האינטגרל הקווי $integral.cont_gamma arrow(F) arrow(dif l)$ כאשר
$ arrow(F) (x,y,z) = (y,-2z,4x) $
ו־$gamma$ הוא מעגל ברדיוס $2$ המוכל במישור $x+2y+3z=4$ ומגמתו בכיוון השעון כאשר מביטים מלמעלה.

#solution[
  ראשית חישוב מניב $Curl F = (2,-4,1)$.\
  וקטור הכיוון של המישור שעליו $gamma$ נמצאת הוא $(1,2,3)$ ולכן הוקטור הנורמל ליחידה פה הוא $ frac((1,2,3), sqrt(1^2+2^2+3^2)) = frac((1,2,3), sqrt(14)) $
  אנחנו צריכים את הנורמל כלפי מטה (כלל יד ימין) ולכן בעצם
  $ hat(n) = frac((-1,-2,-3), sqrt(14)) $
  ממשפט סטוקס
  $
    integral.cont_gamma arrow(F) arrow(dif l) = integral.double_S chevron.l Curl F, hat(n) chevron.r dif s = integral.double_S frac(9, sqrt(14)) dif S = frac(9, sqrt(14)) Area(S) =_((star)) frac(36pi, sqrt(14))
  $
  $(star)$ זה כי $S$ הוא מעגל ברדיוס $2$ ולכן $Area(S) = pi r^2 = 4pi$.
]

= מועד ב' 2023
== שאלה 1
=== סעיף א'
נגדיר את המושג יריעה חלקה $k$־מימדית.

#solution[
  כזכור, יש $3$ הגדרות
  + כקבוצת האפסים של פונקציה – נגיד ש־$M subset.eq RR^n$ היא יריעה חלקה $k$־מימדית אם לכל $p in M$ קיימת סביבה (פתוחה) $p in W subset.eq RR^n$ ו־$F: U arrow RR^(n-k)$ חלקה המקיימת
    + $D F$ מדרגה מלאה
    + $M inter W = {x in W bar F(x) = 0}$
  + כגרף של פונקציה – נגיד ש־$M subset.eq RR^n$ היא יריעה חלקה $k$־מימדית אם לכל $p in M$ קיימת $p in W subset.eq RR^n$ סביבה פתוחה, $U subset.eq RR^k$ פתוחה ו־$f in C^r (U, RR^(n-k))$ כך שמתקיים $W inter M = Gamma(f)$
  + על־ידי פרמטריזציה – נגיד ש־$M subset.eq RR^n$ היא יריעה חלקה $k$־מימדית אם לכל $p in M$ קיימת $p in W$ סביבה פתוחה, $U subset.eq RR^k$ פתוחה ו־$phi:U arrow RR^n$ המקיימת
    + $D phi$ מדרגה מלאה
    + $phi(U) = W inter M$
    + $phi :U arrow W inter M$ הוא הומיאומורפיזם
]

=== סעיף ב'
נוכיח בעזרת אחת ההגדרות לעיל שהקבוצה הבאה היא יריעה חלקה
$ M = {(x,y,z) in RR^3 bar x sin(z) = y cos(z), x + y + z =2} $

#solution[
  נראה לפי ההגדרה של קבוצת האפסים של פונקציה (נראה לי זה הכי קל פה) כאשר $F:RR^3 arrow RR^2$ נתונה על־ידי
  $ F(x,y,z) = (x sin(z)-y cos(z), x+y+z-2) $
  ברור כי היא חלקה כי היא פולינומים / פולינומים טריגונומטריים והתנאי השני מתקיים ישירות כאשר בוחרים את $W=RR^3$ בצורה די ודאית אז רק נשאר להראות שהדיפרנציאל מדרגה מלאה
  $
    D F_((x,y,z)) = mat(frac(partial F_1, partial x), frac(partial F_1, partial y), frac(partial F_1, partial z); frac(partial F_2, partial x), frac(partial F_2, partial y), frac(partial F_2, partial z)) = mat(sin(z), -cos(z), x cos(z)+y cos(z); 1, 1, 1)
  $
  כדי שזה יהיה מדרגה מלאה צריך להראות שאין תלות לינארית בין השורות ולכן מספיק שנניח שכל הערכים בשורה הראשונה שווים זה לזה ואז נראה איך זה גורם ל־$M$ להתנהג
  $ sin(z) = -cos(z) = x cos(z) + y cos(z) $
  אז מהשיוויון הראשון נקבל ש־$tan(z)=-1$ ואז מהגדרת היריעה נקבל גם
  $ x(-cos(z)) = y cos(z) <==> -x cos(z) = y cos(z) <==> x = -y $
  עכשיו $sin(z)= x cos(z) + y sin(z)$ ולכן אם נציב $x=-y, sin(z) = -cos(z)$ נקבל
  $ - cos(z) = -y cos(z) - y cos (z) <==> - cos(z) = -2y cos(z) $
  מכיוון ש־$cos(z)!=0$ כי $tan(z)=-1$ נקבל
  $ -1 = - 2y <==> y = frac(1, 2) <==> x = - frac(1, 2) $
  אבל אז
  $ frac(-1, 2) + frac(1, 2) + z = 2 ==> z = 2 $
  אבל $tan(2)!=-1$ וזאת סתירה אז הדרגה מלאה וזו אכן יריעה.
]

#pagebreak()

== שאלה 2
נחשב את
$ integral_boundary(Omega) frac(-y, x^2+y^2) dif x + frac(x, x^2+y^2) dif y $
כאשר $Omega ={ (x,y) in RR^2 bar frac((x-2)^2, 16)+y^2 < 1}$ ושפת אומגה מכוונת נגד כיוון השעון.

#solution[
  אי־אפשר להשתמש במשפט גרין כי הראשית נקודה סינגולרית (ויחידה) והיא נמצאת ב־$Omega$.\
  נסמן $ arrow(F) = (P, Q), quad P colon.eq frac(-y, x^2+y^2), quad Q colon.eq frac(x, x^2+y^2) $
  נגזור
  $
    frac(partial P, partial y) = frac(-1(x^2+y^2)-(-y)2y, (x^2+y^2)^2) = frac(y^2-x^2, (x^2+y^2)^2) \
    frac(partial Q, partial x) = frac(1(x^2+y^2)-2x^2, (x^2+y^2)^2) = frac(y^2-x^2, (x^2+y^2)^2)
  $
  בפרט נובע ש־$F$ שדה משמר מקומית ואם *נניח* ש־$Omega^prime = Omega without {(0,0)}$ (כאשר לא באמת הוצאנו רק את הראשית אלא סביבה קטנה דיו של הראשית)  תחום שלא מכיל את הנקודה הסינגולרית, אז ממשפט גרין ישירות נקבל אם־כך $integral.double_(Omega^prime) 0 dif x dif y = 0$.\
  יהי $epsilon > 0$ וניקח $B(0, epsilon)$ כדור קטן דיו סביב הראשית כדי להוציא את הנקודה הסינגולרית עם הפרמטריזציה
  $ x(t) =epsilon cos(t), quad y(t) =epsilon sin(t), quad t in [0, 2pi] $
  ואז
  $ dif x = - epsilon sin(t) dif t, quad dif y = epsilon cos(t) dif t $
  והזהות הרגילה
  $ x^2 + y^2 = cos^2 (t) + sin^2 (t) = 1 $
  ולכן
  $
    integral_(C_epsilon) P dif x + Q dif y &= integral_0^(2pi) ( ( -frac(epsilon sin(t), epsilon^2))(-epsilon sin(t)) +( frac(epsilon cos(t), epsilon^2))(epsilon cos(t))) dif t \
    &= integral_0^(2pi) (sin^2(t) + cos^2(t)) dif t \
    &= integral_0^(2pi) 1 dif t = 2pi
  $
  מתקיים $Omega = Omega^prime union C_epsilon$ ולכן גם $integral_Omega = integral_(Omega^prime) + integral_C_epsilon$ אבל ראינו שזה אפס, אז $integral_(Omega^prime) = 2pi$ (כי המעגל הוא עם כיוון השעון ולכן האוריינטציה שלו שלילית ביחס למה שמשפט גרין דורש אז צריך לתקן את זה)
]

== שאלה 3
תהיי $gamma : [0,1] arrow RR^2$ מסילה סגורה, חלקה, לא קבועה המקיימת
$ integral_gamma y^3 dif x - x^3 dif y =0 $

=== סעיף א'
נראה שלא קיימת קבוצה פתוחה, חלוקה וחסומה $Omega$ כך ש־$gamma$ מתארת את $boundary(Omega)$ במגמה חיובית.

#solution[
  נניח שכן יש כזאת ונשתמש במשפט גרין. נסמן
  $ arrow(F) (P,Q), quad P = y^3, quad Q = -x^3 $
  נגזור
  $ frac(partial Q, partial x) = -3x^2, quad frac(partial P, partial y) = 3y^2 $
  מהנתון וממשפט גרין נקבל
  $
    0 = integral_boundary(Omega) P dif x + Q dif y = integral_Omega frac(partial Q, partial x) - frac(partial P, partial y) dif x dif y = integral_Omega (-3x)-3y^2 dif x dif y = -3 integral_Omega x^2+y^2 dif x dif y
  $
  אבל $f(x,y) = x^2+y^2$ היא פונקציה חיובית לכל  $(x,y) != (0,0)$ ולכן האינטגרל שלה על כל קבוצה (לא ממידה אפס) הוא גדול מאפס וזאת סתירה.
]

=== סעיפים ב' וג'
נמצא דוגמה למסילה $gamma$ המקיימת את הנתון ודוגמה למסילה $gamma$ המקיימת את הנתון ושהיא רגולרית.

#solution[
  בשביל החלק הראשון מספיק הישר מ־$x=0$ ל־$x=1$ ובשביל החלק השני ניקח את צורת ה־$infinity$ בקטע $[0,1]$ ומכיוון שהפונקציה שלנו אנטי־סימטרית ההרכבה של המסילה עליה תיתן אפס (וכמובן שרגולרית).
]

== שאלה 4
נחשבאת השטף של השדה $F(x,y,z) = (tan y^3, sin z, x^2023+1)$ דרך חצי הספירה
$ Sigma = {(x,y,z) in RR^3 bar x^2+y^2+z^2=1, z>0} $

#solution[
  ראשית $divergence F = 0$ לכן ממשפט הדיבירגנץ $integral_Sigma divergence F = 0$ ו־$Sigma$ היא חצי ספירה אז הנפח שלה הוא $frac(2 pi, 3)$.
  נשים לב ש־$Sigma$ לא תחום סגור (אבל כן חסום) אז נבחר את $D = {(x,y,0) in RR^3 bar x^2+y^2 <=1}$ כי בעצם סגרנו את הספירה שיש לנו מלמטה וככה נקבל חצי כדור שלם ונוכל להשתמש במשפט הדיבירגנץ' כי
  $
    0 = integral_Sigma divergence F dif sigma = integral.double_Sigma chevron.l F, hat(n) chevron.r dif sigma + integral.double_D chevron.l F, hat(n) chevron.r dif sigma ==> integral.double_Sigma chevron.l F, hat(n) chevron.r dif sigma = - integral.double_D chevron.l F, hat(n) chevron.r dif sigma
  $
  אז הנורמל שלנו הוא מי שמצביע החוצה ומאונך לציר ה־$z$ ולכן נבחר $z= (0, 0, -1)$ כי אנחנו רוצים לצאת מהספירה, ואם הוא יהיה חיובי אנחנו נסתכל לתוך הספירה.\
  אפשר לחשב את הנורמל גם ידנית: אנחנו עם מעגל אז עדיף קורדינאטות קוטביות $x(r,theta) = r cos(theta), y(r,theta) = r sin(theta), z(r,theta)=0$ עבור $r in [0,1], theta in [0,2pi]$ ואז
  $
    r_r (cos(theta), sin(theta), 0) \
    r_theta = (-r sin(theta), r cos(theta), 0) \
    norm(r_r times r_theta) = norm((0 comma 0 comma r cos^2 (theta) + r sin^2 (theta))) = r
  $
  ושוב בגלל הכיוון נובע שצריך את $(0,0-r)$ ובגלל שלקחנו וקטור יחידה זה $(0,0,-1)$ ונשאר לחשב
  $ integral.double_D chevron.l F, hat(n) chevron.r dif sigma = - integral.double_D x^2023 + 1 dif sigma $
  נשים לב ש־$f(x)=x^2023$ היא פונקציה אי־זוגית ולכן האינטגרל שלה על כל תחום סימטרי (ובפרט על הכדור שלנו) ייתן אפס אז חבל על המאמץ של האינטגרציה, אז רק נשאר
  $ - integral.double_D 1 dif sigma = (-1) dot.op Area(D) = - pi $
  אז
  $ integral.double_Sigma chevron.l F, hat(n) chevron.r dif sigma = pi $
]

== שאלה 5
תהיי $gamma : [0, frac(pi, 4)] arrow RR^3$ המסילה במישור $x z$ הנתונה על־ידי
$ gamma(t) = (R(cos(2t))^(frac(1, 2)) sin(t), 0, R (cos(2t))^frac(1, 2) cos(t)) $
ויהי $Sigma$ המשטח המתקבל על־ידי סיבוב המסילה $gamma$ סביב ציר ה־$z$ (הערה: זה אומר שגובה ה־$z$ נשאר זהה, אבל ציר ה־$x$ הופך לרדיוס של מעגל במישור ה־$x y$, אני לא חושבת שאנחנו אמורים לדעת לענות על השאלה הזאת).

=== סעיף א'
פרמטריזציה עבור $Sigma$.

#solution[
  כדי לסובב סביב ציר ה־$z$ כאשר $theta in [0,2pi]$ נכפיל את הקורדינאטה ה־$x$־ית ב־$cos(theta)$ וכדי לקבל את הקורדינאטה ה־$y$־ית (שכרגע היא אפס), ניקח את הקורדינאטה ה־$x$־ית ונכפיל אותה ב־$sin(theta)$ וזה ייתן את הנדרש
  $
    (R(cos(2t))^(frac(1, 2)) sin(t) cos(theta), R(cos(2t))^(frac(1, 2)) sin(t) sin(theta), R (cos(2t))^frac(1, 2) cos(t))
  $
]

=== סעיף ב'
נראה שאלמנט השטח של $Sigma$ מתלכד עם אלמנט שטח של ספירה.

#proof[
  נסמן $f(t)=R sqrt(cos(2t)) sin(t)$ ואז
  $ sigma(t, theta) = (f(t)cos(theta),f(t)sin(theta), R sqrt(cos(2t)) cos(t)) $
  אנחנו רוצים $dif S = norm(sigma_t times sigma_theta) dif t dif theta$ אז נחשב כרגיל
  $
    sigma_theta = (-f(t)sin(theta), f(t)cos(theta), 0) \
    sigma_t = (f^prime (t) cos(theta), f^prime (t) sin(theta), z^prime (t))
  $
  אם נפתח את המכפלה הוקטורית הזאת נקבל
  $ sigma_t times sigma_theta = (-f(t)z^prime (t)cos(theta), -f(t) z^prime (t)sin(theta), f(t)f^prime (t)) $
  *יש פה מלא אלגברה שאני מסרבת לעשות.*
]

== שאלה 6
תהיי $Omega subset.eq RR^3$ פתוחה, חלוקה וחסומה, $Sigma = boundary(Omega)$ עם נורמל כלפי חוץ ויהי $arrow(F)$ השדה $arrow(F)(x,y,z)=(z(x+y)-y^2, x(z-y), x^2+y^2)$.\
יהי $product$ המישור $a x + b y + c z = 1$.\
נניח שהמישור $product$ מחלק את $Sigma$ לשני משטחים מכוונים $Sigma_plus$, $Sigma_minus$ עם שפה. נמצא תנאים לא טריוויאלים על $a,b,c$ שאינם תלויים ב־$Omega$ לכך שהשטף של $Curl F$ דרך כל אחד מהמשטחים $Sigma_plus$, $Sigma_minus$ יתאפס.

#solution[
  Wtf... \
  קודם כל $Curl F = (2y-x,y-x,y)$ ונסמן $C = Sigma_plus inter Sigma_minus$, ממשפט סטוקס והאוריינטציה הנתונה
  $
    integral.double_Sigma_plus chevron.l Curl F, hat(n) chevron.r dif S = integral.cont_C F dif sigma \
    integral.double_Sigma_minus chevron.l Curl F, hat(n) chevron.r dif S = - integral.cont_C F dif sigma
  $
  $C$ כולה ב־$a x + b y + c z = 1$ ולכן אפשר למצוא נורמל $hat(n) = frac((a,b,c), sqrt(a^2+b^2+c^2))$.\
  אנחנו רוצים שזה ייתאפס לכל $Omega$ ולכן חייב בהכרח להתקיים $chevron.l Curl F, hat(n) chevron.r = 0$, אז המכפלה היא
  $ (2y-x,y-x,y) dot.op (a,b,c)=(-a-b)x+(2a+b+c)y $
  (המכנה לא מעניין פה).\
  אם $c!=0$ אזי $z = frac(1-a x - b y, c)$ וזה בעצם גורר כל צירוף לינארי כלשהו אבל מצד שני אנחנו דורשים
  $ (-a-b)x + (2a+b+c)y = 0 $
  וזו פונקציה לינארית ב־$x,y$ והדרך היחידה שפונקציה לינארית תהיה אפס לכל $x,y$ היא שכל המקדמים שלה יהיו אפס אז
  $ -a-b = 0 and 2a + b+ c = 0 ==> b = -a ==> c= -a ==> (a,b,c)=a(1,-1,-1) $
  אם $c=0$ אז המישור הוא $a x + b y = 1$ וכדי שיתקיימו התנאים לעיל צריך להיות $lambda$ כך שיתקיים
  $ (-a-b)x + (2a + b) y = lambda(a x + b y - 1) ==> lambda a = (-a -b) $
  כלומר אנחנו רוצים ש־$(-a-b)x+(2a+b)y$ תהיה אפס על כל המישור $a x + b y = 1$ ומכאן נובע שאם שני אגפים שווים כפונקציות אז גם האיבר החופשי חייב להיות שווה ומכאן $lambda=0$ אבל אז
  $ -a-b = 0 and 2a +b = 0 ==> a=b=0 $
  סתירה.\
  בסך־הכל תנאי הכרחי ומספיק הוא $lambda(1, -1, -1)$ עבור $lambda!=0$.
]

= פתרון מבחן בלמזי (מניחה שמועד א' 2023)
== שאלה 1
=== סעיף א'
נגדיר את המושג יריעה חלקה $k$־מימדית ב־$RR^n$.

#solution[
  ישנן 3 הגדרות ליריעות, ניתן את שלושתן
  + כאוסף נקודות האפס – נגיד ש־$M subset.eq RR^n$ היא יריעה חלקה $k$־מימדית אם לכל $p in M$ יש $p in W$ סביבה פתוחה ו־$F: U arrow RR^(n-k)$ חלקה כך ש־$D F$ מדרגה מלאה ו־$M inter W = {x in W bar F(x) = 0}$
  + כגרף של פונקציה – נגיד ש־$M subset.eq RR^n$ היא יריעה חלקה $k$־מימדית אם לכל $p in M$ יש $p in W$ סביבה פתוחה, $U subset.eq RR^k$ פתוחה ו־$f in C^r (U, RR^(n-k))$ כך שמתקיים $M inter W = Gamma(f)$
  + נגיד ש־$M subset.eq RR^n$ היא יריעה חלקה $k$־מימדית אם לכל $p in M$ יש $p in W$ סביבה פתוחה ו־$U subset.eq RR^k$ פתוחה, $phi : U arrow RR^n$ כך שמתקיים
    + $D phi$ מדרגה מלאה
    + $phi(U) = M inter W$
    + $phi : U arrow M inter W$ היא הומיאומורפיזם
]

=== סעיף ב'
נוכיח בעזרת אחת ההגדרות לעיל שהקבוצה הבאה היא יריעה חלקה
$ M = {(s sin(t), s cos(t), s^2 +t) bar s,t in RR} $

#solution[
  לא טבעי בכלל ואפילו די ארוך אבל מראים עם ההגדרה השלישית, נגדיר $f:RR^2 arrow RR^3$ על־ידי $f(t,s) = (s sin(t), s cos(t), t+s^2)$ והיא כמובן חלקה ב־$RR^2$ שפתוחה ואם נראה שהיא מדרגה מלאה אז ממשפט ההעתקה הפתוכה נקבל ש־$f$ הומיאומורפיזם מקומי ולכן יריעה
  $ D F(t,s) = mat(sin(t), s cos(t); cos(t), - s sin(t); 2s, 1) $
  נורא ארוך ומפרך אבל מראים עם המינורים.\
  כלומר ניקח מינור ראשון נניח
  $ det mat(delim: "[", sin(t), s cos(t); cos(t), - s sin(t)) = -s $
  בגלל ש־$s$ בתחום שלנו אז צריך לראות מה קורה כש־$s=0$ (עבור $s!=0$ כבר מדרגה מלאה) אז נציב $s=0$ ונקבל
  $ mat(sin(t), 0; cos(t), 0; 0, 1) $
  בבירור העמודות פה בלתי־תלויות ולכן המטריצה עדיין מדרגה מלאה.
]

== שאלה 2
נחשב את האינטגרל הקווי $integral_gamma (x^2-y) dif x + (y^2 + x) dif y$ כאשר $gamma$ היא בציור המצורף
#figure(
  image("../../../src/images/SomeRandomGamma.png", width: 50%, height: 20%, fit: "contain"),
)

#pagebreak()

#solution[
  זו מסילה סגורה אז אפשר להשתמש במשפט גרין
  $
    integral_boundary(Omega) P dif x + Q dif y = integral_Omega frac(partial Q, partial x) - frac(partial P, partial y) dif x dif y
  $
  אז אם נסמן $P=x^2-y, Q = y^2 + x$ נקבל $frac(partial P, partial y) = -1, frac(partial Q, partial x) = 1$
  ולכן
  $ integral_Omega frac(partial Q, partial x) - frac(partial P, partial y) dif x dif y = 2 Area(Omega) $
  יש ריבוע יחידה ועוד ריבוע עם אורך קטע 2 אז
  $ Area(Omega) = 2 dot.op 2 - 1 = 3 $
  כשהמינוס זה בגלל שהאורינטצייה מבטלת את השטח בריבוע הקטן
  אז לבסוף התשובה היא $6$.
]

== שאלה 3
תהיי $Omega subset.eq RR^3$ קבוצה פתוחה, חלקה וחסומה כך ש־$(0,0,0) in Omega$ ותהיי
$ u(x,y,z) = frac(1, sqrt(x^2+y^2+z^2)) $

=== סעיף א'
נחשב את $F=gradient u$.

#solution[
  מכללי גזירה
  $ F = gradient u = frac(1, (x^2+y^2+z^2)^(3/2))(-x,-y,-z) $
]

=== סעיף ב'
נחשב את השטף של $F$ דרך $boundary(Omega)$.

#solution[
  זה אותו טריק ממקודם, בגלל ש־$(0,0,0) in Omega$ וזו נקודה סינגולרית גם של $F$ וגם של $u$ אז אנחנו צריכים לפרק את $Omega$ להיות בסביבה קטנה מספיק בלי הראשית ובגלל ש־$divergence F = 0$ מחישוב קצר אז נריץ פעם אחת את משפט הדיבירגנץ' על $F$ על $Omega$ בלי סביבה של הראשית ועוד משפט הדיבירגנץ' על סביבה קטנה של הראשית עם $epsilon > 0$ אבל אנחנו צריכים נורמל שחיצוני לכדורון (לא נתון המשטח בצורה שמאפשרת להוציא אותו) ולכן $hat(n)=frac((x,y,z), sqrt(x^2+y^2+z^2)) = frac((x,y,z), epsilon)$ לכדורון ואנחנו צריכים באוריינטציה הפוכה ולכן $-hat(n)$
  את האחד הפנימי קל יותר לחשב כי בכדור $B_epsilon (0)$ מתקיים $x^2+y^2+z^2=epsilon^2$ ולכן $ chevron.l F, -hat(n) chevron.r = chevron.l - frac((x,y,z), epsilon^3), - frac((x,y,z), epsilon) chevron.r = frac(1, epsilon^2) $
  ולבסוף
  $
    integral.double_boundary(B(0, epsilon)) chevron.l F, -hat(n) chevron.r dif sigma = integral.double_boundary(B(0,epsilon)) frac(1, epsilon^2) dif S = frac(4 pi epsilon^2, epsilon^2) = 4pi
  $
  אז השטף הרצוי הוא $-4pi$.
]

== שאלה 4
אני לא יודעת לעשות.

== שאלה 5
יהי $Sigma$ חלק הפרבולואיד שנתון על־ידי
$ Sigma = {(x,y,z) in RR^3 bar z=2(x^2+y^2), 0<=z<1} $

=== סעיף א'
נחשב את השטח של $Sigma$ ונסמנו $A$.

#solution[
  נשים ל שהמשטח נתון בצורה של גרף של פונקציה $z= f(x,y) = 2(x^2+y^2)$ ולכן את אלמנט השטח אפשר לקבל על־ידי
  $ sqrt(1+(f_x)^2 + (f_y)^2) dif x dif y = sqrt(1 + 16x^2 + 16 y^2) $
  נשים לב
  $ 0<= z=2(x^2+y^2) < 1 <==> x^2+y^2 < frac(1, 2) $
  ולכן התחום שלנו הוא $D = {(x,y) bar x^2+y^2 < frac(1, 2)}$ ואם נעבור לקורדינאטות קוטביות $r^2=x^2+y^2$ ולכן
  $
    A = integral_0^(2pi) integral_0^(frac(1, sqrt(2))) sqrt(1+16r^2) r dif r dif theta = 2pi integral_0^(frac(1, sqrt(2))) sqrt(1+16r^2) r dif r
  $
  נעשה חילוף משתנה $u=1+16r^2$ ולכן $dif u = 32 r dif r$ אז
  $
    integral sqrt(1+16r^2) r dif r = frac(1, 32) integral sqrt(u) dif u = frac(1, 32) dot.op frac(2, 3) u^(frac(3, 2)) = frac(1, 48)(1+16r^2)^(frac(3, 2))
  $
  אז נקבל
  $ A = 2pi [frac(1, 48)(1+16r^2)^(frac(3, 2))]_(r=0)^(r=frac(1, sqrt(2))) = 2pi dot.op frac(13, 24) = frac(13 pi, 12) $
]

=== סעיף ב'
נחשב את $B = integral.double_Sigma z dif Vol_2$.

#solution[
  מתקיים $z=2r^2$ ולכן
  $
    B = integral_0^(2pi) integral_0^(frac(1, sqrt(2))) (2r^2) sqrt(1+16r^2)r dif r dif theta = 8pi integral_0^frac(1, sqrt(2)) r^3 sqrt(1+16r^2) dif r
  $
  ועם אותה הצבה ממקודם כשזוכרים ש־$r^2=frac(u-1, 16)$ פותרים.
]

=== סעיף ג'
נחשב את היחס $frac(B, A)$.

#solution[
  אני חושבת שלא.
]

== שאלה 6
יהי $ arrow(F)(x,y,z) = (3x^2 y^2 z^2 + e^(x y), 2x^3 y z^2 - 2y z + e^x^2, 2x^3 y^2 z + x^2) $
ו־$f:RR^2 arrow RR$ חלקה, יהי $ Sigma= {(x,y,z) in RR^3 bar x^2+y^2 <= 1, z = f(x,y)} $
עם נורמל $hat(n)$ כלפי מעלה, צריך להראות ש־$integral_boundary(Sigma) arrow(F) arrow(dif l)$ אינו תלוי בפונקציה $f$.

#solution[
  Wtf...
  צריך להשתמש פה איכשהו במשפט סטוקס אז נתחיל ממה שקל
  $ Curl F = (2y, -2x, "some shit") $
  הג'מיני אומר להסתכל על הגליל
  $ S = {(x,y,z) in RR^3 bar x^2+y^2=1 , 0<=z<=f(x,y)} $
  ואז $boundary(S)$ מורכב משתי עקומות, $boundary(Sigma)$ מכוונת נגד כיוון השעון (מגמה חיובית) והשפה התחתונה היא פשוט מעגל היחידה במישור $z=0$ עם כיוון השעון וממשפט סטוקס נקבל
  $
    integral.double_S chevron.l Curl F, hat(n) chevron.r dif S = integral_boundary(Sigma) F dif l - integral_C_0 F dif l
  $
  נשים לב שהנורמל החיצוני בשביל $x^2+y^2=1$ הוא $(x,y,0)$ (מצביע אופקית החוצה מהראשית) אבל אז $chevron.l Curl F, (x,y,0) chevron.r = 0$ ואז באמת לא היינו צריכים לחשב את האיכסה ובפרט יינבע $integral.double_S 0 dif S = 0$ ולכן
  $ integral_boundary(Sigma) F dif l = integral_C_0 F dif l $
  וזה בידיוק אומר שזה לא תלוי ב־$f$.
]
