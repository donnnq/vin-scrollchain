// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CredentialRotationDAO {
    address public admin;

    struct RotationEntry {
        string credentialLabel;
        string rotationClause;
        string emotionalTag;
        bool rotated;
    }

    RotationEntry[] public credentials;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _credentialLabel, string memory _rotationClause, string memory _emotionalTag) external onlyAdmin {
        credentials.push(RotationEntry(_credentialLabel, _rotationClause, _emotionalTag, false));
    }

    function rotateEntry(uint256 index) external onlyAdmin {
        credentials[index].rotated = true;
    }

    function getEntry(uint256 index) external view returns (RotationEntry memory) {
        return credentials[index];
    }
}
