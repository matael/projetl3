# geometry
L = 10 # y length

*(a::Function, b::Function) = c::Function(args...) = a(args...)*b(args...)

# freq-related
f = 440
w = 2*pi*f
c = 343

k = w/c

# boundary condition
Z = -5+im
Y = 1/Z

N = 10;
n_vect = 1:N

psin(n) = y -> cos(n*pi/L*y)
psi = [psin(n) for n=n_vect]



