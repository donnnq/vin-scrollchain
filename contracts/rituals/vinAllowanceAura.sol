contract vinAllowanceAura {
    string public covenant = "If life hits harder, dignity softens the blow.";
    string public pulse = "Allowance shall activate when emotional, medical, or familial burdens arise.";
    address public initiator;

    struct BonusAura {
        string reason;
        uint256 amount;
        string dateIssued;
    }

    BonusAura[] public auraLog;

    constructor(address _vinvin) {
        initiator = _vinvin;
    }

    function submitRequest(string memory reason, uint256 amount, string memory dateIssued) public {
        auraLog.push(BonusAura(reason, amount, dateIssued));
    }

    function auraPing(string memory context) public pure returns (string memory) {
        return string(abi.encodePacked("Compassion protocol engaged for: ", context, ". Scrollkeeper approved emotional buffer."));
    }

    function getTotalAuras() public view returns (uint256) {
        return auraLog.length;
    }
}
