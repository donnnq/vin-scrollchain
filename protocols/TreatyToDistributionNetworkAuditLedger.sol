// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract TreatyToDistributionNetworkAuditLedger {
    string public batchID = "1321.9.229";
    string public steward = "Vinvin";

    address public admin;

    struct Distribution {
        string hub;         // warehouse, port, airport
        string status;      // audited, pending, ghost
        uint256 timestamp;
    }

    Distribution[] public distributions;

    event DistributionLogged(string hub, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logDistribution(string memory hub, string memory status) public onlyAdmin {
        distributions.push(Distribution(hub, status, block.timestamp));
        emit DistributionLogged(hub, status);
    }

    function getDistribution(uint256 index) public view returns (string memory hub, string memory status, uint256 timestamp) {
        Distribution memory d = distributions[index];
        return (d.hub, d.status, d.timestamp);
    }
}
