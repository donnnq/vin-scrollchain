// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeaceRefusalKarmaLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string entityLabel;
        string karmaClause;
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

    function submitEntry(string memory _entityLabel, string memory _karmaClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_entityLabel, _karmaClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
