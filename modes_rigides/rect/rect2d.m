%
% rect3d.m
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

Ly = 2;

y = linspace(0,Ly,75);

n_v = (0:3);

for n=n_v
	fct_y = cos(n*pi/Ly*y);

	subplot(1, length(n_v), 1+n);

	plot(fct_y, y, 'linewidth', 2);

	grid on;
	title(['n=' num2str(n)])
	xlabel(['Y_' num2str(n) '(y)'])
	xlim([-1.5, 1.5])
	set(gca, 'xtick', [0]);
	set(gca, 'ytick', []);
end
	subplot(1, length(n_v), 1);
	ylabel('y');

print('-dpng', '-S1000,600', 'modes_rect2rigid.png')
