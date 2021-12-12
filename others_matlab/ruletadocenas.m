function [dinero,win,m,pg,pp]=ruletadocenas(di,ap)
%
%Ruleta 2-docenas. Si sale 273 docenas, gana.
%%Hasta que nos hayamos duplicado o perdido la mitad seguimos jugando.
dinero=di;
r=randi([0,36],1); %Ronda ruleta. Primera mano previa a nuestras apuestas.
if r<=12   %Bola cae en primera docena.
    g1=[13:36]; 
    mano=g1;    %Nuestra apuesta ser� 2� y 3� docena.
elseif r>12 & r<=24  %Bola cae en 2� docena.
    g2=[1:12,25:36];
    mano=g2;   %Nuestra apuesta ser� 1� y 3� docena.
else
    g3=[1:24];
    mano=g3;   %Nuestra apuesta ser� 1� y 2� docena.
end
n=length(mano);
m=0;                   %JUGADAS
while (dinero>=di/2)&(dinero<=2*di)  %Hasta que nos hayamos duplicado o perdido la mitad.
    m=m+1;      %'m' mano apostada.
    ll(m)=m;     %Creamos vector para n�mero apuestas.
    r(m)=randi([0,36],1);   %Lanzamos bola ruleta y guardamos resultados en 'r'.
    for i=1:n  %Contador para comparar si 'r' (n�mero que cae) est� en nuestra mano.
        if mano(i)==r(m)  %La bola cay� en nuestro n�mero.
            j=1;
            break
        else
            j=0;
        end
    end
    win(m)=r(m)-mano(i);  %Comparamos resultados. win(m)=0 -> mano ganadora.
    if j==1    %Ganamos mano.
        dinero=dinero+ap;
        pgg(m)=1;  %Hemos ganado una.
    else       %Perdemos mano.
        dinero=dinero-2.*ap; 
        ppp(m)=1;  %Hemos perdido una.
    end
    if r(m)<=12     %ESTRATEGIA! cambiamos a otras docenas. (no var�a probabilidades).
        g=[13:36];
    elseif r(m)>12 & r(m)<=24
        g=[1:12,25:36];
    else
        g=[1:24];
    end
    mano=g;
    jj(m)=dinero;  %Evoluci�n de nuestro dinero.
    plot(m,dinero,'*k');
    axis equal
    hold on
end
plot(ll,jj)
grid on
pg=sum(pgg)./m;
pp=sum(ppp)./m;
disp('NOTA: win(i)=0 entonces la mano es ganadora')

