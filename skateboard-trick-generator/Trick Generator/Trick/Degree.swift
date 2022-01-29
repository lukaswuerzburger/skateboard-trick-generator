enum Degree: String, Equatable, CaseIterable {
    case oneEighty = "180"
    case threeSixty = "360"
    case fiveForty = "540"
}

extension Degree: CustomStringConvertible {

    var description: String {
        rawValue
    }
}
