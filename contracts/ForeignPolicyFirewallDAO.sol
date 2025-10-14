// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForeignPolicyFirewallDAO {
    address public admin;

    struct FirewallEntry {
        string country;
        string policyDomain;
        string firewallStrategy;
        string emotionalTag;
        bool enforced;
    }

    FirewallEntry[] public firewalls;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitFirewall(string memory _country, string memory _policyDomain, string memory _firewallStrategy, string memory _emotionalTag) external onlyAdmin {
        firewalls.push(FirewallEntry(_country, _policyDomain, _firewallStrategy, _emotionalTag, false));
    }

    function enforceFirewall(uint256 index) external onlyAdmin {
        firewalls[index].enforced = true;
    }

    function getFirewall(uint256 index) external view returns (FirewallEntry memory) {
        return firewalls[index];
    }
}
