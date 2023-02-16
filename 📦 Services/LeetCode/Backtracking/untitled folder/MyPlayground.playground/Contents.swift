import UIKit


class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var comb = [Int]()
        var all = [[Int]]()

        calCombinationSum(candidates.sorted(), 0, target, 0, &comb, &all)
        return all
    }

    func calCombinationSum(_ candidates: [Int], _ start: Int,_ target: Int, _ sum: Int, _ comb: inout[Int], _ all: inout [[Int]]) {
        // More than target
        if target < sum {
            return
        }

        // Found a result
        if target == sum {
            all.append(comb)
            return
        }

        // Checked all elements
        if start >= candidates.count { return }

        var set = Set<Int>()

        for current in start...candidates.count-1 {
            print(current)
            if current > 0 && candidates[current - 1] == candidates[current] && set.contains(candidates[current - 1]){
                continue
            }
            
            set.insert(candidates[current])
            comb.append(candidates[current])
            calCombinationSum(candidates, current + 1, target, sum + candidates[current], &comb, &all)
            comb.removeLast()
        }
    }
}

Solution().combinationSum2([10,1,2,7,6,1,5], 8)
