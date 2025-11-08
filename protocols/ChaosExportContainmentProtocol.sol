// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ChaosExportContainmentProtocol {
    address public steward;

    struct ContainmentEntry {
        string timestamp;
        string originEntity;
        string exportMethod;
        string destabilizationRegion;
        string volatilitySignal;
        string emotionalTag;
    }

    ContainmentEntry[] public protocol;

    event ChaosExportContained(string timestamp, string originEntity, string exportMethod, string destabilizationRegion, string volatilitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containExport(
        string memory timestamp,
        string memory originEntity,
        string memory exportMethod,
        string memory destabilizationRegion,
        string memory volatilitySignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(ContainmentEntry(timestamp, originEntity, exportMethod, destabilizationRegion, volatilitySignal, emotionalTag));
        emit ChaosExportContained(timestamp, originEntity, exportMethod, destabilizationRegion, volatilitySignal, emotionalTag);
    }
}
