// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EVRepairCurriculumDAO {
    address public admin;

    struct EVEntry {
        string courseName;
        string institution;
        string moduleType;
        string emotionalTag;
        bool summoned;
        bool accredited;
        bool sealed;
    }

    EVEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEVModule(string memory courseName, string memory institution, string memory moduleType, string memory emotionalTag) external onlyAdmin {
        entries.push(EVEntry(courseName, institution, moduleType, emotionalTag, true, false, false));
    }

    function confirmAccreditation(uint256 index) external onlyAdmin {
        entries[index].accredited = true;
    }

    function sealEVModule(uint256 index) external onlyAdmin {
        require(entries[index].accredited, "Must be accredited first");
        entries[index].sealed = true;
    }

    function getEVEntry(uint256 index) external view returns (EVEntry memory) {
        return entries[index];
    }
}
