// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PresidentialAccountabilityCodex {
    address public admin;

    struct AccountabilityEntry {
        string presidentLabel;
        string directive;
        string emotionalTag;
        bool linkedToCase;
        bool archived;
    }

    AccountabilityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory presidentLabel, string memory directive, string memory emotionalTag) external onlyAdmin {
        entries.push(AccountabilityEntry(presidentLabel, directive, emotionalTag, false, false));
    }

    function linkToCase(uint256 index) external onlyAdmin {
        entries[index].linkedToCase = true;
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (AccountabilityEntry memory) {
        return entries[index];
    }
}
