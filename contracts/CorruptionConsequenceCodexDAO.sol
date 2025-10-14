// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorruptionConsequenceCodexDAO {
    address public admin;

    struct ConsequenceEntry {
        string accusedEntity;
        string corruptionType;
        string consequencePath;
        string emotionalTag;
        bool executed;
    }

    ConsequenceEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _accusedEntity, string memory _corruptionType, string memory _consequencePath, string memory _emotionalTag) external onlyAdmin {
        codex.push(ConsequenceEntry(_accusedEntity, _corruptionType, _consequencePath, _emotionalTag, false));
    }

    function executeConsequence(uint256 index) external onlyAdmin {
        codex[index].executed = true;
    }

    function getEntry(uint256 index) external view returns (ConsequenceEntry memory) {
        return codex[index];
    }
}
