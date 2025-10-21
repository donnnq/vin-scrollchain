// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalCryptoEthicsProtocol {
    address public admin;

    struct EthicsEntry {
        string platform;
        string cryptoTheme;
        string ethicsClause;
        string emotionalTag;
        bool summoned;
        bool debated;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthics(string memory platform, string memory cryptoTheme, string memory ethicsClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(platform, cryptoTheme, ethicsClause, emotionalTag, true, false, false));
    }

    function confirmDebate(uint256 index) external onlyAdmin {
        entries[index].debated = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].debated, "Must be debated first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
