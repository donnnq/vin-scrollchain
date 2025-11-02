// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DueProcessCodex {
    address public steward;

    struct SafeguardEntry {
        string legalBasis;
        string resistingEntity;
        string safeguardOutcome;
        string emotionalTag;
    }

    SafeguardEntry[] public codex;

    event DueProcessLogged(string legalBasis, string resistingEntity, string safeguardOutcome, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logDueProcess(
        string memory legalBasis,
        string memory resistingEntity,
        string memory safeguardOutcome,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SafeguardEntry(legalBasis, resistingEntity, safeguardOutcome, emotionalTag));
        emit DueProcessLogged(legalBasis, resistingEntity, safeguardOutcome, emotionalTag);
    }
}
