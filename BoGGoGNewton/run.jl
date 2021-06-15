using Pkg
using Plots
using BenchmarkTools

Pkg.activate(".")
using BoGGoGNewton

foo(x) = sin(x + 0.2) + x/4

x_guess = 1.3
x_zero = newton_func(foo, x_guess, eps = 0.1)

plot(foo, -5:0.1:5)
plot!(x -> 0, -5:5)
scatter!([x_zero], [foo(x_zero)])

@time newton_it(foo, x_guess, eps=1e-10)
@time newton_func(foo, x_guess, eps=1e-10)

@benchmark newton_it(foo, x_guess, eps=1e-10)
@benchmark newton_func(foo, x_guess, eps=1e-10)
