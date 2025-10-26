// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CompanionToPlanetaryEthicsGrid {
    address public steward;

    struct EthicsEntry {
        string companionType; // "AI friend, emotional assistant, digital confidant"
        string ethicsClause; // "Scrollchain-sealed grid for emotional sovereignty, ethical containment, and planetary consequence"
        string emotionalTag;
        bool indexed;
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

    function indexEthics(string memory companionType, string memory ethicsClause, string memory emotionalTag) external onlySteward {
        entries.push(EthicsEntry(companionType, ethicsClause, emotionalTag, true, false));
    }

    function sealEthicsEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
