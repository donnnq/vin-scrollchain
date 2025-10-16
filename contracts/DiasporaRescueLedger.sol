// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaRescueLedger {
    address public admin;

    struct RescueEntry {
        string workerName;
        string nationality;
        string rescueMethod;
        string emotionalTag;
        bool rescued;
        bool archived;
    }

    RescueEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logRescue(string memory workerName, string memory nationality, string memory rescueMethod, string memory emotionalTag) external onlyAdmin {
        entries.push(RescueEntry(workerName, nationality, rescueMethod, emotionalTag, false, false));
    }

    function markRescued(uint256 index) external onlyAdmin {
        entries[index].rescued = true;
    }

    function archiveRescue(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getRescue(uint256 index) external view returns (RescueEntry memory) {
        return entries[index];
    }
}
