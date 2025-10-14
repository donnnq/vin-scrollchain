// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHTruthTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string projectName;
        string region;
        string tribunalClause;
        string emotionalTag;
        bool adjudicated;
    }

    TribunalEntry[] public tribunal;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _projectName, string memory _region, string memory _tribunalClause, string memory _emotionalTag) external onlyAdmin {
        tribunal.push(TribunalEntry(_projectName, _region, _tribunalClause, _emotionalTag, false));
    }

    function adjudicateEntry(uint256 index) external onlyAdmin {
        tribunal[index].adjudicated = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return tribunal[index];
    }
}
