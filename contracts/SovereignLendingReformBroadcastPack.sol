// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereignLendingReformBroadcastPack {
    address public admin;

    struct BroadcastEntry {
        string reformLabel;
        string message;
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

    function submitEntry(string memory reformLabel, string memory message, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(reformLabel, message, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
