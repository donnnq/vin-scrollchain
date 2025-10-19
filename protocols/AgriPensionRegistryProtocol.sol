// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AgriPensionRegistryProtocol {
    address public admin;

    struct AgriEntry {
        string workerName;
        string sectorType;
        string region;
        string emotionalTag;
        bool summoned;
        bool registered;
        bool sealed;
    }

    AgriEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAgriPension(string memory workerName, string memory sectorType, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(AgriEntry(workerName, sectorType, region, emotionalTag, true, false, false));
    }

    function confirmRegistration(uint256 index) external onlyAdmin {
        entries[index].registered = true;
    }

    function sealAgriEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getAgriEntry(uint256 index) external view returns (AgriEntry memory) {
        return entries[index];
    }
}
