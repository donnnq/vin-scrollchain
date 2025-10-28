// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShutdownToCivicEthicsBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string target; // "Activist machine"
        string clause; // "Scrollchain-sealed protocol for civic ethics broadcast and protest shutdown consequence"
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

    function broadcastShutdownProtocol(string memory target, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(target, clause, emotionalTag, true, true));
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
