// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EnvironmentalComplianceBroadcastIndex {
    address public admin;

    struct BroadcastEntry {
        string projectName; // "PAREX"
        string complianceSignal; // "ECC pending", "Design revision required", "Public hearing scheduled"
        string broadcastChannel; // "DENR bulletin", "TRB advisory", "Citizen digest"
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

    function broadcastCompliance(string memory projectName, string memory complianceSignal, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(projectName, complianceSignal, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
