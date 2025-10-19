// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DICTOversightDAO {
    address public admin;

    struct OversightEntry {
        string projectName;
        string companyName;
        string oversightStatus;
        string emotionalTag;
        bool summoned;
        bool monitored;
        bool sealed;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory projectName, string memory companyName, string memory oversightStatus, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(projectName, companyName, oversightStatus, emotionalTag, true, false, false));
    }

    function confirmMonitoring(uint256 index) external onlyAdmin {
        entries[index].monitored = true;
    }

    function sealOversightEntry(uint256 index) external onlyAdmin {
        require(entries[index].monitored, "Must be monitored first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
