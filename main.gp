nb = 512;
nbm = 12;

mod = 1<<nbm;

mask = 2*(4^(nbm/2)-1)/(4-1);

n = read("input.txt");

chiffre(m) = [m^2%n,kronecker(m,n),m%2];

dechiffre(c) = read("dec")(c);

m = random(1<<500) << nb+mask;

if(dechiffre(chiffre(m)) != m,error("problème d'énoncé à signaler"));




\\ Le but est de trouver 2 chiffrés c1 et c2 identiques SAUF par pour le symbole de Kronecker.

c1 = chiffre(m);
c2 = c1 ;
c2[2]= -c1[2];


tmp = dechiffre(c2); \\on déchiffre ce nouveau chiffré


\\ On vérifie que le chiffré 'tmp' qu'on obtient est non nul et différent de c1 car on veut trouver deux racines distinctes
\\ On reitère les instructions jusqu'à obtenir un autre chiffré.

while((tmp==0 || tmp==m), { m = random(1<<500)<< nb+mask; c1 = chiffre(m); c2 = c1; c2[2] = -c1[2]; tmp = dechiffre(c2); } );

\\ Quand on sort de la boucle, on a c1^2 mod n = c2^2 mod n avec c1 != c2.
\\ On calcule ensuite p et q et on renvoi le plus plus petit.

p = gcd(tmp - m, n);
q = gcd(tmp + m, n);

if(p<q, print(p), print(q));
