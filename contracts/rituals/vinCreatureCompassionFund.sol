// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCreatureCompassionFund {
    address public scrollkeeper;

    struct AnimalAid {
        string species;
        string location;
        uint256 supportAmount;
        uint256 timestamp;
    }

    AnimalAid[] public aids;

    event AidDeployed(string species, string location, uint256 amount);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function deployAid(string memory species, string memory location, uint256 amount) external onlyScrollkeeper {
        aids.push(AnimalAid(species, location, amount, block.timestamp));
        emit AidDeployed(species, location, amount);
    }

    function getAid(uint256 index) external view returns (string memory, string memory, uint256, uint256) {
        AnimalAid memory a = aids[index];
        return (a.species, a.location, a.supportAmount, a.timestamp);
    }

    function totalAids() external view returns (uint256) {
        return aids.length;
    }

    receive() external payable {}
}
