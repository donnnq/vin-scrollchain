// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmigrationBriberyImmunityPackDAO {
    address public admin;

    struct ImmunityEntry {
        string checkpointLabel;
        string briberyClause;
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

    function submitEntry(string memory _checkpointLabel, string memory _briberyClause, string memory _emotionalTag) external onlyAdmin {
        immunity.push(ImmunityEntry(_checkpointLabel, _briberyClause, _emotionalTag, false));
    }

    function grantEntry(uint256 index) external onlyAdmin {
        immunity[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return immunity[index];
    }
}
