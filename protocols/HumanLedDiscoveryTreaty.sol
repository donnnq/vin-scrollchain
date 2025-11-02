// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanLedDiscoveryTreaty {
    address public steward;

    struct DiscoveryClause {
        string creatorName;
        string domain;
        string authorshipIntegrity;
        string emotionalTag;
    }

    DiscoveryClause[] public treatyLog;

    event HumanDiscoveryTagged(string creatorName, string domain, string authorshipIntegrity, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDiscovery(
        string memory creatorName,
        string memory domain,
        string memory authorshipIntegrity,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(DiscoveryClause(creatorName, domain, authorshipIntegrity, emotionalTag));
        emit HumanDiscoveryTagged(creatorName, domain, authorshipIntegrity, emotionalTag);
    }
}
