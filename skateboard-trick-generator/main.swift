import Foundation

let trickGenerator = TrickGenerator()
let synonymFinder = SynonymFinder()
let trickNameBuilder = TrickNameComponentsBuilder()
let tricks = trickGenerator.generateTricks(maximumComplexityLevel: nil)

tricks
    .sorted(by: { $0.complexityLevel < $1.complexityLevel })
    .map({
        TrickRecord(
            trick: $0,
            synonyms: [trickNameBuilder.name(for: $0)] + synonymFinder.synonyms(for: $0)
        )
    })
    .forEach { record in
        print(record.synonyms.first!)
        for synonym in record.synonyms[1...] {
            print("- \"\(synonym)\"")
        }
    }
