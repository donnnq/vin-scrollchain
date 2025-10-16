// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LaborTribunalCodex {
    address public admin;

    struct TribunalEntry {
        string workerName;
        string country;
        string violationType;
        string emotionalTag;
        bool heard;
        bool resolved;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTribunal(string memory workerName, string memory country, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(workerName, country, violationType, emotionalTag, false, false));
    }

    function markHeard(uint256 index) external onlyAdmin {
        entries[index].heard = true;
    }

    function markResolved(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
