// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriExportProtectionDAO {
    address public steward;

    struct ProtectionEntry {
        string cropType;
        string exportMarket;
        string protectionMeasure;
        string emotionalTag;
    }

    ProtectionEntry[] public registry;

    event AgriExportTagged(string cropType, string exportMarket, string protectionMeasure, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProtection(
        string memory cropType,
        string memory exportMarket,
        string memory protectionMeasure,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ProtectionEntry(cropType, exportMarket, protectionMeasure, emotionalTag));
        emit AgriExportTagged(cropType, exportMarket, protectionMeasure, emotionalTag);
    }
}
