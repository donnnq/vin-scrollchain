// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetailTraderOnboardingRegistryDAO {
    address public admin;

    struct TraderEntry {
        string purokOrBarangay;
        string onboardingFocus;
        string platformUsed;
        string emotionalTag;
        bool completed;
    }

    TraderEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTrader(string memory _purokOrBarangay, string memory _onboardingFocus, string memory _platformUsed, string memory _emotionalTag) external onlyAdmin {
        registry.push(TraderEntry(_purokOrBarangay, _onboardingFocus, _platformUsed, _emotionalTag, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        registry[index].completed = true;
    }

    function getTrader(uint256 index) external view returns (TraderEntry memory) {
        return registry[index];
    }
}
