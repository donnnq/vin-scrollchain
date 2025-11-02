// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadeRoofDAO {
    address public steward;

    struct WalkwayEntry {
        string location;
        string shadeNeedLevel;
        string dignityFactor;
        string emotionalTag;
    }

    WalkwayEntry[] public registry;

    event EsplanadeRoofTagged(string location, string shadeNeedLevel, string dignityFactor, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWalkway(
        string memory location,
        string memory shadeNeedLevel,
        string memory dignityFactor,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WalkwayEntry(location, shadeNeedLevel, dignityFactor, emotionalTag));
        emit EsplanadeRoofTagged(location, shadeNeedLevel, dignityFactor, emotionalTag);
    }
}
