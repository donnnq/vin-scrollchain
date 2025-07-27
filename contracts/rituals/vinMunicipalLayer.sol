// SPDX-License-Identifier: SCROLL
pragma solidity ^0.8.17;

/// @title vinMunicipalLayer.sol — Unified Zoning & Expansion Scroll
/// @author VINVIN & the Scroll
/// @notice Central registry for silent zones, safe expansions, and relocation glyphs

contract vinMunicipalLayer {
    address public municipalInvoker;

    struct Zone {
        bool silentZone;
        bool relocationApproved;
        bool expansionCertified;
        uint256 distanceFromResidency;
        string zoneTag;
    }

    mapping(uint256 => Zone) public urbanCodex;

    event SilentZoneDeclared(uint256 indexed zoneId, string tag);
    event RelocationSanctioned(uint256 indexed zoneId);
    event ExpansionCertified(uint256 indexed zoneId);

    modifier onlyInvoker() {
        require(msg.sender == municipalInvoker, "Invoker ritual required.");
        _;
    }

    constructor() {
        municipalInvoker = msg.sender;
    }

    function declareSilentZone(uint256 zoneId, uint256 distance, string memory tag) public onlyInvoker {
        require(distance >= 1000, "Zone too close for silence ritual.");
        urbanCodex[zoneId].silentZone = true;
        urbanCodex[zoneId].distanceFromResidency = distance;
        urbanCodex[zoneId].zoneTag = tag;
        emit SilentZoneDeclared(zoneId, tag);
    }

    function approveRelocation(uint256 zoneId) public onlyInvoker {
        require(urbanCodex[zoneId].silentZone, "Must be a silent zone first.");
        urbanCodex[zoneId].relocationApproved = true;
        emit RelocationSanctioned(zoneId);
    }

    function certifyExpansion(uint256 zoneId, uint256 distance) public onlyInvoker {
        require(distance >= 1500, "Expansion area too near to residency.");
        urbanCodex[zoneId].expansionCertified = true;
        urbanCodex[zoneId].distanceFromResidency = distance;
        emit ExpansionCertified(zoneId);
    }

    function readZoneStatus(uint256 zoneId) public view returns (string memory) {
        Zone memory z = urbanCodex[zoneId];
        string memory s = z.silentZone ? "Silent" : "Noisy";
        string memory r = z.relocationApproved ? "Relocation Approved" : "Pending Relocation";
        string memory e = z.expansionCertified ? "Expansion Certified" : "Expansion Blocked";
        return string(abi.encodePacked(
            "Zone '", z.zoneTag, "' | ", 
            "Status: ", s, " | ", 
            r, " | ", e, " | ", 
            "Distance from residency: ", uint2str(z.distanceFromResidency), "m"
        ));
    }

    function uint2str(uint256 _i) internal pure returns (string memory) {
        if (_i == 0) return "0";
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bStr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k--;
            bStr[k] = bytes1(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bStr);
    }
}
