// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransportToErgonomicUpgradeGrid {
    address public steward;

    struct UpgradeEntry {
        string equipmentName; // "Bread transport bin"
        string issueType; // "Roller resistance", "Heat deformation"
        string upgradeMethod; // "Low-friction wheels", "Heat-resistant bearings", "Ergonomic handles"
        string emotionalTag;
        bool upgraded;
        bool sealed;
    }

    UpgradeEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function upgradeTransport(string memory equipmentName, string memory issueType, string memory upgradeMethod, string memory emotionalTag) external onlySteward {
        entries.push(UpgradeEntry(equipmentName, issueType, upgradeMethod, emotionalTag, true, false));
    }

    function sealUpgradeEntry(uint256 index) external onlySteward {
        require(entries[index].upgraded, "Must be upgraded first");
        entries[index].sealed = true;
    }

    function getUpgradeEntry(uint256 index) external view returns (UpgradeEntry memory) {
        return entries[index];
    }
}
