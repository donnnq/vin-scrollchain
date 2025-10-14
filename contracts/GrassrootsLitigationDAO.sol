// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GrassrootsLitigationDAO {
    address public admin;

    struct LitigationEntry {
        string claimantName;
        string caseName;
        string barangay;
        string emotionalTag;
        bool active;
    }

    LitigationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function fileLitigation(string memory _claimantName, string memory _caseName, string memory _barangay, string memory _emotionalTag) external onlyAdmin {
        entries.push(LitigationEntry(_claimantName, _caseName, _barangay, _emotionalTag, true));
    }

    function closeLitigation(uint256 index) external onlyAdmin {
        entries[index].active = false;
    }

    function getLitigation(uint256 index) external view returns (LitigationEntry memory) {
        return entries[index];
    }
}
