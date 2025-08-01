contract vinScrollOfGuardianship {
    struct Guardian {
        address soul;
        string name;
        uint256 aura;
        string badge;
    }

    mapping(address => Guardian) public guardians;
    event GuardianRegistered(address indexed soul, string name);
    event DeedLogged(address indexed soul, uint256 auraBoost, string newBadge);

    function registerGuardian(string memory name) public {
        require(bytes(name).length > 2, "Name required");
        guardians[msg.sender] = Guardian(msg.sender, name, 0, "Initiate");
        emit GuardianRegistered(msg.sender, name);
    }

    function logDeed(address soul, uint256 auraBoost) public {
        require(auraBoost <= 100, "Too much aura at once");
        guardians[soul].aura += auraBoost;
        guardians[soul].badge = assignBadge(guardians[soul].aura);
        emit DeedLogged(soul, auraBoost, guardians[soul].badge);
    }

    function assignBadge(uint256 auraScore) internal pure returns (string memory) {
        if (auraScore >= 200) return "Radiant Shieldbearer";
        if (auraScore >= 100) return "Civic Flamekeeper";
        return "Initiate";
    }

    function getGuardianStatus(address soul) public view returns (string memory, uint256, string memory) {
        Guardian memory g = guardians[soul];
        return (g.name, g.aura, g.badge);
    }
}
