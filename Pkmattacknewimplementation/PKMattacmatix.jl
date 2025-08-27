# Matrix
A = ["Angreifer/Verteidiger" "Normal" "Feuer" "Wasser" "Elektro" "Pflanze" "Eis" "Kampf" "Gift" "Boden";
     "Normal" 1 1 1 1 1 1 1 1 1;
     "Feuer" 1 0.5 0.5 1 2 2 1 1 1;
     "Wasser" 1 2 0.5 1 0.5 1 1 1 2;
     "Elektro" 1 1 2 0.5 0.5 1 1 1 0;
     "Pflanze" 1 0.5 2 1 0.5 1 1 0.5 2;
     "Eis" 1 0.5 0.5 1 2 0.5 1 1 2;
     "Kampf" 2 1 1 1 1 2 1 0.5 1;
     "Gift" 1 1 1 1 2 1 1 0.5 0.5;
     "Boden" 1 2 1 2 0.5 1 1 2 1]

# Datenbereich und Beschriftungen
daten = A[2:end, 2:end]        # Nur Zahlen
angreifer_list = A[2:end, 1]   # Zeilenbeschriftungen
verteidiger_list = A[1, 2:end] # Spaltenbeschriftungen

# Funktion definieren
function effekt(angreifer::String, verteidiger::String)
    # Zeilen- und Spaltenindex finden
    i = findfirst(x -> x == angreifer, angreifer_list)
    j = findfirst(x -> x == verteidiger, verteidiger_list)
    
    if i === nothing || j === nothing
        return "Ungültiger Typ!"
    end
    
    # Wert auslesen
    wert = daten[i,j]
    
    # Beschreibung
    beschreibung = ""
    if wert == 2
        beschreibung = "sehr effektiv"
    elseif wert == 1
        beschreibung = "normal effektiv"
    elseif wert == 0.5
        beschreibung = "nicht sehr effektiv"
    elseif wert == 0
        beschreibung = "kein Effekt"
    else
        beschreibung = "unbekannter Wert"
    end
    
    return "$angreifer gegen $verteidiger -> $beschreibung"
end


effekt("Eis", "Eis")
