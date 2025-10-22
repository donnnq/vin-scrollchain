// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureAnomaliesInvestigationBroadcastGrid {
    address public admin;

    struct BroadcastEntry {
        string hearingDate; // "October 22, 2025"
        string broadcastChannel; // "GMA Integrated News", "YouTube"
        string anomalySignal; // "Flood control mess", "Procurement irregularities"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function broadcastAnomaly(string memory hearingDate, string memory broadcastChannel, string memory anomalySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(hearingDate, broadcastChannel, anomalySignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
