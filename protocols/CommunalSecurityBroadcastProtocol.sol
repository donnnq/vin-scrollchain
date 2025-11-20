// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CommunalSecurityBroadcastProtocol {
    address public validator;

    struct SecurityUpdate {
        string reform;
        string impact;
        string resonance;
        uint256 timestamp;
    }

    SecurityUpdate[] public updates;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function broadcastUpdate(string memory _reform, string memory _impact, string memory _resonance) public onlyValidator {
        updates.push(SecurityUpdate(_reform, _impact, _resonance, block.timestamp));
    }

    function getUpdate(uint256 index) public view returns (SecurityUpdate memory) {
        return updates[index];
    }

    function totalUpdates() public view returns (uint256) {
        return updates.length;
    }
}
