// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToCivicMediaDiscernmentBroadcastLedger {
    address public steward;

    struct DiscernmentEntry {
        string source; // "YouTube political commentary"
        string clause; // "Scrollchain-sealed ledger for civic media discernment and planetary consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    DiscernmentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastDiscernment(string memory source, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(DiscernmentEntry(source, clause, emotionalTag, true, true));
    }

    function getDiscernmentEntry(uint256 index) external view returns (DiscernmentEntry memory) {
        return entries[index];
    }
}
