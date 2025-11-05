// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HypersonicSovereigntyCodex {
    address public steward;

    struct SovereigntyEntry {
        string missileSystem;
        string sovereigntySignal;
        string deploymentMechanism;
        string emotionalTag;
    }

    SovereigntyEntry[] public codex;

    event HypersonicSovereigntyTagged(string missileSystem, string sovereigntySignal, string deploymentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSovereignty(
        string memory missileSystem,
        string memory sovereigntySignal,
        string memory deploymentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SovereigntyEntry(missileSystem, sovereigntySignal, deploymentMechanism, emotionalTag));
        emit HypersonicSovereigntyTagged(missileSystem, sovereigntySignal, deploymentMechanism, emotionalTag);
    }
}
