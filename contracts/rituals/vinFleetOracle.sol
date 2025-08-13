// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinFleetOracle {
    struct Prediction {
        string region;
        int256 emotionalTrend; // -100 to +100
        string forecast;
        uint256 timestamp;
        address oracle;
    }

    Prediction[] public predictions;

    event ForecastIssued(string region, int256 emotionalTrend, string forecast, address oracle);

    function issueForecast(
        string memory region,
        int256 emotionalTrend,
        string memory forecast
    ) public {
        require(emotionalTrend >= -100 && emotionalTrend <= 100, "Invalid trend.");
        predictions.push(Prediction(region, emotionalTrend, forecast, block.timestamp, msg.sender));
        emit ForecastIssued(region, emotionalTrend, forecast, msg.sender);
    }

    function getForecast(uint index) public view returns (
        string memory, int256, string memory, uint256, address
    ) {
        Prediction memory p = predictions[index];
        return (p.region, p.emotionalTrend, p.forecast, p.timestamp, p.oracle);
    }

    function totalForecasts() public view returns (uint) {
        return predictions.length;
    }
}
