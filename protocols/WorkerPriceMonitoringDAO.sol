// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerPriceMonitoringDAO {
    address public steward;

    struct MonitoringEntry {
        string workerName;
        string barangay;
        string commodity;
        string priceSignal;
        string emotionalTag;
    }

    MonitoringEntry[] public registry;

    event WorkerPriceMonitoringTagged(string workerName, string barangay, string commodity, string priceSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagMonitoring(
        string memory workerName,
        string memory barangay,
        string memory commodity,
        string memory priceSignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(MonitoringEntry(workerName, barangay, commodity, priceSignal, emotionalTag));
        emit WorkerPriceMonitoringTagged(workerName, barangay, commodity, priceSignal, emotionalTag);
    }
}
