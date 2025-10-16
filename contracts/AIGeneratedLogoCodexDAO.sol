// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIGeneratedLogoCodexDAO {
    address public admin;

    struct LogoEntry {
        string contentLabel;
        string logoClause;
        string emotionalTag;
        bool stamped;
    }

    LogoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory contentLabel, string memory logoClause, string memory emotionalTag) external onlyAdmin {
        entries.push(LogoEntry(contentLabel, logoClause, emotionalTag, false));
    }

    function stampEntry(uint256 index) external onlyAdmin {
        entries[index].stamped = true;
    }

    function getEntry(uint256 index) external view returns (LogoEntry memory) {
        return entries[index];
    }
}
