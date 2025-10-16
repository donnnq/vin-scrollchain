// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativeCommodityOverrideDAO {
    address public admin;

    struct OverrideEntry {
        string legislatorLabel;
        string commodityType;
        string overrideMethod;
        string emotionalTag;
        bool exposed;
        bool escalated;
    }

    OverrideEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitOverride(string memory legislatorLabel, string memory commodityType, string memory overrideMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(OverrideEntry(legislatorLabel, commodityType, overrideMethod, emotionalTag, false, false));
    }

    function exposeOverride(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function escalateOverride(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function getEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
