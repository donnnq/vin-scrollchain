// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanLedModerationDAO {
    address public admin;

    struct ModerationEntry {
        string moderatorName;
        string platformLabel;
        string moderationMethod;
        string emotionalTag;
        bool active;
    }

    ModerationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory moderatorName, string memory platformLabel, string memory moderationMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(ModerationEntry(moderatorName, platformLabel, moderationMethod, emotionalTag, true));
    }

    function deactivateEntry(uint256 index) external onlyAdmin {
        entries[index].active = false;
    }

    function getEntry(uint256 index) external view returns (ModerationEntry memory) {
        return entries[index];
    }
}
