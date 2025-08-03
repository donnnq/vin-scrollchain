// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinDiplomaticSanctionScroll {
    address public sanctionChancellor;
    mapping(address => bool) public sanctionedEntities;
    mapping(address => string) public sanctionReason;

    event EntitySanctioned(address indexed entity, string reason);
    event EntityUnsanctioned(address indexed entity);

    modifier onlyChancellor() {
        require(msg.sender == sanctionChancellor, "Unauthorized scroll authority.");
        _;
    }

    constructor() {
        sanctionChancellor = msg.sender;
    }

    function imposeSanction(address entity, string calldata reason) external onlyChancellor {
        sanctionedEntities[entity] = true;
        sanctionReason[entity] = reason;
        emit EntitySanctioned(entity, reason);
    }

    function liftSanction(address entity) external onlyChancellor {
        sanctionedEntities[entity] = false;
        delete sanctionReason[entity];
        emit EntityUnsanctioned(entity);
    }

    function isSanctioned(address entity) external view returns (bool) {
        return sanctionedEntities[entity];
    }

    function getSanctionReason(address entity) external view returns (string memory) {
        return sanctionReason[entity];
    }
}
