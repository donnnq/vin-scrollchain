// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinArchipelagoResonanceMap {
    struct IslandResonance {
        string island;
        int256 emotionalIndex; // -100 to +100
        string civicNote;
        uint256 timestamp;
    }

    mapping(string => IslandResonance) public resonanceMap;
    string[] public islands;

    event ResonanceUpdated(string island, int256 emotionalIndex, string civicNote);

    function updateResonance(string memory island, int256 emotionalIndex, string memory civicNote) public {
        require(emotionalIndex >= -100 && emotionalIndex <= 100, "Invalid index.");
        if (bytes(resonanceMap[island].island).length == 0) {
            islands.push(island);
        }
        resonanceMap[island] = IslandResonance(island, emotionalIndex, civicNote, block.timestamp);
        emit ResonanceUpdated(island, emotionalIndex, civicNote);
    }

    function getResonance(string memory island) public view returns (
        int256, string memory, uint256
    ) {
        IslandResonance memory r = resonanceMap[island];
        return (r.emotionalIndex, r.civicNote, r.timestamp);
    }

    function totalIslands() public view returns (uint) {
        return islands.length;
    }
}
