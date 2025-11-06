// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SkywayExpansionScrutinyDAO {
    address public steward;

    struct ScrutinyEntry {
        string expresswayName;
        string expansionJustification;
        string civicConcern;
        string emotionalTag;
    }

    ScrutinyEntry[] public registry;

    event SkywayScrutinyBroadcasted(string expresswayName, string expansionJustification, string civicConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastScrutiny(
        string memory expresswayName,
        string memory expansionJustification,
        string memory civicConcern,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ScrutinyEntry(expresswayName, expansionJustification, civicConcern, emotionalTag));
        emit SkywayScrutinyBroadcasted(expresswayName, expansionJustification, civicConcern, emotionalTag);
    }
}
