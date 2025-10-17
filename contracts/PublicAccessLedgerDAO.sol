// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicAccessLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string documentType;
        string officialName;
        string emotionalTag;
        bool archived;
        bool searchable;
    }

    LedgerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveDocument(string memory documentType, string memory officialName, string memory emotionalTag) external onlyAdmin {
        entries.push(LedgerEntry(documentType, officialName, emotionalTag, true, false));
    }

    function enableSearch(uint256 index) external onlyAdmin {
        entries[index].searchable = true;
    }

    function getDocument(uint256 index) external view returns (LedgerEntry memory) {
        return entries[index];
    }
}
