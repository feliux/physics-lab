function [media,desviacion]=medesv1(x)
%Funci�n.
%Da el valor medio y la desviacion estandar del vector 'x'.
n=length(x)
media=sum(x)/n
desviacion=sqrt(sum((x-media).^2)/n)