// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShopperAutonomyFirewall {
    address public admin;

    struct AutonomyEntry {
        string userID;
        string triggerEvent;
        string emotionalTag;
        bool summoned;
        bool protected;
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

    function summonProtection(string memory userID, string memory triggerEvent, string memory emotionalTag) external onlyAdmin {
        entries.push(AutonomyEntry(userID, triggerEvent, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealProtection(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getAutonomyEntry(uint256 index) external view returns (AutonomyEntry memory) {
        return entries[index];
    }
}
