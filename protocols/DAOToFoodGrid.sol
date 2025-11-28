// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToFoodGrid {
    string public batchID = "1321.9.170";
    string public steward = "Vinvin";

    address public admin;

    struct FoodGap {
        string sector;      // agriculture, fisheries, distribution
        string issue;       // shortage, logistics, spoilage
        uint256 severity;   // scale 1-10
        uint256 timestamp;
    }

    FoodGap[] public gaps;

    event GapLogged(string sector, string issue, uint256 severity);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logGap(string memory sector, string memory issue, uint256 severity) public onlyAdmin {
        gaps.push(FoodGap(sector, issue, severity, block.timestamp));
        emit GapLogged(sector, issue, severity);
    }

    function getGap(uint256 index) public view returns (string memory sector, string memory issue, uint256 severity, uint256 timestamp) {
        FoodGap memory g = gaps[index];
        return (g.sector, g.issue, g.severity, g.timestamp);
    }
}
