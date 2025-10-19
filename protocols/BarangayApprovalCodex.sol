// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayApprovalCodex {
    address public admin;

    struct BarangayEntry {
        string projectName;
        string barangay;
        string emotionalTag;
        bool summoned;
        bool countersigned;
        bool sealed;
    }

    BarangayEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBarangayApproval(string memory projectName, string memory barangay, string memory emotionalTag) external onlyAdmin {
        entries.push(BarangayEntry(projectName, barangay, emotionalTag, true, false, false));
    }

    function countersignBarangay(uint256 index) external onlyAdmin {
        entries[index].countersigned = true;
    }

    function sealBarangayApproval(uint256 index) external onlyAdmin {
        require(entries[index].countersigned, "Must be countersigned first");
        entries[index].sealed = true;
    }

    function getBarangayEntry(uint256 index) external view returns (BarangayEntry memory) {
        return entries[index];
    }
}
