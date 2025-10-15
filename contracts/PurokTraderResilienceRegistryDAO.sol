// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokTraderResilienceRegistryDAO {
    address public admin;

    struct TraderEntry {
        string purokOrBarangay;
        string resilienceFocus;
        string trainingMethod;
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

    function submitTrader(string memory _purokOrBarangay, string memory _resilienceFocus, string memory _trainingMethod, string memory _emotionalTag) external onlyAdmin {
        registry.push(TraderEntry(_purokOrBarangay, _resilienceFocus, _trainingMethod, _emotionalTag, false));
    }

    function markCompleted(uint256 index) external onlyAdmin {
        registry[index].completed = true;
    }

    function getTrader(uint256 index) external view returns (TraderEntry memory) {
        return registry[index];
    }
}
