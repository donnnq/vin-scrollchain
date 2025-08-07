// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinBalanceSentimentGauge {
    address public gaugeAdmin;

    enum Branch { Executive, Legislative, Judiciary }

    mapping(Branch => uint256) public trustScore;

    event TrustUpdated(Branch branch, uint256 newScore);

    modifier onlyAdmin() {
        require(msg.sender == gaugeAdmin, "Unauthorized");
        _;
    }

    constructor(address _admin) {
        gaugeAdmin = _admin;
    }

    function updateTrust(Branch branch, uint256 score) external onlyAdmin {
        require(score <= 100, "Max score is 100");
        trustScore[branch] = score;
        emit TrustUpdated(branch, score);
    }

    function getTrust(Branch branch) external view returns (uint256) {
        return trustScore[branch];
    }
}
