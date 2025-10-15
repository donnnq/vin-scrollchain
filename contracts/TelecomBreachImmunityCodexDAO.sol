// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelecomBreachImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string telecomLabel;
        string immunityClause;
        string emotionalTag;
        bool granted;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _telecomLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_telecomLabel, _immunityClause, _emotionalTag, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        codex[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
