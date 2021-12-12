function dibujo_parabola
%Gr�fica de un tiro parab�lico con una v.inicial=60m/s y �ngulo(theta)=45�
%x=v0.*cosd(theta).*t
%y=v0.*sind(theta).*t-0.5.*g.*t.^2
g=9.8;
v0=60;
theta=45;
%calculo el tiempo m�ximo aplicando alcance2.
tmaximo=alcance2(v0,theta);
%ahora divido el tiempo m�ximo en 50 tramos: t=linspace(0,tmaximo,50)
t=linspace(0,tmaximo,50);
x=v0*cosd(theta).*t;
y=v0*sind(theta).*t-0.5*g.*t.^2;
plot(x,0)  %Dibujo el suelo.
hold on
pause(1)   %Espero 1 seg.
plot(x,y)
xlabel('Alcance')
ylabel('Altura')
title('Gr�fica tiro parab�lico')
