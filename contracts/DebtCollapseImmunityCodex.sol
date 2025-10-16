// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DebtCollapseImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string economyLabel;
        string collapseSignal;
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

    function submitImmunity(string memory economyLabel, string memory collapseSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(economyLabel, collapseSignal, emotionalTag, false, false));
    }

    function protectEconomy(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function ritualizeCollapse(uint256 index) external onlyAdmin {
        entries[index].ritualized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
