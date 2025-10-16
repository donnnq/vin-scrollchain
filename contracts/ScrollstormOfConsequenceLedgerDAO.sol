// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollstormOfConsequenceLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string actorLabel;
        string consequenceClause;
        string emotionalTag;
        bool logged;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _actorLabel, string memory _consequenceClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_actorLabel, _consequenceClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
