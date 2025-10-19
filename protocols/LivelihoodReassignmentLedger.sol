// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LivelihoodReassignmentLedger {
    address public admin;

    struct ReassignmentEntry {
        string vendorName;
        string previousLocation;
        string reassignedZone;
        string emotionalTag;
        bool summoned;
        bool reassigned;
        bool sealed;
    }

    ReassignmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReassignment(string memory vendorName, string memory previousLocation, string memory reassignedZone, string memory emotionalTag) external onlyAdmin {
        entries.push(ReassignmentEntry(vendorName, previousLocation, reassignedZone, emotionalTag, true, false, false));
    }

    function confirmReassignment(uint256 index) external onlyAdmin {
        entries[index].reassigned = true;
    }

    function sealReassignmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].reassigned, "Must be reassigned first");
        entries[index].sealed = true;
    }

    function getReassignmentEntry(uint256 index) external view returns (ReassignmentEntry memory) {
        return entries[index];
    }
}
