// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayRetailDAO {
    address public admin;

    struct RetailEntry {
        string barangayLabel;
        string retailClause;
        string emotionalTag;
        bool activated;
    }

    RetailEntry[] public retail;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _barangayLabel, string memory _retailClause, string memory _emotionalTag) external onlyAdmin {
        retail.push(RetailEntry(_barangayLabel, _retailClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        retail[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (RetailEntry memory) {
        return retail[index];
    }
}
