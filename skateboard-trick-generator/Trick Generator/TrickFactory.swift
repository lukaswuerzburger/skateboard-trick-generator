protocol TrickFactoryType {
    func trick(
        stance: Stance,
        spin: Spin?,
        shoveIt: ShoveIt?,
        flip: Flip?,
        bodyVarial: Direction?,
        revert: Direction?
    ) -> Trick
}

final class TrickFactory: TrickFactoryType {

    // MARK: - TrickFactoryType

    func trick(
        stance: Stance,
        spin: Spin?,
        shoveIt: ShoveIt?,
        flip: Flip?,
        bodyVarial: Direction?,
        revert: Direction?
    ) -> Trick {
        Trick(
            stance: stance,
            spin: spin,
            shoveIt: shoveIt,
            flip: flip,
            bodyVarial: bodyVarial,
            revert: revert
        )
    }
}
