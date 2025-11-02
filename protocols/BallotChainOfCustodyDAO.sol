// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BallotChainOfCustodyDAO {
    address public steward;

    struct CustodyEntry {
        string ballotType;
        string custodyPhase;
        string breachRisk;
        string emotionalTag;
    }

    CustodyEntry[] public registry;

    event BallotCustodyTagged(string ballotType, string custodyPhase, string breachRisk, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagCustody(
        string memory ballotType,
        string memory custodyPhase,
        string memory breachRisk,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(CustodyEntry(ballotType, custodyPhase, breachRisk, emotionalTag));
        emit BallotCustodyTagged(ballotType, custodyPhase, breachRisk, emotionalTag);
    }
}
