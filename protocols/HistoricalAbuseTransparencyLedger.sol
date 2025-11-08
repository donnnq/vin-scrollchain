// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HistoricalAbuseTransparencyLedger {
    address public steward;

    struct AbuseEntry {
        string timestamp;
        string abuseType;
        string responsibleEntity;
        string documentationStatus;
        string transparencySignal;
        string emotionalTag;
    }

    AbuseEntry[] public ledger;

    event HistoricalAbuseLogged(string timestamp, string abuseType, string responsibleEntity, string documentationStatus, string transparencySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logAbuse(
        string memory timestamp,
        string memory abuseType,
        string memory responsibleEntity,
        string memory documentationStatus,
        string memory transparencySignal,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(AbuseEntry(timestamp, abuseType, responsibleEntity, documentationStatus, transparencySignal, emotionalTag));
        emit HistoricalAbuseLogged(timestamp, abuseType, responsibleEntity, documentationStatus, transparencySignal, emotionalTag);
    }
}
