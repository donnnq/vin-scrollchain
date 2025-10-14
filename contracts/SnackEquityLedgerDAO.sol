// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SnackEquityLedgerDAO {
    address public admin;

    struct SnackEntry {
        string itemName;
        string category;
        string priceImpact;
        string emotionalTag;
        bool exemptedFromVAT;
    }

    SnackEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logSnack(string memory _itemName, string memory _category, string memory _priceImpact, string memory _emotionalTag) external onlyAdmin {
        ledger.push(SnackEntry(_itemName, _category, _priceImpact, _emotionalTag, false));
    }

    function exemptVAT(uint256 index) external onlyAdmin {
        ledger[index].exemptedFromVAT = true;
    }

    function getSnack(uint256 index) external view returns (SnackEntry memory) {
        return ledger[index];
    }
}
