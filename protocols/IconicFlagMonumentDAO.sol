// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IconicFlagMonumentDAO {
    address public steward;

    struct FlagEntry {
        string parkName;
        string flagType;
        string monumentPartner;
        string emotionalTag;
    }

    FlagEntry[] public registry;

    event FlagMonumentTagged(string parkName, string flagType, string monumentPartner, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagFlagMonument(
        string memory parkName,
        string memory flagType,
        string memory monumentPartner,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(FlagEntry(parkName, flagType, monumentPartner, emotionalTag));
        emit FlagMonumentTagged(parkName, flagType, monumentPartner, emotionalTag);
    }
}
