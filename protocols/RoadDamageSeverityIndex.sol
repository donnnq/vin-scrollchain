// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RoadDamageSeverityIndex {
    address public steward;

    struct DamageEntry {
        string roadName;
        string damageLevel;
        string recommendedFix;
        string emotionalTag;
    }

    DamageEntry[] public index;

    event RoadDamageTagged(string roadName, string damageLevel, string recommendedFix, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDamage(
        string memory roadName,
        string memory damageLevel,
        string memory recommendedFix,
        string memory emotionalTag
    ) public onlySteward {
        index.push(DamageEntry(roadName, damageLevel, recommendedFix, emotionalTag));
        emit RoadDamageTagged(roadName, damageLevel, recommendedFix, emotionalTag);
    }
}
