using Pkg              # Pkg is the package manager
Pkg.activate(@__DIR__) # activates environment in this folder
Pkg.instantiate()      # downloads all packages if missing

import Trebuchet as Trebuchets # imports package under a different name
using ForwardDiff: gradient    # only imports the name `gradient` from package ForwardDiff

# definitions for structures
struct Environment
    wind::Float64
    target_distance::Float64
end

mutable struct Trebuchet <: AbstractVector{Float64}
    counterweight::Float64
    release_angle::Float64
end

# add methods to Base functions
function Base.size(t::Trebuchet)
    return tuple(2) # tuple(2) == (2,)
end
function Base.getindex(t::Trebuchet, idx::Integer)
    if idx == 1
        return t.counterweight
    elseif idx == 2
        return t.release_angle
    else
        error("Trebuchet only accepts indices 1 and 2, yours is $idx")
    end
end
function Base.setindex!(t::Trebuchet, value, idx::Integer)
    if idx == 1
        t.counterweight = value
    elseif idx == 2
        t.release_angle = value
    else
        error("Trebuchet only accepts indices 1 and 2, yours is $idx")
    end
end

# create objects
environment = Environment(5, 100)
trebuchet = Trebuchet(500, 0.25pi)

# define functions
function shoot_distance(windspeed, angle, weight)
    Trebuchets.shoot(windspeed, angle, weight)[2]
end

function shoot_distance(trebuchet::Trebuchet, environment::Environment)
    shoot_distance(environment.wind, trebuchet.release_angle, trebuchet.counterweight)
end

function shoot_distance(args...) # slurping
    Trebuchets.shoot(args...)[2] # splatting
end

# Anonymous functions

# short form
 (windspeed, angle, weight) -> Trebuchets.shoot(windspeed, angle, weight)[2]

 # long form

 function (windspeed, angle, weight)
    Trebuchets.shoot(windspeed, angle, weight)[2]
 end

# Experiments

# Random search
N = 100
weights = [rand() * 500 for _ in 1:N]
angles  = [rand() * pi/2 for _ in 1:N]
distances = [shoot_distance(Trebuchet(weights[i], angles[i]), environment) for i in 1:N]
closeness = distances .- environment.target_distance
min_index = findmin(abs.(closeness))
best_hit  = (min_distance = min_index[1], min_weight = weights[min_index[2]], min_angle = angles[min_index[2]])

# Gradient descent

function closenes(trebuchet, environment::Environment)
    shoot_distance([environment.wind, trebuchet[2], trebuchet[1]]) - environment.target_distance
end
grad = gradient(x -> closenes(x, environment), trebuchet)

better_trebuchet = trebuchet - 0.005 * grad
shoot_distance([environment.wind, better_trebuchet[2], better_trebuchet[1]])

function aim(trebuchet, environment; epsilon = 0.1, eta = 0.05)
    better_trebuchet = copy(trebuchet)
    while abs(closenes(better_trebuchet, environment)) > epsilon
        grad = gradient(x -> closenes(x, environment), better_trebuchet)
        better_trebuchet -= eta * grad
    end
    return Trebuchet(better_trebuchet[1], better_trebuchet[2])
end

better_trebuchet = aim(trebuchet, environment)
shoot_distance(better_trebuchet, environment)