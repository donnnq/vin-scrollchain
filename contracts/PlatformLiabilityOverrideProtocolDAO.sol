// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlatformLiabilityOverrideProtocolDAO {
    address public admin;

    struct OverrideEntry {
        string platform;
        string legalSystem;
        string overrideClause;
        string emotionalTag;
        bool activated;
    }

    OverrideEntry[] public protocols;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitOverride(string memory _platform, string memory _legalSystem, string memory _overrideClause, string memory _emotionalTag) external onlyAdmin {
        protocols.push(OverrideEntry(_platform, _legalSystem, _overrideClause, _emotionalTag, false));
    }

    function activateOverride(uint256 index) external onlyAdmin {
        protocols[index].activated = true;
    }

    function getOverride(uint256 index) external view returns (OverrideEntry memory) {
        return protocols[index];
    }
}
