// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SPEDInfrastructureDAO {
    address public admin;

    struct InfraEntry {
        string schoolName;
        string region;
        string infraType;
        string emotionalTag;
        bool summoned;
        bool constructed;
        bool sealed;
    }

    InfraEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonInfra(string memory schoolName, string memory region, string memory infraType, string memory emotionalTag) external onlyAdmin {
        entries.push(InfraEntry(schoolName, region, infraType, emotionalTag, true, false, false));
    }

    function confirmConstruction(uint256 index) external onlyAdmin {
        entries[index].constructed = true;
    }

    function sealInfraEntry(uint256 index) external onlyAdmin {
        require(entries[index].constructed, "Must be constructed first");
        entries[index].sealed = true;
    }

    function getInfraEntry(uint256 index) external view returns (InfraEntry memory) {
        return entries[index];
    }
}
