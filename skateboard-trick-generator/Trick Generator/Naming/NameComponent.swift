struct NameComponent {
    var kind: Kind
    var text: String
}

extension NameComponent {

    enum Kind: Int {
        case stance = 10
        case spin = 20
        case shoveIt = 30
        case flip = 40
        case bodyVarial = 50
        case revert = 60

        // Half Cab, Caballerial (Fakie BS 360), Helipop (Nollie BS 360)
        case stanceSpin = 11

        // Ghetto Bird (Nollie Hardflip Revert)
        case stanceShoveItFlipRevert = 12

        // Bigspin, Biggerspin, Biggestspin, Gazelle
        case spinShoveIt = 21

        // Bigflip, Big Heel
        case spinShoveItFlip = 22

        // Hardflip, Inward Heelflip
        case shoveItFlip = 31

        // Sexchange
        case flipBodyVarial = 41
    }
}

extension NameComponent.Kind {

    static func kindsReplaced(by kind: NameComponent.Kind) -> [NameComponent.Kind] {
        switch kind {
        case .stance:
            return [.stance]
        case .spin:
            return [.spin]
        case .shoveIt:
            return [.shoveIt]
        case .flip:
            return [.flip]
        case .bodyVarial:
            return [.bodyVarial]
        case .revert:
            return [.revert]
        case .stanceSpin:
            return [.stance, .spin, .stanceSpin, .stanceShoveItFlipRevert, .spinShoveIt, .spinShoveItFlip]
        case .stanceShoveItFlipRevert:
            return [.stance, .shoveIt, .flip, .revert, .stanceShoveItFlipRevert, .stanceSpin, .spinShoveIt, .spinShoveItFlip, .shoveItFlip, .flipBodyVarial]
        case .spinShoveIt:
            return [.spin, .shoveIt, .spinShoveIt, .stanceSpin, .stanceShoveItFlipRevert, .spinShoveItFlip, .shoveItFlip]
        case .spinShoveItFlip:
            return [.spin, .shoveIt, .flip, .spinShoveIt, .spinShoveItFlip, .stanceSpin, .shoveItFlip, .stanceShoveItFlipRevert, .flipBodyVarial]
        case .shoveItFlip:
            return [.shoveIt, .flip, .shoveItFlip, .spinShoveIt, .spinShoveItFlip, .stanceShoveItFlipRevert, .flipBodyVarial]
        case .flipBodyVarial:
            return [.flip, .bodyVarial, .flipBodyVarial, .shoveItFlip, .spinShoveItFlip, .stanceShoveItFlipRevert]
        }
    }
}
