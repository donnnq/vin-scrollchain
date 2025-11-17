// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SupplyChainTransparencyTimestampLedger {
    address public validator;

    struct Flow {
        string product;
        string destination;
        string transparencyTag;
        bool exportApproved;
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

    function logFlow(string memory _product, string memory _destination, string memory _tag, bool _approved) public onlyValidator {
        flows.push(Flow(_product, _destination, _tag, _approved, block.timestamp));
    }

    function getFlow(uint256 index) public view returns (Flow memory) {
        return flows[index];
    }

    function totalFlows() public view returns (uint256) {
        return flows.length;
    }
}
