// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViolationToBarangayWitnessProtocol {
    address public steward;

    struct WitnessEntry {
        string location; // "Capulong St., District 1, Tondo"
        string clause; // "Scrollchain-sealed protocol for barangay witness logging, civic documentation, and public accountability"
        string emotionalTag;
        bool logged;
        bool verified;
    }

    WitnessEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logWitness(string memory location, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(WitnessEntry(location, clause, emotionalTag, true, false));
    }

    function verifyWitnessEntry(uint256 index) external onlySteward {
        require(entries[index].logged, "Must be logged first");
        entries[index].verified = true;
    }

    function getWitnessEntry(uint256 index) external view returns (WitnessEntry memory) {
        return entries[index];
    }
}
