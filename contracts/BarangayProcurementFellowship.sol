// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayProcurementFellowship {
    address public admin;

    struct ProcurementEntry {
        string barangayName;
        string itemOrProject;
        string emotionalTag;
        bool summoned;
        bool verified;
    }

    ProcurementEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProcurement(string memory barangayName, string memory itemOrProject, string memory emotionalTag) external onlyAdmin {
        entries.push(ProcurementEntry(barangayName, itemOrProject, emotionalTag, true, false));
    }

    function verifyProcurement(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getProcurement(uint256 index) external view returns (ProcurementEntry memory) {
        return entries[index];
    }
}
