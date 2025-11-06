// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayTrafficFlowCodex {
    address public steward;

    struct TrafficEntry {
        string barangay;
        string roadName;
        string flowStatus;
        string frictionSignal;
        string emotionalTag;
    }

    TrafficEntry[] public codex;

    event TrafficFlowTagged(string barangay, string roadName, string flowStatus, string frictionSignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTrafficFlow(
        string memory barangay,
        string memory roadName,
        string memory flowStatus,
        string memory frictionSignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(TrafficEntry(barangay, roadName, flowStatus, frictionSignal, emotionalTag));
        emit TrafficFlowTagged(barangay, roadName, flowStatus, frictionSignal, emotionalTag);
    }
}
