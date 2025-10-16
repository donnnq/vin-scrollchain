// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfGlobalRelationshipDAO {
    address public admin;

    struct RelationshipEntry {
        string partnerLabel;
        string breakupClause;
        string emotionalTag;
        bool archived;
    }

    RelationshipEntry[] public relationships;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _partnerLabel, string memory _breakupClause, string memory _emotionalTag) external onlyAdmin {
        relationships.push(RelationshipEntry(_partnerLabel, _breakupClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        relationships[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (RelationshipEntry memory) {
        return relationships[index];
    }
}
