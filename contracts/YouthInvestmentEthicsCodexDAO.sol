// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthInvestmentEthicsCodexDAO {
    address public admin;

    struct EthicsEntry {
        string purokOrBarangay;
        string investmentTheme;
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

    function submitEntry(string memory _purokOrBarangay, string memory _investmentTheme, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(EthicsEntry(_purokOrBarangay, _investmentTheme, _ethicsClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return codex[index];
    }
}
