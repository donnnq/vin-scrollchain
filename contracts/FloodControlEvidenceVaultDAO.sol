// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlEvidenceVaultDAO {
    address public admin;

    struct EvidenceEntry {
        string caseLabel;
        string documentType;
        string sourceAgency;
        string emotionalTag;
        bool verified;
    }

    EvidenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory caseLabel, string memory documentType, string memory sourceAgency, string memory emotionalTag) external onlyAdmin {
        entries.push(EvidenceEntry(caseLabel, documentType, sourceAgency, emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (EvidenceEntry memory) {
        return entries[index];
    }
}
