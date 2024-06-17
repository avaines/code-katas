const addTwoNumbers = require('./002-AddTwoNumbers'); // Ensure the path is correct

test('example 1', () => {
    const input_l1 = [2,4,3]
    const input_l2 = [5,6,4];
    const output = [7,0,8];
    const result = addTwoNumbers(input_l1, input_l2);

    console.log(`Input ${input_l1} & ${input_l2} should result in: ${output}, actual: ${result}`)
    expect(result).toEqual(output);
});

test('example 2', () => {
    const input_l1 = [0]
    const input_l2 = [0];
    const output = [0];
    const result = addTwoNumbers(input_l1, input_l2);

    console.log(`Input ${input_l1} & ${input_l2} should result in: ${output}, actual: ${result}`)
    expect(result).toEqual(output);
});

test('example 3', () => {
    const input_l1 = [9,9,9,9,9,9,9]
    const input_l2 = [9,9,9,9];
    const output = [8,9,9,9,0,0,0,1];
    const result = addTwoNumbers(input_l1, input_l2);

    console.log(`Input ${input_l1} & ${input_l2} should result in: ${output}, actual: ${result}`)
    expect(result).toEqual(output);
});