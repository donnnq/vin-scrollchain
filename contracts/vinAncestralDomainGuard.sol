// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinAncestralDomainGuard {
    address public domainProtector;

    struct ProtectedZone {
        string region;
        string tribe;
        bool extractionAllowed;
        uint256 lastUpdated;
    }

    mapping(string => ProtectedZone) public zones;
    string[] public zoneList;

    modifier onlyProtector() {
        require(msg.sender == domainProtector, "Unauthorized");
        _;
    }

    constructor(address _protector) {
        domainProtector = _protector;
    }

    function registerZone(string memory region, string memory tribe, bool extractionAllowed) external onlyProtector {
        zones[region] = ProtectedZone(region, tribe, extractionAllowed, block.timestamp);
        zoneList.push(region);
    }

    function toggleExtraction(string memory region, bool allowed) external onlyProtector {
        zones[region].extractionAllowed = allowed;
        zones[region].lastUpdated = block.timestamp;
    }

    function getZoneStatus(string memory region) external view returns (ProtectedZone memory) {
        return zones[region];
    }
}
