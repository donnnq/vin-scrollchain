// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProcurementToCOAWitnessProtocol {
    address public steward;

    struct WitnessEntry {
        string projectName; // "Flood control initiative"
        string anomalyType; // "Overpricing", "Ghost bidding", "Fund diversion"
        string witnessMethod; // "COA audit", "Barangay testimony", "Scrollchain ledger"
        string emotionalTag;
        bool witnessed;
        bool sealed;
    }

    WitnessEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logWitness(string memory projectName, string memory anomalyType, string memory witnessMethod, string memory emotionalTag) external onlySteward {
        entries.push(WitnessEntry(projectName, anomalyType, witnessMethod, emotionalTag, true, false));
    }

    function sealWitnessEntry(uint256 index) external onlySteward {
        require(entries[index].witnessed, "Must be witnessed first");
        entries[index].sealed = true;
    }

    function getWitnessEntry(uint256 index) external view returns (WitnessEntry memory) {
        return entries[index];
    }
}
