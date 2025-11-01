// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DAOToPolymarketShutdownAuditGrid {
    string public batchID = "1321.9.92";
    string public steward = "Vinvin";

    struct Prediction {
        string market;
        bool isShutdownLinked;
        uint256 volatilityScore;
    }

    mapping(string => Prediction) public auditLog;

    function logPrediction(
        string memory market,
        bool linked,
        uint256 score
    ) public {
        auditLog[market] = Prediction(market, linked, score);
    }

    function getVolatility(string memory market) public view returns (uint256) {
        return auditLog[market].volatilityScore;
    }
}
