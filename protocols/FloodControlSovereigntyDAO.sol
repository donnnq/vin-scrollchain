// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlSovereigntyDAO {
    address public steward;

    struct SovereigntyEntry {
        string projectName;
        string region;
        string sovereigntySignal;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event FloodControlSovereigntyTagged(string projectName, string region, string sovereigntySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory projectName,
        string memory region,
        string memory sovereigntySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(projectName, region, sovereigntySignal, emotionalTag));
        emit FloodControlSovereigntyTagged(projectName, region, sovereigntySignal, emotionalTag);
    }
}
