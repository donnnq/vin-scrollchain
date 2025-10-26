// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YouthToAtomicEthicsManifesto {
    address public steward;

    struct EthicsEntry {
        string youthSector; // "Science clubs, student councils, civic orgs"
        string ethicsClause; // "Nuclear responsibility, planetary consequence, intergenerational stewardship"
        string emotionalTag;
        bool declared;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function declareEthics(string memory youthSector, string memory ethicsClause, string memory emotionalTag) external onlySteward {
        entries.push(EthicsEntry(youthSector, ethicsClause, emotionalTag, true, false));
    }

    function sealEthicsEntry(uint256 index) external onlySteward {
        require(entries[index].declared, "Must be declared first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
