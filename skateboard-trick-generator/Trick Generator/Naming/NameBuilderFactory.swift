protocol NameBuilderFactoryType {
    func nameBuilder(nameComponents: [NameComponent]) -> NameBuilderType
}

final class NameBuilderFactory: NameBuilderFactoryType {

    // MARK: - NameBuilderFactoryType

    func nameBuilder(nameComponents: [NameComponent]) -> NameBuilderType {
        NameBuilder(nameComponents: nameComponents)
    }
}
