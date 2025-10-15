// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorkerRehireImmunityPackDAO {
    address public admin;

    struct RehireEntry {
        string workerName;
        string factoryName;
        string immunityClause;
        string emotionalTag;
        bool rehired;
    }

    RehireEntry[] public rehiredWorkers;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitRehire(string memory _workerName, string memory _factoryName, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        rehiredWorkers.push(RehireEntry(_workerName, _factoryName, _immunityClause, _emotionalTag, false));
    }

    function markRehired(uint256 index) external onlyAdmin {
        rehiredWorkers[index].rehired = true;
    }

    function getRehire(uint256 index) external view returns (RehireEntry memory) {
        return rehiredWorkers[index];
    }
}
