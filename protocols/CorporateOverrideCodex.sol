// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorporateOverrideCodex {
    address public admin;

    struct OverrideEntry {
        string corporationName;
        string overrideType;
        string codexClause;
        string emotionalTag;
        bool summoned;
        bool overridden;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOverride(string memory corporationName, string memory overrideType, string memory codexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(OverrideEntry(corporationName, overrideType, codexClause, emotionalTag, true, false, false));
    }

    function confirmOverride(uint256 index) external onlyAdmin {
        entries[index].overridden = true;
    }

    function sealOverrideEntry(uint256 index) external onlyAdmin {
        require(entries[index].overridden, "Must be overridden first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
