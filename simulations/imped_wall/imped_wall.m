%
% imped_wall.m
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

prefix = 'Z5pj_';

% geometry
L = 1; % y length

% freq-related
f = 440;
w = 2*pi*f;
c = 343;

% k = w/c;
k = 10;

% boundary condition
Z = j;
Y = 1/Z;

% ky finding
N = 10;
n_vect = 1:N;

alphan2 = pi/L*n_vect;

ky_vect = sqrt(diag(j*k*L*Y*eye(N) + diag(alphan2)));

% plotting
y = 0:0.01:1;
for n=n_vect
    ky = ky_vect(n);
	if ky > k
		mode_type = '[propagatif]';
	else
		mode_type = '[evanescent]';
	end

	close all;

    plot(cos(ky*y), y);
	title(['n=' num2str(n) ' ' mode_type]);
	grid on;
	ylabel('y');
    print('-dpng', [prefix 'imped_n' num2str(n) '.png']);
end

