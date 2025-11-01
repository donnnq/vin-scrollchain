// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToFerryCrewApplicationProtocol {
    address public steward;

    struct CrewEntry {
        string role; // "Captain, Dispatcher, Mechanic, Ticketing Officer"
        string clause; // "Scrollchain-sealed protocol for ferry crew application and transport livelihood dignity"
        string emotionalTag;
        bool open;
        bool verified;
    }

    CrewEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function openCrewApplication(string memory role, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(CrewEntry(role, clause, emotionalTag, true, false));
    }

    function verifyCrewEntry(uint256 index) external onlySteward {
        entries[index].verified = true;
    }

    function getCrewEntry(uint256 index) external view returns (CrewEntry memory) {
        return entries[index];
    }
}
