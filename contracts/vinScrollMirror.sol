// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinScrollMirror.sol
/// @notice Reflects civic rituals, symbolic transitions, and public healing events.
contract vinScrollMirror {
    address public scrollsmith;

    struct CivicEvent {
        string eventType;
        string theme;
        address location;
        uint256 timestamp;
        string impactStatement;
    }

    CivicEvent[] private mirrorLedger; // privacy tweak, use getter methods instead

    event EventReflected(
        string indexed eventType,
        string indexed theme,
        address indexed location,
        string impactStatement
    );

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Unauthorized scrollsmith");
        _;
    }

    function reflectEvent(
        string memory eventType,
        string memory theme,
        address location,
        string memory impactStatement
    ) public onlyScrollsmith {
        mirrorLedger.push(CivicEvent(eventType, theme, location, block.timestamp, impactStatement));
        emit EventReflected(eventType, theme, location, impactStatement);
    }

    function viewEvent(uint256 index) public view returns (CivicEvent memory) {
        require(index < mirrorLedger.length, "Mirror out of bounds");
        return mirrorLedger[index];
    }

    function ledgerLength() public view returns (uint256) {
        return mirrorLedger.length;
    }
}
