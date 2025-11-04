// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksSovereigntyDAO {
    address public steward;

    struct SovereigntyEntry {
        string infrastructureType;
        string sovereigntySignal;
        string governanceMechanism;
        string emotionalTag;
    }

    SovereigntyEntry[] public registry;

    event PublicWorksSovereigntyTagged(string infrastructureType, string sovereigntySignal, string governanceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory infrastructureType,
        string memory sovereigntySignal,
        string memory governanceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SovereigntyEntry(infrastructureType, sovereigntySignal, governanceMechanism, emotionalTag));
        emit PublicWorksSovereigntyTagged(infrastructureType, sovereigntySignal, governanceMechanism, emotionalTag);
    }
}
