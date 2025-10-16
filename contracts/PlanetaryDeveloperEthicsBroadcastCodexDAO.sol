// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlanetaryDeveloperEthicsBroadcastCodexDAO {
    address public admin;

    struct CodexEntry {
        string broadcastLabel;
        string ethicsClause;
        string emotionalTag;
        bool aired;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _broadcastLabel, string memory _ethicsClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_broadcastLabel, _ethicsClause, _emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        codex[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
