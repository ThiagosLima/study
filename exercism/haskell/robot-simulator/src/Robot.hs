module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show, Enum)

type Coordinates = (Integer, Integer)

data Robot = Robot { bearing :: Bearing
                   , coordinates :: Coordinates 
                   }


mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move robot [] = robot
move robot (instruction:rest) = move position rest
  where position = case instruction of
                     'R' -> turnRight robot
                     'L' -> turnLeft robot
                     'A' -> advance robot

advance :: Robot -> Robot
advance (Robot direction (x, y)) = mkRobot direction newCoords
  where newCoords = case direction of
                      North -> (x, y+1)
                      East  -> (x+1, y)
                      South -> (x, y-1)
                      West  -> (x-1, y)

turnRight :: Robot -> Robot
turnRight (Robot direction coordinates) = mkRobot newDirection coordinates
  where newDirection = case direction of
                         West -> North
                         _    -> succ direction

turnLeft :: Robot -> Robot
turnLeft (Robot direction coordinates) = mkRobot newDirection coordinates
  where newDirection = case direction of
                         North -> West
                         _     -> pred direction