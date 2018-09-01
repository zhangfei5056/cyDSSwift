class TreeNode {
    var val: Int = 0
    var left: TreeNode?
    var right: TreeNode?

    init(val: Int) {
        self.val = val
    }
}

class Tree {
    static func toTree(array: [String]) -> TreeNode? {
        if array.isEmpty {
            return nil
        }
        var nodeList: [String] = array// array.map({String($0)})
        if nodeList.count % 2 == 0 {
            nodeList.append("#")
        }
        let root = TreeNode(val: Int(nodeList.first!)!)
        var queue: [TreeNode?] = [root]
        var index = 1
        while index < nodeList.count {
            let parent = queue.removeFirst()
            if nodeList[index] != "#" {
                let node = TreeNode(val: Int(nodeList[index])!)
                parent?.left = node
                queue.append(node)
            }
            index += 1
            if nodeList[index] != "#" {
                let node = TreeNode(val: Int(nodeList[index])!)
                parent?.right = node
                queue.append(node)
            }
            index += 1 //这里为什么会有两个index += 1呢，见下面分解
        }
        return root
    }

    static func toList(root: TreeNode?) -> [String]? {
        guard let root = root else {
            return []
        }
        var q: [TreeNode?] = [root]
        var res: [String] = []
        while !q.isEmpty {
            let node = q.removeFirst()
            if node == nil {
                res.append("#")
            } else {
                if let val = node?.val {
                    res.append(String(val))
                }
                q.append(node?.left)
                q.append(node?.right)
            }
        }
        while res.last == "#" {
            res.removeLast()
        }
        return res
    }

    static func test() {
        let a = ["1", "2", "3", "#", "#", "4"]
        let root = Tree.toTree(array: a)
        if let list = Tree.toList(root: root) {
            print("🌞👉\(list)👈🌞")
        }

    }
}


