// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GriefSupportDAO {
    address public steward;

    struct SupportEntry {
        string toolName;
        string griefType;
        string ritualProtocol;
        string emotionalTag;
    }

    SupportEntry[] public registry;

    event GriefSupportTagged(string toolName, string griefType, string ritualProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSupport(
        string memory toolName,
        string memory griefType,
        string memory ritualProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SupportEntry(toolName, griefType, ritualProtocol, emotionalTag));
        emit GriefSupportTagged(toolName, griefType, ritualProtocol, emotionalTag);
    }
}
