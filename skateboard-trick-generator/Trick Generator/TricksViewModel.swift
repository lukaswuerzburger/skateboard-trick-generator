protocol TricksViewModelType {
    func tricksString(_ tricks: [Trick]) -> String
}

final class TricksViewModel: TricksViewModelType {

    // MARK: - Dependencies

    private let synonymFinder: SynonymFinderType
    private let trickNameBuilder: TrickNameComponentsBuilderType

    // MARK: - Initialization

    init(
        synonymFinder: SynonymFinderType = SynonymFinder(),
        trickNameBuilder: TrickNameComponentsBuilderType = TrickNameComponentsBuilder()
    ) {
        self.synonymFinder = synonymFinder
        self.trickNameBuilder = trickNameBuilder
    }

    // MARK: - TricksViewModelType

    func tricksString(_ tricks: [Trick]) -> String {
        tricksRecords(tricks)
            .reduce("") { result, record in
                let name = trickNameBuilder.name(for: record.trick)
                var output = name
                if record.synonyms.isEmpty == false {
                    output.append(" (\(record.synonyms.joined(separator: ", ")))")
                }
                output.append("\n")
                return result + output
            }
    }

    private func tricksRecords(_ tricks: [Trick]) -> [TrickRecord] {
        tricks
            .sorted(by: { $0.complexityLevel < $1.complexityLevel })
            .map({
                TrickRecord(
                    trick: $0,
                    synonyms: synonymFinder.synonyms(for: $0)
                )
            })
    }
}
