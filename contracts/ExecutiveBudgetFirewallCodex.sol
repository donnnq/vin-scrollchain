// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExecutiveBudgetFirewallCodex {
    address public admin;

    struct FirewallEntry {
        string fundLabel;
        string sourceEntity;
        string emotionalTag;
        bool returned;
        bool protected;
    }

    FirewallEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory fundLabel, string memory sourceEntity, string memory emotionalTag) external onlyAdmin {
        entries.push(FirewallEntry(fundLabel, sourceEntity, emotionalTag, false, false));
    }

    function markReturned(uint256 index) external onlyAdmin {
        entries[index].returned = true;
    }

    function grantProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getEntry(uint256 index) external view returns (FirewallEntry memory) {
        return entries[index];
    }
}
