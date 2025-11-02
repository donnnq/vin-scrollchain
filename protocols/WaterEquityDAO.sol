// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterEquityDAO {
    address public steward;

    struct WaterEntry {
        string barangay;
        string waterSource;
        string equityStatus;
        string emotionalTag;
    }

    WaterEntry[] public registry;

    event WaterTagged(string barangay, string waterSource, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagWater(
        string memory barangay,
        string memory waterSource,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(WaterEntry(barangay, waterSource, equityStatus, emotionalTag));
        emit WaterTagged(barangay, waterSource, equityStatus, emotionalTag);
    }
}
