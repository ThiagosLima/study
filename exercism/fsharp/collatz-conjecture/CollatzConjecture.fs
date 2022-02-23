module CollatzConjecture

let (|Even|Odd|Invalid|FinalStep|) number =
    match number with
    | 1 -> FinalStep
    | n when n <= 0 -> Invalid
    | n when n % 2 = 0 -> Even
    | _ -> Odd

let rec steps (number: int): int option =
    let addStep = Option.map ((+) 1)
    match number with
    | Invalid -> None
    | FinalStep -> Some 0
    | Even -> addStep (steps (number / 2))
    | Odd -> addStep (steps (3 * number + 1))