// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerAnthemDAO {
    address public admin;

    struct AnthemEntry {
        string workerLabel;
        string anthemClause;
        string emotionalTag;
        bool archived;
    }

    AnthemEntry[] public anthems;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _anthemClause, string memory _emotionalTag) external onlyAdmin {
        anthems.push(AnthemEntry(_workerLabel, _anthemClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        anthems[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (AnthemEntry memory) {
        return anthems[index];
    }
}
