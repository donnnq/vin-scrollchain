// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHCostAuditBroadcastDAO {
    address public admin;

    struct BroadcastEntry {
        string projectLabel;
        string auditMessage;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public broadcasts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory projectLabel, string memory auditMessage, string memory emotionalTag) external onlyAdmin {
        broadcasts.push(BroadcastEntry(projectLabel, auditMessage, emotionalTag, false));
    }

    function airEntry(uint256 index) external onlyAdmin {
        broadcasts[index].aired = true;
    }

    function getEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return broadcasts[index];
    }
}
