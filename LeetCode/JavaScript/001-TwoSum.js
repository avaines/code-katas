
/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */


// Brute forced
var twoSum_mk1 = function(nums, target) {
    let num_sum_indicies = []

    for (let i = 0; i < nums.length; i++){
        for (let j = i+1; j < nums.length; j++){
            if (nums[i] + nums[j] == target){
                num_sum_indicies.push(i, j)
            }
        }
    }
    return num_sum_indicies
};

// Nicer hashmap from the solution video
var twoSum = function(nums, target) {
    let map = new Map()

    for (let i = 0; i < nums.length; i++){
        x=target - nums[i]
        if (map.has(x)) {
            return [map.get(x), i]
        }

        map.set(nums[i],i)
    }
};

module.exports = twoSum;

