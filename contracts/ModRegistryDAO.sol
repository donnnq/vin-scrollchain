// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModRegistryDAO {
    address public admin;

    struct ModEntry {
        string gameTitle;
        string modLabel;
        string emotionalTag;
        bool verified;
        bool deployed;
    }

    ModEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitMod(string memory gameTitle, string memory modLabel, string memory emotionalTag) external onlyAdmin {
        entries.push(ModEntry(gameTitle, modLabel, emotionalTag, false, false));
    }

    function verifyMod(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function deployMod(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function getMod(uint256 index) external view returns (ModEntry memory) {
        return entries[index];
    }
}
