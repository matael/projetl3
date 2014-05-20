%
% rect3.m
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

Ly = 1;
Lx = 1;

k = 10;
N = 10; % nombre de modes à matcher en y

Y = -j;
K = Ly*k;
f = @(ky) tan(ky*Ly) - j*K*Y./ky;
f_p = @(ky) Ly./(cos(ky*Ly)).^2 + j*K*Y./(ky).^2;

search_zeros;

x = linspace(-Lx/2,Lx/2,75);
y = linspace(-Ly/2,Ly/2,75);

[xx, yy] = meshgrid(x,y);

m_v = (0:3);
n_v = uniquify(eigfun_zeros, 0.5*10^-5);

% strip negatives
n_v = nonzeros((n_v >= 0).*n_v)';

i = 1;

for m=m_v
	fct_x = cos(m*pi/Lx*xx);
	for n=n_v
		fct_y = cos(n*yy);

		subplot(length(m_v), length(n_v), i);
		imagesc(xx,yy,fct_y.*fct_x);

		set(gca, 'xtick', []);
		set(gca, 'ytick', []);

		if (m==0)
			title(['n=' num2str(n)]);
		end
		if n==1
			ylabel(['m=' num2str(m)]);
		end

		i = i+1;
	end
end
