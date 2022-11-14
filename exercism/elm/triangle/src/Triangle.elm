module Triangle exposing (Triangle(..), triangleKind)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    let
        isValidLength =
            x > 0 && y > 0 && z > 0

        isValidInequality =
            x <= y + z && y <= x + z && z <= x + y

        isEquilateral =
            x == y && y == z

        isScalene =
            x /= y && y /= z && x /= z
    in
    if not isValidLength then
        Err "Invalid lengths"

    else if not isValidInequality then
        Err "Violates inequality"

    else if isEquilateral then
        Ok Equilateral

    else if isScalene then
        Ok Scalene

    else
        Ok Isosceles
