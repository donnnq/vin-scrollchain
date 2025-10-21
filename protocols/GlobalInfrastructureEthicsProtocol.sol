// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalInfrastructureEthicsProtocol {
    address public admin;

    struct EthicsEntry {
        string region;
        string infrastructureType;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool affirmed;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthics(string memory region, string memory infrastructureType, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(region, infrastructureType, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmAffirmation(uint256 index) external onlyAdmin {
        entries[index].affirmed = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].affirmed, "Must be affirmed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
