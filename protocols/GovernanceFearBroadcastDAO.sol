// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GovernanceFearBroadcastDAO {
    address public steward;

    struct BroadcastEntry {
        string publicFigure;
        string statementSummary;
        string governanceRisk;
        string emotionalTag;
    }

    BroadcastEntry[] public registry;

    event GovernanceFearBroadcasted(string publicFigure, string statementSummary, string governanceRisk, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastFear(
        string memory publicFigure,
        string memory statementSummary,
        string memory governanceRisk,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastEntry(publicFigure, statementSummary, governanceRisk, emotionalTag));
        emit GovernanceFearBroadcasted(publicFigure, statementSummary, governanceRisk, emotionalTag);
    }
}
