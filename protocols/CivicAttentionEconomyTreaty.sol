// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicAttentionEconomyTreaty {
    address public steward;

    struct AttentionClause {
        string location;
        string mediaType;
        string civicImpact;
        string emotionalTag;
    }

    AttentionClause[] public treatyLog;

    event AttentionEconomyTagged(string location, string mediaType, string civicImpact, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagAttentionEconomy(
        string memory location,
        string memory mediaType,
        string memory civicImpact,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(AttentionClause(location, mediaType, civicImpact, emotionalTag));
        emit AttentionEconomyTagged(location, mediaType, civicImpact, emotionalTag);
    }
}
