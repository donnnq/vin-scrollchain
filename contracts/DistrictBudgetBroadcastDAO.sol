// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DistrictBudgetBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string districtLabel;
        string budgetMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory districtLabel, string memory budgetMessage, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(districtLabel, budgetMessage, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
