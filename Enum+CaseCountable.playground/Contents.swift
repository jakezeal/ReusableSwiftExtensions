import UIKit

protocol CaseCountable: RawRepresentable {}

extension CaseCountable where RawValue == Int {
    
    static var count: RawValue {
        var i: RawValue = 0
        while let _ = Self(rawValue: i) { i += 1 }
        return i
    }
    
    static func cases(_ range: CountableRange<Int>) -> [Self] {
        return range.flatMap { Self(rawValue: $0) }
    }
}

enum Section: Int, CaseCountable {
    case title
    case subtitle
    case usernameInput
}

class TableViewController: UITableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.count
    }
}

let someCases = Section.cases(0..<2)