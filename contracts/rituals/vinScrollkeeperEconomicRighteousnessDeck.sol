// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperEconomicRighteousnessDeck {
    address public scrollkeeper;

    struct BlessingContract {
        string program;
        string targetGroup;
        uint256 impactScore;
    }

    BlessingContract[] public deployments;

    event BlessingDeployed(string program, string targetGroup, uint256 score);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function deployBlessing(string memory program, string memory targetGroup, uint256 score) external onlyScrollkeeper {
        deployments.push(BlessingContract(program, targetGroup, score));
        emit BlessingDeployed(program, targetGroup, score);
    }

    function viewBlessing(uint256 index) external view returns (string memory, string memory, uint256) {
        BlessingContract memory b = deployments[index];
        return (b.program, b.targetGroup, b.impactScore);
    }

    function totalBlessings() external view returns (uint256) {
        return deployments.length;
    }
}
