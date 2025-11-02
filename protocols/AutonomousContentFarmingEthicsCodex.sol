// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AutonomousContentFarmingEthicsCodex {
    address public steward;

    struct EthicsClause {
        string platform;
        string contentType;
        string ethicalConcern;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event ContentFarmingTagged(string platform, string contentType, string ethicalConcern, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagContentFarming(
        string memory platform,
        string memory contentType,
        string memory ethicalConcern,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(platform, contentType, ethicalConcern, emotionalTag));
        emit ContentFarmingTagged(platform, contentType, ethicalConcern, emotionalTag);
    }
}
