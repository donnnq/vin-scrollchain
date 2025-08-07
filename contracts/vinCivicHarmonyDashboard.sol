// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IBalanceSentimentGauge {
    function getTrust(uint8 branch) external view returns (uint256);
}

interface IBranchPowerMeter {
    function getLatestSnapshot() external view returns (
        uint256 timestamp,
        uint256 executivePower,
        uint256 legislativePower,
        uint256 judiciaryPower
    );
}

interface IScrollOfChecksAndBalances {
    function getImbalanceCount() external view returns (uint256);
}

contract vinCivicHarmonyDashboard {
    address public dashboardAdmin;

    IBalanceSentimentGauge public trustContract;
    IBranchPowerMeter public powerContract;
    IScrollOfChecksAndBalances public alertContract;

    event DashboardSynced(
        uint256 timestamp,
        uint256 execTrust,
        uint256 legisTrust,
        uint256 judTrust,
        uint256 execPower,
        uint256 legisPower,
        uint256 judPower,
        uint256 imbalanceCount
    );

    modifier onlyAdmin() {
        require(msg.sender == dashboardAdmin, "Unauthorized");
        _;
    }

    constructor(
        address _admin,
        address _trustContract,
        address _powerContract,
        address _alertContract
    ) {
        dashboardAdmin = _admin;
        trustContract = IBalanceSentimentGauge(_trustContract);
        powerContract = IBranchPowerMeter(_powerContract);
        alertContract = IScrollOfChecksAndBalances(_alertContract);
    }

    function syncDashboard() external onlyAdmin {
        uint256 execTrust = trustContract.getTrust(0);
        uint256 legisTrust = trustContract.getTrust(1);
        uint256 judTrust = trustContract.getTrust(2);

        (
            uint256 timestamp,
            uint256 execPower,
            uint256 legisPower,
            uint256 judPower
        ) = powerContract.getLatestSnapshot();

        uint256 imbalanceCount = alertContract.getImbalanceCount();

        emit DashboardSynced(
            timestamp,
            execTrust,
            legisTrust,
            judTrust,
            execPower,
            legisPower,
            judPower,
            imbalanceCount
        );
    }
}
