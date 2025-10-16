// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokTradeFirewallPackDAO {
    address public admin;

    struct FirewallEntry {
        string purokLabel;
        string firewallClause;
        string emotionalTag;
        bool activated;
    }

    FirewallEntry[] public firewall;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _purokLabel, string memory _firewallClause, string memory _emotionalTag) external onlyAdmin {
        firewall.push(FirewallEntry(_purokLabel, _firewallClause, _emotionalTag, false));
    }

    function activateEntry(uint256 index) external onlyAdmin {
        firewall[index].activated = true;
    }

    function getEntry(uint256 index) external view returns (FirewallEntry memory) {
        return firewall[index];
    }
}
