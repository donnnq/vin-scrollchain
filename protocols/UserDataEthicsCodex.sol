// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserDataEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string dataType;
        string usagePolicy;
        string consentClause;
        string emotionalTag;
        bool summoned;
        bool ratified;
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

    function summonEthics(string memory dataType, string memory usagePolicy, string memory consentClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(dataType, usagePolicy, consentClause, emotionalTag, true, false, false));
    }

    function confirmRatification(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
