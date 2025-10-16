// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PHDigitalFirewallDAO {
    address public admin;

    struct FirewallEntry {
        string platformLabel;
        string firewallClause;
        string emotionalTag;
        bool enforced;
    }

    FirewallEntry[] public firewall;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _platformLabel, string memory _firewallClause, string memory _emotionalTag) external onlyAdmin {
        firewall.push(FirewallEntry(_platformLabel, _firewallClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        firewall[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (FirewallEntry memory) {
        return firewall[index];
    }
}
