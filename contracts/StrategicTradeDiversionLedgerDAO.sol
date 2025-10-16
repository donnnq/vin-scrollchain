// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StrategicTradeDiversionLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string sectorLabel;
        string diversionClause;
        string emotionalTag;
        bool redirected;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _sectorLabel, string memory _diversionClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_sectorLabel, _diversionClause, _emotionalTag, false));
    }

    function markRedirected(uint256 index) external onlyAdmin {
        ledger[index].redirected = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
