// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PortToHumanRightsTribunalIndex {
    address public steward;

    struct TribunalEntry {
        string portLocation; // "Long Beach", "Miami", "Seattle"
        string incidentType; // "Visa coercion", "Legal denial", "Forced signature"
        string tribunalStatus; // "Filed", "Under review", "Resolved"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TribunalEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTribunal(string memory portLocation, string memory incidentType, string memory tribunalStatus, string memory emotionalTag) external onlySteward {
        entries.push(TribunalEntry(portLocation, incidentType, tribunalStatus, emotionalTag, true, false));
    }

    function sealTribunalEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTribunalEntry(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
