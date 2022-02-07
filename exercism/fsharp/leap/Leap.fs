module Leap

let leapYear (year: int): bool = 
    let divisibleBy x = (year % x) = 0
    divisibleBy 4 <> divisibleBy 100 <> divisibleBy 400