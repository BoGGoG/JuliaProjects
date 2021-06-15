include("Euler.jl")
using Plots

t0 = 0
x0 = 1
dt = 0.001

f(t,x) = t*sin(x)

t_sol, x_sol = euler_solve(f, t0, x0, dt, 1000)
plot(t_sol, x_sol)

g(t,x) = t*x*sin(0.4 - x)^2 + 0.2*x^(-2)*exp(1/5*x^2*cos(x))
t_sol2Euler, x_sol2Euler = DEQ_evolve(g, t0, x0, dt, 10000, euler_step)
t_sol2RK, x_sol2RK = DEQ_evolve(g, t0, x0, dt, 10000, RK4_step)

plot(t_sol2Euler, x_sol2Euler)
plot!(t_sol2RK, x_sol2RK)
