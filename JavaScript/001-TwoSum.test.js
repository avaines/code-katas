const twoSum = require('./001-TwoSum'); // Ensure the path is correct

test('should return [0, 1] for nums = [2, 7, 11, 15] and target = 9', () => {
    const nums = [2, 7, 11, 15];
    const target = 9;
    const result = twoSum(nums, target);
    console.log(`Indices ${result} can be summed to equal ${target} with in an array like ${nums}`)
    expect(result).toEqual([0, 1]);
});

test('should return [1, 2] for nums = [3, 2, 4] and target = 6', () => {
    const nums = [3, 2, 4];
    const target = 6;
    const result = twoSum(nums, target);
    console.log(`Indices ${result} can be summed to equal ${target} with in an array like ${nums}`)
    expect(result).toEqual([1, 2]);
});

test('should return [0, 1] for nums = [3, 3] and target = 6', () => {
    const nums = [3, 3];
    const target = 6;
    const result = twoSum(nums, target);
    console.log(`Indices ${result} can be summed to equal ${target} with in an array like ${nums}`)
    expect(result).toEqual([0, 1]);
});
