using Plots
using ForwardDiff

function newton_step(func, x_0)
    x_0 - func(x_0) / ForwardDiff.derivative(func, x_0)
end

function newton_func(func, x_0, eps = 1e-5)
    x_1 = newton_step(func, x_0)
    abs(x_1 - x_0) < eps ? x_1 : newton_func(func, x_1, eps)
    end
end

function newton_it(func, x_0, eps = 1e-5)
    while true
        x_1 = newton_step(func, x_0)
        if abs(x_1 - x_0) < eps
            return x_1
        end
        x_0 = x_1
    end
end

foo(x) = sin(x + 0.2) + x/4

x_guess = 1.3
x_zero = newton_func(foo, x_guess, 0.1)

plot(foo, -5:0.1:5)
plot!(x -> 0, -5:5)
scatter!([x_zero], [foo(x_zero)])

@time newton_it(foo, x_guess, 1e-10)
@time newton_func(foo, x_guess, 1e-10)
