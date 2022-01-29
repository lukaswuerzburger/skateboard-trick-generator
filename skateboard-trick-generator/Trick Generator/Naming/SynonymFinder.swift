protocol SynonymFinderType {
    func synonyms(for trick: Trick) -> [String]
}

final class SynonymFinder: SynonymFinderType {

    // MARK: - Dependencies

    private let trickNameComponentsBuilder: TrickNameComponentsBuilderType
    private let nameBuilderFactory: NameBuilderFactoryType

    // MARK: - Initialization

    init(
        trickNameComponentsBuilder: TrickNameComponentsBuilderType = TrickNameComponentsBuilder(),
        nameBuilderFactory: NameBuilderFactoryType = NameBuilderFactory()
    ) {
        self.trickNameComponentsBuilder = trickNameComponentsBuilder
        self.nameBuilderFactory = nameBuilderFactory
    }

    // MARK: - SynonymFinderType

    func synonyms(for trick: Trick) -> [String] {
        var synonyms: [String] = []
        let nameComponents = trickNameComponentsBuilder.components(for: trick)
        let builder = nameBuilderFactory.nameBuilder(nameComponents: nameComponents)
        if let spin = trick.spin {
            if spin.degree == .oneEighty {
                builder.spin(spin.direction.description)
            }
            if let shoveIt = trick.shoveIt {
                if spin.degree == .oneEighty {
                    // Spin and shove it direction is always the same
                    var name = customSpinShoveItName(spin: spin, shoveIt: shoveIt)
                    if let flip = trick.flip {
                        if flip == .kickflip {
                            name += "flip"
                        } else {
                            name += " \(flip.rawValue)"
                        }
                        builder.spinShoveItFlip(name)
                        synonyms.append(builder.name)
                    } else {
                        name += "spin"
                        builder.spinShoveIt(name)
                        synonyms.append(builder.name)
                    }
                }
            } else {
                if trick.stance == .fakie {
                    if spin.direction == .backside {
                        if spin.degree == .oneEighty {
                            builder.stanceSpin("Half Cab")
                            synonyms.append(builder.name)
                        } else if spin.degree == .threeSixty {
                            builder.stanceSpin("Caballerial")
                            synonyms.append(builder.name)
                            builder.stanceSpin("Full Cab")
                            synonyms.append(builder.name)
                        }
                    }
                } else if trick.stance == .nollie {
                    if spin.direction == .backside {
                        if spin.degree == .threeSixty {
                            builder.stanceSpin("Helipop")
                            synonyms.append(builder.name)
                        }
                    }
                }
            }
        } else {
            if let shoveIt = trick.shoveIt {
                if let flip = trick.flip {
                    if shoveIt.direction == .backside {
                        if flip == .kickflip {
                            if shoveIt.degree == .oneEighty {
                                builder.shoveItFlip("Varial Kickflip")
                                synonyms.append(builder.name)
                            } else if shoveIt.degree == .threeSixty {
                                builder.shoveItFlip("\(shoveIt.degree) Flip")
                                synonyms.append(builder.name)
                                builder.shoveItFlip("Tre Flip")
                                synonyms.append(builder.name)
                            } else {
                                builder.shoveItFlip("\(shoveIt.degree) Flip")
                            }
                        } else if flip == .heelflip {
                            var name = "Inward Heelflip"
                            if shoveIt.degree != .oneEighty {
                                name = "\(shoveIt.degree) \(name)"
                            }
                            builder.shoveItFlip(name)
                            synonyms.append(builder.name)
                        }
                    } else if shoveIt.direction == .frontside {
                        if flip == .kickflip {
                            var name = "Hardflip"
                            if shoveIt.degree != .oneEighty {
                                name = "\(shoveIt.degree) \(name)"
                            }
                            builder.shoveItFlip(name)
                            synonyms.append(builder.name)
                        } else if flip == .heelflip {
                            if shoveIt.degree == .oneEighty {
                                builder.shoveItFlip("Varial Heelflip")
                                synonyms.append(builder.name)
                            } else if shoveIt.degree == .threeSixty {
                                builder.shoveItFlip("Lazer Flip")
                                synonyms.append(builder.name)
                            } else  {
                                builder.shoveItFlip("\(shoveIt.degree) Heelflip")
                                synonyms.append(builder.name)
                            }
                        }
                    }
                }
            } else {
                if let flip = trick.flip {
                    if let bodyVarial = trick.bodyVarial {
                        if flip == .kickflip {
                            if bodyVarial == .frontside {
                                builder.flipBodyVarial("Sex Change Kickflip")
                                synonyms.append(builder.name)
                            } else if bodyVarial == .backside {
                                builder.flipBodyVarial("Backside Sex Change Kickflip")
                                synonyms.append(builder.name)
                            }
                        } else if flip == .heelflip {
                            if bodyVarial == .frontside {
                                builder.flipBodyVarial("Frontside Sex Change Kickflip")
                                synonyms.append(builder.name)
                            } else if bodyVarial == .backside {
                                builder.flipBodyVarial("Sex Change Heelflip")
                                synonyms.append(builder.name)
                            }
                        }
                    }
                }
            }
        }
        return synonyms
    }

    // MARK: - Private

    private func customSpinShoveItName(spin: Spin, shoveIt: ShoveIt) -> String {
        let variation: String
        switch shoveIt.degree {
        case .oneEighty:
            variation = "Big"
        case .threeSixty:
            variation = "Bigger"
        case .fiveForty:
            variation = "Biggest"
        }
        return "\(spin.direction.description) \(variation)"
    }
}
