// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenOversightBroadcastCodex {
    address public admin;

    struct OversightEntry {
        string submittedBy;
        string issueLabel;
        string comment;
        string emotionalTag;
        bool acknowledged;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory submittedBy, string memory issueLabel, string memory comment, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(submittedBy, issueLabel, comment, emotionalTag, false));
    }

    function acknowledgeEntry(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
