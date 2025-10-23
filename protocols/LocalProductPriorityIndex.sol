// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalProductPriorityIndex {
    address public steward;

    struct PriorityEntry {
        string productType; // "Beef", "Rice", "Coffee"
        string region; // "Tennessee", "Bulacan", "Ilocos"
        string priorityStatus; // "Primary", "Fallback", "Emergency reserve"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    PriorityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexProduct(string memory productType, string memory region, string memory priorityStatus, string memory emotionalTag) external onlySteward {
        entries.push(PriorityEntry(productType, region, priorityStatus, emotionalTag, true, false));
    }

    function sealPriorityEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getPriorityEntry(uint256 index) external view returns (PriorityEntry memory) {
        return entries[index];
    }
}
