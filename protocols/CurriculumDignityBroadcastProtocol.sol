// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CurriculumDignityBroadcastProtocol {
    address public validator;

    struct Reform {
        string subject;
        string dignityTag;
        string communalImpact;
        uint256 timestamp;
    }

    Reform[] public reforms;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastReform(string memory _subject, string memory _tag, string memory _impact) public onlyValidator {
        reforms.push(Reform(_subject, _tag, _impact, block.timestamp));
    }

    function getReform(uint256 index) public view returns (Reform memory) {
        return reforms[index];
    }

    function totalReforms() public view returns (uint256) {
        return reforms.length;
    }
}
