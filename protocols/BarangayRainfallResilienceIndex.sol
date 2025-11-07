// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRainfallResilienceIndex {
    address public steward;

    struct RainfallEntry {
        string barangay;
        string timestamp;
        uint256 rainfallMM;
        string resilienceStatus;
        string emotionalTag;
    }

    RainfallEntry[] public index;

    event RainfallLogged(string barangay, uint256 rainfallMM, string timestamp, string resilienceStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRainfall(
        string memory barangay,
        uint256 rainfallMM,
        string memory timestamp,
        string memory resilienceStatus,
        string memory emotionalTag
    ) public onlySteward {
        index.push(RainfallEntry(barangay, timestamp, rainfallMM, resilienceStatus, emotionalTag));
        emit RainfallLogged(barangay, rainfallMM, timestamp, resilienceStatus, emotionalTag);
    }
}
