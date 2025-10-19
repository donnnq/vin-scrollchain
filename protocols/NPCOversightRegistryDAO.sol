// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NPCOversightRegistryDAO {
    address public admin;

    struct OversightEntry {
        string entityName;
        string violationType;
        string enforcementAction;
        string emotionalTag;
        bool summoned;
        bool enforced;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory entityName, string memory violationType, string memory enforcementAction, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(entityName, violationType, enforcementAction, emotionalTag, true, false, false));
    }

    function confirmEnforcement(uint256 index) external onlyAdmin {
        entries[index].enforced = true;
    }

    function sealOversightEntry(uint256 index) external onlyAdmin {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
