// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CitizenActivationCodex {
    address public admin;

    struct ActivationEntry {
        string region;
        string civicTheme;
        string emotionalTag;
        bool initiated;
        bool reinforced;
    }

    ActivationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function initiateActivation(string memory region, string memory civicTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(ActivationEntry(region, civicTheme, emotionalTag, true, false));
    }

    function reinforceActivation(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getActivation(uint256 index) external view returns (ActivationEntry memory) {
        return entries[index];
    }
}
