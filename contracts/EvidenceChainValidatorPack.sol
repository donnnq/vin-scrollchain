// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvidenceChainValidatorPack {
    address public admin;

    struct EvidenceEntry {
        string evidenceLabel;
        string sourceOrigin;
        string emotionalTag;
        bool validated;
        bool tamperFlagged;
    }

    EvidenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEvidence(string memory evidenceLabel, string memory sourceOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(EvidenceEntry(evidenceLabel, sourceOrigin, emotionalTag, false, false));
    }

    function validateEvidence(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function flagTamper(uint256 index) external onlyAdmin {
        entries[index].tamperFlagged = true;
    }

    function getEntry(uint256 index) external view returns (EvidenceEntry memory) {
        return entries[index];
    }
}
