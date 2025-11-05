// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthTransportEquityDAO {
    address public steward;

    struct EquityEntry {
        string youthGroup;
        string transportDesign;
        string equitySignal;
        string emotionalTag;
    }

    EquityEntry[] public registry;

    event YouthTransportEquityTagged(string youthGroup, string transportDesign, string equitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory youthGroup,
        string memory transportDesign,
        string memory equitySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(EquityEntry(youthGroup, transportDesign, equitySignal, emotionalTag));
        emit YouthTransportEquityTagged(youthGroup, transportDesign, equitySignal, emotionalTag);
    }
}
