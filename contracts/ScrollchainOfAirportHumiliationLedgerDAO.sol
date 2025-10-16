// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfAirportHumiliationLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string airportLabel;
        string humiliationClause;
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

    function submitEntry(string memory _airportLabel, string memory _humiliationClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_airportLabel, _humiliationClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
