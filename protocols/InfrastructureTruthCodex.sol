// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureTruthCodex {
    address public admin;

    struct TruthEntry {
        string region;
        string projectName;
        string truthClause;
        string emotionalTag;
        bool summoned;
        bool validated;
        bool sealed;
    }

    TruthEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTruth(string memory region, string memory projectName, string memory truthClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TruthEntry(region, projectName, truthClause, emotionalTag, true, false, false));
    }

    function confirmValidation(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function sealTruthEntry(uint256 index) external onlyAdmin {
        require(entries[index].validated, "Must be validated first");
        entries[index].sealed = true;
    }

    function getTruthEntry(uint256 index) external view returns (TruthEntry memory) {
        return entries[index];
    }
}
