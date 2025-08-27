# Abstract type für alle Pokémon-Typen
abstract type PokemonType end

# Concrete Subtypen
struct Normaln <: PokemonType end
struct Fire <: PokemonType end
struct Water <: PokemonType end
struct Electric <: PokemonType end
struct Grass <: PokemonType end
struct Ice <: PokemonType end
struct Fighting <: PokemonType end
struct Poison <: PokemonType end
struct Ground <: PokemonType end




