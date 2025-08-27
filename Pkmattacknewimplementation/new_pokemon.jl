using Pkg
Pkg.activate(@__DIR__) 
Pkg.instantiate() 

#Types: Normal, Fire, Water, Electric, Grass, Ice, Fighting, Poison, Ground
# Effectiveness: no_effect, not_very_effective, normal_effective, super_effective

function pokemon_vs(att::String, def::String)
    if att == "Fire" && def == "Water"
        return "not very effective"
    elseif att == "Fire" && def == "Grass"
        return "super effective"
    elseif att == "Fire" && def == "Ice"
        return "super effective"
    elseif att == "Water" && def == "Fire"
        return "super effective"
    elseif att == "Water" && def == "Grass"
        return "not very effective"
    elseif att == "Water" && def == "Ground"
        return "super effective"
    elseif att == "Electric" && def == "Water"
        return "super effective"
    elseif att == "Electric" && def == "Grass"
        return "not very effective"
    elseif att == "Electric" && def == "Ground"
        return "not effective"
    elseif att == "Grass" && def == "Fire"
        return "not very effective"
    elseif att == "Grass" && def == "Water"
        return "super effective"
    elseif att == "Grass" && def == "Poison"
        return "not_very_effective"
    elseif att == "Grass" && def == "Ground"
        return "super effective"
    elseif att == "Ice" && def == "Fire"
        return "not very effective"
    elseif att == "Ice" && def == "Water"
        return "not very effect"
    elseif att == "Ice" && def == "Grass"
        return "super effective"
    elseif att == "Ice" && def == "Ground"
        return "super effective"
    elseif att == "Fighting" && def == "Normal"
        return "super effective"
    elseif att == "Fighting" && def == "Ice"
        return "super effective"
    elseif att == "Fighting" && def == "Poison"
        return "not very effective"
    elseif att == "Poison" && def == "Grass"
        return "super effective"
    elseif att == "Poison" && def == "Ground"
        return "not very effective"
    elseif att == "Ground" && def == "Fire"
        return "super effective"
    elseif att == "Ground" && def == "Electric"
        return "super effective"
    elseif att == "Ground" && def == "Grass"
        return "not very effective"
    elseif att == "Ground" && def == "Poison"
        return "super effective"
    elseif att == def in ["Normal", "Fighting", "Ground"]
        return "not very effective"
    elseif att == def in ["Fire", "Water", "Electric", "Grass", "Ice", "Poison"]
        return "not very effective"
    elseif att in ["Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground"] && def in ["Normal", "Fire", "Water", "Electric", "Grass", "Ice", "Fighting", "Poison", "Ground"]
        return "normal effective"
    else
        return "Error"
    end
end

function attack(att, def)
    effectiveness= pokemon_vs("$att", "$def")
    println("A Pokemon Type $att attacked a Pokemon Type $def.")
    println("The attack was $effectiveness.")
end

