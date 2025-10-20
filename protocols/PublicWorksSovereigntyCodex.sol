// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksSovereigntyCodex {
    address public admin;

    struct WorksEntry {
        string projectName;
        string barangayZone;
        string sovereigntyClause;
        string emotionalTag;
        bool summoned;
        bool restored;
        bool sealed;
    }

    WorksEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRestoration(string memory projectName, string memory barangayZone, string memory sovereigntyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(WorksEntry(projectName, barangayZone, sovereigntyClause, emotionalTag, true, false, false));
    }

    function confirmRestoration(uint256 index) external onlyAdmin {
        entries[index].restored = true;
    }

    function sealWorksEntry(uint256 index) external onlyAdmin {
        require(entries[index].restored, "Must be restored first");
        entries[index].sealed = true;
    }

    function getWorksEntry(uint256 index) external view returns (WorksEntry memory) {
        return entries[index];
    }
}
