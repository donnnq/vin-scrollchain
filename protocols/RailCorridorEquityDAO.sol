// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RailCorridorEquityDAO {
    address public steward;

    struct EquityEntry {
        string corridorName;
        string underservedRegion;
        string equityAction;
        string emotionalTag;
    }

    EquityEntry[] public registry;

    event EquityTagged(string corridorName, string underservedRegion, string equityAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagEquity(
        string memory corridorName,
        string memory underservedRegion,
        string memory equityAction,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EquityEntry(corridorName, underservedRegion, equityAction, emotionalTag));
        emit EquityTagged(corridorName, underservedRegion, equityAction, emotionalTag);
    }
}
