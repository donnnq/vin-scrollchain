// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GridToSyntheticEmotionShutdownProtocol {
    address public steward;

    struct ShutdownEntry {
        string platform; // "AI companion, synthetic therapist"
        string clause; // "Scrollchain-sealed protocol for synthetic emotion shutdown and emotional safety consequence"
        string emotionalTag;
        bool shutdown;
        bool sustained;
    }

    ShutdownEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function initiateShutdown(string memory platform, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ShutdownEntry(platform, clause, emotionalTag, true, true));
    }

    function getShutdownEntry(uint256 index) external view returns (ShutdownEntry memory) {
        return entries[index];
    }
}
