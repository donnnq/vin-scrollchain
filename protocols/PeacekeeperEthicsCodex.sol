// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeacekeeperEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string missionName;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool validated;
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

    function summonEthics(string memory missionName, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(missionName, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmValidation(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
