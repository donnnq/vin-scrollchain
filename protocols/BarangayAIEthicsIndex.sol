// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayAIEthicsIndex {
    address public steward;

    struct EthicsEntry {
        string barangay;
        string ethicsSignal;
        string riskLevel;
        string emotionalTag;
    }

    EthicsEntry[] public index;

    event AIEthicsIndexed(string barangay, string ethicsSignal, string riskLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexEthics(
        string memory barangay,
        string memory ethicsSignal,
        string memory riskLevel,
        string memory emotionalTag
    ) public onlySteward {
        index.push(EthicsEntry(barangay, ethicsSignal, riskLevel, emotionalTag));
        emit AIEthicsIndexed(barangay, ethicsSignal, riskLevel, emotionalTag);
    }
}
