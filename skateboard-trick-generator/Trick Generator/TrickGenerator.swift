protocol TrickGeneratorType {
    func generateTricks(maximumComplexityLevel: Int?) -> [Trick]
}

final class TrickGenerator: TrickGeneratorType {

    // MARK: - Dependencies

    private let trickFactory: TrickFactoryType

    // MARK: - Initialization

    init(trickFactory: TrickFactoryType = TrickFactory()) {
        self.trickFactory = trickFactory
    }

    // MARK: - TrickGeneratorType

    func generateTricks(maximumComplexityLevel: Int? = nil) -> [Trick] {
        var tricks: [Trick] = []
        let spins: [Spin?] = [nil] + generateSpins()
        let shoveIts: [ShoveIt?] = [nil] + generateShoveIts()
        let flips: [Flip?] = [nil] + Flip.allCases
        let directions: [Direction?] = [nil] + Direction.allCases
        Stance.allCases.forEach { stance in
            spins.forEach { spin in
                shoveIts.forEach { shoveIt in
                    flips.forEach { flip in
                        directions.forEach { bodyVarial in
                            directions.forEach { revert in
                                if let spin = spin {
                                    if let shoveIt = shoveIt, spin.direction != shoveIt.direction {
                                        return
                                    }
                                }
                                if bodyVarial != nil {
                                    if spin != nil || shoveIt != nil {
                                        return
                                    }
                                }
                                if let revert = revert {
                                    if let spin = spin, spin.direction == revert {
                                        return
                                    }
                                    if shoveIt == nil && flip == nil {
                                        return
                                    }
                                }
                                let trick = trickFactory.trick(
                                    stance: stance,
                                    spin: spin,
                                    shoveIt: shoveIt,
                                    flip: flip,
                                    bodyVarial: bodyVarial,
                                    revert: revert
                                )
                                if trick.complexityLevel <= maximumComplexityLevel ?? 1000 {
                                    tricks.append(trick)
                                }
                            }
                        }
                    }
                }
            }
        }
        return tricks
    }

    // MARK: - Private

    private func generateSpins() -> [Spin] {
        var spins: [Spin] = []
        Direction.allCases.forEach { direction in
            Degree.allCases.forEach { degree in
                spins.append(.init(direction: direction, degree: degree))
            }
        }
        return spins
    }

    private func generateShoveIts() -> [ShoveIt] {
        var shoveits: [ShoveIt] = []
        Direction.allCases.forEach { direction in
            Degree.allCases.forEach { degree in
                shoveits.append(.init(direction: direction, degree: degree))
            }
        }
        return shoveits
    }
}
