import Foundation

//func matrix(row_m: Int, col_n: Int) -> [[Int]] {
//    let row = Array(repeating: 0, count: col_n)
//    return Array(repeating: row, count: row_m)
//}
//
//var m = matrix(row_m: 3, col_n: 4)
//
//for row in m {
//    print("🌞👉\(row)👈🌞")
//}

class Matrix {
    var val: [[Int]]

    var rowLenght: Int {
        return val[0].count
    }

    var colLenght: Int {
        return val.count
    }

    init(m: Int, n: Int) {
        self.val = Matrix.creat(row: m, col: n)
    }

    static func creat(row: Int, col: Int) -> [[Int]] {
        let eachRowList = Array(repeating: 0, count: col)
        return Array(repeating: eachRowList, count: row)
    }

    func show() {
        for i in self.val {
            print(i)
        }
        print("-------------------")
    }

    func setAll(row: Int, with data: Int) {
        for i in 0..<rowLenght {
            self.val[row][i] = data
        }
    }

    func setAll(col: Int, with data: Int) {
        for i in 0..<colLenght {
            self.val[i][col] = data
        }
    }

    static func test() {
//        let a = Matrix.creat(row: 3, col: 2)
        let a = Matrix(m: 3, n: 4)
        a.show()
        a.setAll(row: 0, with: 3)
        a.show()
        a.setAll(col: 0, with: 2)
        a.show()

//        a[2][3] = 99

    }
}
