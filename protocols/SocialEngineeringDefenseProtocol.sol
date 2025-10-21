// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SocialEngineeringDefenseProtocol {
    address public admin;

    struct DefenseEntry {
        string tacticName; // "Romantic Lure", "Fake Investment", "Urgency Trigger"
        string countermeasureLayer; // "Awareness Campaign", "Platform Flagging", "Emotional Immunity Training"
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    DefenseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDefense(string memory tacticName, string memory countermeasureLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(DefenseEntry(tacticName, countermeasureLayer, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealDefenseEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getDefenseEntry(uint256 index) external view returns (DefenseEntry memory) {
        return entries[index];
    }
}
