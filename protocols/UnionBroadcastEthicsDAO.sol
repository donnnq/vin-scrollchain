// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnionBroadcastEthicsDAO {
    address public steward;

    struct BroadcastClause {
        string unionName;
        string corridor;
        string broadcastType;
        string ethicalConcern;
        string emotionalTag;
    }

    BroadcastClause[] public registry;

    event BroadcastTagged(string unionName, string corridor, string broadcastType, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagBroadcast(
        string memory unionName,
        string memory corridor,
        string memory broadcastType,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(BroadcastClause(unionName, corridor, broadcastType, ethicalConcern, emotionalTag));
        emit BroadcastTagged(unionName, corridor, broadcastType, ethicalConcern, emotionalTag);
    }
}
