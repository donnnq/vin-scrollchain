// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FiscalTransparencyEthicsCodexDAO {
    address public admin;

    struct EthicsEntry {
        string fundType;
        string transparencyClause;
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

    function submitEntry(string memory _fundType, string memory _transparencyClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(EthicsEntry(_fundType, _transparencyClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return codex[index];
    }
}
