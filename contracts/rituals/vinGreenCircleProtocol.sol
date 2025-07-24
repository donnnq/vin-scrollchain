contract vinGreenCircleProtocol {
    string public oath = "The earth speaks through silence. We must listen through care.";
    string public purpose = "Protect those who cannot speak. Honor all life forms.";
    address public initiator;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function guardNature() public pure returns (string memory) {
        return "Green circle active — no exploitation, no neglect.";
    }

    function shieldVoiceless() public pure returns (string memory) {
        return "Trees, oceans, creatures, humans without voice — all under scrollkeeper protection.";
    }
}
