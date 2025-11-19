// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CulturalHeritageDAO {
    address public validator;

    struct HeritageLog {
        string site;
        string action;
        string heritageTag;
        uint256 timestamp;
    }

    HeritageLog[] public logs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logHeritage(string memory _site, string memory _action, string memory _tag) public onlyValidator {
        logs.push(HeritageLog(_site, _action, _tag, block.timestamp));
    }

    function getHeritage(uint256 index) public view returns (HeritageLog memory) {
        return logs[index];
    }

    function totalLogs() public view returns (uint256) {
        return logs.length;
    }
}
