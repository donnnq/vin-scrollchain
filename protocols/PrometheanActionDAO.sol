// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PrometheanActionDAO {
    address public steward;

    struct ActionEntry {
        string supporterName;
        string campaignSignal;
        string nationalistProtocol;
        string emotionalTag;
    }

    ActionEntry[] public registry;

    event PrometheanActionTagged(string supporterName, string campaignSignal, string nationalistProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAction(
        string memory supporterName,
        string memory campaignSignal,
        string memory nationalistProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ActionEntry(supporterName, campaignSignal, nationalistProtocol, emotionalTag));
        emit PrometheanActionTagged(supporterName, campaignSignal, nationalistProtocol, emotionalTag);
    }
}
