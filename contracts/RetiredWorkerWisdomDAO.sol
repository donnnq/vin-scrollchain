// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetiredWorkerWisdomDAO {
    address public admin;

    struct WisdomEntry {
        string workerName;
        string factoryName;
        string legacyInsight;
        string emotionalTag;
        bool archived;
    }

    WisdomEntry[] public wisdom;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitWisdom(string memory _workerName, string memory _factoryName, string memory _legacyInsight, string memory _emotionalTag) external onlyAdmin {
        wisdom.push(WisdomEntry(_workerName, _factoryName, _legacyInsight, _emotionalTag, false));
    }

    function archiveWisdom(uint256 index) external onlyAdmin {
        wisdom[index].archived = true;
    }

    function getWisdom(uint256 index) external view returns (WisdomEntry memory) {
        return wisdom[index];
    }
}
