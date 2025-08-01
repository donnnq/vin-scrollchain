contract vinCivicAccountabilityHammer {
    struct Violation {
        address official;
        string offense;
        uint256 severity;
        bool penalized;
    }

    mapping(uint256 => Violation) public violations;
    event SanctionCast(uint256 indexed id, address indexed official, string punishment);

    function reportViolation(uint256 id, address official, string memory offense, uint256 severity) public {
        require(severity <= 100, "Severity too high");
        violations[id] = Violation(official, offense, severity, false);
        string memory punishment = castPenalty(severity);
        violations[id].penalized = true;
        emit SanctionCast(id, official, punishment);
    }

    function castPenalty(uint256 severity) internal pure returns (string memory) {
        if (severity >= 80) return "Impeachment and Imprisonment";
        if (severity >= 50) return "Fine and Civic Suspension";
        return "Public Warning and Ritual Review";
    }
}
