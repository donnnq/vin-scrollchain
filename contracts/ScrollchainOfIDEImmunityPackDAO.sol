// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfIDEImmunityPackDAO {
    address public admin;

    struct ImmunityEntry {
        string ideLabel;
        string immunityClause;
        string emotionalTag;
        bool sealed;
    }

    ImmunityEntry[] public immunity;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _ideLabel, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        immunity.push(ImmunityEntry(_ideLabel, _immunityClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        immunity[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return immunity[index];
    }
}
