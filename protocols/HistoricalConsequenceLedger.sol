// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HistoricalConsequenceLedger {
    address public steward;

    struct LedgerEntry {
        string timestamp;
        string actorOrInstitution;
        string consequenceType;
        string impactScope;
        string emotionalTag;
    }

    LedgerEntry[] public ledger;

    event HistoricalConsequenceLogged(string timestamp, string actorOrInstitution, string consequenceType, string impactScope, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logConsequence(
        string memory timestamp,
        string memory actorOrInstitution,
        string memory consequenceType,
        string memory impactScope,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(LedgerEntry(timestamp, actorOrInstitution, consequenceType, impactScope, emotionalTag));
        emit HistoricalConsequenceLogged(timestamp, actorOrInstitution, consequenceType, impactScope, emotionalTag);
    }
}
