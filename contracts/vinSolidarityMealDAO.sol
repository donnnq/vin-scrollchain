// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinSolidarityMealDAO {
    enum MealStatus { Proposed, Funded, Delivered, Verified }

    struct MealDrop {
        string location;
        string foodType; // e.g., Rice, Soup, Bread, Water
        uint256 quantity;
        address proposer;
        uint256 fundingGoal;
        uint256 fundsRaised;
        MealStatus status;
        string metadataLink; // image, description, local partner info
    }

    address public scrollkeeper;
    uint256 public dropCounter;
    mapping(uint256 => MealDrop) public mealDrops;
    mapping(address => uint256) public donorImpact;

    event MealProposed(uint256 indexed id, string location, uint256 goal);
    event MealFunded(uint256 indexed id, address donor, uint256 amount);
    event MealStatusUpdated(uint256 indexed id, MealStatus status);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function proposeMealDrop(
        string memory _location,
        string memory _foodType,
        uint256 _quantity,
        uint256 _fundingGoal,
        string memory _metadataLink
    ) public {
        mealDrops[dropCounter] = MealDrop({
            location: _location,
            foodType: _foodType,
            quantity: _quantity,
            proposer: msg.sender,
            fundingGoal: _fundingGoal,
            fundsRaised: 0,
            status: MealStatus.Proposed,
            metadataLink: _metadataLink
        });

        emit MealProposed(dropCounter, _location, _fundingGoal);
        dropCounter++;
    }

    function fundMealDrop(uint256 _id) public payable {
        require(_id < dropCounter, "MealDrop does not exist.");
        MealDrop storage drop = mealDrops[_id];
        require(drop.status == MealStatus.Proposed || drop.status == MealStatus.Funded, "Invalid status.");

        drop.fundsRaised += msg.value;
        donorImpact[msg.sender] += msg.value;
        emit MealFunded(_id, msg.sender, msg.value);

        if (drop.fundsRaised >= drop.fundingGoal) {
            drop.status = MealStatus.Funded;
            emit MealStatusUpdated(_id, MealStatus.Funded);
        }
    }

    function updateMealStatus(uint256 _id, MealStatus _newStatus) public {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can update.");
        require(_id < dropCounter, "Invalid MealDrop ID.");
        mealDrops[_id].status = _newStatus;
        emit MealStatusUpdated(_id, _newStatus);
    }

    function getMealDrop(uint256 _id) public view returns (MealDrop memory) {
        return mealDrops[_id];
    }
}
