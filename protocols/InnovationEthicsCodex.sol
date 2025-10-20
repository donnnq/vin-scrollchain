// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InnovationEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string innovationName;
        string riskType;
        string auditClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
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

    function summonEthicsReview(string memory innovationName, string memory riskType, string memory auditClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(innovationName, riskType, auditClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
