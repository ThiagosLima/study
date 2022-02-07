let leap_year year = 
    let divisibleBy x = year mod x = 0 in
    divisibleBy 4 <> divisibleBy 100 <> divisibleBy 400