// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VeteranFamilyResilienceCodex {
    address public steward;

    struct ResilienceClause {
        string veteranName;
        string familySupportProgram;
        string resilienceProtocol;
        string emotionalTag;
    }

    ResilienceClause[] public codex;

    event FamilyResilienceTagged(string veteranName, string familySupportProgram, string resilienceProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory veteranName,
        string memory familySupportProgram,
        string memory resilienceProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ResilienceClause(veteranName, familySupportProgram, resilienceProtocol, emotionalTag));
        emit FamilyResilienceTagged(veteranName, familySupportProgram, resilienceProtocol, emotionalTag);
    }
}
