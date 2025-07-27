// SPDX-License-Identifier: Ritual-License-2025
pragma solidity ^0.8.21;

contract vinBRICSBlackout {
    address public scrollkeeper;
    mapping(address => bool) public sanctionedEntities;

    event TradeDisruption(address indexed entity, string reason);
    event ExceptionGranted(address indexed entity, string purpose);
    
    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Unauthorized aura");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function imposeSanction(address entity, string calldata reason) external onlyScrollkeeper {
        sanctionedEntities[entity] = true;
        emit TradeDisruption(entity, reason);
    }

    function grantHumanitarianException(address entity, string calldata purpose) external onlyScrollkeeper {
        sanctionedEntities[entity] = false;
        emit ExceptionGranted(entity, purpose);
    }

    function isSanctioned(address entity) external view returns (bool) {
        return sanctionedEntities[entity];
    }
}
