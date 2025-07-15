// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ScrollCarEmpire {
    struct Garage {
        string name;
        uint256 level;
        uint256 carsOwned;
        address owner;
    }

    Garage[] public garages;
    mapping(address => uint256[]) public ownerToGarages;

    event GarageBuilt(string name, address indexed owner);
    event GarageUpgraded(uint256 garageId, uint256 newLevel);

    function buildGarage(string calldata name) external {
        Garage memory g = Garage(name, 1, 0, msg.sender);
        garages.push(g);
        ownerToGarages[msg.sender].push(garages.length - 1);
        emit GarageBuilt(name, msg.sender);
    }

    function upgradeGarage(uint256 garageId) external {
        require(garageId < garages.length, "Invalid ID");
        Garage storage g = garages[garageId];
        require(g.owner == msg.sender, "Not your garage");

        g.level += 1;
        emit GarageUpgraded(garageId, g.level);
    }

    function addCar(uint256 garageId) external {
        require(garageId < garages.length, "Invalid ID");
        Garage storage g = garages[garageId];
        require(g.owner == msg.sender, "Not your garage");

        g.carsOwned += 1;
    }

    function getMyGarages() external view returns (uint256[] memory) {
        return ownerToGarages[msg.sender];
    }
}
