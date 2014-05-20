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

Lx = 1;
Ly = 1;

x = linspace(-Lx/2,Lx/2,75);
y = linspace(-Ly/2,Ly/2,75);

[xx, yy] = meshgrid(x,y);

m_v = (1:4);
n_v = (1:4);

i = 1;

for m=m_v
	fct_x = cos(m*pi/Lx*xx);
	for n=n_v
		fct_y = cos(n*pi/Ly*yy);

		subplot(max(m_v), max(n_v), max(n_v)*(m-1)+n);
		imagesc(xx,yy,fct_y.*fct_x);

		if (m==1)
			title(['n=' num2str(n-1)]);
		end
		if (m==4)
			xlabel(['n=' num2str(n-1)]);
		end
		if n==1
			ylabel(['m=' num2str(m-1)]);
		end
		set(gca, 'xtick', []);
		set(gca, 'ytick', []);

		i = i+1;
	end
end

print -dpng modes_rect3rigid.png
