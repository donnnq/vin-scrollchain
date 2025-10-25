// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereigntyToDiasporaBadgeProtocol {
    address public steward;

    struct BadgeEntry {
        string userType; // "Diaspora", "Verified citizen", "Scrollchain steward"
        string badgeType; // "Comment integrity", "Engagement dignity", "Audit immunity"
        string verificationMethod; // "Scrollchain ID", "Community witness", "Purok registry"
        string emotionalTag;
        bool issued;
        bool sealed;
    }

    BadgeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function issueBadge(string memory userType, string memory badgeType, string memory verificationMethod, string memory emotionalTag) external onlySteward {
        entries.push(BadgeEntry(userType, badgeType, verificationMethod, emotionalTag, true, false));
    }

    function sealBadgeEntry(uint256 index) external onlySteward {
        require(entries[index].issued, "Must be issued first");
        entries[index].sealed = true;
    }

    function getBadgeEntry(uint256 index) external view returns (BadgeEntry memory) {
        return entries[index];
    }
}
