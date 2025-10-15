// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalComputeEquityLedgerDAO {
    address public admin;

    struct EquityEntry {
        string region;
        string computeClause;
        string emotionalTag;
        bool registered;
    }

    EquityEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _region, string memory _computeClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(EquityEntry(_region, _computeClause, _emotionalTag, false));
    }

    function markRegistered(uint256 index) external onlyAdmin {
        ledger[index].registered = true;
    }

    function getEntry(uint256 index) external view returns (EquityEntry memory) {
        return ledger[index];
    }
}
