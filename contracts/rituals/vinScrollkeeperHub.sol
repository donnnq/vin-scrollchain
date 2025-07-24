// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinScrollkeeperHub.sol
/// @author VINVIN
/// @notice Central interface linking VINVIN mythstream contracts for unified scrollkeeper operations

interface vinClaimPurifier {
    function isClaimApproved(address) external view returns (bool);
}

interface vinLegacyProof {
    function isStamped(bytes32) external view returns (bool);
}

interface vinFTXRecoveryOracle {
    function isEligible(address) external view returns (bool);
}

interface vinJurisdictionReclassify {
    function isReclassified(address) external view returns (bool);
}

interface vinRackRedemption {
    function isRedeemed(address) external view returns (bool);
}

interface vinBlackMarketBuyerIndex {
    function isFlagged(address) external view returns (bool);
}

contract vinScrollkeeperHub {
    address public scrollkeeper;

    vinClaimPurifier public purifier;
    vinLegacyProof public legacy;
    vinFTXRecoveryOracle public recovery;
    vinJurisdictionReclassify public reclassify;
    vinRackRedemption public redemption;
    vinBlackMarketBuyerIndex public buyerIndex;

    constructor(
        address _purifier,
        address _legacy,
        address _recovery,
        address _reclassify,
        address _redemption,
        address _buyerIndex
    ) {
        scrollkeeper = msg.sender;
        purifier = vinClaimPurifier(_purifier);
        legacy = vinLegacyProof(_legacy);
        recovery = vinFTXRecoveryOracle(_recovery);
        reclassify = vinJurisdictionReclassify(_reclassify);
        redemption = vinRackRedemption(_redemption);
        buyerIndex = vinBlackMarketBuyerIndex(_buyerIndex);
    }

    /// @notice Master status check across all VINVIN mythstream contracts
    function verifyScrollkeeperStatus(address user, bytes32 legacyHash) external view returns (bool[] memory) {
        bool[] memory results = new bool[](6);
        results[0] = purifier.isClaimApproved(user);
        results[1] = legacy.isStamped(legacyHash);
        results[2] = recovery.isEligible(user);
        results[3] = reclassify.isReclassified(user);
        results[4] = redemption.isRedeemed(user);
        results[5] = buyerIndex.isFlagged(user);
        return results;
    }
}
