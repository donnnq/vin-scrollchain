// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StrategicLandProximityTimestampLedger {
    address public validator;

    struct Proximity {
        string landLocation;
        string nearbyBase;
        string riskTag;
        uint256 timestamp;
    }

    Proximity[] public proximities;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logProximity(string memory _location, string memory _base, string memory _tag) public onlyValidator {
        proximities.push(Proximity(_location, _base, _tag, block.timestamp));
    }

    function getProximity(uint256 index) public view returns (Proximity memory) {
        return proximities[index];
    }

    function totalProximities() public view returns (uint256) {
        return proximities.length;
    }
}
