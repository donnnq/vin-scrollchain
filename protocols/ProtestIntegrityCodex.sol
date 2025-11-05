// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProtestIntegrityCodex {
    address public steward;

    struct IntegrityClause {
        string protestName;
        string organizingEntity;
        string integrityProtocol;
        string emotionalTag;
    }

    IntegrityClause[] public codex;

    event ProtestIntegrityTagged(string protestName, string organizingEntity, string integrityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProtest(
        string memory protestName,
        string memory organizingEntity,
        string memory integrityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(IntegrityClause(protestName, organizingEntity, integrityProtocol, emotionalTag));
        emit ProtestIntegrityTagged(protestName, organizingEntity, integrityProtocol, emotionalTag);
    }
}
