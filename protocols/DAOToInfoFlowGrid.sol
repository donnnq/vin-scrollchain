// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToInfoFlowGrid {
    string public batchID = "1321.9.160";
    string public steward = "Vinvin";

    address public admin;

    struct InfoFlow {
        string source;       // origin of information
        string destination;  // target jurisdiction
        string status;       // pending, verified, disputed
        uint256 timestamp;
    }

    InfoFlow[] public flows;

    event InfoFlowLogged(string source, string destination, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFlow(string memory source, string memory destination, string memory status) public onlyAdmin {
        flows.push(InfoFlow(source, destination, status, block.timestamp));
        emit InfoFlowLogged(source, destination, status);
    }

    function getFlow(uint256 index) public view returns (string memory source, string memory destination, string memory status, uint256 timestamp) {
        InfoFlow memory f = flows[index];
        return (f.source, f.destination, f.status, f.timestamp);
    }
}
