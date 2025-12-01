// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToLocalFarmingEquityGrid {
    string public batchID = "1321.9.215";
    string public steward = "Vinvin";

    address public admin;

    struct Farm {
        string farmer;      // smallholder, cooperative, indigenous
        string crop;        // rice, corn, vegetables
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    Farm[] public farms;

    event FarmLogged(string farmer, string crop, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFarm(string memory farmer, string memory crop, string memory status) public onlyAdmin {
        farms.push(Farm(farmer, crop, status, block.timestamp));
        emit FarmLogged(farmer, crop, status);
    }

    function getFarm(uint256 index) public view returns (string memory farmer, string memory crop, string memory status, uint256 timestamp) {
        Farm memory f = farms[index];
        return (f.farmer, f.crop, f.status, f.timestamp);
    }
}
