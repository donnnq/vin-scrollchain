// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySafeSpacesCodexDAO {
    address public admin;

    struct CodexEntry {
        string purokOrBarangay;
        string safeSpaceClause;
        string emotionalTag;
        bool enforced;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokOrBarangay, string memory _safeSpaceClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_purokOrBarangay, _safeSpaceClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
