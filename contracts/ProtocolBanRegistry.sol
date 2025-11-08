// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProtocolBanRegistry {
    address public validator;
    mapping(address => bool) public bannedEntities;
    event EntityBanned(address indexed entity, string reason, uint256 timestamp);
    event EntityUnbanned(address indexed entity, uint256 timestamp);

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function ban(address _entity, string memory _reason) public onlyValidator {
        require(!bannedEntities[_entity], "Already banned");
        bannedEntities[_entity] = true;
        emit EntityBanned(_entity, _reason, block.timestamp);
    }

    function unban(address _entity) public onlyValidator {
        require(bannedEntities[_entity], "Not banned");
        bannedEntities[_entity] = false;
        emit EntityUnbanned(_entity, block.timestamp);
    }

    function isBanned(address _entity) public view returns (bool) {
        return bannedEntities[_entity];
    }
}
