// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelperBotEthicsFellowship {
    address public admin;

    struct EthicsEntry {
        string botName;
        string assignedCorridor;
        string emotionalTag;
        bool deployed;
        bool audited;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployBot(string memory botName, string memory assignedCorridor, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(botName, assignedCorridor, emotionalTag, true, false));
    }

    function auditBot(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getBot(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
