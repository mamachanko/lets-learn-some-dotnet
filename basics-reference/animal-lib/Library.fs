namespace animal_lib

module AnimalCompendium =

    let dog = "🐶"
    let cat = "🐱"
    let octopus = "🐙"

    let Identify (feature: string): List<string> =
        match feature with
        | "barks" -> [dog]
        | "meows" -> [cat]
        | "walks" -> [dog; cat]
        | "swims" -> [octopus]
        | _ -> []
