// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalVendorLoyaltyLedgerDAO {
    address public admin;

    struct VendorEntry {
        string vendorLabel;
        string loyaltyClause;
        string emotionalTag;
        bool rewarded;
    }

    VendorEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _vendorLabel, string memory _loyaltyClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(VendorEntry(_vendorLabel, _loyaltyClause, _emotionalTag, false));
    }

    function rewardEntry(uint256 index) external onlyAdmin {
        ledger[index].rewarded = true;
    }

    function getEntry(uint256 index) external view returns (VendorEntry memory) {
        return ledger[index];
    }
}
