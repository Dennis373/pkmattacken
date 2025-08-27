import Trebuchet as Trebuchets
struct Enviroment
 wind::Float64
 target_distance::Float64
end

mutable struct Trebuchet <: AbstractVector{Float64}
 counterweight::Float64
 release_angle::Float64
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