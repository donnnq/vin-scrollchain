// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CyberSovereigntyCodexDAO {
    address public admin;

    struct SovereigntyEntry {
        string systemName;
        string sovereigntyTag;
        string emotionalTag;
        bool enforced;
    }

    SovereigntyEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _systemName, string memory _sovereigntyTag, string memory _emotionalTag) external onlyAdmin {
        codex.push(SovereigntyEntry(_systemName, _sovereigntyTag, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return codex[index];
    }
}
