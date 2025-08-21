// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.19;

contract vinGlobalBlessingLedger {
    struct LedgerEntry {
        string country;
        string partnerOrg;
        uint256 aprScore;
        string blessingType;
        string broadcastMessage;
        uint256 timestamp;
    }

    LedgerEntry[] public globalLedger;

    event LedgerUpdated(string country, string partnerOrg, uint256 aprScore, string blessingType);

    function logBlessing(
        string memory _country,
        string memory _partnerOrg,
        uint256 _aprScore,
        string memory _blessingType,
        string memory _broadcastMessage
    ) public {
        globalLedger.push(LedgerEntry({
            country: _country,
            partnerOrg: _partnerOrg,
            aprScore: _aprScore,
            blessingType: _blessingType,
            broadcastMessage: _broadcastMessage,
            timestamp: block.timestamp
        }));

        emit LedgerUpdated(_country, _partnerOrg, _aprScore, _blessingType);
    }

    function getAllBlessings() public view returns (LedgerEntry[] memory) {
        return globalLedger;
    }
}
