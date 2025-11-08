// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JusticeDelayContainmentProtocol {
    address public steward;

    struct DelayEntry {
        string timestamp;
        string caseName;
        string delayCause;
        string institutionalResponse;
        string accountabilitySignal;
        string emotionalTag;
    }

    DelayEntry[] public protocol;

    event JusticeDelayContained(string timestamp, string caseName, string delayCause, string institutionalResponse, string accountabilitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containDelay(
        string memory timestamp,
        string memory caseName,
        string memory delayCause,
        string memory institutionalResponse,
        string memory accountabilitySignal,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(DelayEntry(timestamp, caseName, delayCause, institutionalResponse, accountabilitySignal, emotionalTag));
        emit JusticeDelayContained(timestamp, caseName, delayCause, institutionalResponse, accountabilitySignal, emotionalTag);
    }
}
