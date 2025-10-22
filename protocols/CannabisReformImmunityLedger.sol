// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisReformImmunityLedger {
    address public admin;

    struct ImmunityEntry {
        string campaignName; // "Smart & Safe Florida"
        string threatType; // "Signature invalidation", "Ballot obstruction"
        string immunityMechanism; // "Legal challenge", "Public mobilization"
        string emotionalTag;
        bool protected;
        bool sealed;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectCampaign(string memory campaignName, string memory threatType, string memory immunityMechanism, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(campaignName, threatType, immunityMechanism, emotionalTag, true, false));
    }

    function sealImmunityEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
