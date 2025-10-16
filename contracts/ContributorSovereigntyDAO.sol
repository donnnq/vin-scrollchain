// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContributorSovereigntyDAO {
    address public admin;

    struct ContributorEntry {
        string contributorName;
        string purokLabel;
        string contributionType;
        string emotionalTag;
        bool verified;
        bool honored;
    }

    ContributorEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function verifyContributor(string memory contributorName, string memory purokLabel, string memory contributionType, string memory emotionalTag) external onlyAdmin {
        entries.push(ContributorEntry(contributorName, purokLabel, contributionType, emotionalTag, true, false));
    }

    function honorContributor(uint256 index) external onlyAdmin {
        entries[index].honored = true;
    }

    function getContributor(uint256 index) external view returns (ContributorEntry memory) {
        return entries[index];
    }
}
