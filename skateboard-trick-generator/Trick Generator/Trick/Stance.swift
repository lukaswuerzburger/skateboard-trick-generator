enum Stance: String, Equatable, CaseIterable {
    case regular = "Regular"
    case fakie = "Fakie"
    case `switch` = "Switch"
    case nollie = "Nollie"
}

extension Stance: CustomStringConvertible {

    var description: String {
        rawValue
    }
}
