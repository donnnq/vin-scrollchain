// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CryptoMarketOversightDAO {
    address public admin;

    struct OversightEntry {
        string agencyName;
        string oversightArea;
        string emotionalTag;
        bool summoned;
        bool reinforced;
    }

    OversightEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonOversight(string memory agencyName, string memory oversightArea, string memory emotionalTag) external onlyAdmin {
        entries.push(OversightEntry(agencyName, oversightArea, emotionalTag, true, false));
    }

    function reinforceOversight(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getOversight(uint256 index) external view returns (OversightEntry memory) {
        return entries[index];
    }
}
