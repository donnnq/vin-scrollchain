// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateOversightImmunityPackDAO {
    address public admin;

    struct OversightEntry {
        string committeeName;
        string immunityClause;
        string emotionalTag;
        bool enforced;
    }

    OversightEntry[] public oversightPack;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _committeeName, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        oversightPack.push(OversightEntry(_committeeName, _immunityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        oversightPack[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (OversightEntry memory) {
        return oversightPack[index];
    }
}
