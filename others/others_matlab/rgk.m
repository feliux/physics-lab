function [t,X,Y,Z,Vx,Vy,Vz]=rgk(r0,v0,t0,tf,h)
%Cambiamos l�nea 1,8,11,12,13,23,52,53,59,60 y las gr�ficas
t=t0:h:tf;                      %%Rango de tiempo.
x=r0(1); y=r0(2); z=r0(3);      %%Posiciones iniciales
vx=v0(1); vy=v0(2); vz=v0(3);   %%Velocidades iniciales
X=[x];         %Almacenamos posiciones x(t)
Y=[y];         %Almacenamos posiciones y(t)
Z=[z];                  %Cambio: almacenamos posiciones z(t)
Vx=[vx];       %Almacenamos velocidades vx(t)
Vy=[vy];       %Almacenamos velocidades vy(t)
Vz=[vz];                %Cambio almacenamos velocidades vy(t)
fprintf(1,'\nTiempo     |    x(t)      |     y(t)     |       z(t)      |        vx(t)      |     vy(t)    |       vz(t)')
fprintf(1,'\r\n%e      %e       %e       %e       %e       %e       %e',t(1),x,y,z,vx,vy,vz)
%%%%%%%
%%%%%%%%Describimos el sistema de ecuaciones diferenciales
%Los valores constantes (E,B,q,m) ya est�n inscritos.
%Para cambiar par�metros redefinir el sistema.
%%%E=[0,1,0]   B=[0,0,1]
%%%q=+-1.6*10^-19 (+positr�n,-electr�n)  m=9.109*10^-31
xp=inline('vxx');     %Derivada de x = vxt
vxp=inline('(1.6*10^-19./9.109*10^-31).*vyy'); %Derivada de vx = vxp(vy)
yp=inline('vyy');     %Derivada de y = vy
vyp=inline('(1.6*10^-19./9.109*10^-31).*(1-vxx)');  %Derivada de vy = vyp(vx)
zp=inline('vzz'); %%Cambio linea 21: definimos ec diferencial para calcular z
%%%%%%%%%%
%%%%%%%%%%Par�metros de Runge-Kutta
%%%%%%%%%%
for i=2:length(t) %length(t)-1 ya que queremos hasta 2*10^-12. Sin -1 ser�a 2*10^-12+h
    k1=xp(vx);
    l1=vxp(vy);
    q1=yp(vy);
    m1=vyp(vx);
    k2=xp(vx+h*l1/2);
    l2=vxp(vy+h*m1/2);
    q2=yp(vy+h*m1/2);
    m2=vyp(vx+h*l1/2);
    k3=xp(vx+h*l2/2);
    l3=vxp(vy+h*m2/2);
    q3=yp(vy+h*m2/2);
    m3=vyp(vx+h*l2/2);
    k4=xp(vx+h*l3);
    l4=vxp(vy+h*m3);
    q4=yp(vy+h*m3);
    m4=vyp(vx+h*l3);
    %%%%%Posici�n x
    x=x+h*(k1+2*k2+2*k3+k4)/6; %Nueva posici�n inicial x
    X=[X;x];
    %%%%%Posici�n y
    y=y+h*(q1+2*q2+2*q3+q4)/6; %Nueva posici�n inicial y
    Y=[Y;y];
    %%%%%Posici�n z
    z=z+h*vz;  %No calculamos par�metros s pues sabemos que no cambiar�n. vz=1, a=0
    Z=[Z;z];
    %%%%%%%Velocidades
    vx=vx+h*(l1+2*l2+2*l3+l4)/6; %Nueva velocidad inicial vx
    Vx=[Vx;vx];
    vy=vy+h*(m1+2*m2+2*m3+m4)/6; %Nueva velocidad inicial vy
    Vy=[Vy;vy];
    Vz=[Vz;vz]; %Vz se mantendr� constante.
    fprintf(1,'\r\n%e      %e       %e       %e       %e       %e       %e',t(i),x,y,z,vx,vy,vz)
end
figure(2)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(t,X)
title('Posici�n x frente al tiempo')
xlabel('Tiempo t')
ylabel('Posici�n x(t)')
grid on
figure(3)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(t,Y)
title('Posici�n y frente al tiempo')
xlabel('Tiempo t')
ylabel('Posici�n y(t)')
grid on
figure(4)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(t,Z)
title('Posici�n z frente al tiempo')
xlabel('Tiempo t')
ylabel('Posici�n z(t)')
grid on
figure(5)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot3(X,Y,Z)
title('Trayectoria de la part�cula xyz')
xlabel('Posici�n x')
ylabel('Posici�n y')
zlabel('Posici�n z')
grid on
t=t';