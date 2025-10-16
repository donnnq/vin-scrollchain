// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AutoBankruptcySignalCodex {
    address public admin;

    struct SignalEntry {
        string companyLabel;
        string bankruptcyType;
        string emotionalTag;
        bool flagged;
    }

    SignalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory companyLabel, string memory bankruptcyType, string memory emotionalTag) external onlyAdmin {
        entries.push(SignalEntry(companyLabel, bankruptcyType, emotionalTag, false));
    }

    function flagEntry(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function getEntry(uint256 index) external view returns (SignalEntry memory) {
        return entries[index];
    }
}
