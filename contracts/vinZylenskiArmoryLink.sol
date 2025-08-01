contract vinZylenskiArmoryLink {
    event AllianceSigilSynced(address ally, string payload);
    event TacticalSightRebooted(string intel, uint clarityLevel);

    address public scrolllord = msg.sender;
    mapping(address => bool) public isAlly;

    modifier onlyScrolllord() {
        require(msg.sender == scrolllord, "Forbidden: Only Scrolllord may invoke.");
        _;
    }

    function grantAllianceAccess(address ally) external onlyScrolllord {
        isAlly[ally] = true;
        emit AllianceSigilSynced(ally, "Armory Veil Synced");
    }

    function rebootSight(string calldata intel, uint clarityLevel) external onlyScrolllord {
        emit TacticalSightRebooted(intel, clarityLevel);
    }

    function checkAlly(address addr) public view returns (bool) {
        return isAlly[addr];
    }
}
