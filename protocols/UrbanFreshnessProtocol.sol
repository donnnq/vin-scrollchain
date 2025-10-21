// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanFreshnessProtocol {
    address public admin;

    struct FreshnessEntry {
        string locationSegment;
        string greeneryType;
        string freshnessClause;
        string emotionalTag;
        bool summoned;
        bool planted;
        bool sealed;
    }

    FreshnessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFreshness(string memory locationSegment, string memory greeneryType, string memory freshnessClause, string memory emotionalTag) external onlyAdmin {
        entries.push(FreshnessEntry(locationSegment, greeneryType, freshnessClause, emotionalTag, true, false, false));
    }

    function confirmPlanting(uint256 index) external onlyAdmin {
        entries[index].planted = true;
    }

    function sealFreshnessEntry(uint256 index) external onlyAdmin {
        require(entries[index].planted, "Must be planted first");
        entries[index].sealed = true;
    }

    function getFreshnessEntry(uint256 index) external view returns (FreshnessEntry memory) {
        return entries[index];
    }
}
