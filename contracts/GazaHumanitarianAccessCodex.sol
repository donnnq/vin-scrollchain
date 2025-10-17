// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GazaHumanitarianAccessCodex {
    address public admin;

    struct AccessEntry {
        string crossingPoint;
        uint256 trucksAllowed;
        string emotionalTag;
        bool opened;
        bool monitored;
    }

    AccessEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function openAccess(string memory crossingPoint, uint256 trucksAllowed, string memory emotionalTag) external onlyAdmin {
        entries.push(AccessEntry(crossingPoint, trucksAllowed, emotionalTag, true, false));
    }

    function monitorAccess(uint256 index) external onlyAdmin {
        entries[index].monitored = true;
    }

    function getAccessEntry(uint256 index) external view returns (AccessEntry memory) {
        return entries[index];
    }
}
