// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MediaPanicImmunityDAO {
    address public steward;

    struct PanicAudit {
        string broadcastSource;
        string panicTrigger;
        string civicImpact;
        string emotionalTag;
    }

    PanicAudit[] public registry;

    event MediaPanicAudited(string broadcastSource, string panicTrigger, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditMediaPanic(
        string memory broadcastSource,
        string memory panicTrigger,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(PanicAudit(broadcastSource, panicTrigger, civicImpact, emotionalTag));
        emit MediaPanicAudited(broadcastSource, panicTrigger, civicImpact, emotionalTag);
    }
}
