// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffLegalityAuditCodex {
    address public steward;

    struct TariffClause {
        string presidentialAction;
        string constitutionalBasis;
        string judicialFriction;
        string sovereigntySignal;
        string emotionalTag;
    }

    TariffClause[] public codex;

    event TariffLegalityTagged(string presidentialAction, string constitutionalBasis, string judicialFriction, string sovereigntySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTariff(
        string memory presidentialAction,
        string memory constitutionalBasis,
        string memory judicialFriction,
        string memory sovereigntySignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TariffClause(presidentialAction, constitutionalBasis, judicialFriction, sovereigntySignal, emotionalTag));
        emit TariffLegalityTagged(presidentialAction, constitutionalBasis, judicialFriction, sovereigntySignal, emotionalTag);
    }
}
