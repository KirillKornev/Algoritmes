import UIKit

/*
 task: https://leetcode.com/problems/contains-duplicate/
 Go throught each element and check duplicate in set
 if it contains current value - return true
 
 Compexity O(n)
 */

class Solution {
    
    // MARK: - Solution 1 using `set`.
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var setvalues: Set<Int> = []
        
        for num in nums { // O(n)
            if setvalues.contains(num) { // O(1) because it works with hash
                return true
            }
            
            setvalues.insert(num)
        }
        
        return false
    }
    
    // MARK: - Solution 2 using `set`.
    
    func containsDuplicate1(_ nums: [Int]) -> Bool {
        let uniqueValues = Set(nums)
        
        return uniqueValues.count != nums.count
    }
    
    // MARK: - Solution 3 using `dictionary`.
    
    func containsDuplicate2(_ nums: [Int]) -> Bool {
        var dict = [Int: Bool]()
        
        for num in nums {
            if dict[num] != nil {
                return true
            } else {
                dict[num] = false
            }
        }
        
        return false
    }
}

_ = Solution().containsDuplicate2([1,2,3])
