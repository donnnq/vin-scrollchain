// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalAssetRecoveryDAO {
    address public admin;

    struct RecoveryEntry {
        string assetType;
        string ownerName;
        uint lostValueUSD;
        string emotionalTag;
        bool attempted;
        bool recovered;
    }

    RecoveryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logRecovery(string memory assetType, string memory ownerName, uint lostValueUSD, string memory emotionalTag) external onlyAdmin {
        entries.push(RecoveryEntry(assetType, ownerName, lostValueUSD, emotionalTag, true, false));
    }

    function markRecovered(uint256 index) external onlyAdmin {
        entries[index].recovered = true;
    }

    function getRecovery(uint256 index) external view returns (RecoveryEntry memory) {
        return entries[index];
    }
}
