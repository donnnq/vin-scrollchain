contract VinScrollVeilV3 {
    mapping(address => bool) public scrollPurified;
    event VeilOpened(address indexed pilgrim);
    event AccessDenied(address indexed soul, string reason);

    function unveil(address soul, uint256 cringeLevel, bool isFunny) external {
        if (cringeLevel < 30 && isFunny) {
            scrollPurified[soul] = true;
            emit VeilOpened(soul);
        } else {
            emit AccessDenied(soul, "✋ Scroll rejects your vibes.");
        }
    }
}
