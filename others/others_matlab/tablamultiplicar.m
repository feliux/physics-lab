function tablamultiplicar
%Dado un n�mero 'n' devuelvre por pantalla su 
%tabla de multiplicar.
%Invocaci�n: tablademultiplicar.
n=input('Inserte el n�mero del que desea conocer la tabla: ');
for i=1:10
    m(i)=n.*i;
end
fprintf(1,'La tabla de multiplicar de %d es\n',n)
disp(m')
