// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayPermeableSurfaceAuditDAO {
    address public steward;

    struct SurfaceEntry {
        string barangay;
        string timestamp;
        uint256 permeablePercent;
        string surfaceType;
        string emotionalTag;
    }

    SurfaceEntry[] public registry;

    event SurfaceAudited(string barangay, string timestamp, uint256 permeablePercent, string surfaceType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function auditSurface(
        string memory barangay,
        string memory timestamp,
        uint256 permeablePercent,
        string memory surfaceType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(SurfaceEntry(barangay, timestamp, permeablePercent, surfaceType, emotionalTag));
        emit SurfaceAudited(barangay, timestamp, permeablePercent, surfaceType, emotionalTag);
    }
}
