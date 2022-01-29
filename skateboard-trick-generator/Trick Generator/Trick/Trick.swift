struct Trick: Equatable, Identifiable {
    var id: String {
        "\(self)"
    }

    var stance: Stance
    var spin: Spin?
    var shoveIt: ShoveIt?
    var flip: Flip?
    var bodyVarial: Direction?
    var revert: Direction?
}

extension Trick {

    var complexityLevel: Int {
        var level: Int = 0
        switch stance {
        case .regular:
            break
        case .fakie:
            level += 1
        case .switch:
            level += 2
        case .nollie:
            level += 2
        }
        if let spin = spin {
            switch spin.degree {
            case .oneEighty:
                level += 1
            case .threeSixty:
                level += 3
            case .fiveForty:
                level += 5
            }
        }
        if let shoveIt = shoveIt {
            switch shoveIt.degree {
            case .oneEighty:
                level += 1
            case .threeSixty:
                level += 4
            case .fiveForty:
                level += 7
            }
        }
        if spin != nil && shoveIt != nil {
            level += 2
        }
        if let flip = flip {
            switch flip {
            case .kickflip, .heelflip:
                level += 2
            case .doubleKickflip, .doubleHeelflip:
                level += 4
            }
            if let shoveIt = shoveIt {
                switch shoveIt.direction {
                case .frontside:
                    if [.kickflip, .doubleKickflip].contains(flip) {
                        level += 2
                    }
                case .backside:
                    if [.heelflip, .doubleHeelflip].contains(flip) {
                        level += 2
                    }
                }
            }
        }
        if bodyVarial != nil {
            level += 4
        }
        if revert != nil {
            level += 3
        }
        return level
    }
}
