// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract BlessingDeckSanctumVault {
    struct VaultEntry {
        string steward;
        string country;
        string blessingType;
        string broadcastMessage;
        string qrLink;
        uint256 aprScore;
        uint256 timestamp;
    }

    VaultEntry[] public sanctumVault;

    event VaultEntryStored(string steward, string blessingType, uint256 aprScore);

    function storeEntry(
        string memory _steward,
        string memory _country,
        string memory _blessingType,
        string memory _broadcastMessage,
        string memory _qrLink,
        uint256 _aprScore
    ) public {
        sanctumVault.push(VaultEntry({
            steward: _steward,
            country: _country,
            blessingType: _blessingType,
            broadcastMessage: _broadcastMessage,
            qrLink: _qrLink,
            aprScore: _aprScore,
            timestamp: block.timestamp
        }));

        emit VaultEntryStored(_steward, _blessingType, _aprScore);
    }

    function getVault() public view returns (VaultEntry[] memory) {
        return sanctumVault;
    }
}
