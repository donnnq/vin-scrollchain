// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserAutonomyCodex {
    address public admin;

    struct AutonomyEntry {
        string userGroup;
        string dataType;
        string controlMethod;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    AutonomyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAutonomy(string memory userGroup, string memory dataType, string memory controlMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(AutonomyEntry(userGroup, dataType, controlMethod, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealAutonomyEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getAutonomyEntry(uint256 index) external view returns (AutonomyEntry memory) {
        return entries[index];
    }
}
