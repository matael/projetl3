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

% hauteur du guide et nombre d'onde
L = 1;
k = 10;

% impédance en paroi
imped_str = input('wall impedance : ', 's');
Z = eval(imped_str)
% Z = 5+j;
Y = 1/Z;

% shortcut
K = k*L;

% modes troncation
N = 10;

alphan = zeros(1,N);
for n=(0:N-1)
	alphan(n+1) = n*pi/L;
end

A = j*K*Y*ones(N)+diag(alphan.^2)

[eigvect, eigval] = eig(A);

% tracé des modes (Re/Im)
eigval_vect = diag(eigval);

figure;
plot(real(eigval_vect), imag(eigval_vect));

