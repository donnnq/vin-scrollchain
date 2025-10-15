// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ColdChainImmunityLedgerDAO {
    address public admin;

    struct LedgerEntry {
        string productType;
        string region;
        string coldChainStatus;
        string emotionalTag;
        bool operational;
    }

    LedgerEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _productType, string memory _region, string memory _coldChainStatus, string memory _emotionalTag) external onlyAdmin {
        ledger.push(LedgerEntry(_productType, _region, _coldChainStatus, _emotionalTag, false));
    }

    function markOperational(uint256 index) external onlyAdmin {
        ledger[index].operational = true;
    }

    function getEntry(uint256 index) external view returns (LedgerEntry memory) {
        return ledger[index];
    }
}
