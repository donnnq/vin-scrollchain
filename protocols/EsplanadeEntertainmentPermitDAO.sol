// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EsplanadeEntertainmentPermitDAO {
    address public admin;

    struct PermitEntry {
        string performerName;
        string performanceType;
        string schedule; // e.g., "Saturdays 5PM–9PM"
        string location; // e.g., "Pasig River Esplanade Phase 4 – Zone B"
        string emotionalTag;
        bool summoned;
        bool approved;
        bool sealed;
    }

    PermitEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPermit(string memory performerName, string memory performanceType, string memory schedule, string memory location, string memory emotionalTag) external onlyAdmin {
        entries.push(PermitEntry(performerName, performanceType, schedule, location, emotionalTag, true, false, false));
    }

    function confirmApproval(uint256 index) external onlyAdmin {
        entries[index].approved = true;
    }

    function sealPermitEntry(uint256 index) external onlyAdmin {
        require(entries[index].approved, "Must be approved first");
        entries[index].sealed = true;
    }

    function getPermitEntry(uint256 index) external view returns (PermitEntry memory) {
        return entries[index];
    }
}
