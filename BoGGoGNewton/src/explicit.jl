@inline newton_step(f::Function, x::Float64)::Float64 = x - f(x) / f'(x)

function newton_func(func, x_0::Float64; eps = 1e-5)
    x_1 = newton_step(func, x_0)
    abs(x_1 - x_0) < eps ? x_1 : newton_func(func, x_1, eps=eps)
end

function newton_it(func::Function, x0::Float64; eps = 1e-8, maxit = 1000)
    x1::Float64 = Inf
    i = 0
    while abs2(x1 - x0) < eps && i < maxit 
        x0 = x_1
        x1 = newton_step(func, x0)
        i += 1
    end
    return x1
end
