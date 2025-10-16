// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticFilterDismantleCodex {
    address public admin;

    struct FilterEntry {
        string filterLabel;
        string platformSource;
        string emotionalTag;
        bool dismantled;
    }

    FilterEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory filterLabel, string memory platformSource, string memory emotionalTag) external onlyAdmin {
        entries.push(FilterEntry(filterLabel, platformSource, emotionalTag, false));
    }

    function markDismantled(uint256 index) external onlyAdmin {
        entries[index].dismantled = true;
    }

    function getEntry(uint256 index) external view returns (FilterEntry memory) {
        return entries[index];
    }
}
