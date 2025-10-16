// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalForgivenessLedgerDAO {
    address public admin;

    struct ForgivenessEntry {
        string entityLabel;
        string forgivenessClause;
        string emotionalTag;
        bool granted;
    }

    ForgivenessEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _entityLabel, string memory _forgivenessClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(ForgivenessEntry(_entityLabel, _forgivenessClause, _emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        ledger[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ForgivenessEntry memory) {
        return ledger[index];
    }
}
