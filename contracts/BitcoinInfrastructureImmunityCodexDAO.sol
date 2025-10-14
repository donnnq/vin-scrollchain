// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitcoinInfrastructureImmunityCodexDAO {
    address public admin;

    struct ImmunityEntry {
        string facilityName;
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

    function registerFacility(string memory _facilityName, string memory _region, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(ImmunityEntry(_facilityName, _region, _immunityClause, _emotionalTag, false));
    }

    function protectFacility(uint256 index) external onlyAdmin {
        codex[index].protected = true;
    }

    function getFacility(uint256 index) external view returns (ImmunityEntry memory) {
        return codex[index];
    }
}
