// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToNutritionEquityGrid {
    string public batchID = "1321.9.227";
    string public steward = "Vinvin";

    address public admin;

    struct Nutrition {
        string program;     // feeding program, food bank, school meals
        string status;      // equitable, pending, ghost
        uint256 timestamp;
    }

    Nutrition[] public nutritions;

    event NutritionLogged(string program, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logNutrition(string memory program, string memory status) public onlyAdmin {
        nutritions.push(Nutrition(program, status, block.timestamp));
        emit NutritionLogged(program, status);
    }

    function getNutrition(uint256 index) public view returns (string memory program, string memory status, uint256 timestamp) {
        Nutrition memory n = nutritions[index];
        return (n.program, n.status, n.timestamp);
    }
}
