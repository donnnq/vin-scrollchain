// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticEngagementCollapseCodex {
    address public admin;

    struct CollapseEntry {
        string engagementLabel;
        string platformSource;
        string emotionalTag;
        bool collapsed;
    }

    CollapseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory engagementLabel, string memory platformSource, string memory emotionalTag) external onlyAdmin {
        entries.push(CollapseEntry(engagementLabel, platformSource, emotionalTag, false));
    }

    function markCollapsed(uint256 index) external onlyAdmin {
        entries[index].collapsed = true;
    }

    function getEntry(uint256 index) external view returns (CollapseEntry memory) {
        return entries[index];
    }
}
