
import Foundation

public class ListNode {
    var val: Int
    var next: ListNode?
    weak var previous: ListNode?
    
    init(_ value: Int) {
        self.val = value
    }
}

class Solution {
    func sum(one: Int, two: Int, carry: Int)-> Int {
        return one + two + carry
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carryOperation: Int = 0
        var first: ListNode? = l1?.next
        var second: ListNode? = l2?.next
        var last: ListNode?
        var head: ListNode?
        
        let summation = sum(one: l1?.val ?? 0, two: l2?.val ?? 0, carry: carryOperation)
        
        if summation > 9 {
            let array = Array("\(summation)")
            carryOperation = 1
            var value: Int = 0

            value = Int("\(array.last ?? "0")") ?? 0

            let node = ListNode(value)
            last = node
            head = node
        } else {
            let node = ListNode(summation)
            last = node
            head = node
        }
        
        while (first != nil) || (second != nil) {
            let summation = sum(one: first?.val ?? 0, two: second?.val ?? 0, carry: carryOperation)
            
            if summation > 9 {
                let array = Array("\(summation)")
                carryOperation = 1
                var value: Int = 0

                value = Int("\(array.last ?? "0")") ?? 0

                let node = ListNode(value)
                last?.next = node
                last = node
            } else {
                carryOperation = 0
                let node = ListNode(summation)
                last?.next = node
                last = node
            }
            
            first = first?.next
            second = second?.next
        }
        
        if carryOperation == 1 {
            let node = ListNode(carryOperation)
            last?.next = node
        }
       
        return head ?? ListNode(0)
    }
}
