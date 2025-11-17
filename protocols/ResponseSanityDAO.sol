// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ResponseSanityDAO {
    address public validator;

    struct SanityCheck {
        string aiModel;
        string responseHash;
        bool isGibberish;
        string hallucinationTag;
        uint256 timestamp;
    }

    SanityCheck[] public checks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logSanityCheck(string memory _model, string memory _hash, bool _isGibberish, string memory _tag) public onlyValidator {
        checks.push(SanityCheck(_model, _hash, _isGibberish, _tag, block.timestamp));
    }

    function getCheck(uint256 index) public view returns (SanityCheck memory) {
        return checks[index];
    }

    function totalChecks() public view returns (uint256) {
        return checks.length;
    }
}
