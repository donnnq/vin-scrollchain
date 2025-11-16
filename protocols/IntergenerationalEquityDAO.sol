// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract IntergenerationalEquityDAO {
    address public validator;

    struct EquityAction {
        string policy;
        string beneficiaryGeneration;
        string consequence;
        uint256 timestamp;
    }

    EquityAction[] public actions;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logAction(string memory _policy, string memory _generation, string memory _consequence) public onlyValidator {
        actions.push(EquityAction(_policy, _generation, _consequence, block.timestamp));
    }

    function getAction(uint256 index) public view returns (EquityAction memory) {
        return actions[index];
    }

    function totalActions() public view returns (uint256) {
        return actions.length;
    }
}
