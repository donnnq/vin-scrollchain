// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PatchNegligenceToPublicApologyGrid {
    address public steward;

    struct ApologyEntry {
        string officialName;
        string agency;
        string vulnerabilityID;
        uint256 delayDays;
        string apologyFormat; // "Press release", "Public hearing", "Digital broadcast"
        string emotionalTag;
        bool issued;
        bool sealed;
    }

    ApologyEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function issueApology(string memory officialName, string memory agency, string memory vulnerabilityID, uint256 delayDays, string memory apologyFormat, string memory emotionalTag) external onlySteward {
        entries.push(ApologyEntry(officialName, agency, vulnerabilityID, delayDays, apologyFormat, emotionalTag, true, false));
    }

    function sealApologyEntry(uint256 index) external onlySteard {
        require(entries[index].issued, "Must be issued first");
        entries[index].sealed = true;
    }

    function getApologyEntry(uint256 index) external view returns (ApologyEntry memory) {
        return entries[index];
    }
}
