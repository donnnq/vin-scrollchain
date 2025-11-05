// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuaryEthicsResilienceCodex {
    address public steward;

    struct EthicsClause {
        string sanctuaryName;
        string ethicsSignal;
        string resilienceMechanism;
        string emotionalTag;
    }

    EthicsClause[] public codex;

    event SanctuaryEthicsResilienceTagged(string sanctuaryName, string ethicsSignal, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEthics(
        string memory sanctuaryName,
        string memory ethicsSignal,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EthicsClause(sanctuaryName, ethicsSignal, resilienceMechanism, emotionalTag));
        emit SanctuaryEthicsResilienceTagged(sanctuaryName, ethicsSignal, resilienceMechanism, emotionalTag);
    }
}
