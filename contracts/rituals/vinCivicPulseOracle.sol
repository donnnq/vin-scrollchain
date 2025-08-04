// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinCivicPulseOracle {
    address public council;
    uint256 public forecastThreshold;
    mapping(bytes32 => uint256) public pulseMomentum;
    mapping(bytes32 => string) public forecastLog;

    event PulseRecorded(bytes32 ritualID, uint256 updatedMomentum);
    event ForecastIssued(bytes32 ritualID, string forecastLabel);

    modifier onlyCouncil() {
        require(msg.sender == council, "Only Epoch Council may forecast");
        _;
    }

    constructor(address _council, uint256 _threshold) {
        council = _council;
        forecastThreshold = _threshold;
    }

    function recordPulse(bytes32 ritualID) public onlyCouncil {
        pulseMomentum[ritualID] += 1;
        emit PulseRecorded(ritualID, pulseMomentum[ritualID]);

        if (pulseMomentum[ritualID] >= forecastThreshold) {
            string memory label = labelForecast(ritualID);
            forecastLog[ritualID] = label;
            emit ForecastIssued(ritualID, label);
        }
    }

    function labelForecast(bytes32 ritualID) internal pure returns (string memory) {
        if (ritualID == keccak256(abi.encodePacked("vinCivicDeEscalator"))) return "Peaceflow surge imminent";
        if (ritualID == keccak256(abi.encodePacked("vinAnimalSignalRescue"))) return "Kindness convergence approaching";
        if (ritualID == keccak256(abi.encodePacked("vinFoodPulseRedistribution"))) return "Harvest signal intensifying";
        return "Ritual convergence forecasted";
    }

    function adjustThreshold(uint256 newThreshold) public onlyCouncil {
        forecastThreshold = newThreshold;
    }

    function updateCouncil(address newCouncil) public onlyCouncil {
        council = newCouncil;
    }

    function fetchForecast(bytes32 ritualID) public view returns (string memory) {
        return forecastLog[ritualID];
    }
}
