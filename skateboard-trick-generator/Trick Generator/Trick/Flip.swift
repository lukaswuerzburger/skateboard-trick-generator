enum Flip: String, Equatable, CaseIterable {
    case kickflip = "Kickflip"
    case heelflip = "Heelflip"
    case doubleKickflip = "Double Kickflip"
    case doubleHeelflip = "Double Heelflip"
}

extension Flip: CustomStringConvertible {

    var description: String {
        rawValue
    }
}
