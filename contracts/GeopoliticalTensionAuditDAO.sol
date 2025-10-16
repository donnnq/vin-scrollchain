// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GeopoliticalTensionAuditDAO {
    address public admin;

    struct TensionEntry {
        string regionLabel;
        string flashpoint;
        string emotionalTag;
        bool active;
        bool archived;
    }

    TensionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTension(string memory regionLabel, string memory flashpoint, string memory emotionalTag) external onlyAdmin {
        entries.push(TensionEntry(regionLabel, flashpoint, emotionalTag, true, false));
    }

    function archiveTension(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getTension(uint256 index) external view returns (TensionEntry memory) {
        return entries[index];
    }
}
