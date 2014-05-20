%
% search_zeros.m
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

ky_v = linspace(0,30,500);
plot(ky_v, f(ky_v));
grid on;

disp(['Choisir ' num2str(N) ' points pour le départ de N-R']);
[x0_points, useless_y] = ginput(N)

zs = zeros(N,1);

error_limit = 0.5e-5;

i = 1;
eigfun_zeros = zeros(1,N);
for x=x0_points'
	while abs(f(x))>error_limit
		x = x - f(x)/f_p(x);
	end
	eigfun_zeros(i) = x;
	i = i + 1;
end

