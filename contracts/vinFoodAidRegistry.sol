// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinFoodAidRegistry {
    struct FoodAid {
        string recipientLocation;
        string foodType; // e.g., Rice, Water, Canned Goods
        uint256 quantity;
        address donor;
        uint256 timestamp;
        string deliveryStatus; // e.g., Pending, Delivered, Verified
    }

    address public scrollkeeper;
    uint256 public foodAidCount;
    mapping(uint256 => FoodAid) public foodAidLog;

    event FoodAidLogged(uint256 indexed id, string recipientLocation, string foodType, uint256 quantity);
    event FoodDeliveryUpdated(uint256 indexed id, string newStatus);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function logFoodAid(
        string memory _recipientLocation,
        string memory _foodType,
        uint256 _quantity,
        string memory _deliveryStatus
    ) public {
        foodAidLog[foodAidCount] = FoodAid({
            recipientLocation: _recipientLocation,
            foodType: _foodType,
            quantity: _quantity,
            donor: msg.sender,
            timestamp: block.timestamp,
            deliveryStatus: _deliveryStatus
        });

        emit FoodAidLogged(foodAidCount, _recipientLocation, _foodType, _quantity);
        foodAidCount++;
    }

    function updateDeliveryStatus(uint256 _id, string memory _newStatus) public {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can update status.");
        require(_id < foodAidCount, "Invalid aid ID.");
        foodAidLog[_id].deliveryStatus = _newStatus;
        emit FoodDeliveryUpdated(_id, _newStatus);
    }

    function getFoodAid(uint256 _id) public view returns (FoodAid memory) {
        return foodAidLog[_id];
    }
}
