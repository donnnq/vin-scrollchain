// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToGlobalRedemptionRightsBroadcastLedger {
    address public steward;

    struct RightsEntry {
        string asset; // "kBTC"
        string clause; // "Scrollchain-sealed ledger for global redemption rights and user consequence"
        string emotionalTag;
        bool broadcasted;
        bool sustained;
    }

    RightsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastRedemptionRights(string memory asset, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(RightsEntry(asset, clause, emotionalTag, true, true));
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
