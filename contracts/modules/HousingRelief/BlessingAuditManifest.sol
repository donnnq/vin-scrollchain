// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BlessingAuditManifest {
    struct AuditEntry {
        address summoner;
        string blessingType;
        string region;
        string emotionalGlyph;
        uint256 timestamp;
    }

    AuditEntry[] public manifest;
    event BlessingLogged(address summoner, string blessingType, string region, string emotionalGlyph, uint256 timestamp);

    function logBlessing(address summoner, string calldata blessingType, string calldata region, string calldata emotionalGlyph) external {
        manifest.push(AuditEntry(summoner, blessingType, region, emotionalGlyph, block.timestamp));
        emit BlessingLogged(summoner, blessingType, region, emotionalGlyph, block.timestamp);
    }

    function getAudit(uint256 index) external view returns (AuditEntry memory) {
        require(index < manifest.length, "Invalid index");
        return manifest[index];
    }

    function totalBlessingsLogged() external view returns (uint256) {
        return manifest.length;
    }
}
