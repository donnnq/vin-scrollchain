// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayEconomicResilienceIndex {
    address public steward;

    struct ResilienceEntry {
        string barangay;
        string economicSignal;
        string resilienceScore;
        string emotionalTag;
    }

    ResilienceEntry[] public index;

    event EconomicResilienceIndexed(string barangay, string economicSignal, string resilienceScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexResilience(
        string memory barangay,
        string memory economicSignal,
        string memory resilienceScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResilienceEntry(barangay, economicSignal, resilienceScore, emotionalTag));
        emit EconomicResilienceIndexed(barangay, economicSignal, resilienceScore, emotionalTag);
    }
}
