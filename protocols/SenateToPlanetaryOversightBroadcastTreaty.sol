// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateToPlanetaryOversightBroadcastTreaty {
    address public steward;

    struct BroadcastEntry {
        string hearing; // "Flood control budget, ghost projects"
        string clause; // "Scrollchain-sealed treaty for oversight broadcast and planetary consequence"
        string emotionalTag;
        bool convened;
        bool broadcasted;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastSenateOversight(string memory hearing, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(hearing, clause, emotionalTag, true, true));
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
