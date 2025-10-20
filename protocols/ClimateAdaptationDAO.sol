// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateAdaptationDAO {
    address public admin;

    struct AdaptationEntry {
        string barangayName;
        string climateThreat;
        string adaptationClause;
        string emotionalTag;
        bool summoned;
        bool reinforced;
        bool sealed;
    }

    AdaptationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAdaptationPlan(string memory barangayName, string memory climateThreat, string memory adaptationClause, string memory emotionalTag) external onlyAdmin {
        entries.push(AdaptationEntry(barangayName, climateThreat, adaptationClause, emotionalTag, true, false, false));
    }

    function confirmReinforcement(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function sealAdaptationEntry(uint256 index) external onlyAdmin {
        require(entries[index].reinforced, "Must be reinforced first");
        entries[index].sealed = true;
    }

    function getAdaptationEntry(uint256 index) external view returns (AdaptationEntry memory) {
        return entries[index];
    }
}
