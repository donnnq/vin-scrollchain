// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Age60RestorationBillDAO {
    address public admin;

    struct BillEntry {
        string billTitle;
        string author;
        string jurisdiction;
        string emotionalTag;
        bool proposed;
        bool ratified;
    }

    BillEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function proposeBill(string memory billTitle, string memory author, string memory jurisdiction, string memory emotionalTag) external onlyAdmin {
        entries.push(BillEntry(billTitle, author, jurisdiction, emotionalTag, true, false));
    }

    function ratifyBill(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getBill(uint256 index) external view returns (BillEntry memory) {
        return entries[index];
    }
}
