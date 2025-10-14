// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySovereigntyLedgerDAO {
    address public admin;

    struct SovereigntyEntry {
        string barangay;
        string sovereigntyClaim;
        string fundingSource;
        string emotionalTag;
        bool validated;
    }

    SovereigntyEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _barangay, string memory _sovereigntyClaim, string memory _fundingSource, string memory _emotionalTag) external onlyAdmin {
        ledger.push(SovereigntyEntry(_barangay, _sovereigntyClaim, _fundingSource, _emotionalTag, false));
    }

    function validateEntry(uint256 index) external onlyAdmin {
        ledger[index].validated = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return ledger[index];
    }
}
