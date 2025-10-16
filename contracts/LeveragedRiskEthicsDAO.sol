// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LeveragedRiskEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string productLabel;
        string riskClause;
        string emotionalTag;
        bool logged;
    }

    EthicsEntry[] public ethics;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _productLabel, string memory _riskClause, string memory _emotionalTag) external onlyAdmin {
        ethics.push(EthicsEntry(_productLabel, _riskClause, _emotionalTag, false));
    }

    function logEntry(uint256 index) external onlyAdmin {
        ethics[index].logged = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return ethics[index];
    }
}
