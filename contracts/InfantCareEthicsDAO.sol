// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfantCareEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string productName;
        string careClause;
        string emotionalTag;
        bool validated;
    }

    EthicsEntry[] public ethics;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _productName, string memory _careClause, string memory _emotionalTag) external onlyAdmin {
        ethics.push(EthicsEntry(_productName, _careClause, _emotionalTag, false));
    }

    function validateEntry(uint256 index) external onlyAdmin {
        ethics[index].validated = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return ethics[index];
    }
}
