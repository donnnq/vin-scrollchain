// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SPEDParentTeacherAllianceCodex {
    address public admin;

    struct AllianceEntry {
        string parentName;
        string teacherName;
        string schoolName;
        string emotionalTag;
        bool summoned;
        bool formed;
        bool sealed;
    }

    AllianceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAlliance(string memory parentName, string memory teacherName, string memory schoolName, string memory emotionalTag) external onlyAdmin {
        entries.push(AllianceEntry(parentName, teacherName, schoolName, emotionalTag, true, false, false));
    }

    function confirmFormation(uint256 index) external onlyAdmin {
        entries[index].formed = true;
    }

    function sealAllianceEntry(uint256 index) external onlyAdmin {
        require(entries[index].formed, "Must be formed first");
        entries[index].sealed = true;
    }

    function getAllianceEntry(uint256 index) external view returns (AllianceEntry memory) {
        return entries[index];
    }
}
