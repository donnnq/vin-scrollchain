// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StartupEquityDAO {
    address public admin;

    struct StartupEntry {
        string startupName;
        string sector;
        string equityClause;
        string emotionalTag;
        bool summoned;
        bool supported;
        bool sealed;
    }

    StartupEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonStartup(string memory startupName, string memory sector, string memory equityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(StartupEntry(startupName, sector, equityClause, emotionalTag, true, false, false));
    }

    function confirmSupport(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function sealStartupEntry(uint256 index) external onlyAdmin {
        require(entries[index].supported, "Must be supported first");
        entries[index].sealed = true;
    }

    function getStartupEntry(uint256 index) external view returns (StartupEntry memory) {
        return entries[index];
    }
}
