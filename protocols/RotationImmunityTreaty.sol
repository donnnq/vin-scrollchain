// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RotationImmunityTreaty {
    address public steward;

    struct ImmunityEntry {
        string corridor;
        string assetClass;
        string immunityLevel;
        string emotionalTag;
    }

    ImmunityEntry[] public treatyLog;

    event ImmunityGranted(string corridor, string assetClass, string immunityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function grantImmunity(
        string memory corridor,
        string memory assetClass,
        string memory immunityLevel,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ImmunityEntry(corridor, assetClass, immunityLevel, emotionalTag));
        emit ImmunityGranted(corridor, assetClass, immunityLevel, emotionalTag);
    }
}
