// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactorySovereigntyLedgerDAO {
    address public admin;

    struct FactoryEntry {
        string factoryName;
        string barangay;
        string productionType;
        string emotionalTag;
        bool sovereign;
    }

    FactoryEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerFactory(string memory _factoryName, string memory _barangay, string memory _productionType, string memory _emotionalTag) external onlyAdmin {
        ledger.push(FactoryEntry(_factoryName, _barangay, _productionType, _emotionalTag, false));
    }

    function markSovereign(uint256 index) external onlyAdmin {
        ledger[index].sovereign = true;
    }

    function getFactory(uint256 index) external view returns (FactoryEntry memory) {
        return ledger[index];
    }
}
