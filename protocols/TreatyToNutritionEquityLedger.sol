// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToNutritionEquityLedger {
    string public batchID = "1321.9.202";
    string public steward = "Vinvin";

    address public admin;

    struct Nutrition {
        string community;   // rural, urban, coastal
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    Nutrition[] public records;

    event NutritionLogged(string community, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logNutrition(string memory community, string memory status) public onlyAdmin {
        records.push(Nutrition(community, status, block.timestamp));
        emit NutritionLogged(community, status);
    }

    function getNutrition(uint256 index) public view returns (string memory community, string memory status, uint256 timestamp) {
        Nutrition memory n = records[index];
        return (n.community, n.status, n.timestamp);
    }
}
