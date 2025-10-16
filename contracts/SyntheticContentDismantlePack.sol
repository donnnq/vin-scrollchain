// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SyntheticContentDismantlePack {
    address public admin;

    struct DismantleEntry {
        string contentLabel;
        string platformSource;
        string emotionalTag;
        bool removed;
    }

    DismantleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory contentLabel, string memory platformSource, string memory emotionalTag) external onlyAdmin {
        entries.push(DismantleEntry(contentLabel, platformSource, emotionalTag, false));
    }

    function removeEntry(uint256 index) external onlyAdmin {
        entries[index].removed = true;
    }

    function getEntry(uint256 index) external view returns (DismantleEntry memory) {
        return entries[index];
    }
}
