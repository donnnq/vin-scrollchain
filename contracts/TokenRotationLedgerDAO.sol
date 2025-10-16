// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenRotationLedgerDAO {
    address public admin;

    struct RotationEntry {
        string tokenLabel;
        string rotationClause;
        string emotionalTag;
        bool rotated;
    }

    RotationEntry[] public tokens;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _tokenLabel, string memory _rotationClause, string memory _emotionalTag) external onlyAdmin {
        tokens.push(RotationEntry(_tokenLabel, _rotationClause, _emotionalTag, false));
    }

    function rotateEntry(uint256 index) external onlyAdmin {
        tokens[index].rotated = true;
    }

    function getEntry(uint256 index) external view returns (RotationEntry memory) {
        return tokens[index];
    }
}
