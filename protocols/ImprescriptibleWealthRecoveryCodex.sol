// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImprescriptibleWealthRecoveryCodex {
    address public steward;

    struct RecoveryClause {
        string assetName;
        string corridor;
        string legalBasis;
        string emotionalTag;
    }

    RecoveryClause[] public codex;

    event WealthRecoveryTagged(string assetName, string corridor, string legalBasis, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagRecovery(
        string memory assetName,
        string memory corridor,
        string memory legalBasis,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RecoveryClause(assetName, corridor, legalBasis, emotionalTag));
        emit WealthRecoveryTagged(assetName, corridor, legalBasis, emotionalTag);
    }
}
