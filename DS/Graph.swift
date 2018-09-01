class GraphNode {
    var val: Int
    var neighbors: [GraphNode] = []

    init(val: Int) {
        self.val = val
    }
}

class Graph {
    var inputList: [Any]
    private var nodeCache: [Int: GraphNode] = [:]
    private var dfsCache: [Int: GraphNode] = [:]
    private var bfsCache: [Int: GraphNode] = [:]

    init(inputList: [Any]) {
        self.inputList = inputList
    }

    // MARK: - main method for Graph
    func toGrahp() -> GraphNode? {
        let formatTwoDimensionList = splitArrayByString(separation: "#")
        guard formatTwoDimensionList.count > 0,
            formatTwoDimensionList[0].count > 0 else {
                return nil
        }
        let firstVal = formatTwoDimensionList[0][0]
        let root = getNode(val: firstVal)

        for eachAdjValList in formatTwoDimensionList {
            let firstNode = getNode(val: eachAdjValList[0])
            for val in eachAdjValList[1..<eachAdjValList.count] {
                let adjNode = getNode(val: val)
                firstNode.neighbors.append(adjNode)
            }
        }
        return root
    }

    // split  [0,1,2,3,"#",4,3,"#"]  -> [[0,1,2,3,], [2,3]]
    fileprivate func splitArrayByString(separation: String = "#") -> [[Int]] {
        var res: [[Int]] = []
        var tmp: [Int] = []
        inputList.forEach { (elem) in
            if let e = elem as? Int {
                tmp.append(e)
            }
            if let e = elem as? String, e == separation {
                res.append(tmp)
                tmp = []
            }
        }
        res.append(tmp) // dont forgot this line, after the last # still need add to res. means 4,3
        return res
    }

    // get node from nodeCache
    fileprivate func getNode(val: Int) -> GraphNode {
        if let node = nodeCache[val] {
            return node
        } else {
            let node = GraphNode(val: val)
            nodeCache[val] = node
            return node
        }
    }

    // DFS return list
    fileprivate func DFS(root: GraphNode) -> [Int] {

        func isNodeInDFSCache(node: GraphNode) -> Bool {
            if dfsCache[node.val] != nil {
                return true
            } else {
                return false
            }
        }

        func addNodeToDFSCache(_ node: GraphNode) {
            dfsCache[node.val] = node
        }


        func DFSTravel(root: GraphNode, res: inout [Int]) {
            if !isNodeInDFSCache(node: root) {
                addNodeToDFSCache(root)
                res.append(root.val)
                for node in root.neighbors {
                    if !isNodeInDFSCache(node: node) {
                        DFSTravel(root: node, res: &res)
                    }
                }
            }
        }

        var res = [Int]()
        DFSTravel(root: root, res: &res)
        return res

    }

    // BFS return list
    fileprivate func BFS(root: GraphNode) -> [Int] {

        func isNodeInBFSCache(node: GraphNode) -> Bool {
            if bfsCache[node.val] != nil {
                return true
            } else {
                return false
            }
        }

        func addNodeToBFSCache(_ node: GraphNode) {
            bfsCache[node.val] = node
        }

        var res = [Int]()
        var queue = [root]
        while !queue.isEmpty {
            var tmpNeighborNodes = [GraphNode]()
            for node in queue {
                if !isNodeInBFSCache(node: node) {
                    res.append(node.val)
                    addNodeToBFSCache(node)
                    for neighborNode in node.neighbors {
                        tmpNeighborNodes.append(neighborNode)
                    }
                }
            }
            queue = tmpNeighborNodes
        }
        return res
    }

    func toList(root: GraphNode) -> [Any] {
        bfsCache = [Int:GraphNode]()
        let bfsNodeValList = BFS(root: root)
        var res = [Any]()
        for val in bfsNodeValList {
            if let node = bfsCache[val] {
                if !node.neighbors.isEmpty {
                    res.append(node.val)
                    for neighborNode in node.neighbors {
                        res.append(neighborNode.val)
                    }
                    res.append("#")
                }
            }
        }
        return res
    }


}

extension Graph {
    static func test() {
        //let a: [Any] = [1,2,3,"#",3,2]
        //let a: [Any] = [1,2,3,4,"#",2,1,4,5,"#",3,1,5,"#",4,1,2,"#",5,2,3]
        let a: [Any] = [1,2,3,4,5,"#",3,6,7,8,"#",5,9,"#",9,10,11,12]

        let graph = Graph(inputList: a)
        let formatList = graph.splitArrayByString()

        print("🌞👉\(formatList)👈🌞")
        let root = graph.toGrahp()
        print("DFS🌞👉\(graph.DFS(root: root!))👈🌞")
        print("BFS🌞👉\(graph.BFS(root: root!))👈🌞")
        print("toList🌞👉\(graph.toList(root: root!))👈🌞")
    }
}



