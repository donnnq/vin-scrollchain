// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract JudicialAccountabilityDAO {
    address public validator;

    struct CaseRecord {
        string judge;
        string caseName;
        string outcome;
        string accountabilityTag;
        uint256 timestamp;
    }

    CaseRecord[] public cases;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logCase(string memory _judge, string memory _caseName, string memory _outcome, string memory _tag) public onlyValidator {
        cases.push(CaseRecord(_judge, _caseName, _outcome, _tag, block.timestamp));
    }

    function getCase(uint256 index) public view returns (CaseRecord memory) {
        return cases[index];
    }

    function totalCases() public view returns (uint256) {
        return cases.length;
    }
}
