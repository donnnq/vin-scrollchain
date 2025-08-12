// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinPulseOracle - Predictive scroll for economic foresight based on vinCapitalPulse.sol
/// @author Vinvin
/// @notice Forecasts civic impact based on velocity and interest rate trends
/// @dev Reads from vinCapitalPulse and emits ritual-grade predictions

interface IVinCapitalPulse {
    struct Pulse {
        uint256 velocityOfMoney;
        uint256 interestRate;
        string civicImpact;
        uint256 timestamp;
    }

    function totalPulses() external view returns (uint256);
    function pulses(uint256 index) external view returns (Pulse memory);
}

contract vinPulseOracle {
    address public scrollsmith;
    IVinCapitalPulse public pulseContract;

    event PredictionEmitted(string forecast, uint256 timestamp);

    constructor(address _pulseContract) {
        scrollsmith = msg.sender;
        pulseContract = IVinCapitalPulse(_pulseContract);
    }

    function emitPrediction() public {
        uint256 total = pulseContract.totalPulses();
        require(total >= 2, "Not enough data to forecast");

        IVinCapitalPulse.Pulse memory latest = pulseContract.pulses(total - 1);
        IVinCapitalPulse.Pulse memory previous = pulseContract.pulses(total - 2);

        string memory forecast;

        if (latest.velocityOfMoney < previous.velocityOfMoney && latest.interestRate > previous.interestRate) {
            forecast = "⚠️ Economic slowdown likely. Prepare civic safety nets.";
        } else if (latest.velocityOfMoney > previous.velocityOfMoney && latest.interestRate < previous.interestRate) {
            forecast = "🌱 Recovery pulse detected. Encourage local investment.";
        } else {
            forecast = "🌀 Mixed signals. Maintain civic resilience and observe further.";
        }

        emit PredictionEmitted(forecast, block.timestamp);
    }
}
