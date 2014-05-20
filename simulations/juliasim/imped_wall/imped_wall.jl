#
# imped_wall.jl
#
# Copyright (C) 2014 Mathieu Gaborit (matael) <mathieu@matael.org>
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# Mode dans un guide infini rigide-imped sans source.

c = 343 # célérité du son

f = 440 # fréquence
w = 2*pi*f
k = w/c

N = 10
A = ones(1,N)

L = 100

y_vect = 0:0.1:L
x_vect = 0:100
t_vect = 0:1/(10*f):1/f

[xx, yy] = meshgrid(x_vect,y_vect)


# crée une image du champ de pression en y pour chaque mode
for n_idx=1:N
	n = n_idx -1 	# n_idx est utilisé pour les références dans les tableaux
					# n sert dans les calculs
	kx = sqrt(k^2-(n*pi/L)^2)

	eigen_fct2d= cos(n*pi/L*y_vect)
	eigen_fct3d= cos(n*pi/L*yy)

	ptot_abs = A(n_idx)*eigen_fct3d.*abs(exp(-j*kx*xx))


	figure(1)
	colormap(hot(250))

	subplot(211)
	plot(eigen_fct2d, y_vect)
	xlabel('Eigenfunction')
	ylabel('y')
	title(['n=' num2str(n)])

	subplot(212)
	imagesc(xx, yy, ptot_abs)
	xlabel('x')
	ylabel('y')

	# enregistrement
 	print('-dpng', ['rigiderigide_' num2str(n) '.png'])
end
