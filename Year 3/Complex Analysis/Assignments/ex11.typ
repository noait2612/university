#import "../../../src/article.typ": *
#show: article.with(
  title: [ פתרון מטלה 11 --- פונקציות מרוכבות, 80519 ],
  signature: [#align(center)[#image("../../../src/duck.png", width: 30%, fit: "contain")]],
)
#let ord = math.op("ord")

#question()
_תזכורת:_ בכיתה ראינו שאם $gamma: I arrow CC$ מסילה ו־$f:gamma arrow CC without {0}$ רציפה אזי קיימת $psi:I arrow CC$ כך ש־$e^psi = f compose gamma$.\
הגדרנו
$ i Delta_gamma f colon.eq Delta_gamma log(f) = psi(b)-psi(a) $

#subquestion()
נוכיח שלכל $gamma_1, gamma_2$ הניתנות לשרשור מתקיים $Delta_(gamma_1 + gamma_2) = Delta_(gamma_1) + Delta_(gamma_2)$.

#proof[
  נניח ש־$gamma_1$ מוגדרת על $[a,b]$ ו־$gamma_2$ מוגדרת על $[b,c]$, אז $gamma=gamma_1 + gamma_2$ מוגדרת על־ידי
  $ gamma(t) = mycases(gamma_1 (t), t in [a,b], gamma_2 (t), t in [b,c]) $
  לפי למת הלוגריתם הרציף, קיימת $psi: [a,c] arrow CC$ כך ש־$e^(psi(t))=f(gamma(t))$ לכל $t in [a,c]$.\
  אז ישירות מהגדרה
  $ Delta_gamma f = psi(c) - psi(a) = psi(c)-psi(b)+psi(b)-psi(a) $
  אבל הצמצום של $psi$ לקטע $[a,b]$ הוא מועמד כשר ללוגריתם הרציף עבור $f compose gamma_1$ ולכן $Delta_(gamma_1) (f) = psi(b) - psi(a)$ ובאופן דומה הצמצום של $psi$ לקטע $[b,c]$ הוא מועמד כשר ללוגירתם הרציף עבור $f compose gamma_2$ ולכן $Delta_(gamma_2) (f)=psi(c)-psi(b)$
  כלומר
  $ Delta_(gamma_1 + gamma_2) (f) = Delta_(gamma_2) f + Delta_(gamma_1) f $
]

#subquestion()
נראה שלכל $f,g$ רציפות מתקיים $Delta_gamma (f dot.op g)=Delta_gamma f + Delta_gamma g$.

#proof[
  נסמן $psi_f, psi_g$ הלוגריתמים הרציפים של $f,g$ בהתאמה (כלומר $e^(psi f) = f compose gamma, e^(psi_g) = g compose gamma$).\
  נסתכל על $Psi (t) =psi_f (t) + psi_g (t)$, מחוקי אקספוננט מתקיים
  $ e^(psi(t))=e^(psi_f (t) + psi_g (t))=e^(psi_f (t)) dot.op e^(psi_g (t))= f(gamma(t)) dot.op g(gamma(t)) $
  אבל $psi_f, psi_g$ רציפות ולכן גם הסכום שלהם רציף ו־$Psi$ רציפה ולכן זה מועמד ראוי להיות הלוגריתם הרציף של $f dot.op g$, אז
  $
    Delta_gamma (f g) & =Psi(b)-Psi(a) \
                      & =(psi_f (b)+psi_g (b))-(psi_f (a) + psi_g (a)) \
                      & = (psi_f (b)-psi_f (a))+(psi_g (b) - psi_g (a)) \
                      & = Delta_gamma f + Delta_gamma g
  $
]

#subquestion()
נוכיח שעיקרון הארגומנט שקול לכך ש־$\#{Z_f inter G}-\#{P_f inter G}=1/(2pi) Delta_(partial G) f$.

#proof[
  תהיי $psi(t)$ הלגוריתם הרציף של $f(gamma(t))$, אז מכלל השרשרת
  $ dif/(dif t) psi(t) = dif/(dif t) log(f(gamma(t)))=(f'(gamma(t)))/f(gamma(t)) dot.op gamma'(t) $
  ולאורך העקומה נקבל
  $
    integral_gamma f'/f dif z = integral_0^1 (f'(gamma(t)))/f(gamma(t)) gamma'(t) dif t = integral_0^1 psi'(t) dif t = psi(1) - psi(0) = Delta_gamma f
  $
  אבל מעיקרון הארגומנט
  $ 1/(2pi i) integral_gamma (f'(z))/f(z) dif z = \#(Z_f) - \#(P_f) $
  כלומר
  $ 1/(2pi i) Delta_gamma f = \#(Z_f) - \#(P_f) $
]

#question()
בכל סעיף נמצא כמה פתרונות (כולל ריבועיים) יש למשוואות בתחומים הנתונים.\
_תזכורת (משפט רושה):_ תהיינה $f, g in Hol(G)$ ותהיי $H subset.eq G$ כך ש־$overline(H) subset.eq G$ ו־$H$ תחום טוב.\
נניח שלכל $z in partial H$ מתקיים $abs(g(z))<=abs(f(z))$, אזי
$ \# (Z_(f+g) inter H)=\# (Z_f inter H) $

#subquestion()
$z^7-5z^4+z^2-2=0$ בדיסק היחידה $DD$.
#solution[
  נגדיר $p(z) = z^7-5z^4+z^2-2$ כאשר $g(z)=-5z^4$ ו־$f(z)=z^4+z^2-2$, על $abs(z)=1$ מתקיים
  $ abs(g(z))=abs(-5z^4)=5 wide abs(f(z))=abs(z^4+z^2-2)=0 $
  אז מתקיים $abs(f(z))<=abs(g(z))$ ול־$g$ יש אפס אחד בראשית בריבוי 4 ולכן ממשפט רושה נקבל שיש למשוואה $4$ פתרונות.
]

#subquestion()
$z^4+3z=1$ בטבעת ${z bar 1<abs(z)<2}$.
#solution[
  מהמסקנה אודות ריבויים בטבעת, נחלק לשתי בדיקות
  $ \#{"zeroes in" 1<abs(z)<2}=\# {"zeroes in" abs(z)<2} -\# {"zeroes in" 1<abs(z)} $
  + על $abs(z)=2$, נכתוב $p(z)=z^4+(3z-1)$ כאשר $g(z)=z^4$ ו־$f(z)=3z-1$ ומתקיים
    $ abs(g(z))=abs(z)^4=16 wide abs(f(z))=abs(3z-1)=5 $
    כלומר $abs(f(z))<abs(g(z))$ ולכן תנאי משפט רושה מתקיימים ולכן ל־$p$ יש את אותה כמות אפסים כמו ל־$g$ ול־$g$ יש אפס אחד בראשית, אבל עם הכפליות יש לו ארבע.
  + על $abs(z)=1$ נכתוב $p(z)=3z+(z^4-1)$ כאשר $g(z)=3z$ ו־$g(z)=z^4-1$ ומתקיים
    $ abs(g(z))=abs(3z)=3 wide abs(f(z))=abs(z^4-1)=0 $
    כלומר $abs(f(z))<abs(g(z))$ ולכן תנאי משפט רושה מתקיימים ולכן ל־$p$ יש את אותה כמות אפסים כמו ל־$g$ ול־$g$ יש אפס אחד בראשית עם ריבוי אחד.
  בסך־הכל קיבלנו $4-1=3$ כלומר $3$ פתרונות למשוואה הנתונה.
]

#subquestion()
$e^z=3z^n$ בחצי מישור ${z in CC bar re(z)<1}$ ו־$n in NN$.

#solution[
  נגדיר $F(z)=3z^n-e^z$ ונסתכל קודם כל על דיסק היחידה, על $abs(z)=1$ מתקיים
  $ abs(f(z)) = abs(e^z)=e < 3 wide abs(g(z)) = abs(3z^n) = 3^n = 3 $
  ושוב מתנאי משפט רושה מתקיים $abs(f(z)) < abs(g(z))$ ולכן יש להם את אותה כמות אפסים, ול־$g$ יש ריבוי אחד בראשית עם ריבוי $n$. \
  נבחן מה קורה אם $abs(z)>=1$ ו־$re(z) <1$, אז
  $ abs(f(z))=abs(3z^n) >= 3 wide abs(g(z))=abs(e^z)=e^(re(z)) < e < 3 $
  כלומר
  $ abs(3z^n) > abs(e^z) ==> 3z^n-e^z != 0 $
  כלומר אין התאפסויות בתחום הזה בכלל.\
  לסיכום יש לנו $n$ אפסים, קרי $n$ פתרונות.
]

#question()
נוכיח את משפט ההעתקה המקומית: תהיי $f in Hol(G)$ לא קבועה, $z_0 in G$ ונסמן $w_0 = f(z_0)$ ויהי $m = ord_(z_0) (f-w_0)$.\
אז קיים $epsilon_0 > 0$ כך שלכל $0<epsilon<epsilon_0$ קיימת $delta>0$ כך שלכל $w in B_delta^* (w_0)$ יש בידיוק $m$ פתרונות שונים למשואה $f(z)=w$ בדיסק $B_epsilon (z_0)$.

#proof[
  נסמן $w_0=f(z_0)$, מכך ש־$f$ איננה קבועה נובע שקיים $epsilon_0 > 0$ כך שלכל $B(z_0, epsilon_0)^*$ מתקיים $abs(f'(z)) > 0$ ו־$f(z)!=w_0$ (אפשר להניח ממשפט היחיד8ות). \
  נקבע $0<epsilon<epsilon_0$ ונגדיר
  $ delta = min_(abs(z-z_0)=epsilon) abs(f(z)-w_0) > 0 $
  ונגדיר $g_1 (z) = f(z) - w_0$ ונבחר $w in B(w_0,epsilon)^*$ ונגדיר $g_2 (z) = w_0 -w$ (פונקציה קבועה) ונגדיר $G_1 = B(z_0, epsilon)$.\
  אזז לכל $z in partial G_1$ מתקיים
  $ abs(g_2 (z))=abs(w-w_0)<delta<-abs(f(z)-w_0) = abs(g_1 (z)) $
  אז $g_1, g_2$ מקיימות את תנאי משפט רושה ולכן
  $ \#(Z_(g_1 + g_2) inter B(z_0, epsilon)) = \#(Z_(g_1) inter B(z_0, epsilon)) = m $
  כלומר למשוואה $f(z)=m$ יש בידיוק $m$ פתרונות.
]

#question()
תהיי $f:U_a^* arrow CC$ הולומורפית עם קוטב מסדר $m>=1$ בנקודה $a$. \
נוכיח שקיימים $epsilon, r > 0$ כך שלכל $abs(w)>r$ קיימים בידיוק $m$ פתרונות למשוואה $f(z)=w$ ב־$B_epsilon^* (a)$.

#proof[
  נגדיר $g(z)=1/f(z)$ ומתקיים $g(a)=0$ וכן $ord_a (g) = m$.\
  מהגרסה המקומית של משפט רושה (שאלה קודמת) קיימים $epsilon, delta > 0$ כך שלכל $w in B(g(a), delta)$ קיימים בידיוק $m$ פתרונות למשוואה $g(z)=w$ ב־$B(a, epsilon)$.\
  עוד מתקיים
  $ g(z)=w <==> f(z) = 1/w $
  ולכן קיבלנו את הטענה עבור $r=1/delta, epsilon$.
]
