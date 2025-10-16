// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureIDEUpdateLedgerDAO {
    address public admin;

    struct UpdateEntry {
        string ideLabel;
        string updateClause;
        string emotionalTag;
        bool verified;
    }

    UpdateEntry[] public updates;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _ideLabel, string memory _updateClause, string memory _emotionalTag) external onlyAdmin {
        updates.push(UpdateEntry(_ideLabel, _updateClause, _emotionalTag, false));
    }

    function verifyEntry(uint256 index) external onlyAdmin {
        updates[index].verified = true;
    }

    function getEntry(uint256 index) external view returns (UpdateEntry memory) {
        return updates[index];
    }
}
