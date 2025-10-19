// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakeholderMonitoringLedgerDAO {
    address public admin;

    struct StakeholderEntry {
        string projectName;
        string stakeholder;
        string role;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    StakeholderEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStakeholder(string memory projectName, string memory stakeholder, string memory role, string memory emotionalTag) external onlyAdmin {
        entries.push(StakeholderEntry(projectName, stakeholder, role, emotionalTag, true, false, false));
    }

    function logStakeholder(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealStakeholder(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getStakeholderEntry(uint256 index) external view returns (StakeholderEntry memory) {
        return entries[index];
    }
}
