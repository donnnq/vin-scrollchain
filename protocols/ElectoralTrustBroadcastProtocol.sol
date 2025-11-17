// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ElectoralTrustBroadcastProtocol {
    address public validator;

    struct Trust {
        string reform;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    Trust[] public trusts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastTrust(string memory _reform, string memory _impact, string memory _resonance) public onlyValidator {
        trusts.push(Trust(_reform, _impact, _resonance, block.timestamp));
    }

    function getTrust(uint256 index) public view returns (Trust memory) {
        return trusts[index];
    }

    function totalTrusts() public view returns (uint256) {
        return trusts.length;
    }
}
