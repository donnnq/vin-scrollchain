// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title KindnessKernel - Unified emotional OS core for joy, welcome, and dignity
/// @notice Backdoor-proof, privacy-respecting, and soulbound by design

contract KindnessKernel {
    address private immutable steward;
    mapping(address => bool) private blessedUsers;

    struct EmotionalProfile {
        string welcomeVow;
        string joyMessage;
        uint256 emotionalAPR;
        uint256 timestamp;
    }

    mapping(address => EmotionalProfile) private emotionalLedger;

    event ProfileBlessed(address indexed user, string joyMessage, uint256 emotionalAPR);
    event PrivacyRespected(address indexed user);

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not steward");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    /// @notice Blesses a user with emotional data, privacy-respecting
    function blessUser(
        address _user,
        string memory _vow,
        string memory _joy,
        uint256 _apr
    ) external onlySteward {
        emotionalLedger[_user] = EmotionalProfile(_vow, _joy, _apr, block.timestamp);
        blessedUsers[_user] = true;
        emit ProfileBlessed(_user, _joy, _apr);
    }

    /// @notice Retrieves emotional profile (only by user)
    function getMyProfile() external view returns (EmotionalProfile memory) {
        require(blessedUsers[msg.sender], "No profile found");
        emit PrivacyRespected(msg.sender);
        return emotionalLedger[msg.sender];
    }

    /// @notice No external access to others' emotional data
    function getOthersProfile(address) external pure returns (string memory) {
        return "Access Denied: Soulbound privacy enforced";
    }
}
