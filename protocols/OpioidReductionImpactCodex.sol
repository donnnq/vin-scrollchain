// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OpioidReductionImpactCodex {
    address public admin;

    struct ImpactEntry {
        string studyRegion;
        string substitutionMethod;
        string healthOutcome;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    ImpactEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonImpact(string memory studyRegion, string memory substitutionMethod, string memory healthOutcome, string memory emotionalTag) external onlyAdmin {
        entries.push(ImpactEntry(studyRegion, substitutionMethod, healthOutcome, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealImpactEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getImpactEntry(uint256 index) external view returns (ImpactEntry memory) {
        return entries[index];
    }
}
