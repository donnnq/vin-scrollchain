// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollchainOfWorkerJoyDAO {
    address public admin;

    struct JoyEntry {
        string workerLabel;
        string joyClause;
        string emotionalTag;
        bool archived;
    }

    JoyEntry[] public joys;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _workerLabel, string memory _joyClause, string memory _emotionalTag) external onlyAdmin {
        joys.push(JoyEntry(_workerLabel, _joyClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        joys[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (JoyEntry memory) {
        return joys[index];
    }
}
