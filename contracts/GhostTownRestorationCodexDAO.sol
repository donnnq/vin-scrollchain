// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostTownRestorationCodexDAO {
    address public admin;

    struct RestorationEntry {
        string location;
        string issueTag;
        string restorationPlan;
        string emotionalTag;
        bool completed;
    }

    RestorationEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _location, string memory _issueTag, string memory _restorationPlan, string memory _emotionalTag) external onlyAdmin {
        codex.push(RestorationEntry(_location, _issueTag, _restorationPlan, _emotionalTag, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        codex[index].completed = true;
    }

    function getEntry(uint256 index) external view returns (RestorationEntry memory) {
        return codex[index];
    }
}
