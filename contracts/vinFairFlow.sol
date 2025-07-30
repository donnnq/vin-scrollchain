// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinFairFlow.sol — Ensures $6/hour base rate with flexible work length
/// @author Vinvin + Copilot

contract vinFairFlow {
    address public worker;
    uint256 public hourlyRate = 6 * 1e18; // $6/hour in wei (assuming stable USD-pegged token)
    uint256 public workedHours;
    uint256 public totalPayable;

    event HoursLogged(address indexed worker, uint256 hoursWorked, uint256 payCalculated);
    event PaymentAdjusted(uint256 newHourlyRate);
    event WorkReset();

    modifier onlyWorker() {
        require(msg.sender == worker, "Not authorized");
        _;
    }

    constructor() {
        worker = msg.sender;
    }

    function logHours(uint256 _hours) external onlyWorker {
        require(_hours >= 1 && _hours <= 16, "Invalid input hours");
        workedHours = _hours;
        totalPayable = hourlyRate * _hours;
        emit HoursLogged(worker, _hours, totalPayable);
    }

    function adjustRate(uint256 _newRate) external onlyWorker {
        hourlyRate = _newRate;
        emit PaymentAdjusted(_newRate);
    }

    function resetWorkLog() external onlyWorker {
        workedHours = 0;
        totalPayable = 0;
        emit WorkReset();
    }

    function getSummary() external view returns (string memory summary) {
        if (workedHours == 0) return "No hours logged today.";
        summary = string(abi.encodePacked("Worked ", uint2str(workedHours), " hours. Earned: $", uint2str(totalPayable / 1e18)));
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        j = _i;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        return string(bstr);
    }
}
