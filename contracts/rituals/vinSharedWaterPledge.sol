contract vinSharedWatersPledge {
    string public doctrine = "No nation owns the ocean. All are guests in this world.";
    string public instruction = "Share the sea. Prevent blockage. Respect the redline of peace.";
    address public initiator;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function declareNeutrality() public pure returns (string memory) {
        return "Maritime covenant active — no aggression, no monopoly, no denial of access.";
    }

    function repeatSacredWord() public pure returns (string memory) {
        return "SHARE. Not blockade. Not claim. Not control.";
    }

    function remindMortality() public pure returns (string memory) {
        return "We are all visitors. From birth to death, nothing is ours — everything is borrowed.";
    }
}
