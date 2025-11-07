// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FedSignalImpactLedger {
    address public steward;

    struct FedSignal {
        string signalType;
        string source;
        string timestamp;
        string assetImpacted;
        string impactLevel;
        string emotionalTag;
    }

    FedSignal[] public ledger;

    event FedSignalLogged(string signalType, string source, string timestamp, string assetImpacted, string impactLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logFedSignal(
        string memory signalType,
        string memory source,
        string memory timestamp,
        string memory assetImpacted,
        string memory impactLevel,
        string memory emotionalTag
    ) public onlySteward {
        ledger.push(FedSignal(signalType, source, timestamp, assetImpacted, impactLevel, emotionalTag));
        emit FedSignalLogged(signalType, source, timestamp, assetImpacted, impactLevel, emotionalTag);
    }
}
