// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PulutanLogisticsCodex {
    address public steward;

    struct LogisticsClause {
        string barangay;
        string pulutanType;
        string deliveryProtocol;
        string emotionalTag;
    }

    LogisticsClause[] public codex;

    event PulutanTagged(string barangay, string pulutanType, string deliveryProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagPulutan(
        string memory barangay,
        string memory pulutanType,
        string memory deliveryProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(LogisticsClause(barangay, pulutanType, deliveryProtocol, emotionalTag));
        emit PulutanTagged(barangay, pulutanType, deliveryProtocol, emotionalTag);
    }
}
