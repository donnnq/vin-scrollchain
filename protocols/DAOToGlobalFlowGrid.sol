// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToGlobalFlowGrid {
    string public batchID = "1321.9.124";
    string public steward = "Vinvin";

    address public admin;

    struct Flow {
        string jurisdiction;
        string currency;
        uint256 amount;
        string rail; // stablecoin or fiat
        uint256 timestamp;
    }

    Flow[] public flows;

    event FlowLogged(string jurisdiction, string currency, uint256 amount, string rail);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logFlow(string memory jurisdiction, string memory currency, uint256 amount, string memory rail) public onlyAdmin {
        flows.push(Flow(jurisdiction, currency, amount, rail, block.timestamp));
        emit FlowLogged(jurisdiction, currency, amount, rail);
    }

    function getFlow(uint256 index) public view returns (string memory jurisdiction, string memory currency, uint256 amount, string memory rail, uint256 timestamp) {
        Flow memory f = flows[index];
        return (f.jurisdiction, f.currency, f.amount, f.rail, f.timestamp);
    }
}
