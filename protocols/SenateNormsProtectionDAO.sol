// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateNormsProtectionDAO {
    address public steward;

    struct NormEntry {
        string senateRule;
        string protectionProtocol;
        string integritySignal;
        string emotionalTag;
    }

    NormEntry[] public registry;

    event SenateNormTagged(string senateRule, string protectionProtocol, string integritySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagNorm(
        string memory senateRule,
        string memory protectionProtocol,
        string memory integritySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(NormEntry(senateRule, protectionProtocol, integritySignal, emotionalTag));
        emit SenateNormTagged(senateRule, protectionProtocol, integritySignal, emotionalTag);
    }
}
