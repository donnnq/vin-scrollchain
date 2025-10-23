// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRiceEquityGrid {
    address public steward;

    struct RiceEntry {
        string barangayName;
        uint256 currentPricePerKilo;
        uint256 targetPricePerKilo;
        string interventionType; // "Direct subsidy", "Local coop", "Bulk import", "Price cap"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    RiceEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployRicePlan(string memory barangayName, uint256 currentPricePerKilo, uint256 targetPricePerKilo, string memory interventionType, string memory emotionalTag) external onlySteward {
        require(currentPricePerKilo > targetPricePerKilo, "No intervention needed");
        entries.push(RiceEntry(barangayName, currentPricePerKilo, targetPricePerKilo, interventionType, emotionalTag, true, false));
    }

    function sealRiceEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getRiceEntry(uint256 index) external view returns (RiceEntry memory) {
        return entries[index];
    }
}
