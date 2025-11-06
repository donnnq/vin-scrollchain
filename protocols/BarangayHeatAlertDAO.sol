// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHeatAlertDAO {
    address public steward;

    struct AlertEntry {
        string barangay;
        string heatIndexLevel;
        string alertProtocol;
        string emotionalTag;
    }

    AlertEntry[] public registry;

    event HeatAlertBroadcasted(string barangay, string heatIndexLevel, string alertProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function broadcastHeatAlert(
        string memory barangay,
        string memory heatIndexLevel,
        string memory alertProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(AlertEntry(barangay, heatIndexLevel, alertProtocol, emotionalTag));
        emit HeatAlertBroadcasted(barangay, heatIndexLevel, alertProtocol, emotionalTag);
    }
}
