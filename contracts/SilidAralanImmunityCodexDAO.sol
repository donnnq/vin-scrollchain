// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SilidAralanImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string schoolName;
        string region;
        string immunityClause;
        string emotionalTag;
        bool protected;
    }

    ImmunityEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerSchool(string memory _schoolName, string memory _region, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_schoolName, _region, _immunityClause, _emotionalTag, false));
    }

    function protectSchool(uint256 index) external onlyAdmin {
        codex[index].protected = true;
    }

    function getSchool(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
