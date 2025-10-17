// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ICIHiringTransparencyCodex {
    address public admin;

    struct HiringEntry {
        string positionTitle;
        string qualificationCriteria;
        string emotionalTag;
        bool posted;
        bool filled;
    }

    HiringEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function postHiring(string memory positionTitle, string memory qualificationCriteria, string memory emotionalTag) external onlyAdmin {
        entries.push(HiringEntry(positionTitle, qualificationCriteria, emotionalTag, true, false));
    }

    function fillPosition(uint256 index) external onlyAdmin {
        entries[index].filled = true;
    }

    function getHiringEntry(uint256 index) external view returns (HiringEntry memory) {
        return entries[index];
    }
}
