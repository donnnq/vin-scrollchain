// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConsentBasedRevenueDAO {
    address public admin;

    struct RevenueEntry {
        string contributorLabel;
        string allocationClause;
        string emotionalTag;
        bool allocated;
    }

    RevenueEntry[] public revenue;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _contributorLabel, string memory _allocationClause, string memory _emotionalTag) external onlyAdmin {
        revenue.push(RevenueEntry(_contributorLabel, _allocationClause, _emotionalTag, false));
    }

    function markAllocated(uint256 index) external onlyAdmin {
        revenue[index].allocated = true;
    }

    function getEntry(uint256 index) external view returns (RevenueEntry memory) {
        return revenue[index];
    }
}
