// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalComfortBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string message;
        string regionTag;
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

    function submitBroadcast(string memory message, string memory regionTag, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(message, regionTag, emotionalTag, false));
    }

    function airBroadcast(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
