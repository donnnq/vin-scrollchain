// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayAIEthicsResilienceIndex {
    address public steward;

    struct EthicsEntry {
        string barangay;
        string ethicsSignal;
        string resilienceMechanism;
        string emotionalTag;
    }

    EthicsEntry[] public index;

    event AIEthicsResilienceIndexed(string barangay, string ethicsSignal, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function indexResilience(
        string memory barangay,
        string memory ethicsSignal,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        index.push(EthicsEntry(barangay, ethicsSignal, resilienceMechanism, emotionalTag));
        emit AIEthicsResilienceIndexed(barangay, ethicsSignal, resilienceMechanism, emotionalTag);
    }
}
