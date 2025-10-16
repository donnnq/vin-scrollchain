// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InfrastructureKickbackAuditDAO {
    address public admin;

    struct AuditEntry {
        string projectName;
        string region;
        string allegedActor;
        string emotionalTag;
        bool investigated;
        bool exposed;
    }

    AuditEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logAudit(string memory projectName, string memory region, string memory allegedActor, string memory emotionalTag) external onlyAdmin {
        entries.push(AuditEntry(projectName, region, allegedActor, emotionalTag, true, false));
    }

    function exposeActor(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        return entries[index];
    }
}
