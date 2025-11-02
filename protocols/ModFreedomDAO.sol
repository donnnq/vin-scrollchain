// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModFreedomDAO {
    address public steward;

    struct ModEntry {
        string modTitle;
        string platform;
        string freedomStatus;
        string emotionalTag;
    }

    ModEntry[] public registry;

    event ModFreedomTagged(string modTitle, string platform, string freedomStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagModFreedom(
        string memory modTitle,
        string memory platform,
        string memory freedomStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ModEntry(modTitle, platform, freedomStatus, emotionalTag));
        emit ModFreedomTagged(modTitle, platform, freedomStatus, emotionalTag);
    }
}
