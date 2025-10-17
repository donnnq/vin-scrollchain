// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OmbudsmanEthicsFellowship {
    address public admin;

    struct EthicsEntry {
        string ombudsmanName;
        string reformTheme;
        string emotionalTag;
        bool summoned;
        bool reinforced;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthics(string memory ombudsmanName, string memory reformTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(ombudsmanName, reformTheme, emotionalTag, true, false));
    }

    function reinforceEthics(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getEthics(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
