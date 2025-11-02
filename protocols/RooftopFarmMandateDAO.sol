// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RooftopFarmMandateDAO {
    address public steward;

    struct FarmEntry {
        string buildingName;
        string cropType;
        string laborPartner;
        string emotionalTag;
    }

    FarmEntry[] public registry;

    event FarmTagged(string buildingName, string cropType, string laborPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFarm(
        string memory buildingName,
        string memory cropType,
        string memory laborPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FarmEntry(buildingName, cropType, laborPartner, emotionalTag));
        emit FarmTagged(buildingName, cropType, laborPartner, emotionalTag);
    }
}
