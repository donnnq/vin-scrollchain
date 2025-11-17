// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunityRecoveryBroadcastLedger {
    address public validator;

    struct Recovery {
        string initiative;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    Recovery[] public recoveries;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastRecovery(string memory _initiative, string memory _impact, string memory _resonance) public onlyValidator {
        recoveries.push(Recovery(_initiative, _impact, _resonance, block.timestamp));
    }

    function getRecovery(uint256 index) public view returns (Recovery memory) {
        return recoveries[index];
    }

    function totalRecoveries() public view returns (uint256) {
        return recoveries.length;
    }
}
