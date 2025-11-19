// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ReserveIntegrityTimestampLedger {
    address public validator;

    struct Reserve {
        string asset;
        string status;
        string integrityTag;
        uint256 timestamp;
    }

    Reserve[] public reserves;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logReserve(string memory _asset, string memory _status, string memory _tag) public onlyValidator {
        reserves.push(Reserve(_asset, _status, _tag, block.timestamp));
    }

    function getReserve(uint256 index) public view returns (Reserve memory) {
        return reserves[index];
    }

    function totalReserves() public view returns (uint256) {
        return reserves.length;
    }
}
