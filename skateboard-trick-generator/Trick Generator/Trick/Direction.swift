enum Direction: String, Equatable, CaseIterable {
    case frontside = "Frontside"
    case backside = "Backside"
}

extension Direction: CustomStringConvertible {

    var description: String {
        rawValue
    }
}
