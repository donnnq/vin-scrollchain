// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FarmToMarketInfrastructureCodexDAO {
    address public admin;

    struct CodexEntry {
        string infrastructureType;
        string region;
        string logisticsClause;
        string emotionalTag;
        bool deployed;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _infrastructureType, string memory _region, string memory _logisticsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_infrastructureType, _region, _logisticsClause, _emotionalTag, false));
    }

    function deployEntry(uint256 index) external onlyAdmin {
        codex[index].deployed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
