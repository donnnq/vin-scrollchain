// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayProcurementDAO {
    address public admin;

    struct ProcurementEntry {
        string purokLabel;
        string itemOrService;
        string procurementNote;
        string emotionalTag;
        bool approved;
    }

    ProcurementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory purokLabel, string memory itemOrService, string memory procurementNote, string memory emotionalTag) external onlyAdmin {
        entries.push(ProcurementEntry(purokLabel, itemOrService, procurementNote, emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (ProcurementEntry memory) {
        return entries[index];
    }
}
