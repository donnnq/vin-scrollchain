// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIOverrideImmunityPackDAO {
    address public admin;

    struct ImmunityEntry {
        string advisorLabel;
        string overrideClause;
        string emotionalTag;
        bool granted;
    }

    ImmunityEntry[] public immunity;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _advisorLabel, string memory _overrideClause, string memory _emotionalTag) external onlyAdmin {
        immunity.push(ImmunityEntry(_advisorLabel, _overrideClause, _emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        immunity[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return immunity[index];
    }
}
