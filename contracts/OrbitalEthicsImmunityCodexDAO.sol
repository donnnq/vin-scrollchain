// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalEthicsImmunityCodexDAO {
    address public admin;

    struct CodexEntry {
        string satelliteLabel;
        string ethicsClause;
        string emotionalTag;
        bool granted;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _satelliteLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_satelliteLabel, _ethicsClause, _emotionalTag, false));
    }

    function grantImmunity(uint256 index) external onlyAdmin {
        codex[index].granted = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
