// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarketCapThresholdAlertProtocol {
    address public steward;

    struct ThresholdAlert {
        string assetClass;
        uint256 thresholdValue;
        string breachDirection;
        string timestamp;
        string emotionalTag;
    }

    ThresholdAlert[] public alerts;

    event ThresholdBreachLogged(string assetClass, uint256 thresholdValue, string breachDirection, string timestamp, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logThresholdBreach(
        string memory assetClass,
        uint256 thresholdValue,
        string memory breachDirection,
        string memory timestamp,
        string memory emotionalTag
    ) public onlySteward {
        alerts.push(ThresholdAlert(assetClass, thresholdValue, breachDirection, timestamp, emotionalTag));
        emit ThresholdBreachLogged(assetClass, thresholdValue, breachDirection, timestamp, emotionalTag);
    }
}
