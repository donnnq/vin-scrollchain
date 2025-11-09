// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SafetyDrillTimestampLedger {
    address public validator;

    struct Drill {
        string barangay;
        string type;
        string facilitator;
        uint256 timestamp;
    }

    Drill[] public drills;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logDrill(string memory _barangay, string memory _type, string memory _facilitator) public onlyValidator {
        drills.push(Drill(_barangay, _type, _facilitator, block.timestamp));
    }

    function getDrill(uint256 index) public view returns (Drill memory) {
        return drills[index];
    }

    function totalDrills() public view returns (uint256) {
        return drills.length;
    }
}
