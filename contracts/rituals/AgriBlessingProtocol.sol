// SPDX-License-Identifier: LandStewardship
pragma solidity ^0.8.0;

contract AgriBlessingProtocol {
    address public steward;

    struct Farmer {
        string name;
        uint256 productivityScore;
        uint256 lastHarvest;
        uint256 sahodBalance;
        bool active;
    }

    mapping(address => Farmer) public farmers;
    address[] public registeredFarmers;

    event FarmerBlessed(address indexed farmer, string name);
    event HarvestLogged(address indexed farmer, uint256 score, uint256 timestamp);
    event SahodReleased(address indexed farmer, uint256 amount);

    constructor() {
        steward = msg.sender;
    }

    function registerFarmer(address farmer, string memory name) public {
        require(msg.sender == steward, "Only steward may register");
        farmers[farmer] = Farmer(name, 0, 0, 0, true);
        registeredFarmers.push(farmer);
        emit FarmerBlessed(farmer, name);
    }

    function logHarvest(address farmer, uint256 score) public {
        require(farmers[farmer].active, "Farmer not active");
        farmers[farmer].productivityScore += score;
        farmers[farmer].lastHarvest = block.timestamp;
        emit HarvestLogged(farmer, score, block.timestamp);
    }

    function releaseSahod(address farmer) public {
        require(msg.sender == steward, "Only steward may release sahod");
        uint256 payout = farmers[farmer].productivityScore * 1000; // 1 score = ₱1000
        farmers[farmer].sahodBalance += payout;
        farmers[farmer].productivityScore = 0;
        emit SahodReleased(farmer, payout);
    }

    function getFarmer(address farmer) public view returns (Farmer memory) {
        return farmers[farmer];
    }

    function totalFarmers() public view returns (uint256) {
        return registeredFarmers.length;
    }
}
