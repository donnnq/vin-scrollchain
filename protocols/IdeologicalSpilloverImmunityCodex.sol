// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdeologicalSpilloverImmunityCodex {
    address public steward;

    struct ImmunityClause {
        string region;
        string ideologyType;
        string immunityProtocol;
        string emotionalTag;
    }

    ImmunityClause[] public codex;

    event IdeologicalSpilloverTagged(string region, string ideologyType, string immunityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagSpillover(
        string memory region,
        string memory ideologyType,
        string memory immunityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityClause(region, ideologyType, immunityProtocol, emotionalTag));
        emit IdeologicalSpilloverTagged(region, ideologyType, immunityProtocol, emotionalTag);
    }
}
