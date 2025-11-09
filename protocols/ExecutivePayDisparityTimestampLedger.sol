// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExecutivePayDisparityTimestampLedger {
    address public validator;

    struct Disparity {
        string company;
        uint256 ceoPay;
        uint256 medianWorkerPay;
        uint256 ratio;
        uint256 timestamp;
    }

    Disparity[] public records;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDisparity(string memory _company, uint256 _ceoPay, uint256 _workerPay) public onlyValidator {
        uint256 _ratio = _ceoPay / _workerPay;
        records.push(Disparity(_company, _ceoPay, _workerPay, _ratio, block.timestamp));
    }

    function getDisparity(uint256 index) public view returns (Disparity memory) {
        return records[index];
    }

    function totalDisparities() public view returns (uint256) {
        return records.length;
    }
}
