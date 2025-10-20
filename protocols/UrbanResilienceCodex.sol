// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrbanResilienceCodex {
    address public admin;

    struct ResilienceEntry {
        string barangayName;
        string vulnerabilityZone;
        string resilienceClause;
        string emotionalTag;
        bool summoned;
        bool reinforced;
        bool sealed;
    }

    ResilienceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResiliencePlan(string memory barangayName, string memory vulnerabilityZone, string memory resilienceClause, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(barangayName, vulnerabilityZone, resilienceClause, emotionalTag, true, false, false));
    }

    function confirmReinforcement(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function sealResilienceEntry(uint256 index) external onlyAdmin {
        require(entries[index].reinforced, "Must be reinforced first");
        entries[index].sealed = true;
    }

    function getResilienceEntry(uint256 index) external view returns (ResilienceEntry memory) {
        return entries[index];
    }
}
