%
% modes_zplane.m
%
% Copyright (C) 2014 Mathieu Gaborit (matael) <mathieu@matael.org>
%
%
% Distributed under WTFPL terms
%
%            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
%                    Version 2, December 2004
%
% Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>
%
% Everyone is permitted to copy and distribute verbatim or modified
% copies of this license document, and changing it is allowed as long
% as the name is changed.
%
%            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
%   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
%
%  0. You just DO WHAT THE FUCK YOU WANT TO.
%

clear all;
close all;

% run name
run_name = input('Please enter run indentifier : ','s');

% hauteur du guide et nombre d'onde
L = 1;
k = 10;

% impédance en paroi
% imped_str = input('wall impedance : ', 's');
% Z = eval(imped_str)
% Y = 1/Z;

% shortcut
K = k*L;

% modes troncation
N = 30;

% choose range of impedance variation
pas = 0.2e-2;
maxi = .1;
re_part = (0:pas:maxi);
im_part = [-1];

global_mat = []
i = 0;
for re=re_part
	for im=im_part

		% Z = re+j*im;
		% Y = 1/Z;
		Y = re+j*im;

		% on considère des eigenfun de la forme cos(n pi/L)
		% guide 2D rigide
		% alphan = zeros(1,N);
		% for n=(0:N-1)
		% 	alphan(n+1) = n*pi/L;
		% end
		alphan = (0:N-1)*pi/L;

		% A = [jKY I + diag(alpha_n^2)]
		A = j*K*Y*ones(N)+diag(alphan.^2);

		[eigvect, eigval] = eig(A);

		% tracé des modes (Re/Im)
		eigval_vect = diag(eigval);
		% ajout à la matrice globale
		global_mat = [global_mat, eigval_vect];

		% string = sprintf('%3d_Zplane_modes_%f_%fj', i, re, im);
		string = sprintf('%3d', i);
		string(string == ' ') = '0'; % remplace ' ' par '0'
		save([run_name '/data/' string '.data'], 'eigval_vect');

		figure;
		plot(real(eigval_vect), imag(eigval_vect), '+');
		grid on;
		% xlim([0 1000]);
		ylim([0 4]);
		title_str = sprintf('%f + %f j', re, im);
		title(title_str);
		print('-dpng', [run_name '/' string '.png']);
		i = i+1;
	end
end

figure;

plot3(repmat((0:length(global_mat)-1),30,1), real(global_mat), imag(global_mat), 'b')
xlabel('iters')
ylabel('\Re')
zlabel('\Im')
grid on;
