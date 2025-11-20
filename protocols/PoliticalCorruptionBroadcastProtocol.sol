// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PoliticalCorruptionBroadcastProtocol {
    address public validator;

    struct Investigation {
        string target;
        string focus;
        string resonance;
        uint256 timestamp;
    }

    Investigation[] public broadcasts;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastInvestigation(string memory _target, string memory _focus, string memory _resonance) public onlyValidator {
        broadcasts.push(Investigation(_target, _focus, _resonance, block.timestamp));
    }

    function getInvestigation(uint256 index) public view returns (Investigation memory) {
        return broadcasts[index];
    }

    function totalBroadcasts() public view returns (uint256) {
        return broadcasts.length;
    }
}
