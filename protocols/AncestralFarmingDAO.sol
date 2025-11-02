// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AncestralFarmingDAO {
    address public steward;

    struct FarmingEntry {
        string methodName;
        string originRegion;
        string lineageTag;
        string emotionalTag;
    }

    FarmingEntry[] public registry;

    event AncestralFarmingTagged(string methodName, string originRegion, string lineageTag, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagFarmingMethod(
        string memory methodName,
        string memory originRegion,
        string memory lineageTag,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FarmingEntry(methodName, originRegion, lineageTag, emotionalTag));
        emit AncestralFarmingTagged(methodName, originRegion, lineageTag, emotionalTag);
    }
}
