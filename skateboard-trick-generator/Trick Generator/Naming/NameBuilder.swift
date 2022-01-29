protocol NameBuilderType {
    var name: String { get }
    func stance(_ text: String?)
    func spin(_ text: String)
    func shoveIt(_ text: String)
    func flip(_ text: String)
    func bodyVarial(_ text: String)
    func revert(_ text: String)
    func stanceSpin(_ text: String)
    func stanceShoveItFlipRevert(_ text: String)
    func spinShoveIt(_ text: String)
    func spinShoveItFlip(_ text: String)
    func shoveItFlip(_ text: String)
    func flipBodyVarial(_ text: String)
}

final class NameBuilder: NameBuilderType {

    // MARK: - Variables

    private var nameComponents: [NameComponent] = []

    // MARK: - Initialization

    init(nameComponents: [NameComponent] = []) {
        self.nameComponents = nameComponents
    }

    // MARK: - NameBuilderType

    var name: String {
        nameComponents
            .sorted { $0.kind.rawValue < $1.kind.rawValue }
            .map { $0.text }
            .joined(separator: " ")
    }

    func stance(_ text: String?) {
        inserting(.stance, text: text)
    }

    func spin(_ text: String) {
        inserting(.spin, text: text)
    }

    func shoveIt(_ text: String) {
        inserting(.shoveIt, text: text)
    }

    func flip(_ text: String) {
        inserting(.flip, text: text)
    }

    func bodyVarial(_ text: String) {
        inserting(.bodyVarial, text: text)
    }

    func revert(_ text: String) {
        inserting(.revert, text: text)
    }

    func stanceSpin(_ text: String) {
        inserting(.stanceSpin, text: text)
    }

    func stanceShoveItFlipRevert(_ text: String) {
        inserting(.stanceShoveItFlipRevert, text: text)
    }

    func spinShoveIt(_ text: String) {
        inserting(.spinShoveIt, text: text)
    }

    func spinShoveItFlip(_ text: String) {
        inserting(.spinShoveItFlip, text: text)
    }

    func shoveItFlip(_ text: String) {
        inserting(.shoveItFlip, text: text)
    }

    func flipBodyVarial(_ text: String) {
        inserting(.flipBodyVarial, text: text)
    }

    // MARK: - Private

    private func inserting(_ kind: NameComponent.Kind, text: CustomStringConvertible?) {
        nameComponents.removeAll { NameComponent.Kind.kindsReplaced(by: kind).contains($0.kind) }
        if let text = text {
            nameComponents.append(.init(kind: kind, text: text.description))
        }
    }
}
