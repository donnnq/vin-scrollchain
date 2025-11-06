// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ShadeEquityProtocol {
    address public steward;

    struct ShadeEntry {
        string location;
        string roadType;
        string shadeDeficiencyLevel;
        string pedestrianImpact;
        string emotionalTag;
    }

    ShadeEntry[] public registry;

    event ShadeEquityTagged(string location, string roadType, string shadeDeficiencyLevel, string pedestrianImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagShadeEquity(
        string memory location,
        string memory roadType,
        string memory shadeDeficiencyLevel,
        string memory pedestrianImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ShadeEntry(location, roadType, shadeDeficiencyLevel, pedestrianImpact, emotionalTag));
        emit ShadeEquityTagged(location, roadType, shadeDeficiencyLevel, pedestrianImpact, emotionalTag);
    }
}
