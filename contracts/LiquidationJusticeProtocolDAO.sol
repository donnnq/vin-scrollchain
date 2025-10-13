// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract LiquidationJusticeProtocolDAO {
    address public steward;

    struct CompensationClaim {
        string userUID;
        string platform; // "Binance", "Bybit", "OKX"
        string affectedAsset; // "USDe", "BNSOL", "WBETH", etc.
        string liquidationTimestamp;
        string claimStatus; // "Pending", "Approved", "Rejected"
        string emotionalTag;
        uint256 timestamp;
    }

    CompensationClaim[] public claims;

    event ClaimLogged(
        string userUID,
        string platform,
        string affectedAsset,
        string liquidationTimestamp,
        string claimStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log liquidation justice rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logClaim(
        string memory userUID,
        string memory platform,
        string memory affectedAsset,
        string memory liquidationTimestamp,
        string memory claimStatus,
        string memory emotionalTag
    ) external onlySteward {
        claims.push(CompensationClaim({
            userUID: userUID,
            platform: platform,
            affectedAsset: affectedAsset,
            liquidationTimestamp: liquidationTimestamp,
            claimStatus: claimStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ClaimLogged(userUID, platform, affectedAsset, liquidationTimestamp, claimStatus, emotionalTag, block.timestamp);
    }

    function getClaimByIndex(uint256 index) external view returns (
        string memory userUID,
        string memory platform,
        string memory affectedAsset,
        string memory liquidationTimestamp,
        string memory claimStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < claims.length, "Scrollstorm index out of bounds");
        CompensationClaim memory c = claims[index];
        return (
            c.userUID,
            c.platform,
            c.affectedAsset,
            c.liquidationTimestamp,
            c.claimStatus,
            c.emotionalTag,
            c.timestamp
        );
    }
}
