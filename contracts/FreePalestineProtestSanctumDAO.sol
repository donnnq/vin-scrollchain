// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FreePalestineProtestSanctumDAO {
    address public admin;

    struct ProtestEntry {
        string protesterName;
        string countryOrigin;
        string emotionalTag;
        bool summoned;
        bool grantedVoice;
    }

    ProtestEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtester(string memory protesterName, string memory countryOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtestEntry(protesterName, countryOrigin, emotionalTag, true, false));
    }

    function grantVoice(uint256 index) external onlyAdmin {
        entries[index].grantedVoice = true;
    }

    function getProtestEntry(uint256 index) external view returns (ProtestEntry memory) {
        return entries[index];
    }
}
