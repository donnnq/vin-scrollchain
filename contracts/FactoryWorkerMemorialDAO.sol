// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactoryWorkerMemorialDAO {
    address public admin;

    struct MemorialEntry {
        string workerName;
        string factoryName;
        string tributeMessage;
        string emotionalTag;
        bool honored;
    }

    MemorialEntry[] public memorials;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitMemorial(string memory _workerName, string memory _factoryName, string memory _tributeMessage, string memory _emotionalTag) external onlyAdmin {
        memorials.push(MemorialEntry(_workerName, _factoryName, _tributeMessage, _emotionalTag, false));
    }

    function markHonored(uint256 index) external onlyAdmin {
        memorials[index].honored = true;
    }

    function getMemorial(uint256 index) external view returns (MemorialEntry memory) {
        return memorials[index];
    }
}
