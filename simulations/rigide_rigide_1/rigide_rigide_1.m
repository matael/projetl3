%
% rigide_rigide_1.m
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

N = 1;
A = [1];

L = 5;

y_vect = 0:0.1:L;
x_vect = 0:100;
t_vect = 0:1/(10*f):1/f;

[xx, yy] = meshgrid(x_vect,y_vect);

i = 0;

for t=t_vect
	ptot = zeros(length(x_vect),length(y_vect));


	for ix=1:length(x_vect)
		for iy=1:length(y_vect)
			for n=1:N
				kx = sqrt(k^2 - (pi*n/L)^2);
				ptot(iy,ix) = ptot(ix,iy) + A(n).*cos(pi*n/L*y_vect(iy)).*exp(w*t - kx*x_vect(ix));
			end
		end
	end

	close all;
	imagesc(xx,yy,ptot);
	print('-dpng', ['rigiderigide_' num2str(i) '.png']);

	i = i+1;
end
