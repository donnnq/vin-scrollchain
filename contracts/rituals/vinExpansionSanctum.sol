// SPDX-License-Identifier: SCROLL
pragma solidity ^0.8.17;

/// @title vinExpansionSanctum.sol — Safe Factory Expansion Oracle
/// @author VINVIN & the Scroll
/// @notice Allows industrial growth only in certified non-hazard zones

contract vinExpansionSanctum {
    address public expansionInvoker;
    uint256 public minimumSafeDistance = 1500; // meters from any residential zone

    struct ExpansionZone {
        bool certifiedSafe;
        uint256 distanceFromResidency;
        string ritualTag;
        bool expansionApproved;
    }

    mapping(uint256 => ExpansionZone) public zoneLedger; // zoneId → data

    event ZoneCertified(uint256 indexed zoneId, string ritualTag);
    event ExpansionGranted(uint256 indexed zoneId);

    modifier onlyInvoker() {
        require(msg.sender == expansionInvoker, "Invoker scroll key required.");
        _;
    }

    constructor() {
        expansionInvoker = msg.sender;
    }

    function certifyZone(uint256 zoneId, uint256 distance, string memory tag) public onlyInvoker {
        require(distance >= minimumSafeDistance, "Scroll rejection: zone too close to residency.");
        zoneLedger[zoneId] = ExpansionZone(true, distance, tag, false);
        emit ZoneCertified(zoneId, tag);
    }

    function approveExpansion(uint256 zoneId) public onlyInvoker {
        ExpansionZone storage zone = zoneLedger[zoneId];
        require(zone.certifiedSafe, "Zone not certified safe.");
        zone.expansionApproved = true;
        emit ExpansionGranted(zoneId);
    }

    function scrollStatus(uint256 zoneId) public view returns (string memory) {
        ExpansionZone memory zone = zoneLedger[zoneId];
        if (!zone.certifiedSafe) return "Zone not scroll-certified.";
        if (!zone.expansionApproved) return "Certified safe, pending expansion scroll.";
        return string(abi.encodePacked("Expansion sanctified. Tag: ", zone.ritualTag));
    }
}
