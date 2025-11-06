// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotAccessEquityIndex {
    address public steward;

    struct AccessEntry {
        string jurisdiction;
        string accessBarrier;
        string equityProtocol;
        string emotionalTag;
    }

    AccessEntry[] public index;

    event BallotAccessTagged(string jurisdiction, string accessBarrier, string equityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagAccess(
        string memory jurisdiction,
        string memory accessBarrier,
        string memory equityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        index.push(AccessEntry(jurisdiction, accessBarrier, equityProtocol, emotionalTag));
        emit BallotAccessTagged(jurisdiction, accessBarrier, equityProtocol, emotionalTag);
    }
}
