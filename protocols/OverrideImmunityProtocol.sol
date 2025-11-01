// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OverrideImmunityProtocol {
    address public steward;

    struct ImmunityEntry {
        string deviceID;
        string overrideSource;
        string immunityLevel;
        string emotionalTag;
    }

    ImmunityEntry[] public immunityLog;

    event ImmunityActivated(string deviceID, string overrideSource, string immunityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function activateImmunity(
        string memory deviceID,
        string memory overrideSource,
        string memory immunityLevel,
        string memory emotionalTag
    ) public onlySteward {
        immunityLog.push(ImmunityEntry(deviceID, overrideSource, immunityLevel, emotionalTag));
        emit ImmunityActivated(deviceID, overrideSource, immunityLevel, emotionalTag);
    }
}
