// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RefundJusticeDAO {
    address public admin;

    struct RefundEntry {
        string platformName;
        string disputeType;
        string resolutionClause;
        string emotionalTag;
        bool summoned;
        bool resolved;
        bool sealed;
    }

    RefundEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRefund(string memory platformName, string memory disputeType, string memory resolutionClause, string memory emotionalTag) external onlyAdmin {
        entries.push(RefundEntry(platformName, disputeType, resolutionClause, emotionalTag, true, false, false));
    }

    function confirmResolution(uint256 index) external onlyAdmin {
        entries[index].resolved = true;
    }

    function sealRefundEntry(uint256 index) external onlyAdmin {
        require(entries[index].resolved, "Must be resolved first");
        entries[index].sealed = true;
    }

    function getRefundEntry(uint256 index) external view returns (RefundEntry memory) {
        return entries[index];
    }
}
