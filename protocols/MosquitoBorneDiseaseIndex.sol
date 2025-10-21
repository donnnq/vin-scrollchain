// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MosquitoBorneDiseaseIndex {
    address public admin;

    struct DiseaseEntry {
        string diseaseName; // "Chikungunya", "Dengue", "Zika"
        string region;
        string outbreakStatus; // "Contained", "Spreading", "Escalating"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    DiseaseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDisease(string memory diseaseName, string memory region, string memory outbreakStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(DiseaseEntry(diseaseName, region, outbreakStatus, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealDiseaseEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getDiseaseEntry(uint256 index) external view returns (DiseaseEntry memory) {
        return entries[index];
    }
}
