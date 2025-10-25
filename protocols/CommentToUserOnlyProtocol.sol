// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentToUserOnlyProtocol {
    address public steward;

    struct CommentEntry {
        string platform; // "YouTube", "Twitter", "Facebook", "TikTok"
        string restrictionType; // "User-only comments", "Verified human input"
        string enforcementMethod; // "Scrollchain filter", "Bot firewall", "Diaspora moderation"
        string emotionalTag;
        bool enforced;
        bool sealed;
    }

    CommentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function enforceUserOnly(string memory platform, string memory restrictionType, string memory enforcementMethod, string memory emotionalTag) external onlySteward {
        entries.push(CommentEntry(platform, restrictionType, enforcementMethod, emotionalTag, true, false));
    }

    function sealCommentEntry(uint256 index) external onlySteward {
        require(entries[index].enforced, "Must be enforced first");
        entries[index].sealed = true;
    }

    function getCommentEntry(uint256 index) external view returns (CommentEntry memory) {
        return entries[index];
    }
}
