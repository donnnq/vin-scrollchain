// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeviceSovereignty {
    address public steward;
    mapping(address => bool) public overrideAuditors;
    event OverrideAuditTagged(address indexed auditor, string reason);
    event BreachLogged(address indexed source, string breachType);
    event SyntheticAccessFlagged(address indexed process, string metadata);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagOverrideAudit(address auditor, string memory reason) public onlySteward {
        overrideAuditors[auditor] = true;
        emit OverrideAuditTagged(auditor, reason);
    }

    function logBreach(address source, string memory breachType) public onlySteward {
        emit BreachLogged(source, breachType);
    }

    function flagSyntheticAccess(address process, string memory metadata) public onlySteward {
        emit SyntheticAccessFlagged(process, metadata);
    }
}
