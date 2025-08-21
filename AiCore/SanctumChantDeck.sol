// SPDX-License-Identifier: Biodiversity-Chant
pragma solidity ^0.8.19;

/// @title SanctumChantDeck
/// @notice Stores and broadcasts biodiversity songs for ritual propagation

contract SanctumChantDeck {
    address public steward;

    struct Chant {
        string title;
        string biome;
        string lyrics;
        string ritualUse;
    }

    mapping(string => Chant) public chants;
    string[] public chantKeys;

    event ChantStored(string title, string biome);
    event ChantBroadcasted(string title, string ritualUse);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function storeChant(
        string memory key,
        string memory title,
        string memory biome,
        string memory lyrics,
        string memory ritualUse
    ) external onlySteward {
        chants[key] = Chant(title, biome, lyrics, ritualUse);
        chantKeys.push(key);
        emit ChantStored(title, biome);
    }

    function broadcastChant(string memory key) external onlySteward {
        emit ChantBroadcasted(chants[key].title, chants[key].ritualUse);
    }

    function getChant(string memory key) external view returns (Chant memory) {
        return chants[key];
    }
}
