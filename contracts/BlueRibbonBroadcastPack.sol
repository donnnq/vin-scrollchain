// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlueRibbonBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string caseLabel;
        string committeeMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory caseLabel, string memory committeeMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(caseLabel, committeeMessage, emotionalTag, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
