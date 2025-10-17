// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrillionPesoProtestCodex {
    address public admin;

    struct ProtestEntry {
        string corruptionTarget;
        string protestAction;
        string emotionalTag;
        bool summoned;
        bool archived;
    }

    ProtestEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtest(string memory corruptionTarget, string memory protestAction, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtestEntry(corruptionTarget, protestAction, emotionalTag, true, false));
    }

    function archiveProtest(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getProtestEntry(uint256 index) external view returns (ProtestEntry memory) {
        return entries[index];
    }
}
