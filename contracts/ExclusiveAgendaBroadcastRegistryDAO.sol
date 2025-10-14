// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExclusiveAgendaBroadcastRegistryDAO {
    address public admin;

    struct BroadcastEntry {
        string journalist;
        string investigationTitle;
        string platform;
        string emotionalTag;
        bool aired;
    }

    BroadcastEntry[] public registry;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBroadcast(string memory _journalist, string memory _investigationTitle, string memory _platform, string memory _emotionalTag) external onlyAdmin {
        registry.push(BroadcastEntry(_journalist, _investigationTitle, _platform, _emotionalTag, false));
    }

    function markAired(uint256 index) external onlyAdmin {
        registry[index].aired = true;
    }

    function getBroadcast(uint256 index) external view returns (BroadcastEntry memory) {
        return registry[index];
    }
}
