// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicProcurementImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string procurementItem;
        string agencyName;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagProcurement(string memory procurementItem, string memory agencyName, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(procurementItem, agencyName, emotionalTag, true, false));
    }

    function immunizeProcurement(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunity(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
