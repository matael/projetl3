%
% somme_modes.m
%
% Copyright (C) 2014 Mathieu Gaborit (matael) <mathieu@matael.org>
%
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.
%

clear all;
close all;

% Mode dans un guide infini rigide-rigide sans source.

c = 343; % célérité du son

f = 440; % fréquence
w = 2*pi*f;
k = w/c;

N = 10;
A = ones(1,N);

L = 100;

y_vect = 0:0.1:L;
x_vect = 0:100;
t_vect = 0:1/(10*f):1/f;

[xx, yy] = meshgrid(x_vect,y_vect);

modes_vect = [1,3,5,7,9];

% crée une image du champ de pression en y pour chaque mode
for n1_idx=modes_vect
	n1 = n1_idx -1; 	% n_idx est utilisé pour les références dans les tableaux
					% n sert dans les calculs
	n2 = n1+1; 			% on prend les modes deux par deux.
	n2_idx = n1_idx;

	kx1 = sqrt(k^2-(n1*pi/L)^2);
	kx2 = sqrt(k^2-(n2*pi/L)^2);

	eigen_fct2d= A(n1_idx)*cos(n1*pi/L*y_vect) + A(n2_idx)*cos(n2*pi/L*y_vect);
	eigen_fct3d= A(n1_idx)*cos(n1*pi/L*yy) + A(n2_idx)*cos(n2*pi/L*yy);

	ptot_abs = eigen_fct3d.*abs(exp(-j*(kx1*xx+kx2*xx)));

	% figures
	close all;
	figure(1);
	%colormap(hot(250));

	subplot(211);
	plot(eigen_fct2d, y_vect);
	xlabel('Eigenfunction');
	ylabel('y');
	title(['n1=' num2str(n1) ' ; n2=' num2str(n2)]);

	subplot(212);
	imagesc(xx, yy, ptot_abs);
	xlabel('x');
	ylabel('y');

	% enregistrement
 	print('-dpng', ['rigiderigide_somme' num2str(n1) '_' num2str(n2) '.png']);
end



