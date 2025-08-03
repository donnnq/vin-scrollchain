// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinCivicRestorationPledge {
    address public harmonyChancellor;
    mapping(address => bool) public pledgedEntities;
    mapping(address => string) public pledgeMessage;

    event PledgeMade(address indexed entity, string message);
    event PledgeRevoked(address indexed entity);

    modifier onlyChancellor() {
        require(msg.sender == harmonyChancellor, "Only the harmony chancellor may alter pledges.");
        _;
    }

    constructor() {
        harmonyChancellor = msg.sender;
    }

    function makePledge(address entity, string calldata message) external onlyChancellor {
        pledgedEntities[entity] = true;
        pledgeMessage[entity] = message;
        emit PledgeMade(entity, message);
    }

    function revokePledge(address entity) external onlyChancellor {
        pledgedEntities[entity] = false;
        delete pledgeMessage[entity];
        emit PledgeRevoked(entity);
    }

    function isPledged(address entity) external view returns (bool) {
        return pledgedEntities[entity];
    }

    function getPledgeMessage(address entity) external view returns (string memory) {
        return pledgeMessage[entity];
    }
}
