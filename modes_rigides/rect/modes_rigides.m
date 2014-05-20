%
% modes_rigides.m
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


h = 1;

Ny = 100; % échantillonage axe y
y = linspace(0,h,Ny);

Nmodes = 14;

Nfigures= (Nmodes/14);
for i=(1:Nfigures)
	figure(i);
	for j=(1:Nmodes/Nfigures)
		subplot(2,Nmodes/(2*Nfigures),j);

		j = j + (i-1)*(Nmodes/Nfigures); % récupération du bon numéro de mode
		plot(eigfun_rect_rigd(h,j)(y), y);
		xlabel(['mode ' num2str(j)]);
		set(gca, 'xtick', [0]);
		grid on;
	end
	print('-dpng', ['figure' num2str(i) '.png']);
end
