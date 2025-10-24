// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VATRemovalToEnergyEquityLedger {
    address public steward;

    struct EquityEntry {
        string taxType; // "12% VAT on electricity"
        string removalProposal; // "Marcoleta Bill"
        string equitySignal; // "Billing dignity", "Household relief"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logEquity(string memory taxType, string memory removalProposal, string memory equitySignal, string memory emotionalTag) external onlySteward {
        entries.push(EquityEntry(taxType, removalProposal, equitySignal, emotionalTag, true, false));
    }

    function sealEquityEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
