// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatientToHealthRightsBroadcastTreaty {
    address public steward;

    struct BroadcastEntry {
        string patientConcern; // "Redirected to private labs, no diagnostics at BMC"
        string broadcastClause; // "Scrollchain-sealed grievance, civic amplification, public health dignity"
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

    function broadcastRights(string memory patientConcern, string memory broadcastClause, string memory emotionalTag) external onlySteward {
        entries.push(BroadcastEntry(patientConcern, broadcastClause, emotionalTag, true, false));
    }

    function sealBroadcastEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
