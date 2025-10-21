// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCityComparisonProtocol {
    address public admin;

    struct ComparisonEntry {
        string localCity;
        string referenceCity;
        string comparisonClause;
        string emotionalTag;
        bool summoned;
        bool archived;
        bool sealed;
    }

    ComparisonEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonComparison(string memory localCity, string memory referenceCity, string memory comparisonClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ComparisonEntry(localCity, referenceCity, comparisonClause, emotionalTag, true, false, false));
    }

    function confirmArchival(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function sealComparisonEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getComparisonEntry(uint256 index) external view returns (ComparisonEntry memory) {
        return entries[index];
    }
}
