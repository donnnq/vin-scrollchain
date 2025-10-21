// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CannabisFirearmEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string policyName;
        string contradictionClause;
        string emotionalTag;
        bool summoned;
        bool debated;
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

    function summonDebate(string memory policyName, string memory contradictionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(policyName, contradictionClause, emotionalTag, true, false, false));
    }

    function confirmDebate(uint256 index) external onlyAdmin {
        entries[index].debated = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].debated, "Must be debated first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
