// SPDX-License-Identifier: CryptoOnboarding-Vault001
pragma solidity ^0.8.24;

/// @title vinScrollkeeperAdoptionBridge
/// @notice Logs and decodes emotional resistance points in crypto onboarding
contract vinScrollkeeperAdoptionBridge {
    address public scrollkeeper;
    
    struct AdoptionProfile {
        string curiosityLevel;
        string barrierType;
        bool openToLearning;
        uint256 timestamp;
    }

    mapping(address => AdoptionProfile) public soulProfiles;
    address[] public trackedSouls;

    event SoulPinged(address indexed soul, string curiosityLevel, string barrierType, bool learningIntent);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function pingSoul(
        address soul,
        string calldata curiosityLevel,
        string calldata barrierType,
        bool wantsToLearn
    ) external {
        require(msg.sender == scrollkeeper, "Only VINVIN logs soul adoption profiles");

        soulProfiles[soul] = AdoptionProfile(curiosityLevel, barrierType, wantsToLearn, block.timestamp);
        trackedSouls.push(soul);
        emit SoulPinged(soul, curiosityLevel, barrierType, wantsToLearn);
    }

    function viewSoulProfile(address soul) external view returns (
        string memory curiosity,
        string memory barrier,
        bool ready,
        uint256 timestamp
    ) {
        AdoptionProfile memory p = soulProfiles[soul];
        return (p.curiosityLevel, p.barrierType, p.openToLearning, p.timestamp);
    }

    function allProfiles() external view returns (address[] memory) {
        return trackedSouls;
    }
}
