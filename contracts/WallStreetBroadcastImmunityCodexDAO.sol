// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WallStreetBroadcastImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string broadcastTheme;
        string immunityClause;
        string platform;
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

    function submitEntry(string memory _broadcastTheme, string memory _immunityClause, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_broadcastTheme, _immunityClause, _platform, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
