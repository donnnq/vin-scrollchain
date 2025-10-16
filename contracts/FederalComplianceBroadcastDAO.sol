// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FederalComplianceBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string officialName;
        string issueLabel;
        string broadcastLink;
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

    function submitEntry(string memory officialName, string memory issueLabel, string memory broadcastLink, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(officialName, issueLabel, broadcastLink, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
