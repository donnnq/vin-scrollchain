// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFoodResilienceIndex {
    address public admin;

    struct ResilienceEntry {
        string barangay;
        string resilienceLayer; // "Protein Diversity", "Crop Sovereignty", "Water Loop", "Compost Cycle"
        string indexClause;
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResilience(string memory barangay, string memory resilienceLayer, string memory indexClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(barangay, resilienceLayer, indexClause, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealResilienceEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
