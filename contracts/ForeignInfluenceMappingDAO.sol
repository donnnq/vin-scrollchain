// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeignInfluenceMappingDAO {
    address public admin;

    struct InfluenceEntry {
        string entityLabel;
        string influenceClause;
        string emotionalTag;
        bool mapped;
    }

    InfluenceEntry[] public influence;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _entityLabel, string memory _influenceClause, string memory _emotionalTag) external onlyAdmin {
        influence.push(InfluenceEntry(_entityLabel, _influenceClause, _emotionalTag, false));
    }

    function markMapped(uint256 index) external onlyAdmin {
        influence[index].mapped = true;
    }

    function getEntry(uint256 index) external view returns (InfluenceEntry memory) {
        return influence[index];
    }
}
