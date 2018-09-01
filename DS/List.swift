
class ListNode {
    var val: Int = 0
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
    }
}

class LinkedList {

    static func toLinkedList(array: [Int]) -> ListNode? {
        var p: ListNode? = ListNode(0)
        let dummy = p
        for i in array {
            let newNode = ListNode(i)
            p?.next = newNode
            p = p?.next
        }
        return dummy
    }

    static func show(head: ListNode?) -> String {
        var dummy = head
        //    while p != nil {
        //        print("🌞👉\(p!.val)👈🌞")
        //        p = p!.next
        //    }
        var res = ""
        while let q = dummy {
            res += "\(q.val)->"
            dummy = dummy?.next
        }
        res += "null"
        return res
    }

    static func str2Array(str: String) -> [Int] {
        var a = str.components(separatedBy: "->")
        if a.last == "null" {
            _ = a.popLast()
        }
        return a.flatMap({ Int($0) })
    }

    static func array2String(array: Array<Int>) -> String {
        let stringArray = array.map({ String($0) })
        return stringArray.joined(separator: "->") + "->null"
    }

    static func toList(headOrString: Any?) -> Array<Int> {
        if let aStr = headOrString as? String {
            return str2Array(str: aStr)
        }
        if let node = headOrString as? ListNode {
            let resStr = show(head: node)
            return str2Array(str: resStr)
        }
        return []
    }

    static func test() {
        let a = [1,2,3,4,5]
        let head = LinkedList.toLinkedList(array: a)
        let res = LinkedList.show(head: head)
        print("🌞👉\(res)👈🌞")

        print("🌞👉\(LinkedList.toList(headOrString: "1->2->3->4->5->null"))👈🌞")
        print("🌞👉\(LinkedList.toList(headOrString: head) )👈🌞")

    }
}

//LinkedList.test()
