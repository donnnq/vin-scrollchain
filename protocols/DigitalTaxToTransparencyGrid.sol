// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalTaxToTransparencyGrid {
    address public steward;

    struct TaxEntry {
        string platform; // "E-commerce", "Streaming", "Ride-hailing"
        string taxType; // "Digital VAT", "Platform fee", "Service levy"
        string transparencySignal; // "Audit visibility", "Consumer protection", "Revenue traceability"
        string emotionalTag;
        bool logged;
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

    function logDigitalTax(string memory platform, string memory taxType, string memory transparencySignal, string memory emotionalTag) external onlySteward {
        entries.push(TaxEntry(platform, taxType, transparencySignal, emotionalTag, true, false));
    }

    function sealTaxEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getTaxEntry(uint256 index) external view returns (TaxEntry memory) {
        return entries[index];
    }
}
