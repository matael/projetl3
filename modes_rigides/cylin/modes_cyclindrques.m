%
% modes_cyclindrques.m
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

r = 1;
N_r = 100; % echant en R;

N_theta = 100; % echant en theta

N_m = 4; % nombre de modes radiaux
N_n = 4; % nombre de modes azimutaux

theta_v = linspace(0,2*pi, N_theta);
r_v = linspace(0,r, N_r);

% besselzero = [
% 	[2.40482555769577, 5.52007811028631, 8.65372791291101, 11.7915344390142, 14.9309177084877],
% 	[3.83170597020751, 7.01558666981561, 10.1734681350627, 13.3236919363142, 16.4706300508776],
% 	[5.13562230184068, 8.41724414039986, 11.6198411721490, 14.7959517823512, 17.9598194949878],
% 	[6.38016189592398, 9.76102312998166, 13.0152007216984, 16.2234661603187, 19.4094152264350],
% 	[7.58834243450380, 11.0647094885011, 14.3725366716175, 17.6159660498048, 20.8269329569623],
% 	[8.77148381595995, 12.3386041974669, 15.7001740797116, 18.9801338751799, 22.2177998965612],
% 	[9.93610952421768, 13.5892901705412, 17.0038196678160, 20.3207892135665, 23.5860844355813],
% 	[11.0863700192450, 14.8212687270131, 18.2875828324817, 21.6415410198484, 24.9349278876730],
% 	[12.2250922640046, 16.0377741908877, 19.5545364309970, 22.9451731318746, 26.2668146411766],
% 	[13.3543004774353, 17.2412203824891, 20.8070477892641, 24.2338852577505, 27.5837489635730],
% 	[14.4755006865545, 18.4334636669665, 22.0469853646978, 25.5094505541828, 28.8873750635304]
% ];

besselzero = [
	0 3.83 7.02 10.17;
	1.84 5.33 8.54 11.71;
	3.05 6.71 9.97 13.17;
	4.2 8.02 11.35 14.59
]*1/r;

[tt,rr] = meshgrid(theta_v, r_v);
xx = rr*cos(tt);
yy = rr*sin(tt);

for m=1:N_m
	for n=1:N_n
		res = besselj(m-1,besselzero(m,n)*rr);
		figure;
		mesh(xx,yy,abs(res));
		title(['Mode (' num2str(m) ',' num2str(n) ')']);
		print('-dpng', ['figure_' num2str(m) num2str(n)]);
	end
end
