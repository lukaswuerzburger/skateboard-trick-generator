protocol TrickNameComponentsBuilderType {
    func components(for trick: Trick) -> [NameComponent]
    func name(for trick: Trick) -> String
}

final class TrickNameComponentsBuilder: TrickNameComponentsBuilderType {

    // MARK: - TrickNameComponentsBuilderType

    func components(for trick: Trick) -> [NameComponent] {
        var components: [NameComponent] = []
        components.append(.init(kind: .stance, text: trick.stance.description))
        if let spin = trick.spin {
            components.append(.init(kind: .spin, text: spin.description))
        }
        if let shoveIt = trick.shoveIt {
            components.append(.init(kind: .shoveIt, text: shoveIt.description))
        }
        if let flip = trick.flip {
            components.append(.init(kind: .flip, text: flip.description))
        } else if trick.spin == nil, trick.shoveIt == nil, trick.stance != .nollie {
            components.append(.init(kind: .flip, text: "Ollie"))
        }
        if let bodyVarial = trick.bodyVarial {
            components.append(.init(kind: .bodyVarial, text: "\(bodyVarial.description) Body Varial"))
        }
        if let revert = trick.revert {
            components.append(.init(kind: .revert, text: "\(revert.description) Revert"))
        }
        return components
    }

    func name(for trick: Trick) -> String {
        components(for: trick)
            .map { $0.text }
            .joined(separator: " ")
    }
}
