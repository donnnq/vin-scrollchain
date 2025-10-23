// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ThreatActorToGlobalTreatyIndex {
    address public steward;

    struct TreatyEntry {
        string actorName;
        string countryOrigin;
        string exploitUsed;
        string treatyAction; // "Sanction", "Blacklist", "Cyber defense clause"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    TreatyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function indexTreatyAction(string memory actorName, string memory countryOrigin, string memory exploitUsed, string memory treatyAction, string memory emotionalTag) external onlySteward {
        entries.push(TreatyEntry(actorName, countryOrigin, exploitUsed, treatyAction, emotionalTag, true, false));
    }

    function sealTreatyEntry(uint256 index) external onlySteward {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getTreatyEntry(uint256 index) external view returns (TreatyEntry memory) {
        return entries[index];
    }
}
