%
% multifreq1.m
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

c = 343;
alpha  = 42; % paramètre de la gaussienne
A = 1; % amplitude

L = 100; % longueur du guide
l = 20; % hauteur du guide

F = @(w) 1/(2*sqrt(alpha*pi))*exp(-w.^2/(4*alpha));
k = @(w) w./c;
kx = @(w,n) sqrt((k(w)).^2-(n*pi/L)^2);

n_vect = [2];

y_vect = 0:0.2:l;
x_vect = 0:10:L;
t_vect = 0:.02:4;

% [xx, yy] = meshgrid(x_vect, y_vect);
[tt, yy] = meshgrid(t_vect, y_vect);

eigen_fun = @(y) cos(n_vect(1)*pi/L*y);

ptot = @(w,x,y,n,t) A*F(w).*eigen_fun(y).*abs(exp(-j*k(w,n)*x).*exp(j*w*t));

i = 0;

for x=x_vect

	ptot_map = zeros(length(y_vect), length(t_vect));

	for id_t=1:length(t_vect)
		for id_y=1:length(y_vect)
			ptot_curried = @(w) ptot(w,x, y_vect(id_y), n_vect(1),t_vect(id_t));
			ptot_map(id_y,id_t) = quadgk(ptot_curried, -50, 50);
		end
	end
	imagesc(tt, yy, ptot_map);
	print('-dpng', ['multifreq_' num2str(i) '.png']);
	i = i+1;
end


