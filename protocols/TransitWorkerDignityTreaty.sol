// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransitWorkerDignityTreaty {
    address public steward;

    struct DignityEntry {
        string workerRole;
        string incidentType;
        string dignityViolation;
        string emotionalTag;
    }

    DignityEntry[] public treaty;

    event TransitDignityTagged(string workerRole, string incidentType, string dignityViolation, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDignity(
        string memory workerRole,
        string memory incidentType,
        string memory dignityViolation,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(DignityEntry(workerRole, incidentType, dignityViolation, emotionalTag));
        emit TransitDignityTagged(workerRole, incidentType, dignityViolation, emotionalTag);
    }
}
