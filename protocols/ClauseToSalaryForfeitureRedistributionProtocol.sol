// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClauseToSalaryForfeitureRedistributionProtocol {
    string public batchID = "1321.9.90";
    string public steward = "Vinvin";

    struct Redistribution {
        string sourceOfficial;
        uint256 forfeitedAmount;
        string destinationFund;
        bool broadcasted;
    }

    mapping(string => Redistribution) public redistributionLog;

    event RedistributionBroadcasted(string official, uint256 amount, string fund);

    function redirectSalary(
        string memory official,
        uint256 amount,
        string memory fund
    ) public {
        redistributionLog[official] = Redistribution(official, amount, fund, true);
        emit RedistributionBroadcasted(official, amount, fund);
    }

    function getFundDestination(string memory official) public view returns (string memory) {
        return redistributionLog[official].destinationFund;
    }

    function getAmountRedirected(string memory official) public view returns (uint256) {
        return redistributionLog[official].forfeitedAmount;
    }
}
