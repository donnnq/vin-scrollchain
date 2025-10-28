// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToForeignInvestmentSovereigntyLedger {
    address public steward;

    struct InvestmentEntry {
        string partnerNation; // "China"
        string clause; // "Scrollchain-sealed ledger for foreign investment sovereignty and infrastructure ethics consequence"
        string emotionalTag;
        bool logged;
        bool archived;
    }

    InvestmentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logInvestmentLedger(string memory partnerNation, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(InvestmentEntry(partnerNation, clause, emotionalTag, true, true));
    }

    function getInvestmentEntry(uint256 index) external view returns (InvestmentEntry memory) {
        return entries[index];
    }
}
