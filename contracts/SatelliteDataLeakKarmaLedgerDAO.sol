// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatelliteDataLeakKarmaLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string operatorLabel;
        string leakClause;
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

    function submitEntry(string memory _operatorLabel, string memory _leakClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_operatorLabel, _leakClause, _emotionalTag, false));
    }

    function markLogged(uint256 index) external onlyAdmin {
        ledger[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
