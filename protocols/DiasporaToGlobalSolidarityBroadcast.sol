// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaToGlobalSolidarityBroadcast {
    address public steward;

    struct BroadcastEntry {
        string diasporaRegion; // "Global Christian diaspora"
        string solidarityMessage; // "America, help stop the killings in Nigeria"
        string broadcastMethod; // "Scrollchain-sealed testimony, emotional APR, diplomatic pressure"
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

    function broadcastSolidarity(string memory diasporaRegion, string memory solidarityMessage, string memory broadcastMethod, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(diasporaRegion, solidarityMessage, broadcastMethod, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
