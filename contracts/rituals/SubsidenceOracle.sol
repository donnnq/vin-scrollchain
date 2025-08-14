// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SubsidenceOracle - Ritual-grade oracle for land subsidence monitoring and emergency triggers
contract SubsidenceOracle {
    address public steward;
    uint256 public subsidenceThreshold; // in cm/year
    mapping(string => uint256) public regionSubsidence; // region => cm/year
    mapping(string => bool) public emergencyTriggered;

    event SubsidenceUpdated(string region, uint256 rate);
    event EmergencyTriggered(string region, uint256 rate, string ritual);

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized scrollsmith");
        _;
    }

    constructor(uint256 _threshold) {
        steward = msg.sender;
        subsidenceThreshold = _threshold;
    }

    function updateSubsidence(string calldata region, uint256 rate) external onlySteward {
        regionSubsidence[region] = rate;
        emit SubsidenceUpdated(region, rate);

        if (rate >= subsidenceThreshold && !emergencyTriggered[region]) {
            emergencyTriggered[region] = true;
            emit EmergencyTriggered(region, rate, "🛑 Land subsidence breach — initiate water clause ritual");
        }
    }

    function getSubsidenceRate(string calldata region) external view returns (uint256) {
        return regionSubsidence[region];
    }

    function isEmergency(string calldata region) external view returns (bool) {
        return emergencyTriggered[region];
    }
}
