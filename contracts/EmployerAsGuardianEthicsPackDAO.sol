// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EmployerAsGuardianEthicsPackDAO {
    address public admin;

    struct EthicsEntry {
        string companyLabel;
        string guardianClause;
        string emotionalTag;
        bool ratified;
    }

    EthicsEntry[] public ethics;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _companyLabel, string memory _guardianClause, string memory _emotionalTag) external onlyAdmin {
        ethics.push(EthicsEntry(_companyLabel, _guardianClause, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        ethics[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return ethics[index];
    }
}
