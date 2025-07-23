// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperGeoCompassionDeck {
    address public scrollkeeper;

    struct GeoNode {
        string siteName;
        string region;
        string ecologicalStatus;
        string communityPriority;
        bool extractionAllowed;
    }

    GeoNode[] public geoZones;

    event GeoZoneMapped(string siteName, string region);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function mapGeoZone(string memory siteName, string memory region, string memory ecologicalStatus, string memory communityPriority) external onlyScrollkeeper {
        geoZones.push(GeoNode(siteName, region, ecologicalStatus, communityPriority, false));
        emit GeoZoneMapped(siteName, region);
    }

    function authorizeExtraction(uint256 index) external onlyScrollkeeper {
        geoZones[index].extractionAllowed = true;
    }

    function getGeoZone(uint256 index) external view returns (string memory, string memory, string memory, string memory, bool) {
        GeoNode memory g = geoZones[index];
        return (g.siteName, g.region, g.ecologicalStatus, g.communityPriority, g.extractionAllowed);
    }

    function totalGeoZones() external view returns (uint256) {
        return geoZones.length;
    }
}
