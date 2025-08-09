// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CanteenFeast {
    address public scrollsmith;

    struct Feaster {
        string name;
        bool committed;
        uint256 mealsClaimed;
    }

    mapping(address => Feaster) public feasters;
    uint256 public totalMealsServed;

    event FeasterRegistered(address indexed feaster, string name);
    event MealClaimed(address indexed feaster);
    event RitualFeastHeld(string theme, uint256 attendees);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not scrollsmith");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    function registerFeaster(address feaster, string calldata name, bool committed) external onlyScrollsmith {
        feasters[feaster] = Feaster(name, committed, 0);
        emit FeasterRegistered(feaster, name);
    }

    function claimMeal() external {
        require(feasters[msg.sender].committed, "Not eligible — show commitment first");
        feasters[msg.sender].mealsClaimed++;
        totalMealsServed++;
        emit MealClaimed(msg.sender);
    }

    function holdRitualFeast(string calldata theme, uint256 attendees) external onlyScrollsmith {
        emit RitualFeastHeld(theme, attendees);
    }
}
