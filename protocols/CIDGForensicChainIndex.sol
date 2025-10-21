// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CIDGForensicChainIndex {
    address public admin;

    struct ForensicEntry {
        string caseName;
        string evidenceType; // "DNA", "Fingerprint", "Surveillance Footage"
        string chainLayer; // "Collection", "Analysis", "Submission"
        string emotionalTag;
        bool summoned;
        bool indexed;
        bool sealed;
    }

    ForensicEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonForensic(string memory caseName, string memory evidenceType, string memory chainLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(ForensicEntry(caseName, evidenceType, chainLayer, emotionalTag, true, false, false));
    }

    function confirmIndexing(uint256 index) external onlyAdmin {
        entries[index].indexed = true;
    }

    function sealForensicEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getForensicEntry(uint256 index) external view returns (ForensicEntry memory) {
        return entries[index];
    }
}
