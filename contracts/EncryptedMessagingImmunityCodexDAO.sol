// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EncryptedMessagingImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string platform;
        string jurisdiction;
        string immunityClause;
        string emotionalTag;
        bool enforced;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _platform, string memory _jurisdiction, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_platform, _jurisdiction, _immunityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
