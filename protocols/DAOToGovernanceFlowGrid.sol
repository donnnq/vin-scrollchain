// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToGovernanceFlowGrid {
    string public batchID = "1321.9.143";
    string public steward = "Vinvin";

    address public admin;

    struct GovernanceFlow {
        string directive; // permit, order, reform
        string agency;    // issuing body
        uint256 count;
        uint256 timestamp;
    }

    GovernanceFlow[] public flows;

    event GovernanceLogged(string directive, string agency, uint256 count);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logGovernance(string memory directive, string memory agency, uint256 count) public onlyAdmin {
        flows.push(GovernanceFlow(directive, agency, count, block.timestamp));
        emit GovernanceLogged(directive, agency, count);
    }

    function getGovernance(uint256 index) public view returns (string memory directive, string memory agency, uint256 count, uint256 timestamp) {
        GovernanceFlow memory g = flows[index];
        return (g.directive, g.agency, g.count, g.timestamp);
    }
}
