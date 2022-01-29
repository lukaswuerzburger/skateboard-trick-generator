struct Spin: Equatable {
    var direction: Direction
    var degree: Degree
}

extension Spin: CustomStringConvertible {

    var description: String {
        "\(direction.rawValue) \(degree.rawValue)"
    }
}
