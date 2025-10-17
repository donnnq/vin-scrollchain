// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DepartmentLogoMandateDAO {
    address public admin;

    struct LogoEntry {
        string departmentName;
        string assetType;
        string emotionalTag;
        bool logoOnly;
        bool mandated;
    }

    LogoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function mandateLogoOnly(string memory departmentName, string memory assetType, string memory emotionalTag) external onlyAdmin {
        entries.push(LogoEntry(departmentName, assetType, emotionalTag, true, false));
    }

    function markMandated(uint256 index) external onlyAdmin {
        entries[index].mandated = true;
    }

    function getLogoEntry(uint256 index) external view returns (LogoEntry memory) {
        return entries[index];
    }
}
