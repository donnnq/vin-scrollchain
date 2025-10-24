// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIModelToEthicsRegistry {
    address public steward;

    struct EthicsEntry {
        string modelName; // "PassiveNeuron APT", "Neurise"
        string capability; // "Cognitive mimicry", "Autonomous signal processing"
        string ethicalSignal; // "Surveillance risk", "Consent breach", "Bias propagation"
        string emotionalTag;
        bool registered;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function registerModel(string memory modelName, string memory capability, string memory ethicalSignal, string memory emotionalTag) external onlySteward {
        entries.push(EthicsEntry(modelName, capability, ethicalSignal, emotionalTag, true, false));
    }

    function sealEthicsEntry(uint256 index) external onlySteward {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
