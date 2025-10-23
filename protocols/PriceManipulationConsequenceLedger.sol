// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PriceManipulationConsequenceLedger {
    address public steward;

    struct ViolationEntry {
        string violatorName;
        string productType; // "Rice", "Meat", "Fish", "Vegetables"
        string manipulationType; // "Hoarding", "Overpricing", "Fake shortage"
        string emotionalTag;
        bool flagged;
        bool sealed;
    }

    ViolationEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function flagViolation(string memory violatorName, string memory productType, string memory manipulationType, string memory emotionalTag) external onlySteward {
        entries.push(ViolationEntry(violatorName, productType, manipulationType, emotionalTag, true, false));
    }

    function sealViolationEntry(uint256 index) external onlySteward {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getViolationEntry(uint256 index) external view returns (ViolationEntry memory) {
        return entries[index];
    }
}
