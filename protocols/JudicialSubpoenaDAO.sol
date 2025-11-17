// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JudicialSubpoenaDAO {
    address public validator;

    struct Subpoena {
        string actor;
        string violation;
        string complianceStatus;
        uint256 timestamp;
    }

    Subpoena[] public subpoenas;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function issueSubpoena(string memory _actor, string memory _violation, string memory _status) public onlyValidator {
        subpoenas.push(Subpoena(_actor, _violation, _status, block.timestamp));
    }

    function getSubpoena(uint256 index) public view returns (Subpoena memory) {
        return subpoenas[index];
    }

    function totalSubpoenas() public view returns (uint256) {
        return subpoenas.length;
    }
}
