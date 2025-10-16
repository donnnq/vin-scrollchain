// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BelowAverageWageInclusionCodexDAO {
    address public admin;

    struct InclusionEntry {
        string wageTier;
        string inclusionClause;
        string emotionalTag;
        bool sealed;
    }

    InclusionEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _wageTier, string memory _inclusionClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(InclusionEntry(_wageTier, _inclusionClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (InclusionEntry memory) {
        return codex[index];
    }
}
