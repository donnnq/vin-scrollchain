// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicProcurementImmunityPack {
    address public admin;

    struct ProcurementEntry {
        string agencyLabel;
        string procurementType;
        string emotionalTag;
        bool flagged;
        bool immune;
    }

    ProcurementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitProcurement(string memory agencyLabel, string memory procurementType, string memory emotionalTag) external onlyAdmin {
        entries.push(ProcurementEntry(agencyLabel, procurementType, emotionalTag, false, false));
    }

    function flagProcurement(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        entries[index].immune = true;
    }

    function getEntry(uint256 index) external view returns (ProcurementEntry memory) {
        return entries[index];
    }
}
