module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven elapsedMinutesInOven = expectedMinutesInOven - elapsedMinutesInOven

let timePerLayer = 2

let preparationTimeInMinutes numberOfLayers = numberOfLayers * timePerLayer

let elapsedTimeInMinutes numberOfLayers elapsedMinutesInOven = elapsedMinutesInOven + preparationTimeInMinutes numberOfLayers