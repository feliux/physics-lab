function corazon
%
%Dibuja un coraz�n mediante la ecuaci�n impl�cita.
%
ezplot('(x^2+y^2-1)^3 - x^2*y^3=0',[-1.5,1.5,-1,1.5]);
set(findobj('Type','line'),'Color',[.50 .0 .0],'Linewidth', 3);