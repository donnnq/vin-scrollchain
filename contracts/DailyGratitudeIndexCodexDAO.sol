// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DailyGratitudeIndexCodexDAO {
    address public admin;

    struct IndexEntry {
        string workerLabel;
        string gratitudeClause;
        string emotionalTag;
        bool sealed;
    }

    IndexEntry[] public index;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _gratitudeClause, string memory _emotionalTag) external onlyAdmin {
        index.push(IndexEntry(_workerLabel, _gratitudeClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        index[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (IndexEntry memory) {
        return index[index];
    }
}
