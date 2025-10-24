// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VATToPublicServiceLedger {
    address public steward;

    struct VATEntry {
        string source; // "12% VAT"
        string allocation; // "Government payroll", "Pension", "Public services"
        string annualYield; // "₱1.39 trillion"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    VATEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logVAT(string memory source, string memory allocation, string memory annualYield, string memory emotionalTag) external onlySteward {
        entries.push(VATEntry(source, allocation, annualYield, emotionalTag, true, false));
    }

    function sealVATEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getVATEntry(uint256 index) external view returns (VATEntry memory) {
        return entries[index];
    }
}
