using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()
import Trebuchet as Trebuchets
using ForwardDiff: gradient

struct Enviroment
 wind::Float64
 target_distance::Float64
end

function Base.getindex(t::Trebuchet, idx::Integer)
    if idx == 1
        return t.counterweight 
    elseif idx == 2
       return t.release_angle 
    else error("Trebuchet only accepts indices 1 and 2, yours is $idx")
    end
end

function Base.setindex!(t::Trebuchet, value, idx::Integer)
    if idx == 1
        t.counterweight = value
    elseif idx == 2
        t.release_angle = value
    else error("Trebuchet only accepts indices 1 and 2, yours is $idx")
    end
end
mutable struct Trebuchet <: AbstractVector{Float64}
 counterweight::Float64
 release_angle::Float64
end

function Base.size(t::Trebuchet)
    return tuple(2)
end


enviroment = Enviroment(5, 100)
trebuchet = Trebuchet(500, 0.25pi)

function shoot_distance(windspeed, angle, weight )
    Trebuchets.shoot(windspeed, angle, weight)[2]
end
function shoot_distance(trebuchet::Trebuchet, enviroment::Enviroment)
    shoot_distance(enviroment.wind, trebuchet.release_angle, trebuchet.counterweight)
end

function shoot_distance(args...) # slurping
    Trebuchets.shoot(args...)[2] # slatting
end

# Anonymous functions

# short form
(windspeed, angle, weight) -> Trebuchets.shoot(windspeed, angle. weight)[2]

# long form

function (windspeed, angle, weight)
    Trebuchets.shoot(windspeed, angle, weight)[2]
end

N = 10
weights = [rand()*500 for _ in 1:N]
angles = [rand()*pi/2 for _ in 1:N]
distances = [shoot_distance(Trebuchet(weights[i], angles[i]), enviroment) for i in 1:N]
closeness = distances .- enviroment.target_distance
min_index = findmin(abs.(closeness))
best_hit = (min_distance = min_index[1], min_weight = weights[min_index[2]], min_angles[min_index[2]])

#Gradient descend

function closenes(trebuchet::Trebuchet, enviroment::Enviroment)
    shoot_distance([enviroment, wind, trebuchet[2], trebuchet[1]]) - enviroment.target_distance
end
gradient(x -> closenes(x, enviroment), trebuchet)

better_trebouchet = trebuchet - 0.005 * grad
shoot_distance([enviroment.wind, better_trebuchet[2], better_trebuchet [1], eta = 0.005])

function aim(trebuchet, enviroment; N = 5, eta = 0.005)
    better_trebouchet = copy(trebuchet)
    for _ in 1:N
        grad = gradient(x -> closeness(x, enviroment), better_trebouchet)
        better_trebuchet .= eta * grad
    end
    return Trebuchet(better_trebouchet[1], better_trebouchet[2])
end







function aim(trebuchet, enviroment; epsilon = 0.1, eta = 0.005)
    better_trebouchet = copy(trebuchet)
    while abs(closenes(better_trebuchet, enviroment)) > epsilon
        grad = gradient(x -> closeness(x, enviroment), better_trebouchet)
        better_trebuchet .= eta * grad
    end
    return Trebuchet(better_trebouchet[1], better_trebouchet[2])
end