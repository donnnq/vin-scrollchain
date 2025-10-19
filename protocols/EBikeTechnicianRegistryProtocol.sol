// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EBikeTechnicianRegistryProtocol {
    address public admin;

    struct TechnicianEntry {
        string technicianName;
        string region;
        string skillLevel;
        string emotionalTag;
        bool summoned;
        bool certified;
        bool sealed;
    }

    TechnicianEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTechnician(string memory technicianName, string memory region, string memory skillLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(TechnicianEntry(technicianName, region, skillLevel, emotionalTag, true, false, false));
    }

    function confirmCertification(uint256 index) external onlyAdmin {
        entries[index].certified = true;
    }

    function sealTechnicianEntry(uint256 index) external onlyAdmin {
        require(entries[index].certified, "Must be certified first");
        entries[index].sealed = true;
    }

    function getTechnicianEntry(uint256 index) external view returns (TechnicianEntry memory) {
        return entries[index];
    }
}
