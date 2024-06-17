/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */

var addTwoNumbersQuicker = function(l1, l2) {
    // LeetCode didn't like 'reverse()'
    const l1_int = l1.reverse().join('')
    const l2_int = l2.reverse().join('')
    // console.log(`Adding ${l1_int} and ${l2_int}`)
    return String(Number(l1_int) + Number(l2_int)).split('').map(Number).reverse()
};


// Second attempt
function reverse_array(arr) {
    new_arr = []
    for (let i = arr.length -1; i >= 0; i--){
        new_arr.push(arr[i])
    }

    return new_arr
}

var addTwoNumbers = function(l1, l2) {
    const l1_rev = reverse_array(l1)
    const l2_rev = reverse_array(l2)

    output_rev = String(Number(l1_rev.join('')) + Number(l2_rev.join(''))).split('').map(Number)
    output = reverse_array(output_rev)

    return output
};


module.exports = addTwoNumbers;
