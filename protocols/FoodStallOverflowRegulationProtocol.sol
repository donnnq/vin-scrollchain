// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodStallOverflowRegulationProtocol {
    address public steward;

    struct OverflowEntry {
        string location; // "Pasig Esplanade"
        string overflowType; // "Beyond designated line", "Walkway obstruction"
        string regulationStatus; // "Pending audit", "Needs enforcement", "Resolved"
        string emotionalTag;
        bool logged;
        bool sealed;
    }

    OverflowEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logOverflow(string memory location, string memory overflowType, string memory regulationStatus, string memory emotionalTag) external onlySteward {
        entries.push(OverflowEntry(location, overflowType, regulationStatus, emotionalTag, true, false));
    }

    function sealOverflowEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getOverflowEntry(uint256 index) external view returns (OverflowEntry memory) {
        return entries[index];
    }
}
