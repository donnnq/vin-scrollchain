// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CybersecurityBroadcastCodexDAO {
    address public admin;

    struct BroadcastEntry {
        string incidentName;
        string platform;
        string threatLevel;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _incidentName, string memory _platform, string memory _threatLevel, string memory _emotionalTag) external onlyAdmin {
        codex.push(BroadcastEntry(_incidentName, _platform, _threatLevel, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        codex[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return codex[index];
    }
}
