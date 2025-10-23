// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmerToTradePolicyBroadcast {
    address public steward;

    struct BroadcastEntry {
        string farmerRegion; // "Tennessee", "Bulacan"
        string tradeConcern; // "Argentinian beef", "Price chaos", "Market displacement"
        string policyDemand; // "Local-first clause", "Import buffer rule"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastPolicy(string memory farmerRegion, string memory tradeConcern, string memory policyDemand, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(farmerRegion, tradeConcern, policyDemand, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
