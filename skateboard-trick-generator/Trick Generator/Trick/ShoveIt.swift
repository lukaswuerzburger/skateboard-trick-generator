struct ShoveIt: Equatable {
    var direction: Direction
    var degree: Degree
}

extension ShoveIt: CustomStringConvertible {

    var description: String {
        "\(direction.rawValue) \(degree.rawValue) Pop Shove It"
    }
}
