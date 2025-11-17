// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract GeopoliticalInvestmentConsequenceLedger {
    address public validator;

    struct Flow {
        string destination;
        string sector;
        string consequence;
        uint256 timestamp;
    }

    Flow[] public flows;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logFlow(string memory _destination, string memory _sector, string memory _consequence) public onlyValidator {
        flows.push(Flow(_destination, _sector, _consequence, block.timestamp));
    }

    function getFlow(uint256 index) public view returns (Flow memory) {
        return flows[index];
    }

    function totalFlows() public view returns (uint256) {
        return flows.length;
    }
}
