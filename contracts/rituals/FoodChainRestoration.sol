// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoodChainRestoration {
    address public steward;

    struct Worker {
        string name;
        uint256 wage;
        bool eligibleForSubsidy;
    }

    struct FoodItem {
        string name;
        uint256 basePrice;
        uint256 adjustedPrice;
    }

    mapping(address => Worker) public workers;
    mapping(string => FoodItem) public foodItems;

    event WorkerRegistered(address indexed worker, string name, uint256 wage);
    event PriceAdjusted(string item, uint256 newPrice);
    event SubsidyGranted(address indexed worker, string item, uint256 subsidyAmount);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Only steward can perform this action");
        _;
    }

    function registerWorker(address workerAddress, string memory name, uint256 wage) public onlySteward {
        bool eligible = wage < 20000; // Threshold for subsidy eligibility
        workers[workerAddress] = Worker(name, wage, eligible);
        emit WorkerRegistered(workerAddress, name, wage);
    }

    function setFoodItem(string memory itemName, uint256 basePrice) public onlySteward {
        foodItems[itemName] = FoodItem(itemName, basePrice, basePrice);
    }

    function adjustPrice(string memory itemName, uint256 newPrice) public onlySteward {
        foodItems[itemName].adjustedPrice = newPrice;
        emit PriceAdjusted(itemName, newPrice);
    }

    function grantSubsidy(address workerAddress, string memory itemName) public onlySteward {
        Worker memory worker = workers[workerAddress];
        require(worker.eligibleForSubsidy, "Worker not eligible");

        uint256 base = foodItems[itemName].basePrice;
        uint256 adjusted = foodItems[itemName].adjustedPrice;
        uint256 subsidy = adjusted > base ? adjusted - base : 0;

        emit SubsidyGranted(workerAddress, itemName, subsidy);
    }

    function getFoodPrice(string memory itemName) public view returns (uint256) {
        return foodItems[itemName].adjustedPrice;
    }

    function isEligible(address workerAddress) public view returns (bool) {
        return workers[workerAddress].eligibleForSubsidy;
    }
}
