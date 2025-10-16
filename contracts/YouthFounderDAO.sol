// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthFounderDAO {
    address public admin;

    struct FounderEntry {
        string founderLabel;
        string initiativeClause;
        string emotionalTag;
        bool approved;
    }

    FounderEntry[] public founders;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _founderLabel, string memory _initiativeClause, string memory _emotionalTag) external onlyAdmin {
        founders.push(FounderEntry(_founderLabel, _initiativeClause, _emotionalTag, false));
    }

    function approveEntry(uint256 index) external onlyAdmin {
        founders[index].approved = true;
    }

    function getEntry(uint256 index) external view returns (FounderEntry memory) {
        return founders[index];
    }
}
