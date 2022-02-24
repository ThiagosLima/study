module TwoFer

let twoFer (input: string option): string =
    let person = match input with
                 | None -> "you"
                 | Some name -> name
    $"One for {person}, one for me."