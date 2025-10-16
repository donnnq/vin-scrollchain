// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MobileDevSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string devName;
        string purokLabel;
        string emotionalTag;
        bool registered;
        bool empowered;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerDev(string memory devName, string memory purokLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(devName, purokLabel, emotionalTag, true, false));
    }

    function empowerDev(uint256 index) external onlyAdmin {
        entries[index].empowered = true;
    }

    function getDev(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
