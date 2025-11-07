// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstitutionalRebalancingForecastDAO {
    address public steward;

    struct RebalancingSignal {
        string institution;
        string assetClass;
        string action; // e.g., "Buy", "Sell", "Hold"
        uint256 amount;
        string timestamp;
        string rationale;
    }

    RebalancingSignal[] public forecasts;

    event RebalancingForecasted(string institution, string assetClass, string action, uint256 amount, string timestamp, string rationale);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function forecastRebalancing(
        string memory institution,
        string memory assetClass,
        string memory action,
        uint256 amount,
        string memory timestamp,
        string memory rationale
    ) public onlySteward {
        forecasts.push(RebalancingSignal(institution, assetClass, action, amount, timestamp, rationale));
        emit RebalancingForecasted(institution, assetClass, action, amount, timestamp, rationale);
    }
}
