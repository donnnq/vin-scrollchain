// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthBudgetOversightCodex {
    address public admin;

    struct OversightEntry {
        string youthName;
        string region;
        string oversightType;
        string emotionalTag;
        bool summoned;
        bool trained;
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

    function summonOversight(string memory youthName, string memory region, string memory oversightType, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(youthName, region, oversightType, emotionalTag, true, false, false));
    }

    function confirmTraining(uint256 index) external onlyAdmin {
        entries[index].trained = true;
    }

    function sealOversightEntry(uint256 index) external onlyAdmin {
        require(entries[index].trained, "Must be trained first");
        entries[index].sealed = true;
    }

    function getOversightEntry(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
