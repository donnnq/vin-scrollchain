// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DumpingToRestorationTaxGrid {
    address public steward;

    struct TaxEntry {
        string originCountry; // "China"
        string triggerCondition; // "Product price below fair market value"
        string taxType; // "Restoration levy"
        string emotionalTag;
        bool activated;
        bool sealed;
    }

    TaxEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function activateTax(string memory originCountry, string memory triggerCondition, string memory taxType, string memory emotionalTag) external onlySteward {
        entries.push(TaxEntry(originCountry, triggerCondition, taxType, emotionalTag, true, false));
    }

    function sealTaxEntry(uint256 index) external onlySteward {
        require(entries[index].activated, "Must be activated first");
        entries[index].sealed = true;
    }

    function getTaxEntry(uint256 index) external view returns (TaxEntry memory) {
        return entries[index];
    }
}
