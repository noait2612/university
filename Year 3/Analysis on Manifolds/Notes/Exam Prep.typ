#import "../../../src/article.typ": *
#import "../../../src/article_he.typ": *
#show: thmbox-init()
#show: article_he.with(
  title: [ הכנה למבחן --- אנליזה על יריעות ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)

#set heading(numbering: "1.1")
#outline(depth: 3)

= צורות חשובות
== מסילות
== יריעות פרמטריות
=== ספירה פרמטרית
#definition[פרמטריזציה של ספירה דו־מימדית][
  משטח $Sigma$ נתון על־ידי $display(r(theta,phi.alt) = (cos(phi.alt)sin(theta), sin(phi.alt) sin(theta), cos(theta)))$ עבור $0<=theta<=2pi$ ,  $0<= phi.alt <= pi$.
  #figure(
    image("../../../src/images/2D sphere.png", width: 100%, height: 15%, fit: "contain"),
  )

]

=== טורוס

=== הליקס (סליל)
#definition[הליקס][
  מסילה $gamma(t) = (cos(t), sin(t), t)$ עבור $t in [0,2pi]$.
  #figure(
    image("../../../src/images/helix.png", width: 100%, height: 20%, fit: "contain"),
    caption: "הליקס עם טווח יותר גדול כדי שנראה את הסיבוב",
  )
]

== יריעות עם שפה
== יריעות בלי שפה


= חישובים

== מסילות

=== אינטגרל מסילתי/קווי על פונקציה
#theorem[אינטגרל מסילתי][
  בהינתן $gamma: [a,b] arrow RR^n$ מסילה חלקה ו־$f:RR^n arrow RR$ פונקציה רציפה אזי האינטגרל המסילתי/קווי של $f$ על $gamma$ מוגדר על־ידי
  $ integral_gamma f dif s = integral_a^b f(gamma(t)) norm(dot(gamma)(t)) dif t $
]

#example[
  נחשב את האינטגרל הקווי $integral_gamma sqrt(z) dif s$ עבור הסליל (הליקס) $display(gamma(t)=(cos(t), sin(t), t^2))$ כאשר $t in [0,2pi]$
]

#solution[
  $
    dot(gamma)(t) = (-sin(t), cos(t), 2t) \
    norm(dot(gamma)(t)) = sqrt(1+4t^2) \
    ==> integral_gamma sqrt(z) dif s = integral_0^(2pi) abs(t) sqrt(1+4t^2) dif t = integral_0^(2pi) t sqrt(1+4t^2) dif t = dots.h.c = [frac((4t^2+1)^frac(3, 2), 12)]_(t=0)^(t=2pi) = frac(1, 12) ((1+16 pi^2)^frac(3, 2)-1)
  $
]

=== אינטגרל מסילתי על שדה וקטורי
#theorem[אינטגרל מסילתי על שדה וקטורי][
  תהיי $gamma$ מסילה ו־$arrow(X)$ שדה וקטורי (שם יפה עבור $U subset.eq RR^n$ פתוחה ו־$F:U arrow RR^n$ חלקה) אזי $integral_gamma arrow(X)dif arrow(ell) = integral_a^b arrow(X)(gamma(t)) dot.op dot(gamma) (t) dif t$.
]

#example[
  נסתכל על השדה הוקטורי $F(x,y,z) = display((frac(x, x^2+y^2m), frac(y, x^2+y^2), z))$ המוגדר על $U=(RR^2 without {0}) times RR$. נחשב את האינטגרל הקווי $integral_gamma arrow(X) dif arrow(ell)$ לאורך המסילה $gamma: [0,2pi] arrow RR^n$ הנתונה על־ידי $gamma(t)=display((cos(t), sin(t), t^2))$.
]

#solution[
  $
    dot(gamma)(t) = (-sin(t), cos(t), 2t) ==> integral_0^(2pi) F(gamma(t)) dot(gamma)(t) dif t = integral_0^(2pi) -sin(t)cos(t) + sin(t)cos(t) + 2t dot.op t^2) dif t = integral_0^(2pi) 2t^3 dif t = [frac(t^4, 2)]_(t=0)^(t=2pi) = 8pi^4
  $
]

== יריעות פרמטריות
=== היפר־נפח ($bold(Vol_d)$)
#definition[קבוע הנפח][
  בהינתן 2 מרחבי מכפלה פנימית $k$־מימדים  $(U, chevron.l, chevron.r_U)$ ו־$(W, chevron.l , chevron.r)_W$, העתקה לינארית $T:U arrow W$ ובסיסים אורתונורמליים $e_1, dots.h, e_k$ ל־$U$ ו־$tau_1, dots.h, tau_k$ ל־$W$ נגדיר את קבוע הנפח להיות
  $ V(T)=abs(det(a_(j i))) $
  כאשר $T(e_i) = sum a_(j i) tau_j$
]

#lemma[הגדרה שקולה לקבוע נפח][
  עבור $T:RR^k arrow RR^n$ מתקיים
  $ V(T) = sqrt(det(T^t T)) $
]

#theorem[היפר־נפח של יריעה פרמטרית][
  בהינתן $X$ יריעה פרמטרית ו־$phi.alt : U subset.eq RR^k arrow RR^n$ הפרמטריזציה שלה (יריעה $k$־מימדית) שלה אז הנפח שלה מוגדר על־ידי
  $ Vol_k (X) = integral_U V(D phi.alt|_x) dif x $
  כאשר $V(T)$ הוא קבוע הנפח.
]

#example[
  בהינתן פרמטריזציה $Sigma$ הנתונה על־ידי $display(r(theta, phi.alt) = (cos(phi.alt)sin(theta), sin(phi.alt)sin(theta),cos(theta)))$ עבור $0<=theta<=pi$ ו־$0<=phi.alt <= frac(theta, 2)$ נחשב את השטח של $Sigma$.
]

#solution[
  $
    T colon.eq D phi.alt|_x = mat(-sin(phi.alt) sin(theta), cos(phi.alt) cos(theta); cos(phi.alt) sin(theta), sin(phi.alt) cos(theta); 0, -sin(theta)) \
    sqrt(det(T^t T)) = sqrt(det mat(delim: "[", sin^2(theta), 0; 0, 1)) = abs(sin(theta)) \
    ==> Vol_k (Sigma) = integral_U abs(sin(theta)) dif x = integral_0^pi integral_0^frac(theta, 2) abs(sin(theta)) dif phi.alt dif theta = integral_0^pi integral_0^frac(theta, 2) sin(theta) dif phi.alt dif theta = frac(1, 2) integral_0^pi sin(theta) theta dif theta = [sin(theta)-cos(theta)theta]_(theta=0)^(theta=pi) = frac(pi, 2)
  $
]

== עקמומיות
#definition[#todo]
#example[
  עבור המשטח $z=x y$ נחשב את העקמומיות $K$ בראשית.
]

#solution[
  נגדיר $r(x,y) = (x,y,x y)$ ולכן $r_x = (1,0,y)$ ו־$r_y = (0,1,x)$ ובראשית $r_x = (1,0,0), r_y = (0,1,0)$. #todo
]
=== אינטגרל של פונקציה

=== משפט גרין
#theorem[משפט גרין][
  יהי $Omega subset.eq RR^2$ תחום חלק ויהי $F=(P,Q)$ שדה וקטורי חלק בסביבה של $Omega$ ו־$boundary(Omega)$ באוריינטציה חיובית. אזי
  $
    integral_boundary(Omega) P dif x + Q dif y = integral_boundary(Omega) F dif ell = integral_Omega frac(partial Q, partial x) - frac(partial P, partial y) dif x dif y
  $
]

#corollary[
  בתנאי משפט גרין
  $
    Area(Omega)=integral_boundary(Omega) x dif y = - integral_boundary(Omega) y dif x = frac(1, 2) integral_boundary(Omega) x dif y - y dif x
  $
]

#example[
  נחשב את השטח הכלוא בתוך המסילה $gamma(t)=display((sin(t), sin(t)cos(t)))$ עבור $t in [0,2pi]$.
]

#solution[
  ראשית נתחיל מלשים לב שאם $ x(t)=sin(t), quad y(t)=sin(t)cos(t) \
  ==> y(t)=x(t)cos(t) \
  ==> y^2 = x^2 (t) cos^2 (t) = x^2 (t) (1-sin^2 (t))= x^2 (t) (1- x^2 (t)) $
  עבור $t in [0, pi]$ המסילה תלך עם כיוון השעון ועבור $t in [pi, 2pi]$ היא תלך נגד כיוון השעון ובעצם הם יבטלו אחד את השנייה באינטגרל, אז נחשב רק אחד מהם ונכפיל ב־$2$.\
  נרצה להשתמש בלמה לעיל ולכן נחשב
  $ dif x = cos(t) dif t, quad dif y = (cos^2 (t)-sin^2 (t)) dif t $
  ולכן
  $
    x dif y - y dif x = (sin(t))(cos^2 (t) - sin^2 (t)) dif t- (sin(t)cos(t))(cos(t)) dif t = (sin(t)cos^2 (t) - sin^3 (t) - sin(t) cos^2 (t)) dif t = -sin^3 (t) dif t
  $
  ולכן מהלמה לעיל
  $
    Area(Omega) = frac(1, 2) integral_boundary(Omega) x dif y - y dif x = 2 dot.op abs(frac(1, 2) integral_0^(pi) -sin^3 (t) dif t) = integral_0^pi sin^3(t) dif t = integral_0^pi sin(t)(1-cos^2(t)) dif = dots.h.c = frac(4, 3)
  $
]

=== משפט סטוקס
#definition[Curl][
  תהיי $U subset.eq RR^3$ קבוצה פתוחה ונגדיר $Curl : C^1 (U, RR^3) arrow C^1 (U, RR^3)$ על־ידי
  $ Curl F = (partial_y F_3 - partial_z F_2, partial_z F_1 - partial_x F_3, partial_x F_2 - partial_y F_1) $
]

#theorem[משפט סטוקס][
  יהי $Sigma subset.eq RR^3$ יריעה קומפקטית דו־מימדית עם שפה (אולי ריקה) ותהיי $U subset.eq RR^3$ סביבה של $Sigma$ ויהי $F:U arrow RR^3$ שדה וקטורי. אזי
  $ integral_boundary(Sigma) F dif ell = integral_Sigma chevron.l Curl F, N chevron.r $
]

#example[
  נחשב $integral.cont_gamma F dif ell$ עבור $F=(y,-2z, 4x)$ כאשר $gamma$ זה מעגל ברדיוס $2$ במישור $x+2y+3z=4$ נגד כיוון השעון כשמסתכלים עליו מהציר החיובי של ציר ה־$z$.
]

#solution[
  ראשית $Curl F = (2,-4,-1)$ ובשביל למצוא את $n$ בעצם המשטח נתון בצורה סתומה על־ידי משוואה (כלומר קווי גובה) ולכן אם הוא נתון על־ידי $G$ מתקיים $n=frac(gradient G, norm(gradient G))$ על־כן במקרה שלנו $n=-frac((1,2,3), sqrt(14))$ כאשר המינוס הוא בשביל הכיוון הנגדי.\
  ממשפט סטוקס נקבל אם־כך כאשר $Sigma$ זה  בעצם הדיסק החסום על־ידי $gamma$
  $
    integral.cont_gamma F dif ell = integral.double_Sigma -frac(1, sqrt(14)) (2 dot.op 1 + 2 dot.op -4 + 3 dot.op (-1) ) dif x = frac(9, sqrt(14)) underbrace(pi dot.op 2^2, Area(Sigma)) = frac(36 pi, sqrt(14))
  $
]

=== משפט הדיבירגנץ'
#theorem[משפט הדירביגנץ'][
  תהיי $Omega subset.eq RR^n$ תחום חלק וחסום ויהי $F$ שדה וקטורי חלק המוגדר בסביבה של $Omega$ ויהי $N: boundary(Omega) arrow RR^n$ נורמל היחידה המצביע החוצה על $Omega$ אזי
  $ integral_Omega divergence F dif x = integral_boundary(Omega) chevron.l F, N chevron.r dif sigma $
]

#example[
  יהי $F(x,y,z) = (-y, x,z)$ ונחשב את השטף של $F$ דרך המשטח הסגור $Sigma = {(x,y,z) bar x^2+y^2 = cos^2 (z), frac(-pi, 2) <= z<=frac(pi, 2)}$.
]

#solution[
  ראשית נשים לב ש־$divergence F = 1$ ולכן נשאר רק לחשב
  $ integral_(-frac(pi, 2))^frac(pi, 2) cos^2 (z) dif z = dots.h.c = frac(pi^2, 2) $
]

== יריעות עם שפה
?
=== משפט הדיבירגנץ'
=== משפט גרין
=== משפט סטוקס

