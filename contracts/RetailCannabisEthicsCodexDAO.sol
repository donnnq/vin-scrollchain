// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailCannabisEthicsCodexDAO {
    address public admin;

    struct EthicsEntry {
        string companyName;
        string retailTheme;
        string ethicsClause;
        string emotionalTag;
        bool enforced;
    }

    EthicsEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _companyName, string memory _retailTheme, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(EthicsEntry(_companyName, _retailTheme, _ethicsClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return codex[index];
    }
}
