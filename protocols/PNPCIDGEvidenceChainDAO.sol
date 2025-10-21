// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PNPCIDGEvidenceChainDAO {
    address public admin;

    struct EvidenceEntry {
        string caseName;
        string documentType; // "Witness Statement", "Forensic Report", "Surveillance Footage"
        string submissionDate;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    EvidenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEvidence(string memory caseName, string memory documentType, string memory submissionDate, string memory emotionalTag) external onlyAdmin {
        entries.push(EvidenceEntry(caseName, documentType, submissionDate, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealEvidenceEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getEvidenceEntry(uint256 index) external view returns (EvidenceEntry memory) {
        return entries[index];
    }
}
