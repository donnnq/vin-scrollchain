// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinNationCareProtocol {
    address public scrollkeeper;
    mapping(address => bool) public registeredFarmers;
    mapping(string => uint256) public foodPrices;

    event FarmerRegistered(address indexed farmer);
    event SalaryReleased(address indexed farmer, uint256 amount);
    event PriceAdjusted(string indexed foodItem, uint256 newPrice);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerFarmer(address farmer) external onlyScrollkeeper {
        registeredFarmers[farmer] = true;
        emit FarmerRegistered(farmer);
    }

    function releaseSalary(address farmer, uint256 amount) external onlyScrollkeeper {
        require(registeredFarmers[farmer], "Farmer not registered");
        payable(farmer).transfer(amount);
        emit SalaryReleased(farmer, amount);
    }

    function adjustFoodPrice(string memory item, uint256 newPrice) external onlyScrollkeeper {
        foodPrices[item] = newPrice;
        emit PriceAdjusted(item, newPrice);
    }

    receive() external payable {}
}
