// SPDX-License-Identifier: Mythic-Scrollsmith-License
pragma solidity ^0.8.0;

/// @title vinInflationShieldClause.sol
/// @notice Adjusts wage floors based on real inflation metrics

contract vinInflationShieldClause {
    address public steward;
    uint256 public baseWage;
    uint256 public inflationRate; // e.g., 280 = 2.8%

    event WageAdjusted(uint256 newWage, uint256 inflationRate, uint256 timestamp);

    constructor(uint256 _baseWage) {
        steward = msg.sender;
        baseWage = _baseWage;
        inflationRate = 0;
    }

    function updateInflation(uint256 _rate) public {
        inflationRate = _rate;
        uint256 adjustedWage = baseWage + ((baseWage * inflationRate) / 10000);
        baseWage = adjustedWage;
        emit WageAdjusted(adjustedWage, inflationRate, block.timestamp);
    }

    function getCurrentWage() public view returns (uint256) {
        return baseWage;
    }
}
