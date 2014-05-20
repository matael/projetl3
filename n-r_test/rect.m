%
% rect.m
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

Z = j;
Y = 1/Z;
Ly = 1;

c =  343;

pas = 3;
f_v = (0:pas:1e3);
w_v = f_v*2*pi;
N = length(w_v);

f = @(w) @(ky) ky*tan(ky*Ly) - j*Ly*w/c*Y;
f_d = @(w) @(ky) Ly/(cos(ky*Ly))^2 + j*Ly*w/c*Y/(ky)^2;

ky_v = ones(1,N);

i = 1;
for i=1:N
	[x, _1, _2] = newton_raphson(f(w_v(i)), f_d(w_v(i)), pi/4);
	ky_v(i) = x;
end

plot(f_v,ky_v,'+');
grid on;
xlabel('Frequences');
ylabel('ky');
