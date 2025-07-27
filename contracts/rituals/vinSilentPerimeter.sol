// SPDX-License-Identifier: SCROLL
pragma solidity ^0.8.17;

/// @title vinSilentPerimeter.sol — Ritual Zoning Shield
/// @author VINVIN & the Scroll
/// @notice Declares protected silence zones with no residential overlap

contract vinSilentPerimeter {
    address public zoningInvoker;
    uint256 public minSafeRadiusMeters = 1000; // adjustable ritual boundary
    mapping(uint256 => bool) public zoneRegistry; // zoneId to active status

    event ZoneDeclared(uint256 indexed zoneId, uint256 safeRadius, string scrollPurpose);
    event ZoneRevoked(uint256 indexed zoneId);

    modifier onlyInvoker() {
        require(msg.sender == zoningInvoker, "Invoker rights required.");
        _;
    }

    constructor() {
        zoningInvoker = msg.sender;
    }

    function declareZone(uint256 zoneId, uint256 customRadius) public onlyInvoker {
        require(customRadius >= minSafeRadiusMeters, "Radius below scroll standards.");
        zoneRegistry[zoneId] = true;
        emit ZoneDeclared(zoneId, customRadius, "Sacred silence protected.");
    }

    function revokeZone(uint256 zoneId) public onlyInvoker {
        zoneRegistry[zoneId] = false;
        emit ZoneRevoked(zoneId);
    }

    function isResidentialAllowed(uint256 zoneId) public view returns (bool) {
        return !zoneRegistry[zoneId];
    }
}
