// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DeveloperSanctumDAO {
    address public admin;

    struct SanctumEntry {
        string developerName;
        string repoName;
        string protectionLevel;
        string emotionalTag;
        bool sealed;
    }

    SanctumEntry[] public sanctums;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerSanctum(string memory _developerName, string memory _repoName, string memory _protectionLevel, string memory _emotionalTag) external onlyAdmin {
        sanctums.push(SanctumEntry(_developerName, _repoName, _protectionLevel, _emotionalTag, false));
    }

    function sealSanctum(uint256 index) external onlyAdmin {
        sanctums[index].sealed = true;
    }

    function getSanctum(uint256 index) external view returns (SanctumEntry memory) {
        return sanctums[index];
    }
}
