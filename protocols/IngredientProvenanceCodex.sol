// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IngredientProvenanceCodex {
    address public admin;

    struct ProvenanceEntry {
        string ingredientName;
        string sourceRegion;
        string provenanceClause;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    ProvenanceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProvenance(string memory ingredientName, string memory sourceRegion, string memory provenanceClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ProvenanceEntry(ingredientName, sourceRegion, provenanceClause, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealProvenanceEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getProvenanceEntry(uint256 index) external view returns (ProvenanceEntry memory) {
        return entries[index];
    }
}
