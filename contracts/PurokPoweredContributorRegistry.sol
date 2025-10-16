// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredContributorRegistry {
    address public admin;

    struct ContributorEntry {
        string contributorName;
        string purokLabel;
        string specialty;
        string emotionalTag;
        bool registered;
        bool verified;
    }

    ContributorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerContributor(string memory contributorName, string memory purokLabel, string memory specialty, string memory emotionalTag) external onlyAdmin {
        entries.push(ContributorEntry(contributorName, purokLabel, specialty, emotionalTag, true, false));
    }

    function verifyContributor(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function getContributor(uint256 index) external view returns (ContributorEntry memory) {
        return entries[index];
    }
}
