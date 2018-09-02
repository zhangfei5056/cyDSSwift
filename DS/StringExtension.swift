import Foundation

extension StringProtocol {

    subscript(_ range: CountableRange<Int>) -> SubSequence {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)
        return self[startIndex..<endIndex]
    }

    subscript(_ range: CountableClosedRange<Int>) -> SubSequence {
        let start = self.index(self.startIndex, offsetBy: range.lowerBound)
        let end = self.index(self.startIndex, offsetBy: range.upperBound)
        return self[start...end]
    }

    //    -1 == lastone
    private func getPythonIndex(_ i: Int) -> Index {
        if i < 0 {
            let offset = self.count + i
            return index(self.startIndex, offsetBy: offset)
        } else {
            return index(self.startIndex, offsetBy: i)
        }
    }

    subscript(_ i: Int) -> Character {
        return self[getPythonIndex(i)]
    }

}
