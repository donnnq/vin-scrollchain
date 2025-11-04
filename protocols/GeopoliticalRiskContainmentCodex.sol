// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeopoliticalRiskContainmentCodex {
    address public steward;

    struct ContainmentEntry {
        string region;
        string riskType;
        string containmentMechanism;
        string emotionalTag;
    }

    ContainmentEntry[] public codex;

    event GeopoliticalRiskContained(string region, string riskType, string containmentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containRisk(
        string memory region,
        string memory riskType,
        string memory containmentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ContainmentEntry(region, riskType, containmentMechanism, emotionalTag));
        emit GeopoliticalRiskContained(region, riskType, containmentMechanism, emotionalTag);
    }
}
