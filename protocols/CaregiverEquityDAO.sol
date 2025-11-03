// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CaregiverEquityDAO {
    address public steward;

    struct EquityEntry {
        string caregiverRole;
        string supportBarrier;
        string equityAction;
        string emotionalTag;
    }

    EquityEntry[] public registry;

    event CaregiverEquityTagged(string caregiverRole, string supportBarrier, string equityAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory caregiverRole,
        string memory supportBarrier,
        string memory equityAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EquityEntry(caregiverRole, supportBarrier, equityAction, emotionalTag));
        emit CaregiverEquityTagged(caregiverRole, supportBarrier, equityAction, emotionalTag);
    }
}
