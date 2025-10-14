// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectEvidenceLedgerDAO {
    address public admin;

    struct EvidenceEntry {
        string projectName;
        string evidenceType;
        string sourceReference;
        string emotionalTag;
        bool verified;
    }

    EvidenceEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEvidence(string memory _projectName, string memory _evidenceType, string memory _sourceReference, string memory _emotionalTag) external onlyAdmin {
        ledger.push(EvidenceEntry(_projectName, _evidenceType, _sourceReference, _emotionalTag, false));
    }

    function verifyEvidence(uint256 index) external onlyAdmin {
        ledger[index].verified = true;
    }

    function getEvidence(uint256 index) external view returns (EvidenceEntry memory) {
        return ledger[index];
    }
}
