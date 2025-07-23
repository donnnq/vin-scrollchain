// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperUniversalCareDeck {
    address public scrollkeeper;

    struct CareDeployment {
        string region;
        string serviceType; // e.g. “checkup”, “emergency care”, “vaccination”
        uint256 numberServed;
        uint256 timestamp;
    }

    CareDeployment[] public deployments;

    event CareDeployed(string region, string serviceType, uint256 numberServed);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function deployCare(string memory region, string memory serviceType, uint256 numberServed) external onlyScrollkeeper {
        deployments.push(CareDeployment(region, serviceType, numberServed, block.timestamp));
        emit CareDeployed(region, serviceType, numberServed);
    }

    function getDeployment(uint256 index) external view returns (string memory, string memory, uint256, uint256) {
        CareDeployment memory d = deployments[index];
        return (d.region, d.serviceType, d.numberServed, d.timestamp);
    }

    function totalDeployments() external view returns (uint256) {
        return deployments.length;
    }
}
