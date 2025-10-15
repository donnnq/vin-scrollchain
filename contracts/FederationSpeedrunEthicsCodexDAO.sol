// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FederationSpeedrunEthicsCodexDAO {
    address public admin;

    struct EthicsEntry {
        string federationName;
        string speedrunAction;
        string ethicsClause;
        string emotionalTag;
        bool enforced;
    }

    EthicsEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _federationName, string memory _speedrunAction, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(EthicsEntry(_federationName, _speedrunAction, _ethicsClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (EthicsEntry memory) {
        return codex[index];
    }
}
