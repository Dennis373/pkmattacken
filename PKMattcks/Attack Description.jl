function eff(attacker::PokemonType, defender::PokemonType)
    if (typeof(attacker) == typeof(defender)) &&
       !(attacker isa Fighting || attacker isa Ground)
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Water && defender isa Grass
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Fire && defender isa Water
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Electric && defender isa Grass
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Grass && defender isa Fire
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Grass && defender isa Poison
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Ice && defender isa Fire
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Ice && defender isa Water
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Fighting && defender isa Poison
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Poison && defender isa Ground
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Ground && defender isa Grass
        return NOT_VERY_EFFECTIVE
    elseif attacker isa Normaln && defender isa PokemonType
        return NORMALLY_EFFECTIVE
    elseif attacker isa Fighting && defender isa Normaln
        return SUPER_EFFECTIVE
    elseif attacker isa PokemonType && defender isa Normaln
        return NORMALLY_EFFECTIVE
    elseif attacker isa Fire && defender isa Grass
        return SUPER_EFFECTIVE
    elseif attacker isa Fire && defender isa Ice
        return SUPER_EFFECTIVE
    elseif attacker isa Water && defender isa Fire
        return SUPER_EFFECTIVE
    elseif attacker isa Water && defender isa Ground
        return SUPER_EFFECTIVE
    elseif attacker isa Electric && defender isa Water
        return SUPER_EFFECTIVE
    elseif attacker isa Grass && defender isa Water
        return SUPER_EFFECTIVE
    elseif attacker isa Grass && defender isa Ground
        return SUPER_EFFECTIVE
    elseif attacker isa Ice && defender isa Grass
        return SUPER_EFFECTIVE
    elseif attacker isa Ice && defender isa Ground
        return SUPER_EFFECTIVE
    elseif attacker isa Fighting && defender isa Ice
        return SUPER_EFFECTIVE
    elseif attacker isa Poison && defender isa Grass
        return SUPER_EFFECTIVE
    elseif attacker isa Ground && defender isa Fire
        return SUPER_EFFECTIVE
    elseif attacker isa Ground && defender isa Electric
        return SUPER_EFFECTIVE
    elseif attacker isa Ground && defender isa Poison
        return SUPER_EFFECTIVE
    elseif attacker isa Electric && defender isa Ground
        return NO_EFFECT
    else
        return NORMALLY_EFFECTIVE
    end
end

println(eff(Fire(), Water()))


function eff_string(attacker::PokemonType, defender::PokemonType)
println(attacker,defender)
    if eff(attacker, defender) == SUPER_EFFECTIVE
        println("Das war sehr effektiv!")
    elseif eff(attacker, defender) == NORMALLY_EFFECTIVE
        println("Treffer")
    elseif eff(attacker, defender) == NOT_VERY_EFFECTIVE
        println("Das war nicht sehr effektiv")
    elseif eff(attacker, defender) == NO_EFFECT
        println("Die Attacke ist wirkungslos")
    end
end

eff_string(Grass(), Water())







