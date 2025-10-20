// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DisasterProofInfrastructureCodex {
    address public admin;

    struct InfrastructureEntry {
        string projectName;
        string region;
        string resilienceStandard;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    InfrastructureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonInfrastructure(string memory projectName, string memory region, string memory resilienceStandard, string memory emotionalTag) external onlyAdmin {
        entries.push(InfrastructureEntry(projectName, region, resilienceStandard, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealInfrastructureEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getInfrastructureEntry(uint256 index) external view returns (InfrastructureEntry memory) {
        return entries[index];
    }
}
