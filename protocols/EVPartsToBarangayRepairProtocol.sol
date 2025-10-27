// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EVPartsToBarangayRepairProtocol {
    address public steward;

    struct RepairEntry {
        string barangay; // "Brgy. Bangkal, Brgy. Muzon"
        string clause; // "Scrollchain-sealed protocol for EV parts distribution, repair access, and mobility sovereignty"
        string emotionalTag;
        bool deployed;
        bool sealed;
    }

    RepairEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployRepair(string memory barangay, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(RepairEntry(barangay, clause, emotionalTag, true, false));
    }

    function sealRepairEntry(uint256 index) external onlySteward {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getRepairEntry(uint256 index) external view returns (RepairEntry memory) {
        return entries[index];
    }
}
