import UIKit

// Condition
// ---
// Have to find optimal set of stations which will cover all states

var stations = [
    "kone": Set(["id", "nv", "ut"]),
    "ktwo": Set(["wa", "id", "mt"]),
    "ktnree": Set(["or", "nv", "ca"]),
    "kfour": Set(["ut", "nv"]),
    "kfive": Set(["ca", "az"])
]

// states needed to cover
var statesNeeded: Set<String> = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]

func bestStations(stattions: [String : Set<String>],
                  for allStates: Set<String>) -> Set<String> {
    var finalStationsSet = Set<String>()

    while !statesNeeded.isEmpty {
        var bestStation: String? = nil
        var statesCovered: Set<String> = []

        for key in stations.keys {
            guard let statesForStation = stations[key] else { return [] }
            let covered = statesNeeded.intersection(statesForStation)

            // this one cover more
            if covered.count > statesCovered.count {
                bestStation = key
                statesCovered = covered
            }
        }

        statesNeeded = statesNeeded.symmetricDifference(statesCovered)
        finalStationsSet.insert(bestStation!)
    }
    
    return finalStationsSet
}

// MARK: - Usage

bestStations(stattions: stations, for: statesNeeded)
