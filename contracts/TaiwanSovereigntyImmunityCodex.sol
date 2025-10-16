// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TaiwanSovereigntyImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string actLabel;
        string defenseScope;
        string emotionalTag;
        bool protected;
        bool ritualized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitImmunity(string memory actLabel, string memory defenseScope, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(actLabel, defenseScope, emotionalTag, false, false));
    }

    function protectAct(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function ritualizeAct(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
