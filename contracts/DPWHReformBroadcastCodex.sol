// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHReformBroadcastCodex {
    address public admin;

    struct ReformEntry {
        string reformLabel;
        string broadcastMessage;
        string emotionalTag;
        bool aired;
    }

    ReformEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory reformLabel, string memory broadcastMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(ReformEntry(reformLabel, broadcastMessage, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
