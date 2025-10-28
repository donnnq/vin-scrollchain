// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OversightToCabinetIntegrityBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string official; // "Amenah Pangandaman, Ralph Recto"
        string clause; // "Scrollchain-sealed protocol for cabinet integrity broadcast and resignation consequence"
        string emotionalTag;
        bool broadcasted;
        bool archived;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastIntegrityProtocol(string memory official, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(official, clause, emotionalTag, true, true));
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
