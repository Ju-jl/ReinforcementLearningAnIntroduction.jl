using Ju
using StatsBase:mean
using Plots
gr()



function run_once(b)
    distribution = randn(b)
    ȳ = mean(distribution)
    [abs(e - ȳ) for e in Reductions((ŷ, i) -> ŷ + (distribution[rand(1:b)] - ŷ) / i, 1:2*b)]
end

function fig_8_7(fig_dir=".", n_runs = 100)
    p = plot(legend=:topright, dpi=200)
    for b in [2, 10, 100, 1000]
        rms = mean(run_once(b) for _ in 1:n_runs)
        xs = (1:2*b) ./ b
        plot!(p, xs, rms, label="b=$b")
    end
    savefig(p, joinpath(fig_dir, "figure_8_7.png"))
    p
end