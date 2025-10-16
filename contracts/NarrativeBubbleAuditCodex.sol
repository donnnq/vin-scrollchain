// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeBubbleAuditCodex {
    address public admin;

    struct BubbleEntry {
        string marketLabel;
        string hypeDriver;
        string emotionalTag;
        bool verified;
    }

    BubbleEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory marketLabel, string memory hypeDriver, string memory emotionalTag) external onlyAdmin {
        entries.push(BubbleEntry(marketLabel, hypeDriver, emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (BubbleEntry memory) {
        return entries[index];
    }
}
