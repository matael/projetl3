import Winston: plot, file

# geometry
L = 10 # y length

# freq-related
f = 440
w = 2*pi*f
c = 343

k = w/c

# boundary condition
Z = -5+im
Y = 1/Z

# ky finding
N = 10;
n_vect = 1:N

alphan2 = [pi*n/L for n=n_vect]

# sqrt() pour un vecteur de complexes
import Base.sqrt
sqrt(V::Array{Complex,1}) = [sqrt(_) for _=V]

ky_vect = sqrt(convert(Array{Complex,1}, diag(im*k*L*Y*eye(N) + diagm(alphan2))))

# plotting
y = 0:0.01:1
for n=n_vect
    info("-> Calcul pour n=$n")
    ky = ky_vect[n]
    info("\t Sauvegarde en imped_n$n.png")
    p = plot(cos(ky*y), y)
    file(p,"imped_n$n.png")
end

