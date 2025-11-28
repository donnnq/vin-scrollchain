// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToArbitrationFlowGrid {
    string public batchID = "1321.9.159";
    string public steward = "Vinvin";

    address public admin;

    struct ArbitrationFlow {
        string dispute;      // media vs. state
        string forum;        // arbitration body
        string status;       // pending, resolved
        uint256 timestamp;
    }

    ArbitrationFlow[] public flows;

    event ArbitrationLogged(string dispute, string forum, string status);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logArbitration(string memory dispute, string memory forum, string memory status) public onlyAdmin {
        flows.push(ArbitrationFlow(dispute, forum, status, block.timestamp));
        emit ArbitrationLogged(dispute, forum, status);
    }

    function getArbitration(uint256 index) public view returns (string memory dispute, string memory forum, string memory status, uint256 timestamp) {
        ArbitrationFlow memory a = flows[index];
        return (a.dispute, a.forum, a.status, a.timestamp);
    }
}
