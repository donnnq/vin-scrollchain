// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinGlobalHourlyWageMandate {
    address public scrollkeeper;

    struct CountryWagePolicy {
        string country;
        uint256 minimumHourlyRate;
        bool perHourRequired;
        uint256 timestamp;
    }

    CountryWagePolicy[] public wagePolicies;

    event WagePolicyEnforced(string country, uint256 rate);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function setWagePolicy(string memory country, uint256 minimumHourlyRate) external onlyScrollkeeper {
        wagePolicies.push(CountryWagePolicy(country, minimumHourlyRate, true, block.timestamp));
        emit WagePolicyEnforced(country, minimumHourlyRate);
    }

    function getPolicy(uint256 index) external view returns (string memory, uint256, bool, uint256) {
        CountryWagePolicy memory p = wagePolicies[index];
        return (p.country, p.minimumHourlyRate, p.perHourRequired, p.timestamp);
    }

    function totalPolicies() external view returns (uint256) {
        return wagePolicies.length;
    }
}
