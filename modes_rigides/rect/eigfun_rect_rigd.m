%
% eigfun_rect_rigd.m
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

% ==================
% Fonctions propres pour un guide d'onde rectangulaire en modes rigides symétriques

function [f] = eigfun_rect_rigd(h,n)
	% Guide rectangulaire 2D
	% h : hauteur
	% n : ordre du mode

	f = @(x) cos(n.*pi/h.*x);
end
