import UIKit

/*
 Go throught all elemets in array and save indexes for value keys
 Compare each element with dict and target
 
 Compexity O(n)
 */

class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        typealias Index = Int
        
        var dict = [Int: Index]()

        for (index, number) in nums.enumerated() {
            if let foundedIndex = dict[target - number] {
                return [foundedIndex, index]
            } else {
                dict[number] = index
            }
        }
            
        return []
    }
}

_ = Solution().twoSum([1, 2, 3], 3)
