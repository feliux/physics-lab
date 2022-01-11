function dibujatrayectoria3D(r,w,vz)
%Dibuja la trayectoria circular en 3D de una part�cula conociendo
%su velocidad angular 'w' y el radio de giro 'r'. Adem�s dibuja los
%vecotres velocidad 'vx' 'vy' 'vz'. vz=cte
[x,y,vx,vy]=dibujaMUC(r,w);  %Recurre a la funci�n dibujaMUC
t=[0:0.01:2*pi];
z=t;
vzz=[];  %Matriz vzz
for i=1:length(z)  
    vzz(i)=vz;   %vz es un vector constante.
end
figure(2)
plot3(x,y,z,'k');
hold on;
quiver3(x,y,z,vx,vy,vzz,'r')  %Vectores velocidad