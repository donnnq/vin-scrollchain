// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayIndustrialZoneCodexDAO {
    address public admin;

    struct ZoneEntry {
        string barangay;
        string industryType;
        string infrastructureSupport;
        string emotionalTag;
        bool activated;
    }

    ZoneEntry[] public zones;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerZone(string memory _barangay, string memory _industryType, string memory _infrastructureSupport, string memory _emotionalTag) external onlyAdmin {
        zones.push(ZoneEntry(_barangay, _industryType, _infrastructureSupport, _emotionalTag, false));
    }

    function activateZone(uint256 index) external onlyAdmin {
        zones[index].activated = true;
    }

    function getZone(uint256 index) external view returns (ZoneEntry memory) {
        return zones[index];
    }
}
