// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHProductSovereigntyLedgerDAO {
    address public admin;

    struct ProductEntry {
        string productLabel;
        string sovereigntyClause;
        string emotionalTag;
        bool prioritized;
    }

    ProductEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _productLabel, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        ledger.push(ProductEntry(_productLabel, _sovereigntyClause, _emotionalTag, false));
    }

    function markPrioritized(uint256 index) external onlyAdmin {
        ledger[index].prioritized = true;
    }

    function getEntry(uint256 index) external view returns (ProductEntry memory) {
        return ledger[index];
    }
}
