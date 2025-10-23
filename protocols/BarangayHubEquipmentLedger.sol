// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayHubEquipmentLedger {
    address public steward;

    struct EquipmentEntry {
        string barangayName;
        string equipmentType; // "Sewing machine", "Laptop", "WiFi router", "Food prep tools"
        string emotionalTag;
        bool delivered;
        bool sealed;
    }

    EquipmentEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function logDelivery(string memory barangayName, string memory equipmentType, string memory emotionalTag) external onlySteward {
        entries.push(EquipmentEntry(barangayName, equipmentType, emotionalTag, true, false));
    }

    function sealDeliveryEntry(uint256 index) external onlySteward {
        require(entries[index].delivered, "Must be delivered first");
        entries[index].sealed = true;
    }

    function getDeliveryEntry(uint256 index) external view returns (EquipmentEntry memory) {
        return entries[index];
    }
}
