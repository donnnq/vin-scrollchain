// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToEquityFlowGrid {
    string public batchID = "1321.9.136";
    string public steward = "Vinvin";

    address public admin;

    struct EquityFlow {
        string project; // e.g. Chocolate Lover Revival
        uint256 communalShares;
        uint256 equityInjection;
        uint256 timestamp;
    }

    EquityFlow[] public flows;

    event EquityLogged(string project, uint256 communalShares, uint256 equityInjection);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logEquity(string memory project, uint256 communalShares, uint256 equityInjection) public onlyAdmin {
        flows.push(EquityFlow(project, communalShares, equityInjection, block.timestamp));
        emit EquityLogged(project, communalShares, equityInjection);
    }

    function getEquity(uint256 index) public view returns (string memory project, uint256 communalShares, uint256 equityInjection, uint256 timestamp) {
        EquityFlow memory e = flows[index];
        return (e.project, e.communalShares, e.equityInjection, e.timestamp);
    }
}
