// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ClimateResilienceDAO {
    address public admin;

    struct ResilienceEntry {
        string region;
        string infrastructureType;
        string climateThreat;
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

    function summonResilience(string memory region, string memory infrastructureType, string memory climateThreat, string memory emotionalTag) external onlyAdmin {
        entries.push(ResilienceEntry(region, infrastructureType, climateThreat, emotionalTag, true, false, false));
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
