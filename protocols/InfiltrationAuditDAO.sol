// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract InfiltrationAuditDAO {
    address public validator;

    struct InfiltrationLog {
        string actor;
        string sector;
        string resonance;
        uint256 timestamp;
    }

    InfiltrationLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logInfiltration(string memory _actor, string memory _sector, string memory _resonance) public onlyValidator {
        logs.push(InfiltrationLog(_actor, _sector, _resonance, block.timestamp));
    }

    function getLog(uint256 index) public view returns (InfiltrationLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
