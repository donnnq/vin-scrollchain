// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KarmicLedgerToResignationBroadcast {
    address public steward;

    struct BroadcastEntry {
        string leaderName;
        string karmicSignal; // "Neglect", "Oversight", "Complicity"
        string resignationStatus; // "Requested", "Pending", "Refused"
        string broadcastChannel; // "Public tribunal", "Civic theater", "Scrollchain ledger"
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

    function broadcastResignation(string memory leaderName, string memory karmicSignal, string memory resignationStatus, string memory broadcastChannel, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(leaderName, karmicSignal, resignationStatus, broadcastChannel, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
