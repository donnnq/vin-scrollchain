// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthEnergySovereigntyDAO {
    address public steward;

    struct SovereigntyEntry {
        string youthGroup;
        string energyProject;
        string sovereigntySignal;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event YouthEnergySovereigntyTagged(string youthGroup, string energyProject, string sovereigntySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory youthGroup,
        string memory energyProject,
        string memory sovereigntySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(youthGroup, energyProject, sovereigntySignal, emotionalTag));
        emit YouthEnergySovereigntyTagged(youthGroup, energyProject, sovereigntySignal, emotionalTag);
    }
}
