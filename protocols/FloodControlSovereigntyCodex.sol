// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlSovereigntyCodex {
    address public admin;

    struct SovereigntyEntry {
        string projectName;
        string barangayZone;
        string sovereigntyClause;
        string emotionalTag;
        bool summoned;
        bool reinforced;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReinforcement(string memory projectName, string memory barangayZone, string memory sovereigntyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(projectName, barangayZone, sovereigntyClause, emotionalTag, true, false, false));
    }

    function confirmReinforcement(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].reinforced, "Must be reinforced first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
