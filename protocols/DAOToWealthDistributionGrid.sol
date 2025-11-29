// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToWealthDistributionGrid {
    string public batchID = "1321.9.188";
    string public steward = "Vinvin";

    address public admin;

    struct Distribution {
        string sector;      // health, education, infrastructure
        uint256 amount;     // allocated funds
        string status;      // equitable, pending, audited
        uint256 timestamp;
    }

    Distribution[] public distributions;

    event DistributionLogged(string sector, uint256 amount, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDistribution(string memory sector, uint256 amount, string memory status) public onlyAdmin {
        distributions.push(Distribution(sector, amount, status, block.timestamp));
        emit DistributionLogged(sector, amount, status);
    }

    function getDistribution(uint256 index) public view returns (string memory sector, uint256 amount, string memory status, uint256 timestamp) {
        Distribution memory d = distributions[index];
        return (d.sector, d.amount, d.status, d.timestamp);
    }
}
