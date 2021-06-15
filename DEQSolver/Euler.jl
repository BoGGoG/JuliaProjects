function euler_step(f, t, x, h)
    x + h * f(t,x)
end

function euler_solve(f, t0, x0, h, steps)
    x_arr = Array{Float64}(undef, steps+1)
    t_arr = t0:h:(t0+steps*h)
    x_arr[1] = x0
    for step in 1:steps
        x_arr[step+1] = euler_step(f, t_arr[step], x_arr[step], h)
    end
    [t_arr, x_arr]
end

function DEQ_evolve(f, t0, x0, h, steps, step_method = euler_step)
    x_arr = Array{Float64}(undef, steps+1)
    t_arr = t0:h:(t0+steps*h)
    x_arr[1] = x0
    for step in 1:steps
        x_arr[step+1] = step_method(f, t_arr[step], x_arr[step], h)
    end
    [t_arr, x_arr]
end
