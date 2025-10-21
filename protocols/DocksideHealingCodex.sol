// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DocksideHealingCodex {
    address public admin;

    struct HealingEntry {
        string dockName;
        string healingModality;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool activated;
        bool sealed;
    }

    HealingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonHealing(string memory dockName, string memory healingModality, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(HealingEntry(dockName, healingModality, codexClause, emotionalTag, true, false, false));
    }

    function confirmActivation(uint256 index) external onlyAdmin {
        entries[index].activated = true;
    }

    function sealHealingEntry(uint256 index) external onlyAdmin {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getHealingEntry(uint256 index) external view returns (HealingEntry memory) {
        return entries[index];
    }
}
