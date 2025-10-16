// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LocalSovereigntyBroadcastCodexDAO {
    address public admin;

    struct CodexEntry {
        string broadcastLabel;
        string sovereigntyClause;
        string emotionalTag;
        bool sealed;
    }

    CodexEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _broadcastLabel, string memory _sovereigntyClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(CodexEntry(_broadcastLabel, _sovereigntyClause, _emotionalTag, false));
    }

    function sealEntry(uint256 index) external onlyAdmin {
        codex[index].sealed = true;
    }

    function getEntry(uint256 index) external view returns (CodexEntry memory) {
        return codex[index];
    }
}
