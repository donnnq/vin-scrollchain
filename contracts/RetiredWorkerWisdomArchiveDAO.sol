// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetiredWorkerWisdomArchiveDAO {
    address public admin;

    struct ArchiveEntry {
        string workerName;
        string legacyInsight;
        string emotionalTag;
        bool preserved;
    }

    ArchiveEntry[] public archive;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitInsight(string memory _workerName, string memory _legacyInsight, string memory _emotionalTag) external onlyAdmin {
        archive.push(ArchiveEntry(_workerName, _legacyInsight, _emotionalTag, false));
    }

    function markPreserved(uint256 index) external onlyAdmin {
        archive[index].preserved = true;
    }

    function getInsight(uint256 index) external view returns (ArchiveEntry memory) {
        return archive[index];
    }
}
