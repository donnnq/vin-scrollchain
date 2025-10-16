// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenOversightBroadcastConstitution {
    address public admin;

    struct OversightClause {
        string clauseLabel;
        string broadcastProtocol;
        string emotionalTag;
        bool ratified;
    }

    OversightClause[] public clauses;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitClause(string memory clauseLabel, string memory broadcastProtocol, string memory emotionalTag) external onlyAdmin {
        clauses.push(OversightClause(clauseLabel, broadcastProtocol, emotionalTag, false));
    }

    function ratifyClause(uint256 index) external onlyAdmin {
        clauses[index].ratified = true;
    }

    function getClause(uint256 index) external view returns (OversightClause memory) {
        return clauses[index];
    }
}
