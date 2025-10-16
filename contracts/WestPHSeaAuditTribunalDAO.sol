// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WestPHSeaAuditTribunalDAO {
    address public admin;

    struct TribunalEntry {
        string incidentLabel;
        string auditClause;
        string emotionalTag;
        bool resolved;
    }

    TribunalEntry[] public tribunal;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _incidentLabel, string memory _auditClause, string memory _emotionalTag) external onlyAdmin {
        tribunal.push(TribunalEntry(_incidentLabel, _auditClause, _emotionalTag, false));
    }

    function resolveEntry(uint256 index) external onlyAdmin {
        tribunal[index].resolved = true;
    }

    function getEntry(uint256 index) external view returns (TribunalEntry memory) {
        return tribunal[index];
    }
}
