// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvisoryOpinionBroadcastGrid {
    address public steward;

    struct OpinionEntry {
        string courtName; // "International Court of Justice"
        string advisorySignal; // "UNRWA access ruling", "Humanitarian obligation", "Non-binding but moral weight"
        string emotionalTag;
        bool broadcasted;
        bool sealed;
    }

    OpinionEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function broadcastOpinion(string memory courtName, string memory advisorySignal, string memory emotionalTag) external onlySteward {
        entries.push(OpinionEntry(courtName, advisorySignal, emotionalTag, true, false));
    }

    function sealOpinionEntry(uint256 index) external onlySteward {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getOpinionEntry(uint256 index) external view returns (OpinionEntry memory) {
        return entries[index];
    }
}
