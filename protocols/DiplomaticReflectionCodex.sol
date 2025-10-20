// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticReflectionCodex {
    address public admin;

    struct ReflectionEntry {
        string region;
        string diplomaticActor;
        string reassessmentClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    ReflectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReflection(string memory region, string memory diplomaticActor, string memory reassessmentClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ReflectionEntry(region, diplomaticActor, reassessmentClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealReflectionEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getReflectionEntry(uint256 index) external view returns (ReflectionEntry memory) {
        return entries[index];
    }
}
