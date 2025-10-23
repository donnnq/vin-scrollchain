// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuditImmunityBroadcastProtocol {
    address public steward;

    struct BroadcastEntry {
        string agency; // "COA", "Ombudsman", "Civil society"
        string broadcastSignal; // "Audit transparency", "Whistleblower protection", "Public ledger access"
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

    function broadcastAuditSignal(string memory agency, string memory broadcastSignal, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(agency, broadcastSignal, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
